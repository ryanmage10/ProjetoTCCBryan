unit uCons_Paises;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCons_Base, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Datasnap.DBClient,
  uCad_Paises, uPaisesController, uPaises, cxGraphics, cxControls,
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
  TCons_Paises = class(TCons_Base)
    ds_paises: TDataSource;
    Dset_Paises: TClientDataSet;
    Dset_PaisesID: TIntegerField;
    Dset_PaisesPAIS: TStringField;
    Dset_PaisesSIGLA: TStringField;
    Dset_PaisesDATA_INSERT: TDateField;
    GridPesquisaDBTableView1ID: TcxGridDBColumn;
    GridPesquisaDBTableView1PAIS: TcxGridDBColumn;
    GridPesquisaDBTableView1SIGLA: TcxGridDBColumn;
    GridPesquisaDBTableView1DATA_INSERT: TcxGridDBColumn;
    procedure btn_NovoClick(Sender: TObject);
    procedure btn_AlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btn_PesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure btn_SelecionarClick(Sender: TObject);
  private
    { Private declarations }
    PaisControl : TPaisesController;

  public
    { Public declarations }
    Pais : TPaises;
  end;

var
  Cons_Paises: TCons_Paises;

implementation

{$R *.dfm}

procedure TCons_Paises.btn_AlterarClick(Sender: TObject);
var CadPaisesForm: TCad_Paises;
begin
   if (dset_Paises.Active) and (dset_Paises.RecordCount > 0) then
   begin
     CadPaisesForm := TCad_Paises.Create(nil);
     Pais.LimparDados;
     Pais.id := Dset_Paises.FieldByName('id').asInteger;
     if PaisControl.Recuperar(Pais) then
     begin
       try
          CadPaisesForm.Pais.CopiarDados(Pais);
          CadPaisesForm.Inclusao := False;
          CadPaisesForm.ShowModal;
          PaisControl.Pesquisar(edt_Pesquisa.Text, Dset_Paises);
       finally
          //FreeAndNil(CadPaisesForm );
       end;
     end;
   end
   else
     raise Exception.Create('Erro ao excluir: Lista Vazia');
end;

procedure TCons_Paises.btn_ExcluirClick(Sender: TObject);
begin
  inherited;
  if (dset_Paises.Active) and (dset_Paises.RecordCount > 0) then
  begin
      Pais.ID := dset_PaisesID.AsInteger;
      if not PaisControl.VerificarExclusao(Pais) then
      begin
        if MessageDlg('Deseja Realmente excluir o Pais : '+ dset_PaisesPais.AsString +' ?', mtConfirmation, [mbYes, mbNo], 0) = idYES then
        begin
            PaisControl.Excluir(Pais);
            PaisControl.Pesquisar(edt_Pesquisa.Text, Dset_Paises);
        end;
      end
      else
        raise Exception.Create('Erro ao excluir: Há registros vinculados à esse país');
  end
  else
  begin
    raise Exception.Create('Erro ao excluir: Nenhum registro Selecionado');
  end;
end;

procedure TCons_Paises.btn_NovoClick(Sender: TObject);
var CadPaisesForm: TCad_Paises;
begin
   CadPaisesForm := TCad_Paises.Create(nil);
   try
      CadPaisesForm.Inclusao := True;
      CadPaisesForm.ShowModal;
      edt_Pesquisa.Clear;
      PaisControl.Pesquisar(edt_Pesquisa.Text, Dset_Paises);
   finally
      //FreeAndNil(CadPaisesForm);
   end;
end;

procedure TCons_Paises.btn_PesquisarClick(Sender: TObject);
begin
  inherited;
  PaisControl.Pesquisar(edt_Pesquisa.Text, Dset_Paises);
end;

procedure TCons_Paises.btn_SelecionarClick(Sender: TObject);
begin
  inherited;
  if dset_paises.RecordCount > 0 then
  begin
    Pais.ID := dset_paisesid.AsInteger;
    if PaisControl.Recuperar(Pais) then
      self.Close;
  end;
end;

procedure TCons_Paises.FormCreate(Sender: TObject);
begin
  inherited;
  PaisControl := TPaisesController.Create;
  Pais := TPaises.Create;

  if ( not Dset_Paises.IsEmpty ) then
    Dset_Paises.EmptyDataSet;
  Dset_Paises.Active := False;
  Dset_Paises.CreateDataSet;
  Dset_Paises.Open;
end;

procedure TCons_Paises.FormDestroy(Sender: TObject);
begin
  inherited;
  Pais.Free;
  PaisControl.Free;
end;

procedure TCons_Paises.FormShow(Sender: TObject);
begin
  inherited;
  PaisControl.Pesquisar(edt_Pesquisa.Text, Dset_Paises);
end;

end.
