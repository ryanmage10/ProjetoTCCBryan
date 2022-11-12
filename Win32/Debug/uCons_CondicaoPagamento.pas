unit uCons_CondicaoPagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCons_Base, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Datasnap.DBClient, uCondicaoPagamentoController,
  uCondicaoPagamento, uCad_CondicaoPagamento, cxGraphics, cxControls,
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
  TCons_CondicaoPagamento = class(TCons_Base)
    ds_CondicaoPagamento: TDataSource;
    dset_CondicaoPagamento: TClientDataSet;
    dset_CondicaoPagamentoID: TIntegerField;
    dset_CondicaoPagamentoDESCRICAO: TStringField;
    dset_CondicaoPagamentoDATA_INSERT: TDateField;
    GridPesquisaDBTableView1ID: TcxGridDBColumn;
    GridPesquisaDBTableView1DESCRICAO: TcxGridDBColumn;
    GridPesquisaDBTableView1DATA_INSERT: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_PesquisarClick(Sender: TObject);
    procedure btn_SelecionarClick(Sender: TObject);
    procedure btn_NovoClick(Sender: TObject);
    procedure btn_AlterarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
  private
    { Private declarations }
    CondicaoPagamentoControl : TCondicaoPagamentoController;
  public
    { Public declarations }
    CondicaoPagamento: TCondicaoPagamento;
  end;

var
  Cons_CondicaoPagamento: TCons_CondicaoPagamento;

implementation

{$R *.dfm}

procedure TCons_CondicaoPagamento.btn_AlterarClick(Sender: TObject);
var CadCondicaoPagamentoForm: TCad_CondicaoPagamento;
begin
   if (dset_CondicaoPagamento.Active) and (dset_CondicaoPagamento.RecordCount > 0) then
   begin
     CadCondicaoPagamentoForm := TCad_CondicaoPagamento.Create(nil);
     CondicaoPagamento.LimparDados;
     CondicaoPagamento.id := Dset_CondicaoPagamento.FieldByName('id').asInteger;
     if CondicaoPagamentoControl.Recuperar(CondicaoPagamento) then
     begin
       try
          CadCondicaoPagamentoForm.CondicaoPag.CopiarDados(CondicaoPagamento);
          CadCondicaoPagamentoForm.Inclusao := False;
          CadCondicaoPagamentoForm.ShowModal;
          CondicaoPagamentoControl.Pesquisar(edt_Pesquisa.Text, Dset_CondicaoPagamento);
       finally
          //
       end;
     end;
   end
   else
     raise Exception.Create('Erro ao Alterar: Lista Vazia');
end;

procedure TCons_CondicaoPagamento.btn_ExcluirClick(Sender: TObject);
begin
  inherited;
  if (dset_CondicaoPagamento.Active) and (dset_CondicaoPagamento.RecordCount > 0) then
  begin
      CondicaoPagamento.ID := dset_CondicaoPagamentoID.AsInteger;
      if not CondicaoPagamentoControl.VerificarExclusao(CondicaoPagamento) then
      begin
        if MessageDlg('Deseja Realmente excluir a Condi��o de pagamento : '+ dset_CondicaoPagamentoDescricao.AsString +' ?', mtConfirmation, [mbYes, mbNo], 0) = idYES then
        begin
            CondicaoPagamentoControl.Excluir(CondicaoPagamento);
            CondicaoPagamentoControl.Pesquisar(edt_Pesquisa.Text, Dset_CondicaoPagamento);
        end;
      end
      else
        raise Exception.Create('Erro ao excluir: H� registros vinculados � essa Condi��o de Pagamento');
  end
  else
  begin
    raise Exception.Create('Erro ao excluir: Nenhum registro Selecionado');
  end;
end;

procedure TCons_CondicaoPagamento.btn_NovoClick(Sender: TObject);
var CadCondicaoPagamentoForm: TCad_CondicaoPagamento;
begin
   CadCondicaoPagamentoForm := TCad_CondicaoPagamento.Create(nil);
   try
      CadCondicaoPagamentoForm.Inclusao := True;
      CadCondicaoPagamentoForm.ShowModal;
      edt_Pesquisa.Clear;
      CondicaoPagamentoControl.Pesquisar(edt_Pesquisa.Text, Dset_CondicaoPagamento);
   finally
      //
   end;
end;

procedure TCons_CondicaoPagamento.btn_PesquisarClick(Sender: TObject);
begin
  inherited;
  CondicaoPagamentoControl.Pesquisar(edt_Pesquisa.Text, Dset_CondicaoPagamento);
end;

procedure TCons_CondicaoPagamento.btn_SelecionarClick(Sender: TObject);
begin
  inherited;
  if dset_CondicaoPagamento.RecordCount > 0 then
  begin
    CondicaoPagamento.ID := dset_CondicaoPagamentoid.AsInteger;
    if CondicaoPagamentoControl.Recuperar(CondicaoPagamento) then
      self.Close;
  end;
end;

procedure TCons_CondicaoPagamento.FormCreate(Sender: TObject);
begin
  inherited;
  CondicaoPagamentoControl := TCondicaoPagamentoController.Create;
  CondicaoPagamento := TCondicaoPagamento.Create;

  if ( not Dset_CondicaoPagamento.IsEmpty ) then
    Dset_CondicaoPagamento.EmptyDataSet;
  Dset_CondicaoPagamento.Active := False;
  Dset_CondicaoPagamento.CreateDataSet;
  Dset_CondicaoPagamento.Open;
end;

procedure TCons_CondicaoPagamento.FormDestroy(Sender: TObject);
begin
  inherited;
  CondicaoPagamento.Free;
  CondicaoPagamentoControl.Free;
end;

procedure TCons_CondicaoPagamento.FormShow(Sender: TObject);
begin
  inherited;
  CondicaoPagamentoControl.Pesquisar(edt_Pesquisa.Text, Dset_CondicaoPagamento);
end;

end.
