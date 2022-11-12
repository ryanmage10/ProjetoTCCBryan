unit uEstadosService;

interface
uses uEstados, uEstadosFactory, system.SysUtils, DBClient, uDmConexao;
  type
  TEstadosService = class(TObject)
    private
      EstadoFactory : TEstadosFactory;
    protected
    public
      constructor create;
      destructor free;
      function Inserir(oEstado: TEstados):Boolean;
      function Alterar(oEstado: TEstados):Boolean;
      function Excluir(oEstado: TEstados):Boolean;
      function Recuperar(var oEstado: TEstados):Boolean;
      procedure Pesquisar(sNome: string; var Dset: TClientDataSet);
      function VerificarNome(Value: TEstados): boolean;
      function VerificarExclusao(Value: TEstados): boolean;
  end;
  var
  EstadosService: TEstadosService;
implementation

{ TEstadosService }

function TEstadosService.Alterar(oEstado: TEstados): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := EstadoFactory.Alterar(oEstado);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Alterar o Estado' + E.Message);
      end;
   end;
end;

constructor TEstadosService.create;
begin
   EstadoFactory := TEstadosFactory.Create;
end;

function TEstadosService.Excluir(oEstado: TEstados): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := EstadoFactory.Excluir(oEstado);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Excluir o Estado' + E.Message);
      end;
   end;
end;

destructor TEstadosService.free;
begin
   freeandnil(EstadoFactory);
end;

function TEstadosService.Inserir(oEstado: TEstados): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := EstadoFactory.Inserir(oEstado);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Inserir o Estado' + E.Message);
      end;
   end;
end;

procedure TEstadosService.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        EstadoFactory.Pesquisar(sNome, Dset);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Pesquisar o Estado' + E.Message);
      end;
   end;
end;

function TEstadosService.Recuperar(var oEstado: TEstados): Boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := EstadoFactory.Recuperar(oEstado);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Inserir o Estado' + E.Message);
      end;
   end;
end;

function TEstadosService.VerificarExclusao(Value: TEstados): boolean;
begin
  try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := EstadoFactory.VerificarExclusao(Value);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Verificar a exclusão do Estado' + E.Message);
      end;
   end;
end;

function TEstadosService.VerificarNome(Value: TEstados): boolean;
begin
   try
      begin
        DmConexao.TransactionConexao.StartTransaction;
        result := EstadoFactory.VerificarNome(Value);
        DmConexao.TransactionConexao.Commit;
      end;
      except
      on E: Exception do
      begin
          result := False;
          DmConexao.TransactionConexao.Rollback;
          raise Exception.Create('Ocorreu um erro ao Verificar o nome do Estado' + E.Message);
      end;
   end;
end;

end.

