unit uEstadosFactory;

interface
uses uEstados, system.SysUtils, DBClient, uEstadosDao, uDmConexao;
  type
  TEstadosFactory = class(TObject)
    private
      EstadoDao : TEstadosDao;
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
  EstadosFactory: TEstadosFactory;
implementation

{ TEstadosFactory }

function TEstadosFactory.Alterar(oEstado: TEstados): Boolean;
begin
   oEstado.User_Update := 'Bryan Silva';
   oEstado.DataUltAlt := now;
   result := EstadoDao.Alterar(oEstado);
end;

constructor TEstadosFactory.create;
begin
   EstadoDao := TEstadosDao.Create;
end;

function TEstadosFactory.Excluir(oEstado: TEstados): Boolean;
begin
   result := EstadoDao.Excluir(oEstado);
end;

destructor TEstadosFactory.free;
begin
   freeandnil(EstadoDao);
end;

function TEstadosFactory.Inserir(oEstado: TEstados): Boolean;
begin
   oEstado.User_Insert := 'Bryan';
   oEstado.User_Update := 'Bryan';
   oEstado.DataCad := now;
   oEstado.DataUltAlt := now;
   result := EstadoDao.Inserir(oEstado);
end;

procedure TEstadosFactory.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
   EstadoDao.Pesquisar(sNome, Dset);
end;

function TEstadosFactory.Recuperar(var oEstado: TEstados): Boolean;
begin
   result := EstadoDao.Recuperar(oEstado);
end;

function TEstadosFactory.VerificarExclusao(Value: TEstados): boolean;
begin
    result := EstadoDao.VerificarExclusao(Value);
end;

function TEstadosFactory.VerificarNome(Value: TEstados): boolean;
begin
    result := EstadoDao.VerificarNome(Value);
end;

end.

