unit uCidadesFactory;

interface
uses uCidades, system.SysUtils, DBClient, uCidadesDao, uDmConexao;
  type
  TCidadesFactory = class(TObject)
    private
      CidadeDao : TCidadesDao;
    protected
    public
      constructor create;
      destructor free;
      function Inserir(oCidade: TCidades):Boolean;
      function Alterar(oCidade: TCidades):Boolean;
      function Excluir(oCidade: TCidades):Boolean;
      function Recuperar(var oCidade: TCidades):Boolean;
      procedure Pesquisar(sNome: string; var Dset: TClientDataSet);
      function VerificarNome(Value: TCidades): boolean;
      function VerificarExclusao(Value: TCidades): boolean;
  end;

  var
  CidadesFactory: TCidadesFactory;
implementation

{ TCidadesFactory }

function TCidadesFactory.Alterar(oCidade: TCidades): Boolean;
begin
   oCidade.User_Update := 'Bryan Silva';
   oCidade.DataUltAlt := now;
   result := CidadeDao.Alterar(oCidade);
end;

constructor TCidadesFactory.create;
begin
   CidadeDao := TCidadesDao.Create;
end;

function TCidadesFactory.Excluir(oCidade: TCidades): Boolean;
begin
   result := CidadeDao.Excluir(oCidade);
end;

destructor TCidadesFactory.free;
begin
   freeandnil(CidadeDao);
end;

function TCidadesFactory.Inserir(oCidade: TCidades): Boolean;
begin
   oCidade.User_Insert := 'Bryan';
   oCidade.User_Update := 'Bryan';
   oCidade.DataCad := now;
   oCidade.DataUltAlt := now;
   result := CidadeDao.Inserir(oCidade);
end;

procedure TCidadesFactory.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
   CidadeDao.Pesquisar(sNome, Dset);
end;

function TCidadesFactory.Recuperar(var oCidade: TCidades): Boolean;
begin
   result := CidadeDao.Recuperar(oCidade);
end;

function TCidadesFactory.VerificarExclusao(Value: TCidades): boolean;
begin
   result := CidadeDao.VerificarExclusao(Value);
end;

function TCidadesFactory.VerificarNome(Value: TCidades): boolean;
begin
   result := CidadeDao.VerificarNome(Value);
end;

end.

