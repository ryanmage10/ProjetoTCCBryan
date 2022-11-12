unit uEmpresasService;

interface
uses uEmpresas, uEmpresasFactory, system.SysUtils, DBClient, uDmConexao;
  type
  TEmpresasService = class(TObject)
    private
      EmpresaFactory : TEmpresasFactory;
    protected
    public
      constructor create;
      destructor free;
      function Inserir(oEmpresa: TEmpresas):Boolean;
      function Alterar(oEmpresa: TEmpresas):Boolean;
      function Excluir(oEmpresa: TEmpresas):Boolean;
      function Recuperar(var oEmpresa: TEmpresas):Boolean;
      procedure Pesquisar(sNome: string; var Dset: TClientDataSet);
      function VerificarCpfCnpj(Value: TEmpresas): boolean;
      function VerificarExclusao(Value: TEmpresas): boolean;
  end;
  var
  EmpresasService: TEmpresasService;
implementation

{ TEmpresasService }

function TEmpresasService.Alterar(oEmpresa: TEmpresas): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := EmpresaFactory.Alterar(oEmpresa);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Alterar a Empresa' + E.Message);
      end;
   end;
end;

constructor TEmpresasService.create;
begin
   EmpresaFactory := TEmpresasFactory.Create;
end;

function TEmpresasService.Excluir(oEmpresa: TEmpresas): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := EmpresaFactory.Excluir(oEmpresa);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Excluir a Empresa' + E.Message);
      end;
   end;
end;

destructor TEmpresasService.free;
begin
   freeandnil(EmpresaFactory);
end;

function TEmpresasService.Inserir(oEmpresa: TEmpresas): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := EmpresaFactory.Inserir(oEmpresa);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Inserir a Empresa' + E.Message);
      end;
   end;
end;

procedure TEmpresasService.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        EmpresaFactory.Pesquisar(sNome, Dset);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Pesquisar a Empresa' + E.Message);
      end;
   end;
end;

function TEmpresasService.Recuperar(var oEmpresa: TEmpresas): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := EmpresaFactory.Recuperar(oEmpresa);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Inserir a Empresa' + E.Message);
      end;
   end;
end;

function TEmpresasService.VerificarExclusao(Value: TEmpresas): boolean;
begin
  try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := EmpresaFactory.VerificarExclusao(Value);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Verificar a exclusao da Empresa' + E.Message);
      end;
   end;
end;

function TEmpresasService.VerificarCpfCnpj(Value: TEmpresas): boolean;
begin
  try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := EmpresaFactory.VerificarCpfCnpj(Value);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Verificar o nome da Empresa' + E.Message);
      end;
   end;
end;

end.
