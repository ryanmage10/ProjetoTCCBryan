unit uPaisesService;

interface
uses uPaises, uPaisesFactory, system.SysUtils, DBClient, uDmConexao;
  type
  TPaisesService = class(TObject)
    private
      PaisFactory : TPaisesFactory;
    protected
    public
      constructor create;
      destructor free;
      function Inserir(oPais: TPaises):Boolean;
      function Alterar(oPais: TPaises):Boolean;
      function Excluir(oPais: TPaises):Boolean;
      function Recuperar(var oPais: TPaises):Boolean;
      procedure Pesquisar(sNome: string; var Dset: TClientDataSet);
      function VerificarNome(Value: TPaises): boolean;
      function VerificarExclusao(Value: TPaises): boolean;
  end;
  var
  PaisesService: TPaisesService;
implementation

{ TPaisesService }

function TPaisesService.Alterar(oPais: TPaises): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := PaisFactory.Alterar(oPais);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Alterar o Pais' + E.Message);
      end;
   end;
end;

constructor TPaisesService.create;
begin
   PaisFactory := TPaisesFactory.Create;
end;

function TPaisesService.Excluir(oPais: TPaises): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := PaisFactory.Excluir(oPais);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Excluir o Pais' + E.Message);
      end;
   end;
end;

destructor TPaisesService.free;
begin
   freeandnil(PaisFactory);
end;

function TPaisesService.Inserir(oPais: TPaises): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := PaisFactory.Inserir(oPais);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Inserir o Pais' + E.Message);
      end;
   end;
end;

procedure TPaisesService.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        PaisFactory.Pesquisar(sNome, Dset);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Pesquisar o Pais' + E.Message);
      end;
   end;
end;

function TPaisesService.Recuperar(var oPais: TPaises): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := PaisFactory.Recuperar(oPais);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Inserir o Pais' + E.Message);
      end;
   end;
end;

function TPaisesService.VerificarExclusao(Value: TPaises): boolean;
begin
  try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := PaisFactory.VerificarExclusao(Value);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Verificar a exclusao do Pais' + E.Message);
      end;
   end;
end;

function TPaisesService.VerificarNome(Value: TPaises): boolean;
begin
  try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := PaisFactory.VerificarNome(Value);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Verificar o nome do Pais' + E.Message);
      end;
   end;
end;

end.
