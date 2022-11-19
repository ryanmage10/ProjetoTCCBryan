unit uItensCompraFactory;

interface
uses uItensCompra, system.SysUtils, DBClient, uItensCompraDao, uDmConexao,
System.Generics.Collections, uCompras;
  type
  TItensCompraFactory = class(TObject)
    private
      ItensCompraDao : TItensCompraDao;
    protected
    public
      constructor create;
      destructor free;
      function Inserir(oItensCompra: TItensCompra):Boolean;
      function InserirItens(ListaItens: TList<TItensCompra>): boolean;
      function Excluir(oItensCompra: TItensCompra):Boolean;
      function ExcluirPorCompra(Id: Integer): Boolean;
      function Recuperar(var oItensCompra: TItensCompra):Boolean;
      function RecuperarPorCompra(Var Compra: TCompras): boolean;
  end;

  var
  ItensCompraFactory: TItensCompraFactory;
implementation

{ TItensCompraFactory }



constructor TItensCompraFactory.create;
begin
   ItensCompraDao := TItensCompraDao.Create;
end;

function TItensCompraFactory.Excluir(oItensCompra: TItensCompra): Boolean;
begin
   result := ItensCompraDao.Excluir(oItensCompra);
end;

function TItensCompraFactory.ExcluirPorCompra(
  Id: Integer): Boolean;
begin
  result := ItensCompraDao.ExcluirPorCompra(Id);
end;

destructor TItensCompraFactory.free;
begin
   freeandnil(ItensCompraDao);
end;

function TItensCompraFactory.Inserir(oItensCompra: TItensCompra): Boolean;
begin
   oItensCompra.User_Insert := 'Bryan';
   oItensCompra.User_Update := 'Bryan';
   oItensCompra.DataCad := now;
   oItensCompra.DataUltAlt := now;
   result := ItensCompraDao.Inserir(oItensCompra);
end;

function TItensCompraFactory.InserirItens(
  ListaItens: TList<TItensCompra>): boolean;
begin
  result := ItensCompraDao.InserirItens(ListaItens);
end;

function TItensCompraFactory.Recuperar(var oItensCompra: TItensCompra): Boolean;
begin
   result := ItensCompraDao.Recuperar(oItensCompra);
end;

function TItensCompraFactory.RecuperarPorCompra(
  var Compra: TCompras): boolean;
begin
   result := ItensCompraDao.RecuperarPorCompra(Compra);
end;

end.
