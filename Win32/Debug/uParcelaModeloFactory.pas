unit uParcelaModeloFactory;

interface
uses uParcelaModelos, system.SysUtils, DBClient, uParcelaModeloDao, uDmConexao,
System.Generics.Collections, uCondicaoPagamento;
  type
  TParcelaModeloFactory = class(TObject)
    private
      ParcelaModeloDao : TParcelaModeloDao;
    protected
    public
      constructor create;
      destructor free;
      function Inserir(oParcelaModelo: TParcelaModelo):Boolean;
      function InserirParcelas(ListaParcelas: TList<TParcelaModelo>): boolean;
      function Excluir(oParcelaModelo: TParcelaModelo):Boolean;
      function ExcluirPorCondicaoPagamento(Id: Integer): Boolean;
      function Recuperar(var oParcelaModelo: TParcelaModelo):Boolean;
      function RecuperarPorCondicaoPagamento(Var CondicaoPagamento: TCondicaoPagamento): boolean;
  end;

  var
  ParcelaModeloFactory: TParcelaModeloFactory;
implementation

{ TParcelaModeloFactory }



constructor TParcelaModeloFactory.create;
begin
   ParcelaModeloDao := TParcelaModeloDao.Create;
end;

function TParcelaModeloFactory.Excluir(oParcelaModelo: TParcelaModelo): Boolean;
begin
   result := ParcelaModeloDao.Excluir(oParcelaModelo);
end;

function TParcelaModeloFactory.ExcluirPorCondicaoPagamento(
  Id: Integer): Boolean;
begin
  result := ParcelaModeloDao.ExcluirPorCondicaoPagamento(Id);
end;

destructor TParcelaModeloFactory.free;
begin
   freeandnil(ParcelaModeloDao);
end;

function TParcelaModeloFactory.Inserir(oParcelaModelo: TParcelaModelo): Boolean;
begin
   oParcelaModelo.User_Insert := 'Bryan';
   oParcelaModelo.User_Update := 'Bryan';
   oParcelaModelo.DataCad := now;
   oParcelaModelo.DataUltAlt := now;
   result := ParcelaModeloDao.Inserir(oParcelaModelo);
end;

function TParcelaModeloFactory.InserirParcelas(
  ListaParcelas: TList<TParcelaModelo>): boolean;
begin
  result := ParcelaModeloDao.InserirParcelas(ListaParcelas);
end;

function TParcelaModeloFactory.Recuperar(var oParcelaModelo: TParcelaModelo): Boolean;
begin
   result := ParcelaModeloDao.Recuperar(oParcelaModelo);
end;

function TParcelaModeloFactory.RecuperarPorCondicaoPagamento(
  var CondicaoPagamento: TCondicaoPagamento): boolean;
begin
   result := ParcelaModeloDao.RecuperarPorCondicaoPagamento(CondicaoPagamento);
end;

end.
