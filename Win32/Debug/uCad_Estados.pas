unit uCad_Estados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCad_Base, Vcl.StdCtrls, Vcl.ExtCtrls,
  uCons_Paises, uEstados, uEstadosController, cxGraphics, cxControls,
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
  dxLayoutLookAndFeels, dxLayoutContainer, cxLabel, cxButtons, cxTextEdit,
  dxLayoutControl;

type
  TCad_Estados = class(TCad_Base)
    dxLayoutGroup6: TdxLayoutGroup;
    dxLayoutGroup7: TdxLayoutGroup;
    Edt_Estado: TcxTextEdit;
    dxLayoutItem9: TdxLayoutItem;
    Edt_Sigla: TcxTextEdit;
    dxLayoutItem10: TdxLayoutItem;
    Edt_pais: TcxTextEdit;
    dxLayoutItem11: TdxLayoutItem;
    btn_Pesquisar: TcxButton;
    dxLayoutItem12: TdxLayoutItem;
    procedure btn_pesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
  private
    { Private declarations }
    procedure popularInterface;
    procedure PopularObjeto;
    function ValidarDados: boolean;
  public
    { Public declarations }
    Estado : TEstados;
    estadoControl : TEstadosController;
  end;

implementation

{$R *.dfm}

procedure TCad_Estados.btn_pesquisarClick(Sender: TObject);
var ConsPaisForm: TCons_Paises;
begin
   ConsPaisForm := TCons_Paises.Create(nil);
   try
      ConsPaisForm.Selecao := True;
      ConsPaisForm.ShowModal;
      Estado.Pais := (ConsPaisForm.Pais.clone);
      edt_Pais.text := Estado.Pais.Nome
   finally
      FreeAndNil(ConsPaisForm);
   end;
end;

procedure TCad_Estados.btn_SalvarClick(Sender: TObject);
begin
  inherited;
  if ValidarDados then
  begin
    popularObjeto;

    if not EstadoControl.VerificarNome(Estado) then
     begin
        if Inclusao then
           estadoControl.Inserir(Estado)
        else
          estadoControl.Alterar(Estado);

        self.Close;
     end
     else
      raise Exception.Create('J� Existe um Estado cadastrado com esse nome');
  end;
end;

procedure TCad_Estados.FormCreate(Sender: TObject);
begin
  inherited;
  Estado := TEstados.Create;
  estadoControl := TEstadosController.Create;
end;

procedure TCad_Estados.FormDestroy(Sender: TObject);
begin
  inherited;
  Estado.Free;
  estadoControl.Free;
end;

procedure TCad_Estados.FormShow(Sender: TObject);
begin
  inherited;
  if not inclusao then
    popularInterface;
end;

procedure TCad_Estados.popularInterface;
begin
  edt_id.text := inttostr(Estado.ID);
  edt_estado.text := Estado.Nome;
  edt_sigla.text := estado.UF;
  edt_pais.text := Estado.Pais.Nome;

    lbl_Cad.Visible := True;
    lbl_DataCad.Visible := True;
    lbl_DataCad.Caption := Estado.User_Insert + '-' + DatetoStr(Estado.DataCad);

    lbl_DataAlt.Caption := Estado.User_Update + '-' + DatetoStr(Estado.DataUltAlt);
    Lbl_Alt.Visible := True;
    lbl_DataAlt.Visible := True;
end;

procedure TCad_Estados.PopularObjeto;
begin
  Estado.ID := strtoint(edt_id.text);
  Estado.Nome := edt_Estado.text;
  Estado.UF := edt_sigla.text;
end;

function TCad_Estados.ValidarDados: boolean;
begin
  result := false;
  if not (length(edt_Estado.Text) > 0) then
  begin
    ShowMessage('Insira o nome do Estado');
    edt_Estado.setFocus;
    exit;
  end;

  if not (length(edt_sigla.Text) > 0) then
  begin
    ShowMessage('Insira a sigla do Estado');
    edt_sigla.setFocus;
    exit;
  end;

  if not (length(edt_Pais.Text) > 0) then
  begin
    ShowMessage('Insira o nome do Pais');
    btn_Pesquisar.setFocus;
    exit;
  end;

  result := true;
end;

end.
