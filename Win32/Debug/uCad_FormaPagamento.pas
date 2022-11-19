unit uCad_FormaPagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCad_Base, Vcl.StdCtrls, Vcl.ExtCtrls, uFormaPagamento,
  uFormaPagamentoController, cxGraphics, cxControls, cxLookAndFeels,
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
  TCad_FormaPagamento = class(TCad_Base)
    dxLayoutGroup6: TdxLayoutGroup;
    edt_descricao: TcxTextEdit;
    dxLayoutItem9: TdxLayoutItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
  private
    { Private declarations }
    FormaPagamentoControl: TFormaPagamentoController;
    function validarDados: boolean;
    procedure popularInterface;
    procedure PopularObjeto;
  public
    { Public declarations }

    FormaPagamento: TFormaPagamento;
  end;

var
  Cad_FormaPagamento: TCad_FormaPagamento;

implementation

{$R *.dfm}

procedure TCad_FormaPagamento.btn_SalvarClick(Sender: TObject);
begin
  inherited;
  if validarDados then
  begin
     popularObjeto;

     if not FormaPagamentoControl.VerificarNome(FormaPagamento) then
     begin
       if Inclusao then
          FormaPagamentoControl.Inserir(FormaPagamento)
       else
          FormaPagamentoControl.Alterar(FormaPagamento);

       Self.Close;
     end
     else
      raise Exception.Create('J� Existe uma forma de pagamento cadastrada com esse nome');
  end;
end;

procedure TCad_FormaPagamento.FormCreate(Sender: TObject);
begin
  inherited;
  FormaPagamento := TFormaPagamento.Create;
  FormaPagamentoControl := TFormaPagamentoController.Create;
end;

procedure TCad_FormaPagamento.FormDestroy(Sender: TObject);
begin
  inherited;
  FormaPagamento.Free;
  FormaPagamentoControl.Free;
end;

procedure TCad_FormaPagamento.FormShow(Sender: TObject);
begin
  inherited;
  if not inclusao then
     popularInterface;
end;

procedure TCad_FormaPagamento.popularInterface;
begin
  edt_id.text := inttostr(FormaPagamento.ID);
  edt_Descricao.text := FormaPagamento.Descricao;

  Grupo_Cad.Visible := True;
  Grupo_Alt.Visible := True;

  lbl_Cad.Visible := True;
  lbl_DataCad.Visible := True;
  lbl_DataCad.Caption := FormaPagamento.User_Insert + '-' + DatetoStr(FormaPagamento.DataCad);

  lbl_DataAlt.Caption := FormaPagamento.User_Update + '-' + DatetoStr(FormaPagamento.DataUltAlt);
  Lbl_Alt.Visible := True;
  lbl_DataAlt.Visible := True;
end;

procedure TCad_FormaPagamento.PopularObjeto;
begin
   FormaPagamento.ID := strtoint(edt_id.text);
   FormaPagamento.Descricao := edt_Descricao.text;
end;

function TCad_FormaPagamento.validarDados: boolean;
begin
   result := False;
  if not (length(edt_Descricao.Text) > 0) then
  begin
    ShowMessage('Insira a Descri��o da Forma de Pagamento');
    edt_Descricao.setFocus;
    exit;
  end;

  result := True;
end;

end.
