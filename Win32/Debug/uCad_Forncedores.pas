unit uCad_Fornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCad_Pessoa, Vcl.ComCtrls, Vcl.Mask,
  Vcl.StdCtrls, Vcl.ExtCtrls, uFornecedores, uFornecedoresController, uCons_Cidades, uPessoas, uCidades,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinBasic, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinOffice2019Black, dxSkinOffice2019Colorful,
  dxSkinOffice2019DarkGray, dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringtime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinTheBezier, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxContainer, cxEdit, Vcl.Menus, dxCore, cxDateUtils,
  dxLayoutcxEditAdapters, dxLayoutControlAdapters, cxClasses,
  dxLayoutLookAndFeels, dxLayoutContainer, cxGroupBox, cxRadioGroup,
  cxDropDownEdit, cxCalendar, cxMaskEdit, cxLabel, cxButtons, cxTextEdit,
  dxLayoutControl;

type
  TCad_Fornecedores = class(TCad_Pessoa)
    procedure btn_PesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Fornecedor : TFornecedores;
    FornecedorControl : TFornecedoresController;
  end;

var
  Cad_Fornecedores: TCad_Fornecedores;

implementation

{$R *.dfm}

procedure TCad_Fornecedores.btn_PesquisarClick(Sender: TObject);
var ConsCidadeForm: TCons_Cidades;
begin
   ConsCidadeForm := TCons_Cidades.Create(nil);
   try
      ConsCidadeForm.Selecao := True;
      ConsCidadeForm.ShowModal;
      Fornecedor.Cidade := (ConsCidadeForm.Cidade.clone);
      edt_Cidade.text := Fornecedor.Cidade.Nome;
      edt_uf.text := Fornecedor.Cidade.Estado.uf;
   finally
      FreeAndNil(ConsCidadeForm);
   end;
end;

procedure TCad_Fornecedores.FormCreate(Sender: TObject);
begin
  inherited;
  Forncedor := TClientes.Create;
  ForncedorControl := TClientesController.Create;
end;

end.
