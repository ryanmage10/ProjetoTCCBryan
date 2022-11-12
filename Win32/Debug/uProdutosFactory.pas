unit uProdutosFactory;

interface
uses uProdutos, system.SysUtils, DBClient, uProdutosDao, uDmConexao;
  type
  TProdutosFactory = class(TObject)
    private
      ProdutoDao : TProdutosDao;
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
  ProdutosFactory: TProdutosFactory;
implementation

{ TProdutosFactory }

function TProdutosFactory.Alterar(Value: TProdutos): Boolean;
begin
   Value.User_Update := 'Bryan Silva';
   Value.DataUltAlt := now;
   result := ProdutoDao.Alterar(Value);
end;

constructor TProdutosFactory.create;
begin
   ProdutoDao := TProdutosDao.Create;
end;

function TProdutosFactory.Excluir(Value: TProdutos): Boolean;
begin
   result := ProdutoDao.Excluir(Value);
end;

destructor TProdutosFactory.free;
begin
   freeandnil(ProdutoDao);
end;

function TProdutosFactory.Inserir(Value: TProdutos): Boolean;
begin
   Value.User_Insert := 'Bryan';
   Value.User_Update := 'Bryan';
   Value.DataCad := now;
   Value.DataUltAlt := now;
   result := ProdutoDao.Inserir(Value);
end;

procedure TProdutosFactory.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
   ProdutoDao.Pesquisar(sNome, Dset);
end;

function TProdutosFactory.Recuperar(var Value: TProdutos): Boolean;
begin
   result := ProdutoDao.Recuperar(Value);
end;

function TProdutosFactory.VerificarExclusao(Value: TProdutos): boolean;
begin
   result :=  ProdutoDao.VerificarExclusao(Value);
end;

function TProdutosFactory.VerificarNome(Value: TProdutos): boolean;
begin
   result := ProdutoDao.VerificarNome(Value);
end;

end.
