unit uCons_Produtos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCons_Base, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Datasnap.DBClient, uProdutosController, uProdutos,
  uCad_Produtos;

type
  TCons_Produtos = class(TCons_Base)
    ds_produtos: TDataSource;
    dset_produtos: TClientDataSet;
    dset_produtosid: TIntegerField;
    dset_produtosdescricao: TStringField;
    dset_produtoscodigo: TStringField;
    dset_produtosunidade: TStringField;
    dset_produtosdata_insert: TDateTimeField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btn_PesquisarClick(Sender: TObject);
    procedure btn_SelecionarClick(Sender: TObject);
    procedure btn_NovoClick(Sender: TObject);
    procedure btn_AlterarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
  private
    { Private declarations }
    ProdutoControl : TProdutosController;
  public
    { Public declarations }
    Produto : TProdutos;
  end;

var
  Cons_Produtos: TCons_Produtos;

implementation

{$R *.dfm}

procedure TCons_Produtos.btn_AlterarClick(Sender: TObject);
var CadProdutoForm: TCad_Produtos;
begin
   if (dset_Produtos.Active) and (dset_Produtos.RecordCount > 0) then
   begin
     CadProdutoForm := TCad_Produtos.Create(nil);
     Produto.LimparDados;
     Produto.id := Dset_Produtos.FieldByName('id').asInteger;
     if ProdutoControl.Recuperar(Produto) then
     begin
       try
          CadProdutoForm.Produto.CopiarDados(Produto);
          CadProdutoForm.Inclusao := False;
          CadProdutoForm.ShowModal;
          ProdutoControl.Pesquisar(edt_Pesquisa.Text, Dset_Produtos);
       finally
          //
       end;
     end;
   end
   else
     raise Exception.Create('Erro ao Alterar: Lista Vazia');
end;

procedure TCons_Produtos.btn_ExcluirClick(Sender: TObject);
begin
  inherited;
  if (dset_Produtos.Active) and (dset_Produtos.RecordCount > 0) then
  begin
      Produto.ID := dset_ProdutosID.AsInteger;
      if not ProdutoControl.VerificarExclusao(Produto) then
      begin
        if MessageDlg('Deseja Realmente excluir o Produto : '+ dset_ProdutosDescricao.AsString +' ?', mtConfirmation, [mbYes, mbNo], 0) = idYES then
        begin
            ProdutoControl.Excluir(Produto);
            ProdutoControl.Pesquisar(edt_Pesquisa.Text, Dset_Produtos);
        end;
      end
      else
        raise Exception.Create('Erro ao excluir: Há registros vinculados à esse Produto');
  end
  else
  begin
    raise Exception.Create('Erro ao excluir: Nenhum registro Selecionado');
  end;
end;

procedure TCons_Produtos.btn_NovoClick(Sender: TObject);
var CadProdutoForm: TCad_Produtos;
begin
   CadProdutoForm := TCad_Produtos.Create(nil);
   try
      CadProdutoForm.Inclusao := True;
      CadProdutoForm.ShowModal;
      edt_Pesquisa.Clear;
      ProdutoControl.Pesquisar(edt_Pesquisa.Text, Dset_Produtos);
   finally
      //
   end;
end;

procedure TCons_Produtos.btn_PesquisarClick(Sender: TObject);
begin
  inherited;
  ProdutoControl.Pesquisar(edt_Pesquisa.Text, Dset_Produtos);
end;

procedure TCons_Produtos.btn_SelecionarClick(Sender: TObject);
begin
  inherited;
  if dset_Produtos.RecordCount > 0 then
  begin
    Produto.ID := dset_Produtosid.AsInteger;
    if ProdutoControl.Recuperar(Produto) then
      self.Close;
  end;
end;

procedure TCons_Produtos.FormCreate(Sender: TObject);
begin
  inherited;
  ProdutoControl := TProdutosController.Create;
  Produto := TProdutos.Create;

  if ( not Dset_Produtos.IsEmpty ) then
    Dset_Produtos.EmptyDataSet;
  Dset_Produtos.Active := False;
  Dset_Produtos.CreateDataSet;
  Dset_Produtos.Open;
end;

procedure TCons_Produtos.FormDestroy(Sender: TObject);
begin
  inherited;
  Produto.Free;
  ProdutoControl.Free;
end;

procedure TCons_Produtos.FormShow(Sender: TObject);
begin
  inherited;
  ProdutoControl.Pesquisar(edt_Pesquisa.Text, Dset_Produtos);
end;

end.
