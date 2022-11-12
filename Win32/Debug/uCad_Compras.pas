unit uCad_Compras;

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
  cxTextEdit, dxLayoutControl, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxCurrencyEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  uCompras, uComprasController, Datasnap.DBClient, uCons_Fornecedores,
  uCons_CondicaoPagamento, uItensCompra;

type
  TCad_Compras = class(TCad_Base)
    dxLayoutGroup6: TdxLayoutGroup;
    dxLayoutGroup7: TdxLayoutGroup;
    dxLayoutGroup8: TdxLayoutGroup;
    dxLayoutGroup9: TdxLayoutGroup;
    dxLayoutGroup10: TdxLayoutGroup;
    dxLayoutGroup11: TdxLayoutGroup;
    edt_CodFornecedor: TcxTextEdit;
    dxLayoutItem12: TdxLayoutItem;
    edt_Fornecedor: TcxTextEdit;
    dxLayoutItem13: TdxLayoutItem;
    edt_DataChegada: TcxDateEdit;
    dxLayoutItem14: TdxLayoutItem;
    edt_DataEmissao: TcxDateEdit;
    dxLayoutItem15: TdxLayoutItem;
    edt_Frete: TcxCurrencyEdit;
    dxLayoutItem16: TdxLayoutItem;
    edt_Despesas: TcxCurrencyEdit;
    dxLayoutItem17: TdxLayoutItem;
    edt_Pedagio: TcxCurrencyEdit;
    dxLayoutItem18: TdxLayoutItem;
    btn_PesquisarForn: TcxButton;
    dxLayoutItem19: TdxLayoutItem;
    edt_CodProduto: TcxTextEdit;
    dxLayoutItem20: TdxLayoutItem;
    edt_Produto: TcxTextEdit;
    dxLayoutItem21: TdxLayoutItem;
    edt_UnidProduto: TcxTextEdit;
    dxLayoutItem22: TdxLayoutItem;
    btn_PesquisarProd: TcxButton;
    dxLayoutItem23: TdxLayoutItem;
    edt_Qtd: TEdit;
    dxLayoutItem24: TdxLayoutItem;
    Edt_Valor: TcxCurrencyEdit;
    dxLayoutItem25: TdxLayoutItem;
    edt_Total: TcxCurrencyEdit;
    dxLayoutItem26: TdxLayoutItem;
    Grid_ItensProdutoDBTableView1: TcxGridDBTableView;
    Grid_ItensProdutoLevel1: TcxGridLevel;
    Grid_ItensProduto: TcxGrid;
    dxLayoutItem27: TdxLayoutItem;
    edt_TotalLiquido: TcxCurrencyEdit;
    dxLayoutItem28: TdxLayoutItem;
    edt_CodCondicaoPag: TcxTextEdit;
    dxLayoutItem29: TdxLayoutItem;
    edt_CondicaoPag: TcxTextEdit;
    dxLayoutItem30: TdxLayoutItem;
    btn_PesquisarCond: TButton;
    dxLayoutItem31: TdxLayoutItem;
    btn_GerarParcelas: TcxButton;
    dxLayoutItem32: TdxLayoutItem;
    Grid_ParcelasDBTableView1: TcxGridDBTableView;
    Grid_ParcelasLevel1: TcxGridLevel;
    Grid_Parcelas: TcxGrid;
    dxLayoutItem33: TdxLayoutItem;
    edt_Serie: TEdit;
    dxLayoutItem9: TdxLayoutItem;
    edt_Numero: TEdit;
    dxLayoutItem10: TdxLayoutItem;
    edt_Modelo: TEdit;
    dxLayoutItem11: TdxLayoutItem;
    DSET_ITENS: TClientDataSet;
    DSET_PARCELAS: TClientDataSet;
    DS_PARCELAS: TDataSource;
    DS_ITENS: TDataSource;
    DSET_ITENSCODPRODUTO: TIntegerField;
    DSET_ITENSPRODUTO: TStringField;
    DSET_ITENSUND: TStringField;
    DSET_ITENSQTD: TCurrencyField;
    DSET_ITENSPRECO: TCurrencyField;
    DSET_ITENSTOTAL: TCurrencyField;
    DSET_ITENSDESC: TCurrencyField;
    DSET_ITENSCUSTO: TCurrencyField;
    Grid_ItensProdutoDBTableView1CODPRODUTO: TcxGridDBColumn;
    Grid_ItensProdutoDBTableView1PRODUTO: TcxGridDBColumn;
    Grid_ItensProdutoDBTableView1UND: TcxGridDBColumn;
    Grid_ItensProdutoDBTableView1QTD: TcxGridDBColumn;
    Grid_ItensProdutoDBTableView1PRECO: TcxGridDBColumn;
    Grid_ItensProdutoDBTableView1TOTAL: TcxGridDBColumn;
    Grid_ItensProdutoDBTableView1DESC: TcxGridDBColumn;
    Grid_ItensProdutoDBTableView1CUSTO: TcxGridDBColumn;
    DSET_PARCELASNUMPARCELA: TStringField;
    DSET_PARCELASVENCIMENTO: TDateField;
    DSET_PARCELASVALOR: TCurrencyField;
    DSET_PARCELASFORMAPGTO: TStringField;
    Grid_ParcelasDBTableView1NUMPARCELA: TcxGridDBColumn;
    Grid_ParcelasDBTableView1VENCIMENTO: TcxGridDBColumn;
    Grid_ParcelasDBTableView1VALOR: TcxGridDBColumn;
    Grid_ParcelasDBTableView1FORMAPGTO: TcxGridDBColumn;
    btn_Inserir: TcxButton;
    dxLayoutItem34: TdxLayoutItem;
    btn_Alterar: TcxButton;
    dxLayoutItem35: TdxLayoutItem;
    btn_Excluir: TcxButton;
    dxLayoutItem36: TdxLayoutItem;
    procedure btn_PesquisarFornClick(Sender: TObject);
    procedure btn_PesquisarCondClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    ItemCompra : TItensCompra;
    Alterar: boolean;
    NroParcela: Integer;
  public
    { Public declarations }
    Compra : TCompras;
    CompraControl: TComprasController;
  end;

var
  Cad_Compras: TCad_Compras;

implementation

{$R *.dfm}

procedure TCad_Compras.btn_PesquisarCondClick(Sender: TObject);
var ConsCondicaoPagamentoForm: TCons_CondicaoPagamento;
begin
   ConsCondicaoPagamentoForm := TCons_CondicaoPagamento.Create(nil);
   try
      ConsCondicaoPagamentoForm.Selecao := True;
      ConsCondicaoPagamentoForm.ShowModal;
      Compra.CondicaoPagamento := (ConsCondicaoPagamentoForm.CondicaoPagamento.clone);
      edt_CondicaoPag.text := Compra.CondicaoPagamento.Descricao;
      edt_CodCondicaoPag.text := IntToStr(Compra.CondicaoPagamento.ID);
   finally
      FreeAndNil(ConsCondicaoPagamentoForm);
   end;
end;

procedure TCad_Compras.btn_PesquisarFornClick(Sender: TObject);
var ConsFornecedorForm: TCons_Fornecedores;
begin
   ConsFornecedorForm := TCons_Fornecedores.Create(nil);
   try
      ConsFornecedorForm.Selecao := True;
      ConsFornecedorForm.ShowModal;
      Compra.Fornecedor := (ConsFornecedorForm.Fornecedor.clone);
      edt_Fornecedor.text := Compra.Fornecedor.Nome;
      edt_CodFornecedor.text := IntToStr(Compra.Fornecedor.ID);
   finally
      FreeAndNil(ConsFornecedorForm);
   end;
end;

procedure TCad_Compras.FormCreate(Sender: TObject);
begin
  inherited;
  Compra := TCompras.Create;
  CompraControl := TComprasController.Create;

  ItemCompra := TItensCompra.Create;
  //ItemCompraControl := TItemCompraController.Create;

  Alterar := True;
  NroParcela := 0;

  if ( not Dset_ITENS.IsEmpty ) then
    Dset_ITENS.EmptyDataSet;
  Dset_ITENS.Active := False;
  Dset_ITENS.CreateDataSet;
  Dset_ITENS.Open;

  if ( not Dset_Parcelas.IsEmpty ) then
    Dset_Parcelas.EmptyDataSet;
  Dset_Parcelas.Active := False;
  Dset_Parcelas.CreateDataSet;
  Dset_Parcelas.Open;
end;

end.