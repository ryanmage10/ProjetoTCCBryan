unit uUnidadesFactory;

interface
uses uUnidades, system.SysUtils, DBClient, uUnidadesDao, uDmConexao;
  type
  TUnidadesFactory = class(TObject)
    private
      UnidadeDao : TUnidadesDao;
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
  UnidadesFactory: TUnidadesFactory;
implementation

{ TUnidadesFactory }

function TUnidadesFactory.Alterar(Value: TUnidades): Boolean;
begin
   Value.User_Update := 'Bryan Silva';
   Value.DataUltAlt := now;
   result := UnidadeDao.Alterar(Value);
end;

constructor TUnidadesFactory.create;
begin
   UnidadeDao := TUnidadesDao.Create;
end;

function TUnidadesFactory.Excluir(Value: TUnidades): Boolean;
begin
   result := UnidadeDao.Excluir(Value);
end;

destructor TUnidadesFactory.free;
begin
   freeandnil(UnidadeDao);
end;

function TUnidadesFactory.Inserir(Value: TUnidades): Boolean;
begin
   Value.User_Insert := 'Bryan';
   Value.User_Update := 'Bryan';
   Value.DataCad := now;
   Value.DataUltAlt := now;
   result := UnidadeDao.Inserir(Value);
end;

procedure TUnidadesFactory.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
   UnidadeDao.Pesquisar(sNome, Dset);
end;

function TUnidadesFactory.Recuperar(var Value: TUnidades): Boolean;
begin
   result := UnidadeDao.Recuperar(Value);
end;

function TUnidadesFactory.VerificarExclusao(Value: TUnidades): boolean;
begin
   result :=  UnidadeDao.VerificarExclusao(Value);
end;

function TUnidadesFactory.VerificarNome(Value: TUnidades): boolean;
begin
   result := UnidadeDao.VerificarNome(Value);
end;

end.
