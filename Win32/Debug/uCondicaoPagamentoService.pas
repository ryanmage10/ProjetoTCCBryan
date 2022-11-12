unit uCondicaoPagamentoService;

interface
uses uCondicaoPagamento, uCondicaoPagamentoFactory, system.SysUtils, DBClient, uDmConexao;
  type
  TCondicaoPagamentoService = class(TObject)
    private
      CondicaoPagamentoFactory : TCondicaoPagamentoFactory;
    protected
    public
      constructor create;
      destructor free;
      function Inserir(oCondicaoPagamento: TCondicaoPagamento):Boolean;
      function Alterar(oCondicaoPagamento: TCondicaoPagamento):Boolean;
      function Excluir(oCondicaoPagamento: TCondicaoPagamento):Boolean;
      function Recuperar(var oCondicaoPagamento: TCondicaoPagamento):Boolean;
      procedure Pesquisar(sNome: string; var Dset: TClientDataSet);
      function VerificarNome(Value: TCondicaoPagamento): boolean;
      function VerificarExclusao(Value: TCondicaoPagamento): boolean;
  end;
  var
  CondicaoPagamentoService: TCondicaoPagamentoService;
implementation

{ TCondicaoPagamentoService }

function TCondicaoPagamentoService.Alterar(oCondicaoPagamento: TCondicaoPagamento): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := CondicaoPagamentoFactory.Alterar(oCondicaoPagamento);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Alterar o CondicaoPagamento' + E.Message);
      end;
   end;
end;

constructor TCondicaoPagamentoService.create;
begin
   CondicaoPagamentoFactory := TCondicaoPagamentoFactory.Create;
end;

function TCondicaoPagamentoService.Excluir(oCondicaoPagamento: TCondicaoPagamento): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := CondicaoPagamentoFactory.Excluir(oCondicaoPagamento);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Excluir o CondicaoPagamento' + E.Message);
      end;
   end;
end;

destructor TCondicaoPagamentoService.free;
begin
   freeandnil(CondicaoPagamentoFactory);
end;

function TCondicaoPagamentoService.Inserir(oCondicaoPagamento: TCondicaoPagamento): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := CondicaoPagamentoFactory.Inserir(oCondicaoPagamento);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Inserir o CondicaoPagamento' + E.Message);
      end;
   end;
end;

procedure TCondicaoPagamentoService.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        CondicaoPagamentoFactory.Pesquisar(sNome, Dset);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Pesquisar o CondicaoPagamento' + E.Message);
      end;
   end;
end;

function TCondicaoPagamentoService.Recuperar(var oCondicaoPagamento: TCondicaoPagamento): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := CondicaoPagamentoFactory.Recuperar(oCondicaoPagamento);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Inserir o CondicaoPagamento' + E.Message);
      end;
   end;
end;

function TCondicaoPagamentoService.VerificarExclusao(Value: TCondicaoPagamento): boolean;
begin
  try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := CondicaoPagamentoFactory.VerificarExclusao(Value);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Verificar a exclusao do CondicaoPagamento' + E.Message);
      end;
   end;
end;

function TCondicaoPagamentoService.VerificarNome(Value: TCondicaoPagamento): boolean;
begin
  try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := CondicaoPagamentoFactory.VerificarNome(Value);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Verificar o nome do CondicaoPagamento' + E.Message);
      end;
   end;
end;

end.
