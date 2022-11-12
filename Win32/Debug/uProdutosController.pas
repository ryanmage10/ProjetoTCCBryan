unit uProdutosController;

interface
  uses uProdutos, uProdutosService, system.SysUtils, DBClient;
  type
  TProdutosController = class(TObject)
    private
      Produtoservice : TProdutosService;
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
implementation

{ TProdutosController }

function TProdutosController.Alterar(Value: TProdutos): Boolean;
begin
   result := Produtoservice.Alterar(Value);
end;

constructor TProdutosController.create;
begin
   Produtoservice := TProdutosService.Create;
end;

function TProdutosController.Excluir(Value: TProdutos): Boolean;
begin
   result := Produtoservice.Excluir(Value);
end;

destructor TProdutosController.free;
begin
   freeandnil(Produtoservice);
end;

function TProdutosController.Inserir(Value: TProdutos): Boolean;
begin
   result := Produtoservice.Inserir(Value);
end;

procedure TProdutosController.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
  Produtoservice.Pesquisar(sNome, dset);
end;

function TProdutosController.Recuperar(var Value: TProdutos): Boolean;
begin
   result := Produtoservice.Recuperar(Value);
end;

function TProdutosController.VerificarExclusao(Value: TProdutos): boolean;
begin
  result := Produtoservice.VerificarExclusao(Value);
end;

function TProdutosController.VerificarNome(Value: TProdutos): boolean;
begin
  result := Produtoservice.VerificarNome(Value);
end;

end.
