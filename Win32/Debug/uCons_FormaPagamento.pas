unit uCons_FormaPagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCons_Base, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Datasnap.DBClient, uFormaPagamento,
  uFormaPagamentoController, uCad_FormaPagamento, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringtime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxContainer, cxEdit, Vcl.Menus,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, cxDBData, dxLayoutcxEditAdapters,
  dxLayoutControlAdapters, dxLayoutContainer, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxButtons, cxTextEdit, dxLayoutControl;

type
  TCons_FormaPagamento = class(TCons_Base)
    Dset_FormaPagamento: TClientDataSet;
    Ds_FormaPagamento: TDataSource;
    Dset_FormaPagamentoID: TIntegerField;
    Dset_FormaPagamentoDESCRICAO: TStringField;
    Dset_FormaPagamentoDATA_INSERT: TDateField;
    GridPesquisaDBTableView1ID: TcxGridDBColumn;
    GridPesquisaDBTableView1DESCRICAO: TcxGridDBColumn;
    GridPesquisaDBTableView1DATA_INSERT: TcxGridDBColumn;
    procedure btn_PesquisarClick(Sender: TObject);
    procedure btn_SelecionarClick(Sender: TObject);
    procedure btn_NovoClick(Sender: TObject);
    procedure btn_AlterarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FormaPagamentoControl : TFormaPagamentoController;
  public
    { Public declarations }
    FormaPagamento: TFormaPagamento;
  end;

var
  Cons_FormaPagamento: TCons_FormaPagamento;

implementation

{$R *.dfm}

procedure TCons_FormaPagamento.btn_AlterarClick(Sender: TObject);
var CadFormaPagamentoForm: TCad_FormaPagamento;
begin
   if (dset_FormaPagamento.Active) and (dset_FormaPagamento.RecordCount > 0) then
   begin
     CadFormaPagamentoForm := TCad_FormaPagamento.Create(nil);
     FormaPagamento.LimparDados;
     FormaPagamento.id := Dset_FormaPagamento.FieldByName('id').asInteger;
     if FormaPagamentoControl.Recuperar(FormaPagamento) then
     begin
       try
          CadFormaPagamentoForm.FormaPagamento.CopiarDados(FormaPagamento);
          CadFormaPagamentoForm.Inclusao := False;
          CadFormaPagamentoForm.ShowModal;
          FormaPagamentoControl.Pesquisar(edt_Pesquisa.Text, Dset_FormaPagamento);
       finally
          //
       end;
     end;
   end
   else
     raise Exception.Create('Erro ao Alterar: Lista Vazia');
end;

procedure TCons_FormaPagamento.btn_ExcluirClick(Sender: TObject);
begin
  inherited;
  if (dset_FormaPagamento.Active) and (dset_FormaPagamento.RecordCount > 0) then
  begin
      FormaPagamento.ID := dset_FormaPagamentoID.AsInteger;
      if not FormaPagamentoControl.VerificarExclusao(FormaPagamento) then
      begin
        if MessageDlg('Deseja Realmente excluir a Forma de pagamento : '+ dset_FormaPagamentoDescricao.AsString +' ?', mtConfirmation, [mbYes, mbNo], 0) = idYES then
        begin
            FormaPagamentoControl.Excluir(FormaPagamento);
            FormaPagamentoControl.Pesquisar(edt_Pesquisa.Text, Dset_FormaPagamento);
        end;
      end
      else
        raise Exception.Create('Erro ao excluir: H? registros vinculados ? essa Forma de Pagamento');
  end
  else
  begin
    raise Exception.Create('Erro ao excluir: Nenhum registro Selecionado');
  end;
end;

procedure TCons_FormaPagamento.btn_NovoClick(Sender: TObject);
var CadFormaPagamentoForm: TCad_FormaPagamento;
begin
   CadFormaPagamentoForm := TCad_FormaPagamento.Create(nil);
   try
      CadFormaPagamentoForm.Inclusao := True;
      CadFormaPagamentoForm.ShowModal;
      edt_Pesquisa.Clear;
      FormaPagamentoControl.Pesquisar(edt_Pesquisa.Text, Dset_FormaPagamento);
   finally
      //
   end;
end;

procedure TCons_FormaPagamento.btn_PesquisarClick(Sender: TObject);
begin
  inherited;
  FormaPagamentoControl.Pesquisar(edt_Pesquisa.Text, Dset_FormaPagamento);
end;

procedure TCons_FormaPagamento.btn_SelecionarClick(Sender: TObject);
begin
  inherited;
  if dset_FormaPagamento.RecordCount > 0 then
  begin
    FormaPagamento.ID := dset_FormaPagamentoid.AsInteger;
    if FormaPagamentoControl.Recuperar(FormaPagamento) then
      self.Close;
  end;
end;

procedure TCons_FormaPagamento.FormCreate(Sender: TObject);
begin
  inherited;
  FormaPagamentoControl := TFormaPagamentoController.Create;
  FormaPagamento := TFormaPagamento.Create;

  if ( not Dset_FormaPagamento.IsEmpty ) then
    Dset_FormaPagamento.EmptyDataSet;
  Dset_FormaPagamento.Active := False;
  Dset_FormaPagamento.CreateDataSet;
  Dset_FormaPagamento.Open;
end;

procedure TCons_FormaPagamento.FormDestroy(Sender: TObject);
begin
  inherited;
  FormaPagamento.Free;
  FormaPagamentoControl.Free;
end;

procedure TCons_FormaPagamento.FormShow(Sender: TObject);
begin
  inherited;
  FormaPagamentoControl.Pesquisar(edt_Pesquisa.Text, Dset_FormaPagamento);
end;

end.
