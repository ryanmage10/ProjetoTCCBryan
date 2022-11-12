unit uUnidadesService;

interface
uses uUnidades, uUnidadesFactory, system.SysUtils, DBClient, uDmConexao;
  type
  TUnidadesService = class(TObject)
    private
      UnidadeFactory : TUnidadesFactory;
    protected
    public
      constructor create;
      destructor free;
      function Inserir(Value: TUnidades):Boolean;
      function Alterar(Value: TUnidades):Boolean;
      function Excluir(Value: TUnidades):Boolean;
      function Recuperar(var Value: TUnidades):Boolean;
      procedure Pesquisar(sNome: string; var Dset: TClientDataSet);
      function VerificarNome(Value: TUnidades): boolean;
      function VerificarExclusao(Value: TUnidades): boolean;
  end;
  var
  UnidadesService: TUnidadesService;
implementation

{ TUnidadesService }

function TUnidadesService.Alterar(Value: TUnidades): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := UnidadeFactory.Alterar(Value);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Alterar o Unidade' + E.Message);
      end;
   end;
end;

constructor TUnidadesService.create;
begin
   UnidadeFactory := TUnidadesFactory.Create;
end;

function TUnidadesService.Excluir(Value: TUnidades): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := UnidadeFactory.Excluir(Value);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Excluir o Unidade' + E.Message);
      end;
   end;
end;

destructor TUnidadesService.free;
begin
   freeandnil(UnidadeFactory);
end;

function TUnidadesService.Inserir(Value: TUnidades): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := UnidadeFactory.Inserir(Value);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Inserir o Unidade' + E.Message);
      end;
   end;
end;

procedure TUnidadesService.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        UnidadeFactory.Pesquisar(sNome, Dset);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Pesquisar o Unidade' + E.Message);
      end;
   end;
end;

function TUnidadesService.Recuperar(var Value: TUnidades): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := UnidadeFactory.Recuperar(Value);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Inserir o Unidade' + E.Message);
      end;
   end;
end;

function TUnidadesService.VerificarExclusao(Value: TUnidades): boolean;
begin
  try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := UnidadeFactory.VerificarExclusao(Value);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Verificar a exclusao do Unidade' + E.Message);
      end;
   end;
end;

function TUnidadesService.VerificarNome(Value: TUnidades): boolean;
begin
  try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := UnidadeFactory.VerificarNome(Value);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Verificar o nome do Unidade' + E.Message);
      end;
   end;
end;

end.
