unit uFuncionariosService;

interface
uses uFuncionarios, uFuncionariosFactory, system.SysUtils, DBClient, uDmConexao;
  type
  TFuncionariosService = class(TObject)
    private
      FuncionarioFactory : TFuncionariosFactory;
    protected
    public
      constructor create;
      destructor free;
      function Inserir(oFuncionario: TFuncionarios):Boolean;
      function Alterar(oFuncionario: TFuncionarios):Boolean;
      function Excluir(oFuncionario: TFuncionarios):Boolean;
      function Recuperar(var oFuncionario: TFuncionarios):Boolean;
      procedure Pesquisar(sNome: string; var Dset: TClientDataSet);
      function VerificarCpfCnpj(Value: TFuncionarios): boolean;
      function VerificarExclusao(Value: TFuncionarios): boolean;
  end;
  var
  FuncionariosService: TFuncionariosService;
implementation

{ TFuncionariosService }

function TFuncionariosService.Alterar(oFuncionario: TFuncionarios): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := FuncionarioFactory.Alterar(oFuncionario);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Alterar a Funcionario' + E.Message);
      end;
   end;
end;

constructor TFuncionariosService.create;
begin
   FuncionarioFactory := TFuncionariosFactory.Create;
end;

function TFuncionariosService.Excluir(oFuncionario: TFuncionarios): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := FuncionarioFactory.Excluir(oFuncionario);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Excluir o Funcionario' + E.Message);
      end;
   end;
end;

destructor TFuncionariosService.free;
begin
   freeandnil(FuncionarioFactory);
end;

function TFuncionariosService.Inserir(oFuncionario: TFuncionarios): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := FuncionarioFactory.Inserir(oFuncionario);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Inserir o Funcionario' + E.Message);
      end;
   end;
end;

procedure TFuncionariosService.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        FuncionarioFactory.Pesquisar(sNome, Dset);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Pesquisar o Funcionario' + E.Message);
      end;
   end;
end;

function TFuncionariosService.Recuperar(var oFuncionario: TFuncionarios): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := FuncionarioFactory.Recuperar(oFuncionario);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Inserir o Funcionario' + E.Message);
      end;
   end;
end;

function TFuncionariosService.VerificarExclusao(Value: TFuncionarios): boolean;
begin
  try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := FuncionarioFactory.VerificarExclusao(Value);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Verificar a exclusao do Funcionario' + E.Message);
      end;
   end;
end;

function TFuncionariosService.VerificarCpfCnpj(Value: TFuncionarios): boolean;
begin
  try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := FuncionarioFactory.VerificarCpfCnpj(Value);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Verificar o nome do Funcionario' + E.Message);
      end;
   end;
end;

end.
