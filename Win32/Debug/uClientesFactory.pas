unit uClientesFactory;

interface
uses uClientes, system.SysUtils, DBClient, uClientesDao, uDmConexao;
  type
  TClientesFactory = class(TObject)
    private
      ClienteDao : TClientesDao;
    protected
    public
      constructor create;
      destructor free;
      function Inserir(oCliente: TClientes):Boolean;
      function Alterar(oCliente: TClientes):Boolean;
      function Excluir(oCliente: TClientes):Boolean;
      function Recuperar(var oCliente: TClientes):Boolean;
      procedure Pesquisar(sNome: string; var Dset: TClientDataSet);
      function VerificarCpfCnpj(Value: TClientes): boolean;
      function VerificarExclusao(Value: TClientes): boolean;
  end;

  var
  ClientesFactory: TClientesFactory;
implementation

{ TClientesFactory }

function TClientesFactory.Alterar(oCliente: TClientes): Boolean;
begin
   oCliente.User_Update := 'Bryan Silva';
   oCliente.DataUltAlt := now;
   result := ClienteDao.Alterar(oCliente);
end;

constructor TClientesFactory.create;
begin
   ClienteDao := TClientesDao.Create;
end;

function TClientesFactory.Excluir(oCliente: TClientes): Boolean;
begin
   result := ClienteDao.Excluir(oCliente);
end;

destructor TClientesFactory.free;
begin
   freeandnil(ClienteDao);
end;

function TClientesFactory.Inserir(oCliente: TClientes): Boolean;
begin
   oCliente.User_Insert := 'Bryan';
   oCliente.User_Update := 'Bryan';
   oCliente.DataCad := now;
   oCliente.DataUltAlt := now;
   result := ClienteDao.Inserir(oCliente);
end;

procedure TClientesFactory.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
   ClienteDao.Pesquisar(sNome, Dset);
end;

function TClientesFactory.Recuperar(var oCliente: TClientes): Boolean;
begin
   result := ClienteDao.Recuperar(oCliente);
end;

function TClientesFactory.VerificarExclusao(Value: TClientes): boolean;
begin
   result :=  ClienteDao.VerificarExclusao(Value);
end;

function TClientesFactory.VerificarCpfCnpj(Value: TClientes): boolean;
begin
   result := ClienteDao.VerificarCpfCnpj(Value);
end;

end.
