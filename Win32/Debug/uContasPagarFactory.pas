unit uContasPagarFactory;

interface
uses uContasPagars, system.SysUtils, DBClient, uContasPagarDao, uDmConexao,
System.Generics.Collections, uCompra;
  type
  TContasPagarFactory = class(TObject)
    private
      ContasPagarDao : TContasPagarDao;
    protected
    public
      constructor create;
      destructor free;
      function Inserir(oContasPagar: TContasPagar):Boolean;
      function InserirParcelas(ListaParcelas: TList<TContasPagar>): boolean;
      function Excluir(oContasPagar: TContasPagar):Boolean;
      function ExcluirPorCondicaoPagamento(Id: Integer): Boolean;
      function Recuperar(var oContasPagar: TContasPagar):Boolean;
      function RecuperarPorCompra(Var Compra: TCompras): boolean;
  end;

  var
  ContasPagarFactory: TContasPagarFactory;
implementation

{ TContasPagarFactory }



constructor TContasPagarFactory.create;
begin
   ContasPagarDao := TContasPagarDao.Create;
end;

function TContasPagarFactory.Excluir(oContasPagar: TContasPagar): Boolean;
begin
   result := ContasPagarDao.Excluir(oContasPagar);
end;

function TContasPagarFactory.ExcluirPorCondicaoPagamento(
  Id: Integer): Boolean;
begin
  result := ContasPagarDao.ExcluirPorCondicaoPagamento(Id);
end;

destructor TContasPagarFactory.free;
begin
   freeandnil(ContasPagarDao);
end;

function TContasPagarFactory.Inserir(oContasPagar: TContasPagar): Boolean;
begin
   oContasPagar.User_Insert := 'Bryan';
   oContasPagar.User_Update := 'Bryan';
   oContasPagar.DataCad := now;
   oContasPagar.DataUltAlt := now;
   result := ContasPagarDao.Inserir(oContasPagar);
end;

function TContasPagarFactory.InserirParcelas(
  ListaParcelas: TList<TContasPagar>): boolean;
begin
  result := ContasPagarDao.InserirParcelas(ListaParcelas);
end;

function TContasPagarFactory.Recuperar(var oContasPagar: TContasPagar): Boolean;
begin
   result := ContasPagarDao.Recuperar(oContasPagar);
end;

function TContasPagarFactory.RecuperarPorCompra(
  var Compra: TCompras): boolean;
begin
   result := ContasPagarDao.RecuperarPorCompra(Compra);
end;

end.
