unit uCaixasService;

interface
uses uCaixas, uCaixasFactory, system.SysUtils, DBClient, uDmConexao;
  type
  TCaixasService = class(TObject)
    private
      CaixaFactory : TCaixasFactory;
    protected
    public
      constructor create;
      destructor free;
      function Inserir(oCaixa: TCaixas):Boolean;
      function Alterar(oCaixa: TCaixas):Boolean;
      function Excluir(oCaixa: TCaixas):Boolean;
      function Recuperar(var oCaixa: TCaixas):Boolean;
      procedure Pesquisar(sNome: string; var Dset: TClientDataSet);
      function VerificarNome(Value: TCaixas): boolean;
      function VerificarExclusao(Value: TCaixas): boolean;
  end;
  var
  CaixasService: TCaixasService;
implementation

{ TCaixasService }

function TCaixasService.Alterar(oCaixa: TCaixas): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := CaixaFactory.Alterar(oCaixa);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Alterar o Caixa' + E.Message);
      end;
   end;
end;

constructor TCaixasService.create;
begin
   CaixaFactory := TCaixasFactory.Create;
end;

function TCaixasService.Excluir(oCaixa: TCaixas): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := CaixaFactory.Excluir(oCaixa);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Excluir o Caixa' + E.Message);
      end;
   end;
end;

destructor TCaixasService.free;
begin
   freeandnil(CaixaFactory);
end;

function TCaixasService.Inserir(oCaixa: TCaixas): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := CaixaFactory.Inserir(oCaixa);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Inserir o Caixa' + E.Message);
      end;
   end;
end;

procedure TCaixasService.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        CaixaFactory.Pesquisar(sNome, Dset);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Pesquisar o Caixa' + E.Message);
      end;
   end;
end;

function TCaixasService.Recuperar(var oCaixa: TCaixas): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := CaixaFactory.Recuperar(oCaixa);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Inserir o Caixa' + E.Message);
      end;
   end;
end;

function TCaixasService.VerificarExclusao(Value: TCaixas): boolean;
begin
  try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := CaixaFactory.VerificarExclusao(Value);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Verificar a exclusao do Caixa' + E.Message);
      end;
   end;
end;

function TCaixasService.VerificarNome(Value: TCaixas): boolean;
begin
  try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := CaixaFactory.VerificarNome(Value);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Verificar o nome do Caixa' + E.Message);
      end;
   end;
end;

end.
