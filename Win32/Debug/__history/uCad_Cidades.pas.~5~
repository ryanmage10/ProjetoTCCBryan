unit uCad_Cidades;

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
  cxTextEdit, dxLayoutControl, uCidades, uCidadesController, uCons_Estados;

type
  TCad_Cidades = class(TCad_Base)
    dxLayoutGroup6: TdxLayoutGroup;
    dxLayoutGroup7: TdxLayoutGroup;
    dxLayoutGroup8: TdxLayoutGroup;
    edt_Cidade: TcxTextEdit;
    dxLayoutItem9: TdxLayoutItem;
    Edt_DDD: TcxTextEdit;
    dxLayoutItem10: TdxLayoutItem;
    edt_CodIbge: TcxTextEdit;
    dxLayoutItem11: TdxLayoutItem;
    edt_estado: TcxTextEdit;
    dxLayoutItem12: TdxLayoutItem;
    btn_pesquisar: TcxButton;
    dxLayoutItem13: TdxLayoutItem;
    procedure btn_PesquisarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
  private
    { Private declarations }
    procedure popularInterface;
    procedure PopularObjeto;
    function ValidarDados: boolean;
  public
    { Public declarations }
    CidadeControl : TCidadesController;
    Cidade : TCidades;
  end;

implementation

{$R *.dfm}

procedure TCad_Cidades.btn_PesquisarClick(Sender: TObject);
var ConsEstadoForm: TCons_Estados;
begin
   ConsEstadoForm := TCons_Estados.Create(nil);
   try
      ConsEstadoForm.Selecao := true;
      ConsEstadoForm.ShowModal;
      Cidade.Estado := (ConsEstadoForm.Estado.clone);
      edt_Estado.text := Cidade.Estado.Nome;
   finally
      FreeAndNil(ConsEstadoForm);
   end;
end;

procedure TCad_Cidades.btn_SalvarClick(Sender: TObject);
begin
  inherited;
  if ValidarDados then
  begin
    popularObjeto;

     if not CidadeControl.VerificarNome(Cidade) then
     begin
        if Inclusao then
          CidadeControl.Inserir(Cidade)
        else
          CidadeControl.Alterar(Cidade);

        self.Close;
     end
     else
       raise Exception.Create('Já Existe uma Cidade cadastrado com esse nome');
  end;
end;

procedure TCad_Cidades.FormCreate(Sender: TObject);
begin
  inherited;
  Cidade := TCidades.Create;
  CidadeControl := TCidadesController.Create;
end;

procedure TCad_Cidades.FormDestroy(Sender: TObject);
begin
  inherited;
  Cidade.Free;
  CidadeControl.Free;
end;

procedure TCad_Cidades.FormShow(Sender: TObject);
begin
  inherited;
  if not inclusao then
    popularInterface;
end;

procedure TCad_Cidades.popularInterface;
begin
  edt_id.text := inttostr(Cidade.ID);
  edt_Cidade.text := Cidade.Nome;
  edt_DDD.text := Cidade.DDD;
  edt_codIbge.text := Cidade.CodIbge;
  edt_estado.text := Cidade.Estado.Nome;

  Grupo_Cad.Visible := True;
  Grupo_Alt.Visible := True;

  lbl_Cad.Visible := True;
  lbl_DataCad.Visible := True;
  lbl_DataCad.Caption := Cidade.User_Insert + '-' + DatetoStr(Cidade.DataCad);

  lbl_DataAlt.Caption := Cidade.User_Update + '-' + DatetoStr(Cidade.DataUltAlt);
  Lbl_Alt.Visible := True;
  lbl_DataAlt.Visible := True;
end;

procedure TCad_Cidades.PopularObjeto;
begin
  Cidade.ID := strtoint(edt_id.text);
  Cidade.Nome := edt_Cidade.text;
  Cidade.DDD :=  edt_DDD.text;
  Cidade.CodIbge := edt_codIbge.text;
end;

function TCad_Cidades.ValidarDados: boolean;
begin
  result := False;
  if not (length(edt_Cidade.Text) > 0) then
  begin
    ShowMessage('Insira o nome do Cidade');
    edt_Cidade.setFocus;
    exit;
  end;

  if not (length(edt_DDD.Text) > 0) then
  begin
    ShowMessage('Insira o DDD da cidade');
    edt_DDD.setFocus;
    exit;
  end;

  if not (length(edt_Estado.Text) > 0) then
  begin
    ShowMessage('Insira o nome do Estado');
    btn_Pesquisar.setFocus;
    exit;
  end;

  result := True;
end;

end.
