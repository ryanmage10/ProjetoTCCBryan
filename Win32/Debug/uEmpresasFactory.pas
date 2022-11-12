unit uEmpresasFactory;

interface
uses uEmpresas, system.SysUtils, DBClient, uEmpresasDao, uDmConexao;
  type
  TEmpresasFactory = class(TObject)
    private
      EmpresaDao : TEmpresasDao;
    protected
    public
      constructor create;
      destructor free;
      function Inserir(oEmpresa: TEmpresas):Boolean;
      function Alterar(oEmpresa: TEmpresas):Boolean;
      function Excluir(oEmpresa: TEmpresas):Boolean;
      function Recuperar(var oEmpresa: TEmpresas):Boolean;
      procedure Pesquisar(sNome: string; var Dset: TClientDataSet);
      function VerificarCpfCnpj(Value: TEmpresas): boolean;
      function VerificarExclusao(Value: TEmpresas): boolean;
  end;

  var
  EmpresasFactory: TEmpresasFactory;
implementation

{ TEmpresasFactory }

function TEmpresasFactory.Alterar(oEmpresa: TEmpresas): Boolean;
begin
   oEmpresa.User_Update := 'Bryan Silva';
   oEmpresa.DataUltAlt := now;
   result := EmpresaDao.Alterar(oEmpresa);
end;

constructor TEmpresasFactory.create;
begin
   EmpresaDao := TEmpresasDao.Create;
end;

function TEmpresasFactory.Excluir(oEmpresa: TEmpresas): Boolean;
begin
   result := EmpresaDao.Excluir(oEmpresa);
end;

destructor TEmpresasFactory.free;
begin
   freeandnil(EmpresaDao);
end;

function TEmpresasFactory.Inserir(oEmpresa: TEmpresas): Boolean;
begin
   oEmpresa.User_Insert := 'Bryan';
   oEmpresa.User_Update := 'Bryan';
   oEmpresa.DataCad := now;
   oEmpresa.DataUltAlt := now;
   result := EmpresaDao.Inserir(oEmpresa);
end;

procedure TEmpresasFactory.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
   EmpresaDao.Pesquisar(sNome, Dset);
end;

function TEmpresasFactory.Recuperar(var oEmpresa: TEmpresas): Boolean;
begin
   result := EmpresaDao.Recuperar(oEmpresa);
end;

function TEmpresasFactory.VerificarExclusao(Value: TEmpresas): boolean;
begin
   result :=  EmpresaDao.VerificarExclusao(Value);
end;

function TEmpresasFactory.VerificarCpfCnpj(Value: TEmpresas): boolean;
begin
   result := EmpresaDao.VerificarCpfCnpj(Value);
end;

end.
