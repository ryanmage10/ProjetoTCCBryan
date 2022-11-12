unit uComprasFactory;

interface
uses uCompras, system.SysUtils, DBClient, uComprasDao, uDmConexao;
  type
  TComprasFactory = class(TObject)
    private
      CompraDao : TComprasDao;
    protected
    public
      constructor create;
      destructor free;
      function Inserir(oCompra: TCompras):Boolean;
      function Alterar(oCompra: TCompras):Boolean;
      function Excluir(oCompra: TCompras):Boolean;
      function Recuperar(var oCompra: TCompras):Boolean;
      procedure Pesquisar(sNome: string; var Dset: TClientDataSet);
      function VerificarExiste(Value: TCompras): boolean;
      function VerificarExclusao(Value: TCompras): boolean;
  end;

  var
  ComprasFactory: TComprasFactory;
implementation

{ TComprasFactory }

function TComprasFactory.Alterar(oCompra: TCompras): Boolean;
begin
   oCompra.User_Update := 'Bryan Silva';
   oCompra.DataUltAlt := now;
   result := CompraDao.Alterar(oCompra);
end;

constructor TComprasFactory.create;
begin
   CompraDao := TComprasDao.Create;
end;

function TComprasFactory.Excluir(oCompra: TCompras): Boolean;
begin
   result := CompraDao.Excluir(oCompra);
end;

destructor TComprasFactory.free;
begin
   freeandnil(CompraDao);
end;

function TComprasFactory.Inserir(oCompra: TCompras): Boolean;
begin
   oCompra.User_Insert := 'Bryan';
   oCompra.User_Update := 'Bryan';
   oCompra.DataCad := now;
   oCompra.DataUltAlt := now;
   result := CompraDao.Inserir(oCompra);
end;

procedure TComprasFactory.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
   CompraDao.Pesquisar(sNome, Dset);
end;

function TComprasFactory.Recuperar(var oCompra: TCompras): Boolean;
begin
   result := CompraDao.Recuperar(oCompra);
end;

function TComprasFactory.VerificarExclusao(Value: TCompras): boolean;
begin
   result :=  CompraDao.VerificarExclusao(Value);
end;

function TComprasFactory.VerificarExiste(Value: TCompras): boolean;
begin
   result := CompraDao.VerificarExiste(Value);
end;

end.
