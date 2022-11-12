unit uCons_Contratos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCons_Base, Data.DB, Datasnap.DBClient,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, uContratos, uContratosController,
  uCad_Contratos, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBasic, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  TCons_Contratos = class(TCons_Base)
    dset_Contratos: TClientDataSet;
    ds_Contratos: TDataSource;
    dset_ContratosID: TIntegerField;
    dset_ContratosCODIGODOC: TStringField;
    dset_ContratosDESCRICAO: TStringField;
    dset_ContratosMOEDA: TStringField;
    dset_ContratosTIPO: TStringField;
    dset_ContratosVALOR: TCurrencyField;
    dset_ContratosDATA_INSERT: TDateField;
    GridPesquisaDBTableView1ID: TcxGridDBColumn;
    GridPesquisaDBTableView1CODIGODOC: TcxGridDBColumn;
    GridPesquisaDBTableView1DESCRICAO: TcxGridDBColumn;
    GridPesquisaDBTableView1MOEDA: TcxGridDBColumn;
    GridPesquisaDBTableView1TIPO: TcxGridDBColumn;
    GridPesquisaDBTableView1VALOR: TcxGridDBColumn;
    GridPesquisaDBTableView1DATA_INSERT: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure btn_PesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btn_SelecionarClick(Sender: TObject);
    procedure btn_NovoClick(Sender: TObject);
    procedure btn_AlterarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
  private
    { Private declarations }
    ContratosControl : TContratosController;
  public
    { Public declarations }
    Contrato: TContratos;
  end;

var
  Cons_Contratos: TCons_Contratos;

implementation

{$R *.dfm}

procedure TCons_Contratos.btn_AlterarClick(Sender: TObject);
var CadContratoForm: TCad_Contratos;
begin
  if (dset_Contratos.Active) and (dset_Contratos.RecordCount > 0) then
  begin
     CadContratoForm := TCad_Contratos.Create(nil);
     Contrato.LimparDados;
     Contrato.id := Dset_Contratos.FieldByName('id').asInteger;
     if ContratosControl.Recuperar(Contrato) then
     begin
       try
          CadContratoForm.Contrato.CopiarDados(Contrato);
          CadContratoForm.Inclusao := False;
          CadContratoForm.ShowModal;
          ContratosControl.Pesquisar(edt_Pesquisa.Text, Dset_Contratos);
       finally
          //FreeAndNil(CadEstadoForm);
       end;
     end;
  end
  else
    raise Exception.Create('Erro ao Alterar: Nenhum registro Selecionado');
end;

procedure TCons_Contratos.btn_ExcluirClick(Sender: TObject);
begin
  inherited;
  if (dset_Contratos.Active) and (dset_Contratos.RecordCount > 0) then
  begin
      Contrato.ID := dset_ContratosID.AsInteger;
      if not ContratosControl.VerificarExclusao(Contrato) then
      begin
        if MessageDlg('Deseja Realmente excluir o Contrato: '+ dset_ContratosCodigoDoc.AsString +' ?', mtConfirmation, [mbYes, mbNo], 0) = idYES then
        begin
          ContratosControl.Excluir(Contrato);
          ContratosControl.Pesquisar(edt_Pesquisa.Text, Dset_Contratos);
        end;
      end
      Else
        raise Exception.Create('Erro ao excluir: Há registros vinculados à esse Contrato');
  end
  else
  begin
    raise Exception.Create('Erro ao excluir: Nenhum registro Selecionado');
  end;
end;

procedure TCons_Contratos.btn_NovoClick(Sender: TObject);
var CadContratoForm: TCad_Contratos;
begin
   CadContratoForm := TCad_Contratos.Create(nil);
   try
      CadContratoForm.Inclusao := True;
      CadContratoForm.ShowModal;
      edt_Pesquisa.Clear;
      ContratosControl.Pesquisar(edt_Pesquisa.Text, Dset_Contratos);
   finally
      //FreeAndNil(CadEstadoForm);
   end;
end;

procedure TCons_Contratos.btn_PesquisarClick(Sender: TObject);
begin
  inherited;
  ContratosControl.Pesquisar(edt_Pesquisa.Text, Dset_Contratos);
end;

procedure TCons_Contratos.btn_SelecionarClick(Sender: TObject);
begin
  inherited;
  if dset_Contratos.RecordCount > 0 then
  begin
    Contrato.ID := dset_Contratosid.AsInteger;
    if ContratosControl.Recuperar(Contrato) then
      self.Close;
  end;
end;

procedure TCons_Contratos.FormCreate(Sender: TObject);
begin
  inherited;
  ContratosControl := TContratosController.create;
  Contrato := TContratos.Create;

  if ( not Dset_Contratos.IsEmpty ) then
    Dset_Contratos.EmptyDataSet;
  Dset_Contratos.Active := False;
  Dset_Contratos.CreateDataSet;
  Dset_Contratos.Open;
end;

procedure TCons_Contratos.FormDestroy(Sender: TObject);
begin
  inherited;
  Contrato.Free;
  ContratosControl.Free;
end;

procedure TCons_Contratos.FormShow(Sender: TObject);
begin
  inherited;
  ContratosControl.Pesquisar(edt_Pesquisa.Text, Dset_Contratos);
end;

end.
