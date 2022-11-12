unit uCad_Produtos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCad_Base, Vcl.StdCtrls, Vcl.ExtCtrls,
  UProdutosController, UProdutos, uUnidades, UCons_Unidades, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  dxSkinXmas2008Blue, cxContainer, cxEdit, Vcl.Menus, dxLayoutcxEditAdapters,
  dxLayoutControlAdapters, cxClasses, dxLayoutLookAndFeels, dxLayoutContainer,
  cxLabel, cxButtons, cxTextEdit, dxLayoutControl, cxMaskEdit;

type
  TCad_Produtos = class(TCad_Base)
    dxLayoutGroup6: TdxLayoutGroup;
    dxLayoutGroup7: TdxLayoutGroup;
    edt_unidade: TcxTextEdit;
    dxLayoutItem10: TdxLayoutItem;
    edt_Descricao: TcxTextEdit;
    dxLayoutItem11: TdxLayoutItem;
    edt_codigo: TcxTextEdit;
    dxLayoutItem12: TdxLayoutItem;
    btn_pesquisar: TcxButton;
    dxLayoutItem13: TdxLayoutItem;
    edt_NCM: TcxMaskEdit;
    dxLayoutItem9: TdxLayoutItem;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btn_PesquisarClick(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
  private
    { Private declarations }
    ProdutoControl : TProdutosController;
    function validarDados: boolean;
    procedure popularInterface;
    procedure PopularObjeto;
  public
    { Public declarations }
    Produto : TProdutos;
  end;

var
  Cad_Produtos: TCad_Produtos;

implementation

{$R *.dfm}

procedure TCad_Produtos.btn_PesquisarClick(Sender: TObject);
var ConsUnidadeForm: TCons_Unidades;
begin
   ConsUnidadeForm := TCons_Unidades.Create(nil);
   try
      ConsUnidadeForm.Selecao := True;
      ConsUnidadeForm.ShowModal;
      Produto.Unidade := (ConsUnidadeForm.Unidade.clone);
      edt_Unidade.text := Produto.Unidade.Descricao;
   finally
      FreeAndNil(ConsUnidadeForm);
   end;
end;

procedure TCad_Produtos.btn_SalvarClick(Sender: TObject);
begin
  if ValidarDados then
  begin
    popularObjeto;

    if not ProdutoControl.VerificarNome(Produto) then
     begin
        if Inclusao then
           ProdutoControl.Inserir(Produto)
        else
          ProdutoControl.Alterar(Produto);

        self.Close;
     end
     else
      raise Exception.Create('J� Existe um Produto cadastrado com esse nome');
  end;
end;

procedure TCad_Produtos.FormCreate(Sender: TObject);
begin
  inherited;
  Produto := TProdutos.Create;
  ProdutoControl := TProdutosController.Create;
end;

procedure TCad_Produtos.FormDestroy(Sender: TObject);
begin
  inherited;
  Produto.Free;
  ProdutoControl.Free;
end;

procedure TCad_Produtos.FormShow(Sender: TObject);
begin
  inherited;
  if not inclusao then
     popularInterface;
end;

procedure TCad_Produtos.popularInterface;
begin
  edt_id.text := IntToStr(Produto.id);
  edt_descricao.text := Produto.Descricao;
  edt_Codigo.text    := Produto.Codigo;
  edt_Unidade.Text   := Produto.Unidade.Descricao;
  edt_NCM.Text       := Produto.NCM;

  lbl_Cad.Visible := True;
  lbl_DataCad.Visible := True;
  lbl_DataCad.Caption := Produto.User_Insert + '-' + DatetoStr(Produto.DataCad);

  lbl_DataAlt.Caption := Produto.User_Update + '-' + DatetoStr(Produto.DataUltAlt);
  Lbl_Alt.Visible := True;
  lbl_DataAlt.Visible := True;
end;

procedure TCad_Produtos.PopularObjeto;
begin
  Produto.ID := strtoint(edt_id.text);
  Produto.Descricao := edt_Descricao.text;
  Produto.Codigo := edt_Codigo.text;
  Produto.NCM := Edt_NCM.text;
end;

function TCad_Produtos.validarDados: boolean;
begin
  result := False;

  if not (length(edt_Descricao.Text) > 0) then
  begin
    ShowMessage('Insira a Descri��o do Produto');
    edt_Descricao.setFocus;
    exit;
  end;

  if not (length(edt_Codigo.Text) > 0) then
  begin
    ShowMessage('Insira o C�digo do Produto');
    edt_codigo.setFocus;
    exit;
  end;

  if not (length(edt_Unidade.Text) > 0) then
  begin
    ShowMessage('Insira a Unidade do Produto');
    edt_Unidade.setFocus;
    exit;
  end;

  if not (length(edt_NCM.Text) > 0) then
  begin
    ShowMessage('Insira o NCM do Produto');
    edt_NCM .setFocus;
    exit;
  end;

  result := True;
end;

end.
