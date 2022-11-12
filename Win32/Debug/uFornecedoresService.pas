unit uFornecedoresService;

interface
uses uFornecedores, uFornecedoresFactory, system.SysUtils, DBClient, uDmConexao;
  type
  TFornecedoresService = class(TObject)
    private
      FornecedorFactory : TFornecedoresFactory;
    protected
    public
      constructor create;
      destructor free;
      function Inserir(oFornecedor: TFornecedores):Boolean;
      function Alterar(oFornecedor: TFornecedores):Boolean;
      function Excluir(oFornecedor: TFornecedores):Boolean;
      function Recuperar(var oFornecedor: TFornecedores):Boolean;
      procedure Pesquisar(sNome: string; var Dset: TClientDataSet);
      function VerificarCpfCnpj(Value: TFornecedores): boolean;
      function VerificarExclusao(Value: TFornecedores): boolean;
  end;
  var
  FornecedoresService: TFornecedoresService;
implementation

{ TFornecedoresService }

function TFornecedoresService.Alterar(oFornecedor: TFornecedores): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := FornecedorFactory.Alterar(oFornecedor);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Alterar o Fornecedor' + E.Message);
      end;
   end;
end;

constructor TFornecedoresService.create;
begin
   FornecedorFactory := TFornecedoresFactory.Create;
end;

function TFornecedoresService.Excluir(oFornecedor: TFornecedores): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := FornecedorFactory.Excluir(oFornecedor);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Excluir o Fornecedor' + E.Message);
      end;
   end;
end;

destructor TFornecedoresService.free;
begin
   freeandnil(FornecedorFactory);
end;

function TFornecedoresService.Inserir(oFornecedor: TFornecedores): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := FornecedorFactory.Inserir(oFornecedor);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Inserir o Fornecedor' + E.Message);
      end;
   end;
end;

procedure TFornecedoresService.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        FornecedorFactory.Pesquisar(sNome, Dset);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Pesquisar o Fornecedor' + E.Message);
      end;
   end;
end;

function TFornecedoresService.Recuperar(var oFornecedor: TFornecedores): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := FornecedorFactory.Recuperar(oFornecedor);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Inserir a Fornecedor' + E.Message);
      end;
   end;
end;

function TFornecedoresService.VerificarExclusao(Value: TFornecedores): boolean;
begin
  try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := FornecedorFactory.VerificarExclusao(Value);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Verificar a exclusao do Fornecedor' + E.Message);
      end;
   end;
end;

function TFornecedoresService.VerificarCpfCnpj(Value: TFornecedores): boolean;
begin
  try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := FornecedorFactory.VerificarCpfCnpj(Value);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Verificar o nome do Fornecedor' + E.Message);
      end;
   end;
end;

end.
