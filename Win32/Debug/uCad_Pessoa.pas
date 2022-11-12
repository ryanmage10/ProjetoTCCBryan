unit uCad_Pessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCad_Base, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Mask, cxGraphics, cxControls, cxLookAndFeels,
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
  dxLayoutControl, dxCore, cxDateUtils, cxGroupBox, cxRadioGroup,
  cxDropDownEdit, cxCalendar, cxMaskEdit;

type
  TCad_Pessoa = class(TCad_Base)
    dxLayoutGroup6: TdxLayoutGroup;
    dxLayoutGroup7: TdxLayoutGroup;
    dxLayoutGroup8: TdxLayoutGroup;
    dxLayoutGroup9: TdxLayoutGroup;
    dxLayoutGroup10: TdxLayoutGroup;
    dxLayoutGroup11: TdxLayoutGroup;
    dxLayoutGroup12: TdxLayoutGroup;
    edt_Nome: TcxTextEdit;
    lbl_Nome: TdxLayoutItem;
    edt_Razao_Social: TcxTextEdit;
    lbl_RazaoSocial: TdxLayoutItem;
    edt_Logradouro: TcxTextEdit;
    lbl_logradouro: TdxLayoutItem;
    edt_CPFCNPJ: TcxMaskEdit;
    lbl_CPFCNPJ: TdxLayoutItem;
    edt_RGIE: TcxMaskEdit;
    lbl_RGIE: TdxLayoutItem;
    edt_dataNasc: TcxDateEdit;
    lbl_DataNasc: TdxLayoutItem;
    edt_numero: TcxTextEdit;
    lbl_numero: TdxLayoutItem;
    edt_Cep: TcxMaskEdit;
    lbl_Cep: TdxLayoutItem;
    Rg_TipoPessoa: TcxRadioGroup;
    dxLayoutItem17: TdxLayoutItem;
    rg_Sexo: TcxRadioGroup;
    LayoutSexo: TdxLayoutItem;
    edt_Bairro: TcxTextEdit;
    lbl_Bairro: TdxLayoutItem;
    edt_Complemento: TcxTextEdit;
    lbl_Complemento: TdxLayoutItem;
    edt_Cidade: TcxTextEdit;
    dxLayoutItem21: TdxLayoutItem;
    edt_UF: TcxTextEdit;
    lbl_UF: TdxLayoutItem;
    btn_Pesquisar: TcxButton;
    dxLayoutItem23: TdxLayoutItem;
    edt_Tel_Fixo: TcxMaskEdit;
    lbl_Tel_Fixo: TdxLayoutItem;
    edt_Tel_Cel: TcxMaskEdit;
    lbl_Tel_Cel: TdxLayoutItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Cad_Pessoa: TCad_Pessoa;

implementation

{$R *.dfm}

end.
