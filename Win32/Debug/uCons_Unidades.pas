unit uCons_Unidades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCons_Base, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Datasnap.DBClient,
  uUnidades, uUnidadesController, uCad_Unidades, cxGraphics, cxControls,
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
  TCons_Unidades = class(TCons_Base)
    ds_Unidade: TDataSource;
    dset_Unidade: TClientDataSet;
    dset_UnidadeID: TIntegerField;
    dset_UnidadeDESCRICAO: TStringField;
    dset_UnidadeSIGLA: TStringField;
    dset_UnidadeDATA_INSERT: TDateField;
    GridPesquisaDBTableView1ID: TcxGridDBColumn;
    GridPesquisaDBTableView1DESCRICAO: TcxGridDBColumn;
    GridPesquisaDBTableView1SIGLA: TcxGridDBColumn;
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
    UnidadeControl : TUnidadesController;
  public
    { Public declarations }
    Unidade: TUnidades;
  end;

var
  Cons_Unidades: TCons_Unidades;

implementation

{$R *.dfm}

procedure TCons_Unidades.btn_AlterarClick(Sender: TObject);
var CadUnidadeForm: TCad_Unidades;
begin
   if (dset_Unidade.Active) and (dset_Unidade.RecordCount > 0) then
   begin
     CadUnidadeForm := TCad_Unidades.Create(nil);
     Unidade.LimparDados;
     Unidade.id := Dset_Unidade.FieldByName('id').asInteger;
     if UnidadeControl.Recuperar(Unidade) then
     begin
       try
          CadUnidadeForm.Unidade.CopiarDados(Unidade);
          CadUnidadeForm.Inclusao := False;
          CadUnidadeForm.ShowModal;
          UnidadeControl.Pesquisar(edt_Pesquisa.Text, Dset_Unidade);
       finally
          //
       end;
     end;
   end
   else
     raise Exception.Create('Erro ao Alterar: Lista Vazia');
end;

procedure TCons_Unidades.btn_ExcluirClick(Sender: TObject);
begin
  inherited;
  if (dset_Unidade.Active) and (dset_Unidade.RecordCount > 0) then
  begin
      Unidade.ID := dset_UnidadeID.AsInteger;
      if not UnidadeControl.VerificarExclusao(Unidade) then
      begin
        if MessageDlg('Deseja Realmente excluir a Unidade : '+ dset_UnidadeDescricao.AsString +' ?', mtConfirmation, [mbYes, mbNo], 0) = idYES then
        begin
            UnidadeControl.Excluir(Unidade);
            UnidadeControl.Pesquisar(edt_Pesquisa.Text, Dset_Unidade);
        end;
      end
      else
        raise Exception.Create('Erro ao excluir: H� registros vinculados � essa Unidade');
  end
  else
  begin
    raise Exception.Create('Erro ao excluir: Nenhum registro Selecionado');
  end;
end;

procedure TCons_Unidades.btn_NovoClick(Sender: TObject);
var CadUnidadeForm: TCad_Unidades;
begin
   CadUnidadeForm := TCad_Unidades.Create(nil);
   try
      CadUnidadeForm.Inclusao := True;
      CadUnidadeForm.ShowModal;
      edt_Pesquisa.Clear;
      UnidadeControl.Pesquisar(edt_Pesquisa.Text, Dset_Unidade);
   finally
      //
   end;
end;

procedure TCons_Unidades.btn_PesquisarClick(Sender: TObject);
begin
  inherited;
  UnidadeControl.Pesquisar(edt_Pesquisa.Text, Dset_Unidade);
end;

procedure TCons_Unidades.btn_SelecionarClick(Sender: TObject);
begin
  inherited;
  if dset_Unidade.RecordCount > 0 then
  begin
    Unidade.ID := dset_Unidadeid.AsInteger;
    if UnidadeControl.Recuperar(Unidade) then
      self.Close;
  end;
end;

procedure TCons_Unidades.FormCreate(Sender: TObject);
begin
  inherited;
  UnidadeControl := TUnidadesController.Create;
  Unidade := TUnidades.Create;

  if ( not Dset_Unidade.IsEmpty ) then
    Dset_Unidade.EmptyDataSet;
  Dset_Unidade.Active := False;
  Dset_Unidade.CreateDataSet;
  Dset_Unidade.Open;
end;

procedure TCons_Unidades.FormDestroy(Sender: TObject);
begin
  inherited;
  Unidade.Free;
  UnidadeControl.Free;
end;

procedure TCons_Unidades.FormShow(Sender: TObject);
begin
  inherited;
  UnidadeControl.Pesquisar(edt_Pesquisa.Text, Dset_Unidade);
end;

end.
