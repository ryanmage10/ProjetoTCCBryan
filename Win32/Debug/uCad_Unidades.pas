unit uCad_Unidades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCad_Base, Vcl.StdCtrls, Vcl.ExtCtrls,
  uUnidades, uUnidadesController, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
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
  dxLayoutcxEditAdapters, dxLayoutControlAdapters, cxClasses,
  dxLayoutLookAndFeels, dxLayoutContainer, cxLabel, cxButtons, cxTextEdit,
  dxLayoutControl;

type
  TCad_Unidades = class(TCad_Base)
    dxLayoutGroup6: TdxLayoutGroup;
    edt_Descricao: TcxTextEdit;
    dxLayoutItem9: TdxLayoutItem;
    edt_Sigla: TcxTextEdit;
    dxLayoutItem10: TdxLayoutItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
  private
    { Private declarations }
    UnidadeControl : TUnidadesController;
    function validarDados: boolean;
    procedure popularInterface;
    procedure PopularObjeto;
  public
    { Public declarations }
    Unidade : TUnidades;
  end;

var
  Cad_Unidades: TCad_Unidades;

implementation

{$R *.dfm}

procedure TCad_Unidades.btn_SalvarClick(Sender: TObject);
begin
  inherited;
  if validarDados then
  begin
     popularObjeto;

     if not UnidadeControl.VerificarNome(Unidade) then
     begin
       if Inclusao then
          UnidadeControl.Inserir(Unidade)
       else
          UnidadeControl.Alterar(Unidade);

       Self.Close;
     end
     else
      raise Exception.Create('Já Existe uma Unidade cadastrada com esse nome');
  end;
end;

procedure TCad_Unidades.FormCreate(Sender: TObject);
begin
  inherited;
  unidade := TUnidades.Create;
  UnidadeControl := TUnidadesController.Create;
end;

procedure TCad_Unidades.FormDestroy(Sender: TObject);
begin
  inherited;
  Unidade.Free;
  UnidadeControl.Free;
end;

procedure TCad_Unidades.FormShow(Sender: TObject);
begin
  inherited;
  if not inclusao then
     popularInterface;
end;

procedure TCad_Unidades.popularInterface;
begin
  edt_id.text := inttostr(Unidade.ID);
  edt_Descricao.text := Unidade.Descricao;
  edt_Sigla.Text     := Unidade.Sigla;

  Grupo_Cad.Visible := True;
  Grupo_Alt.Visible := True;

  lbl_Cad.Visible := True;
  lbl_DataCad.Visible := True;
  lbl_DataCad.Caption := Unidade.User_Insert + '-' + DatetoStr(Unidade.DataCad);

  lbl_DataAlt.Caption := Unidade.User_Update + '-' + DatetoStr(Unidade.DataUltAlt);
  Lbl_Alt.Visible := True;
  lbl_DataAlt.Visible := True;
end;

procedure TCad_Unidades.PopularObjeto;
begin
    Unidade.ID := strtoint(edt_id.text);
    Unidade.Descricao := edt_Descricao.text;
    Unidade.sigla     := edt_sigla.text;
end;

function TCad_Unidades.validarDados: boolean;
begin
  result := False;

  if not (length(edt_Descricao.Text) > 0) then
  begin
    ShowMessage('Insira a Descrição da Unidade');
    edt_Descricao.setFocus;
    exit;
  end;

  if not (length(edt_Sigla.Text) > 0) then
  begin
    ShowMessage('Insira a Sigla da Unidade');
    edt_Sigla.setFocus;
    exit;
  end;

  result := True;
end;

end.
