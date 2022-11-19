unit uCad_Caixas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCad_Base, cxGraphics, cxControls,
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
  dxLayoutcxEditAdapters, dxLayoutControlAdapters, cxClasses,
  dxLayoutLookAndFeels, dxLayoutContainer, cxLabel, Vcl.StdCtrls, cxButtons,
  cxTextEdit, dxLayoutControl, uCaixas, uCaixasController, uCons_Empresas;

type
  TCad_Caixas = class(TCad_Base)
    dxLayoutGroup6: TdxLayoutGroup;
    dxLayoutGroup7: TdxLayoutGroup;
    edt_Caixa: TcxTextEdit;
    dxLayoutItem9: TdxLayoutItem;
    edt_Moeda: TcxTextEdit;
    dxLayoutItem10: TdxLayoutItem;
    edt_Empresa: TcxTextEdit;
    dxLayoutItem11: TdxLayoutItem;
    btn_pesquisar: TcxButton;
    dxLayoutItem12: TdxLayoutItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btn_PesquisarClick(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
  private
    { Private declarations }
    procedure popularInterface;
    procedure PopularObjeto;
    function ValidarDados: boolean;
  public
    { Public declarations }
    Caixa : TCaixas;
    CaixaControl : TCaixasController;
  end;

var
  Cad_Caixas: TCad_Caixas;

implementation

{$R *.dfm}

{ TCad_Caixas }

procedure TCad_Caixas.btn_PesquisarClick(Sender: TObject);
var ConsEmpresaForm: TCons_Empresas;
begin
   ConsEmpresaForm := TCons_Empresas.Create(nil);
   try
      ConsEmpresaForm.Selecao := True;
      ConsEmpresaForm.ShowModal;
      Caixa.Empresa := (ConsEmpresaForm.Empresa.clone);
      edt_Empresa.text := Caixa.Empresa.Nome;
   finally
      FreeAndNil(ConsEmpresaForm);
   end;
end;

procedure TCad_Caixas.btn_SalvarClick(Sender: TObject);
begin
  inherited;
  if ValidarDados then
  begin
    popularObjeto;

    if not CaixaControl.VerificarNome(Caixa) then
     begin
        if Inclusao then
           CaixaControl.Inserir(Caixa)
        else
          CaixaControl.Alterar(Caixa);

        self.Close;
     end
     else
      raise Exception.Create('J� Existe um Caixa cadastrado com esse Nome');
  end;
end;

procedure TCad_Caixas.FormCreate(Sender: TObject);
begin
  inherited;
  Caixa := TCaixas.Create;
  CaixaControl := TCaixasController.Create;
end;

procedure TCad_Caixas.FormDestroy(Sender: TObject);
begin
  inherited;
  Caixa.Free;
  CaixaControl.Free;
end;

procedure TCad_Caixas.FormShow(Sender: TObject);
begin
  inherited;
  if not inclusao then
    popularInterface;
end;

procedure TCad_Caixas.popularInterface;
begin
  edt_id.text := inttostr(Caixa.ID);
  edt_Caixa.text := Caixa.Nome;
  edt_moeda.text := Caixa.Moeda;
  edt_Empresa.text := Caixa.Empresa.Nome;

  Grupo_Cad.Visible := True;
  Grupo_Alt.Visible := True;

  lbl_Cad.Visible := True;
  lbl_DataCad.Visible := True;
  lbl_DataCad.Caption := Caixa.User_Insert + '-' + DatetoStr(Caixa.DataCad);

  lbl_DataAlt.Caption := Caixa.User_Update + '-' + DatetoStr(Caixa.DataUltAlt);
  Lbl_Alt.Visible := True;
  lbl_DataAlt.Visible := True;
end;

procedure TCad_Caixas.PopularObjeto;
begin
  Caixa.ID := strtoint(edt_id.text);
  Caixa.Nome := edt_Caixa.text;
  Caixa.Moeda := edt_Moeda.text;
end;

function TCad_Caixas.ValidarDados: boolean;
begin
  result := false;
  if not (length(edt_Caixa.Text) > 0) then
  begin
    ShowMessage('Insira o nome do Caixa');
    edt_Caixa.setFocus;
    exit;
  end;

  if not (length(edt_Moeda.Text) > 0) then
  begin
    ShowMessage('Insira a sigla da Moeda do Caixa');
    edt_Moeda.setFocus;
    exit;
  end;

  if not (length(edt_Empresa.Text) > 0) then
  begin
    ShowMessage('Insira a Empresa do Caixa');
    btn_Pesquisar.setFocus;
    exit;
  end;

  result := true;
end;

end.
