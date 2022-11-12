unit uClientesController;

interface
  uses uClientes, uClientesService, system.SysUtils, DBClient;
  type
  TClientesController = class(TObject)
    private
      Clienteservice : TClientesService;
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
implementation

{ TClientesController }

function TClientesController.Alterar(oCliente: TClientes): Boolean;
begin
   result := Clienteservice.Alterar(oCliente);
end;

constructor TClientesController.create;
begin
   Clienteservice := TClientesService.Create;
end;

function TClientesController.Excluir(oCliente: TClientes): Boolean;
begin
   result := Clienteservice.Excluir(oCliente);
end;

destructor TClientesController.free;
begin
   freeandnil(Clienteservice);
end;

function TClientesController.Inserir(oCliente: TClientes): Boolean;
begin
   result := Clienteservice.Inserir(oCliente);
end;

procedure TClientesController.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
  Clienteservice.Pesquisar(sNome, dset);
end;

function TClientesController.Recuperar(var oCliente: TClientes): Boolean;
begin
   result := Clienteservice.Recuperar(oCliente);
end;

function TClientesController.VerificarExclusao(Value: TClientes): boolean;
begin
  result := Clienteservice.VerificarExclusao(Value);
end;

function TClientesController.VerificarCpfCnpj(Value: TClientes): boolean;
begin
  result := Clienteservice.VerificarCpfCnpj(Value);
end;

end.
