unit uContratosService;

interface
uses uContratos, uContratosFactory, system.SysUtils, DBClient, uDmConexao;
  type
  TContratosService = class(TObject)
    private
      ContratoFactory : TContratosFactory;
    protected
    public
      constructor create;
      destructor free;
      function Inserir(oContrato: TContratos):Boolean;
      function Alterar(oContrato: TContratos):Boolean;
      function Excluir(oContrato: TContratos):Boolean;
      function Recuperar(var oContrato: TContratos):Boolean;
      procedure Pesquisar(sNome: string; var Dset: TClientDataSet);
      function VerificarNome(Value: TContratos): boolean;
      function VerificarExclusao(Value: TContratos): boolean;
  end;
  var
  ContratosService: TContratosService;
implementation

{ TContratosService }

function TContratosService.Alterar(oContrato: TContratos): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := ContratoFactory.Alterar(oContrato);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Alterar o Contrato' + E.Message);
      end;
   end;
end;

constructor TContratosService.create;
begin
   ContratoFactory := TContratosFactory.Create;
end;

function TContratosService.Excluir(oContrato: TContratos): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := ContratoFactory.Excluir(oContrato);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Excluir o Contrato' + E.Message);
      end;
   end;
end;

destructor TContratosService.free;
begin
   freeandnil(ContratoFactory);
end;

function TContratosService.Inserir(oContrato: TContratos): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := ContratoFactory.Inserir(oContrato);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Inserir o Contrato' + E.Message);
      end;
   end;
end;

procedure TContratosService.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        ContratoFactory.Pesquisar(sNome, Dset);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Pesquisar o Contrato' + E.Message);
      end;
   end;
end;

function TContratosService.Recuperar(var oContrato: TContratos): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := ContratoFactory.Recuperar(oContrato);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Inserir o Contrato' + E.Message);
      end;
   end;
end;

function TContratosService.VerificarExclusao(Value: TContratos): boolean;
begin
  try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := ContratoFactory.VerificarExclusao(Value);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Verificar a exclusao do Contrato' + E.Message);
      end;
   end;
end;

function TContratosService.VerificarNome(Value: TContratos): boolean;
begin
  try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := ContratoFactory.VerificarNome(Value);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Verificar o nome do Contrato' + E.Message);
      end;
   end;
end;

end.
