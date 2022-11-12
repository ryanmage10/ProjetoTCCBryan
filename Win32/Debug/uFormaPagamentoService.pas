unit uFormaPagamentoService;

interface
uses uFormaPagamento, uFormaPagamentoFactory, system.SysUtils, DBClient, uDmConexao;
  type
  TFormaPagamentoService = class(TObject)
    private
      FormaPagamentoFactory : TFormaPagamentoFactory;
    protected
    public
      constructor create;
      destructor free;
      function Inserir(oFormaPagamento: TFormaPagamento):Boolean;
      function Alterar(oFormaPagamento: TFormaPagamento):Boolean;
      function Excluir(oFormaPagamento: TFormaPagamento):Boolean;
      function Recuperar(var oFormaPagamento: TFormaPagamento):Boolean;
      procedure Pesquisar(sNome: string; var Dset: TClientDataSet);
      function VerificarNome(Value: TFormaPagamento): boolean;
      function VerificarExclusao(Value: TFormaPagamento): boolean;
  end;
  var
  FormaPagamentoService: TFormaPagamentoService;
implementation

{ TFormaPagamentoService }

function TFormaPagamentoService.Alterar(oFormaPagamento: TFormaPagamento): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := FormaPagamentoFactory.Alterar(oFormaPagamento);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Alterar o FormaPagamento' + E.Message);
      end;
   end;
end;

constructor TFormaPagamentoService.create;
begin
   FormaPagamentoFactory := TFormaPagamentoFactory.Create;
end;

function TFormaPagamentoService.Excluir(oFormaPagamento: TFormaPagamento): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := FormaPagamentoFactory.Excluir(oFormaPagamento);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Excluir o FormaPagamento' + E.Message);
      end;
   end;
end;

destructor TFormaPagamentoService.free;
begin
   freeandnil(FormaPagamentoFactory);
end;

function TFormaPagamentoService.Inserir(oFormaPagamento: TFormaPagamento): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := FormaPagamentoFactory.Inserir(oFormaPagamento);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Inserir o FormaPagamento' + E.Message);
      end;
   end;
end;

procedure TFormaPagamentoService.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        FormaPagamentoFactory.Pesquisar(sNome, Dset);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Pesquisar o FormaPagamento' + E.Message);
      end;
   end;
end;

function TFormaPagamentoService.Recuperar(var oFormaPagamento: TFormaPagamento): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := FormaPagamentoFactory.Recuperar(oFormaPagamento);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Inserir o FormaPagamento' + E.Message);
      end;
   end;
end;

function TFormaPagamentoService.VerificarExclusao(Value: TFormaPagamento): boolean;
begin
  try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := FormaPagamentoFactory.VerificarExclusao(Value);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Verificar a exclusao do FormaPagamento' + E.Message);
      end;
   end;
end;

function TFormaPagamentoService.VerificarNome(Value: TFormaPagamento): boolean;
begin
  try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := FormaPagamentoFactory.VerificarNome(Value);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Verificar o nome do FormaPagamento' + E.Message);
      end;
   end;
end;

end.
