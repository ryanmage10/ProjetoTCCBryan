unit uPaisesFactory;

interface
uses uPaises, system.SysUtils, DBClient, uPaisesDao, uDmConexao;
  type
  TPaisesFactory = class(TObject)
    private
      PaisDao : TPaisesDao;
    protected
    public
      constructor create;
      destructor free;
      function Inserir(oPais: TPaises):Boolean;
      function Alterar(oPais: TPaises):Boolean;
      function Excluir(oPais: TPaises):Boolean;
      function Recuperar(var oPais: TPaises):Boolean;
      procedure Pesquisar(sNome: string; var Dset: TClientDataSet);
      function VerificarNome(Value: TPaises): boolean;
      function VerificarExclusao(Value: TPaises): boolean;
  end;

  var
  PaisesFactory: TPaisesFactory;
implementation

{ TPaisesFactory }

function TPaisesFactory.Alterar(oPais: TPaises): Boolean;
begin
   oPais.User_Update := 'Bryan Silva';
   oPais.DataUltAlt := now;
   result := PaisDao.Alterar(oPais);
end;

constructor TPaisesFactory.create;
begin
   PaisDao := TPaisesDao.Create;
end;

function TPaisesFactory.Excluir(oPais: TPaises): Boolean;
begin
   result := PaisDao.Excluir(oPais);
end;

destructor TPaisesFactory.free;
begin
   freeandnil(PaisDao);
end;

function TPaisesFactory.Inserir(oPais: TPaises): Boolean;
begin
   oPais.User_Insert := 'Bryan';
   oPais.User_Update := 'Bryan';
   oPais.DataCad := now;
   oPais.DataUltAlt := now;
   result := PaisDao.Inserir(oPais);
end;

procedure TPaisesFactory.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
   PaisDao.Pesquisar(sNome, Dset);
end;

function TPaisesFactory.Recuperar(var oPais: TPaises): Boolean;
begin
   result := PaisDao.Recuperar(oPais);
end;

function TPaisesFactory.VerificarExclusao(Value: TPaises): boolean;
begin
   result :=  PaisDao.VerificarExclusao(Value);
end;

function TPaisesFactory.VerificarNome(Value: TPaises): boolean;
begin
   result := PaisDao.VerificarNome(Value);
end;

end.
