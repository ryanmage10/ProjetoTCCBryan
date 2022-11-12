unit uFuncionariosFactory;

interface
uses uFuncionarios, system.SysUtils, DBClient, uFuncionariosDao, uDmConexao;
  type
  TFuncionariosFactory = class(TObject)
    private
      FuncionarioDao : TFuncionariosDao;
    protected
    public
      constructor create;
      destructor free;
      function Inserir(oFuncionario: TFuncionarios):Boolean;
      function Alterar(oFuncionario: TFuncionarios):Boolean;
      function Excluir(oFuncionario: TFuncionarios):Boolean;
      function Recuperar(var oFuncionario: TFuncionarios):Boolean;
      procedure Pesquisar(sNome: string; var Dset: TClientDataSet);
      function VerificarCpfCnpj(Value: TFuncionarios): boolean;
      function VerificarExclusao(Value: TFuncionarios): boolean;
  end;

  var
  FuncionariosFactory: TFuncionariosFactory;
implementation

{ TFuncionariosFactory }

function TFuncionariosFactory.Alterar(oFuncionario: TFuncionarios): Boolean;
begin
   oFuncionario.User_Update := 'Bryan Silva';
   oFuncionario.DataUltAlt := now;
   result := FuncionarioDao.Alterar(oFuncionario);
end;

constructor TFuncionariosFactory.create;
begin
   FuncionarioDao := TFuncionariosDao.Create;
end;

function TFuncionariosFactory.Excluir(oFuncionario: TFuncionarios): Boolean;
begin
   result := FuncionarioDao.Excluir(oFuncionario);
end;

destructor TFuncionariosFactory.free;
begin
   freeandnil(FuncionarioDao);
end;

function TFuncionariosFactory.Inserir(oFuncionario: TFuncionarios): Boolean;
begin
   oFuncionario.User_Insert := 'Bryan';
   oFuncionario.User_Update := 'Bryan';
   oFuncionario.DataCad := now;
   oFuncionario.DataUltAlt := now;
   result := FuncionarioDao.Inserir(oFuncionario);
end;

procedure TFuncionariosFactory.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
   FuncionarioDao.Pesquisar(sNome, Dset);
end;

function TFuncionariosFactory.Recuperar(var oFuncionario: TFuncionarios): Boolean;
begin
   result := FuncionarioDao.Recuperar(oFuncionario);
end;

function TFuncionariosFactory.VerificarExclusao(Value: TFuncionarios): boolean;
begin
   result :=  FuncionarioDao.VerificarExclusao(Value);
end;

function TFuncionariosFactory.VerificarCpfCnpj(Value: TFuncionarios): boolean;
begin
   result := FuncionarioDao.VerificarCpfCnpj(Value);
end;

end.
