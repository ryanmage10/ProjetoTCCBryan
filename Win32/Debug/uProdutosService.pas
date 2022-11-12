unit uProdutosService;

interface
uses uProdutos, uProdutosFactory, system.SysUtils, DBClient, uDmConexao;
  type
  TProdutosService = class(TObject)
    private
      ProdutoFactory : TProdutosFactory;
    protected
    public
      constructor create;
      destructor free;
      function Inserir(Value: TProdutos):Boolean;
      function Alterar(Value: TProdutos):Boolean;
      function Excluir(Value: TProdutos):Boolean;
      function Recuperar(var Value: TProdutos):Boolean;
      procedure Pesquisar(sNome: string; var Dset: TClientDataSet);
      function VerificarNome(Value: TProdutos): boolean;
      function VerificarExclusao(Value: TProdutos): boolean;
  end;
  var
  ProdutosService: TProdutosService;
implementation

{ TProdutosService }

function TProdutosService.Alterar(Value: TProdutos): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := ProdutoFactory.Alterar(Value);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Alterar o Produto' + E.Message);
      end;
   end;
end;

constructor TProdutosService.create;
begin
   ProdutoFactory := TProdutosFactory.Create;
end;

function TProdutosService.Excluir(Value: TProdutos): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := ProdutoFactory.Excluir(Value);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Excluir o Produto' + E.Message);
      end;
   end;
end;

destructor TProdutosService.free;
begin
   freeandnil(ProdutoFactory);
end;

function TProdutosService.Inserir(Value: TProdutos): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := ProdutoFactory.Inserir(Value);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Inserir o Produto' + E.Message);
      end;
   end;
end;

procedure TProdutosService.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        ProdutoFactory.Pesquisar(sNome, Dset);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Pesquisar o Produto' + E.Message);
      end;
   end;
end;

function TProdutosService.Recuperar(var Value: TProdutos): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := ProdutoFactory.Recuperar(Value);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Inserir o Produto' + E.Message);
      end;
   end;
end;

function TProdutosService.VerificarExclusao(Value: TProdutos): boolean;
begin
  try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := ProdutoFactory.VerificarExclusao(Value);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Verificar a exclusao do Produto' + E.Message);
      end;
   end;
end;

function TProdutosService.VerificarNome(Value: TProdutos): boolean;
begin
  try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := ProdutoFactory.VerificarNome(Value);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Verificar o nome do Produto' + E.Message);
      end;
   end;
end;

end.
