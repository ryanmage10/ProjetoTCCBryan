unit uClientesService;

interface
uses uClientes, uClientesFactory, system.SysUtils, DBClient, uDmConexao;
  type
  TClientesService = class(TObject)
    private
      ClienteFactory : TClientesFactory;
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
  ClientesService: TClientesService;
implementation

{ TClientesService }

function TClientesService.Alterar(oCliente: TClientes): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := ClienteFactory.Alterar(oCliente);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Alterar o Cliente' + E.Message);
      end;
   end;
end;

constructor TClientesService.create;
begin
   ClienteFactory := TClientesFactory.Create;
end;

function TClientesService.Excluir(oCliente: TClientes): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := ClienteFactory.Excluir(oCliente);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Excluir o Cliente' + E.Message);
      end;
   end;
end;

destructor TClientesService.free;
begin
   freeandnil(ClienteFactory);
end;

function TClientesService.Inserir(oCliente: TClientes): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := ClienteFactory.Inserir(oCliente);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Inserir o Cliente' + E.Message);
      end;
   end;
end;

procedure TClientesService.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        ClienteFactory.Pesquisar(sNome, Dset);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Pesquisar o Cliente' + E.Message);
      end;
   end;
end;

function TClientesService.Recuperar(var oCliente: TClientes): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := ClienteFactory.Recuperar(oCliente);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Inserir a Cliente' + E.Message);
      end;
   end;
end;

function TClientesService.VerificarExclusao(Value: TClientes): boolean;
begin
  try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := ClienteFactory.VerificarExclusao(Value);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Verificar a exclusao do Cliente' + E.Message);
      end;
   end;
end;

function TClientesService.VerificarCpfCnpj(Value: TClientes): boolean;
begin
  try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := ClienteFactory.VerificarCpfCnpj(Value);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Verificar o nome do Cliente' + E.Message);
      end;
   end;
end;

end.
