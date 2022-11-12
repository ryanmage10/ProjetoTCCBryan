unit uComprasService;

interface
uses uCompras, uComprasFactory, system.SysUtils, DBClient, uDmConexao;
  type
  TComprasService = class(TObject)
    private
      CompraFactory : TComprasFactory;
    protected
    public
      constructor create;
      destructor free;
      function Inserir(oCompra: TCompras):Boolean;
      function Alterar(oCompra: TCompras):Boolean;
      function Excluir(oCompra: TCompras):Boolean;
      function Recuperar(var oCompra: TCompras):Boolean;
      procedure Pesquisar(sNome: string; var Dset: TClientDataSet);
      function VerificarExiste(Value: TCompras): boolean;
      function VerificarExclusao(Value: TCompras): boolean;
  end;
  var
  ComprasService: TComprasService;
implementation

{ TComprasService }

function TComprasService.Alterar(oCompra: TCompras): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := CompraFactory.Alterar(oCompra);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Alterar o Compra' + E.Message);
      end;
   end;
end;

constructor TComprasService.create;
begin
   CompraFactory := TComprasFactory.Create;
end;

function TComprasService.Excluir(oCompra: TCompras): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := CompraFactory.Excluir(oCompra);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Excluir o Compra' + E.Message);
      end;
   end;
end;

destructor TComprasService.free;
begin
   freeandnil(CompraFactory);
end;

function TComprasService.Inserir(oCompra: TCompras): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := CompraFactory.Inserir(oCompra);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Inserir o Compra' + E.Message);
      end;
   end;
end;

procedure TComprasService.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        CompraFactory.Pesquisar(sNome, Dset);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Pesquisar o Compra' + E.Message);
      end;
   end;
end;

function TComprasService.Recuperar(var oCompra: TCompras): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := CompraFactory.Recuperar(oCompra);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Inserir o Compra' + E.Message);
      end;
   end;
end;

function TComprasService.VerificarExclusao(Value: TCompras): boolean;
begin
  try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := CompraFactory.VerificarExclusao(Value);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Verificar a exclusao do Compra' + E.Message);
      end;
   end;
end;

function TComprasService.VerificarExiste(Value: TCompras): boolean;
begin
  try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := CompraFactory.VerificarExiste(Value);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Verificar a Compra' + E.Message);
      end;
   end;
end;

end.
