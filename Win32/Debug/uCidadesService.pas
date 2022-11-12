unit uCidadesService;

interface
uses uCidades, uCidadesFactory, system.SysUtils, DBClient, uDmConexao;
  type
  TCidadesService = class(TObject)
    private
      CidadeFactory : TCidadesFactory;
    protected
    public
      constructor create;
      destructor free;
      function Inserir(oCidade: TCidades):Boolean;
      function Alterar(oCidade: TCidades):Boolean;
      function Excluir(oCidade: TCidades):Boolean;
      function Recuperar(var oCidade: TCidades):Boolean;
      procedure Pesquisar(sNome: string; var Dset: TClientDataSet);
      function VerificarNome(Value: TCidades): boolean;
      function VerificarExclusao(Value: TCidades): boolean;
  end;
  var
  CidadesService: TCidadesService;
implementation

{ TCidadesService }

function TCidadesService.Alterar(oCidade: TCidades): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := CidadeFactory.Alterar(oCidade);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Alterar a Cidade' + E.Message);
      end;
   end;
end;

constructor TCidadesService.create;
begin
   CidadeFactory := TCidadesFactory.Create;
end;

function TCidadesService.Excluir(oCidade: TCidades): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := CidadeFactory.Excluir(oCidade);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Excluir a Cidade' + E.Message);
      end;
   end;
end;

destructor TCidadesService.free;
begin
   freeandnil(CidadeFactory);
end;

function TCidadesService.Inserir(oCidade: TCidades): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := CidadeFactory.Inserir(oCidade);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Inserir a Cidade' + E.Message);
      end;
   end;
end;

procedure TCidadesService.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        CidadeFactory.Pesquisar(sNome, Dset);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Pesquisar a Cidade' + E.Message);
      end;
   end;
end;

function TCidadesService.Recuperar(var oCidade: TCidades): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := CidadeFactory.Recuperar(oCidade);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Inserir o Cidade' + E.Message);
      end;
   end;
end;

function TCidadesService.VerificarExclusao(Value: TCidades): boolean;
begin
  try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := CidadeFactory.VerificarExclusao(Value);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Verificar a exclusão da Cidade' + E.Message);
      end;
   end;
end;

function TCidadesService.VerificarNome(Value: TCidades): boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := CidadeFactory.VerificarNome(Value);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Verificar o nome da Cidade' + E.Message);
      end;
   end;
end;

end.

