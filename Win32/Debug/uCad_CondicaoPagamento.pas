unit uCad_CondicaoPagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCad_Base, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Datasnap.DBClient, uCondicaoPagamento,
  uCondicaoPagamentoController, uParcelaModelos, uCons_FormaPagamento, uFormaPagamento,
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
  dxLayoutControl, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, dxDateRanges, dxScrollbarAnnotations, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxGridCustomView, cxGrid, cxMaskEdit, cxCurrencyEdit;

type
  TCad_CondicaoPagamento = class(TCad_Base)
    dxLayoutGroup6: TdxLayoutGroup;
    edt_Descricao: TcxTextEdit;
    dxLayoutItem9: TdxLayoutItem;
    edt_Juros: TcxCurrencyEdit;
    dxLayoutItem10: TdxLayoutItem;
    Edt_Multa: TcxCurrencyEdit;
    dxLayoutItem11: TdxLayoutItem;
    edt_Desconto: TcxCurrencyEdit;
    dxLayoutItem12: TdxLayoutItem;
    dxLayoutGroup7: TdxLayoutGroup;
    dxLayoutGroup8: TdxLayoutGroup;
    dxLayoutGroup9: TdxLayoutGroup;
    edt_FormaPagamento: TcxTextEdit;
    dxLayoutItem13: TdxLayoutItem;
    btn_pesquisar: TcxButton;
    dxLayoutItem14: TdxLayoutItem;
    edt_Percentual: TcxCurrencyEdit;
    dxLayoutItem15: TdxLayoutItem;
    edt_Dias: TcxMaskEdit;
    dxLayoutItem16: TdxLayoutItem;
    btn_Adicionar: TcxButton;
    dxLayoutItem17: TdxLayoutItem;
    btn_Alterar: TcxButton;
    dxLayoutItem18: TdxLayoutItem;
    btn_Excluir: TcxButton;
    dxLayoutItem19: TdxLayoutItem;
    GridDBTableView1: TcxGridDBTableView;
    GridLevel1: TcxGridLevel;
    Grid: TcxGrid;
    dxLayoutItem20: TdxLayoutItem;
    GridDBTableView1Numero: TcxGridDBColumn;
    GridDBTableView1Percentual: TcxGridDBColumn;
    GridDBTableView1dias: TcxGridDBColumn;
    GridDBTableView1Forma_Pagamento: TcxGridDBColumn;
    GridDBTableView1IdForma_Pagamento: TcxGridDBColumn;
//    edt_descricao: TEdit;
//    lbl_Descricao: TLabel;
//    lbl_juros: TLabel;
//    lbl_multa: TLabel;
//    lbl_desconto: TLabel;
//    Panel2: TPanel;
//    Grid: TDBGrid;
//    lbl_Percentual: TLabel;
//    edt_percentual: TEdit;
//    lbl_Dias: TLabel;
//    edt_dias: TEdit;
//    btn_adicionar: TButton;
//    btn_alterar: TButton;
//    btn_excluir: TButton;
    ds_parcelas: TDataSource;
    dset_parcelas: TClientDataSet;
    dset_parcelasNumero: TIntegerField;
    dset_parcelasPercentual: TCurrencyField;
    dset_parcelasdias: TIntegerField;
//    edt_FormaPagamento: TEdit;
//    btn_Pesquisar: TButton;
//    Label1: TLabel;
    dset_parcelasForma_Pagamento: TStringField;
    dset_parcelasIdForma_Pagamento: TIntegerField;
//    edt_Juros: TEdit;
//    edt_Multa: TEdit;
//    edt_desconto: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btn_PesquisarClick(Sender: TObject);
    procedure btn_adicionarClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
  private
    { Private declarations }
    Forma_Pagamento: TFormaPagamento;
    FormaPagamentoControl: TFormaPagamentoController;
    Alterar: Boolean;
    NroParcela: Integer;

    procedure popularInterface;
    procedure PopularObjeto;
    function ValidarDados: boolean;
    function ValidarParcela: boolean;
    procedure Act_AdicionarParcela;
    procedure Act_LimparCamposParcela;
    procedure Act_AlterarParcela;
    procedure Act_PopulaCamposAlterar;
    procedure Act_ExecutarAlteracao;
    procedure Act_ExcluirParcela;

  public
    { Public declarations }
    CondicaoPag : TCondicaoPagamento;
    CondicaoPagControl: TCondicaoPagamentoController;
  end;

var
  Cad_CondicaoPagamento: TCad_CondicaoPagamento;

implementation

{$R *.dfm}

procedure TCad_CondicaoPagamento.Act_AdicionarParcela;
begin
  if ValidarParcela then
  begin
    dset_parcelas.Append;
    dset_parcelasNumero.AsInteger := dset_parcelas.RecordCount + 1;
    dset_parcelasPercentual.AsCurrency := edt_Percentual.EditValue;
    dset_parcelasDias.AsInteger  := edt_Dias.EditValue;
    dset_parcelasForma_Pagamento.AsString := Forma_Pagamento.Descricao;
    Dset_ParcelasIdForma_Pagamento.AsInteger := Forma_Pagamento.Id;
    dset_parcelas.Post;

    Act_LimparCamposParcela;
  end;
end;

procedure TCad_CondicaoPagamento.Act_AlterarParcela;
begin
  if Dset_Parcelas.RecordCount = 0 then
  begin
     ShowMessage('Erro ao alterar: Lista de Parcelas Vazia');
     exit;
  end;

  if Alterar then
    Act_PopulaCamposAlterar
  Else
    Act_ExecutarAlteracao;

end;

procedure TCad_CondicaoPagamento.Act_ExcluirParcela;
var i: integer;
begin
  dset_parcelas.Delete;

  dset_parcelas.First;
  for I := 0 to dset_parcelas.RecordCount - 1 do
  begin
    dset_parcelas.Edit;
    dset_parcelasNumero.AsInteger := I+1;
    dset_parcelas.Post;
  end;
end;

procedure TCad_CondicaoPagamento.Act_ExecutarAlteracao;
begin
  if ValidarParcela then
  begin
    dset_parcelas.Edit;
    dset_parcelasPercentual.AsCurrency := edt_Percentual.EditValue;
    dset_parcelasDias.AsInteger  := edt_Dias.EditValue;
    dset_parcelasForma_Pagamento.AsString := Forma_Pagamento.Descricao;
    Dset_ParcelasIdForma_Pagamento.AsInteger := Forma_Pagamento.Id;
    dset_parcelas.Post;

    Alterar := True;
    btn_Adicionar.Enabled := True;
    btn_Excluir.Enabled := True;
    btn_salvar.Enabled := True;
    Grid.Enabled := True;
    Act_LimparCamposParcela;
  end;
end;

procedure TCad_CondicaoPagamento.Act_LimparCamposParcela;
begin
  Forma_Pagamento.LimparDados;
  Edt_FormaPagamento.Clear;
  edt_Percentual.Clear;
  Edt_Dias.Clear;
end;

procedure TCad_CondicaoPagamento.Act_PopulaCamposAlterar;
begin
  Grid.Enabled := False;
  NroParcela := Dset_ParcelasNumero.AsInteger;
  Edt_FormaPagamento.Text := Dset_ParcelasForma_Pagamento.AsString;
  Edt_Percentual.EditValue := Dset_ParcelasPercentual.AsCurrency;
  edt_Dias.EditValue := Dset_ParcelasDias.AsInteger;
  Forma_Pagamento.Id := Dset_ParcelasIdForma_Pagamento.AsInteger;
  FormaPagamentoControl.Recuperar(Forma_Pagamento);

  Alterar := False;
  btn_Adicionar.Enabled := False;
  btn_Excluir.Enabled := False;
  btn_salvar.Enabled := False;
end;

procedure TCad_CondicaoPagamento.btn_PesquisarClick(Sender: TObject);
var ConsFormaPagamentoForm: TCons_FormaPagamento;
begin
   ConsFormaPagamentoForm := TCons_FormaPagamento.Create(nil);
   try
      ConsFormaPagamentoForm.Selecao := True;
      ConsFormaPagamentoForm.ShowModal;
      Forma_Pagamento := (ConsFormaPagamentoForm.FormaPagamento.clone);
      edt_FormaPagamento.text := Forma_Pagamento.Descricao;
   finally
      FreeAndNil(ConsFormaPagamentoForm);
   end;
end;

procedure TCad_CondicaoPagamento.btn_SalvarClick(Sender: TObject);
begin
  inherited;
  if validarDados then
  begin
     popularObjeto;

     if not CondicaoPagControl.VerificarNome(CondicaoPag) then
     begin
       if Inclusao then
          CondicaoPagControl.Inserir(CondicaoPag)
       else
          CondicaoPagControl.Alterar(CondicaoPag);

       Self.Close;
     end
     else
      raise Exception.Create('J� Existe uma Condi��o de pagamento cadastrada com esse nome');
  end;
end;

procedure TCad_CondicaoPagamento.btn_adicionarClick(Sender: TObject);
begin
  Act_AdicionarParcela;
end;

procedure TCad_CondicaoPagamento.btn_alterarClick(Sender: TObject);
begin
  Act_AlterarParcela;
end;

procedure TCad_CondicaoPagamento.btn_ExcluirClick(Sender: TObject);
begin
  inherited;
  Act_ExcluirParcela;
end;

procedure TCad_CondicaoPagamento.FormCreate(Sender: TObject);
begin
  inherited;
  CondicaoPag := TCondicaoPagamento.Create;
  CondicaoPagControl := TCondicaoPagamentoController.Create;
  Forma_Pagamento := TFormaPagamento.Create;
  FormaPagamentoControl := TFormaPagamentoController.Create;

  Alterar := True;
  NroParcela := 0;

  if ( not Dset_Parcelas.IsEmpty ) then
    Dset_Parcelas.EmptyDataSet;
  Dset_Parcelas.Active := False;
  Dset_Parcelas.CreateDataSet;
  Dset_Parcelas.Open;
end;

procedure TCad_CondicaoPagamento.FormDestroy(Sender: TObject);
begin
  inherited;
  CondicaoPag.Free;
  CondicaoPagControl.Free;
  Forma_Pagamento.Free;
end;

procedure TCad_CondicaoPagamento.FormShow(Sender: TObject);
begin
  inherited;
  if not inclusao then
    popularInterface;
end;

procedure TCad_CondicaoPagamento.popularInterface;
var i: Integer;
    Parcela : TParcelaModelo;
begin
  edt_id.text := inttostr(CondicaoPag.ID);
  edt_Descricao.text := CondicaoPag.Descricao;
  edt_Juros.EditValue := CondicaoPag.Juro;
  edt_Multa.EditValue := CondicaoPag.Multa;
  edt_Desconto.EditValue := CondicaoPag.Desconto;

  for I := 0 to CondicaoPag.ParcelaModelos.Count - 1 do
  begin
     Parcela := CondicaoPag.ParcelaModelos.Items[I];
     with dset_parcelas do
     begin
       Append;
       dset_parcelasNumero.AsInteger := Parcela.Numero;
       dset_parcelasPercentual.AsCurrency := Parcela.Percentual;
       dset_parcelasDias.AsInteger := Parcela.Dias;
       dset_parcelasForma_Pagamento.AsString := Parcela.FormaPag.Descricao;
       dset_parcelasIdForma_Pagamento.AsInteger := Parcela.FormaPag.Id;
       post;
     end;
  end;

  lbl_Cad.Visible := True;
  lbl_DataCad.Visible := True;
  lbl_DataCad.Caption := CondicaoPag.User_Insert + '-' + DatetoStr(CondicaoPag.DataCad);

  lbl_DataAlt.Caption := CondicaoPag.User_Update + '-' + DatetoStr(CondicaoPag.DataUltAlt);
  Lbl_Alt.Visible := True;
  lbl_DataAlt.Visible := True;
end;

procedure TCad_CondicaoPagamento.PopularObjeto;
var i : integer;
    parcela : TParcelaModelo;
    Percentual: Currency;
begin

  CondicaoPag.Descricao := edt_Descricao.text;
  CondicaoPag.Juro := edt_Juros.EditValue;
  CondicaoPag.Multa := edt_Multa.EditValue;
  CondicaoPag.Desconto := edt_Desconto.EditValue;

  CondicaoPag.ParcelaModelos.Clear;
  dset_parcelas.First;
  for I := 0 to Dset_Parcelas.RecordCount - 1 do
  begin
     Parcela := TParcelaModelo.Create;
     Parcela.Numero := dset_parcelasNumero.AsInteger;
     Parcela.Percentual := dset_parcelasPercentual.AsCurrency;
     Parcela.Dias := dset_parcelasDias.AsInteger;
     Parcela.FormaPag.Id := dset_parcelasIDForma_Pagamento.AsInteger;
     Parcela.Cod_CondPag := StrToInt(edt_id.text);
     dset_parcelas.Next;
     CondicaoPag.ParcelaModelos.Add(Parcela);
  end;
end;

function TCad_CondicaoPagamento.ValidarDados: boolean;
var Percentual : Currency;
    I: Integer;
begin
  result := false;
  if not (length(edt_Descricao.Text) > 0) then
  begin
    ShowMessage('Insira a Descricao da Condi��o de Pagamento');
    edt_Descricao.setFocus;
    exit;
  end;

  if not (edt_Juros.EditValue > 0) then
  begin
    ShowMessage('Insira um valor de juros val�do');
    edt_Juros.setFocus;
    exit;
  end;

  if not (edt_Multa.EditValue > 0) then
  begin
    ShowMessage('Insira um valor de Multa val�do');
    edt_Multa.setFocus;
    exit;
  end;

  if not (edt_Desconto.EditValue > 0) then
  begin
    ShowMessage('Insira um valor de Desconto val�do');
    edt_Desconto.setFocus;
    exit;
  end;

  if not (Dset_Parcelas.RecordCount > 0) then
  begin
    ShowMessage('� necessario inserir parcelas na condi��o de pagamento');
    exit;
  end;

  Percentual := 0;
  for I := 0 to CondicaoPag.ParcelaModelos.Count - 1 do
     Percentual := Percentual + CondicaoPag.ParcelaModelos.Items[I].Percentual;

  if not (Percentual = 100) then
  begin
    ShowMessage('� necessario que o total do percentual das parcelas seja 100%');
    exit;
  end;

  result := true;
end;

function TCad_CondicaoPagamento.ValidarParcela: boolean;
begin
  result := False;

  if not ((Length(edt_FormaPagamento.Text) > 0) and (Forma_Pagamento.Id > 0)) then
  begin
    ShowMessage('Selecione a Forma de pagamento da parcela.');
    btn_pesquisar.SetFocus;
    exit;
  end;

  if not (edt_percentual.EditValue > 0) then
  begin
    ShowMessage('Informe o percentual da parcela.');
    edt_percentual.SetFocus;
    exit;
  end;

  if not (edt_Dias.EditValue > 0) then
  begin
    ShowMessage('Informe a quantidade de dias de pagamento da parcela.');
    edt_Dias.SetFocus;
    exit;
  end;

  result := True;
end;

end.

