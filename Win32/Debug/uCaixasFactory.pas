unit uCaixasFactory;

interface
uses uCaixas, system.SysUtils, DBClient, uCaixasDao, uDmConexao;
  type
  TCaixasFactory = class(TObject)
    private
      CaixaDao : TCaixasDao;
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
  CaixasFactory: TCaixasFactory;
implementation

{ TCaixasFactory }

function TCaixasFactory.Alterar(oCaixa: TCaixas): Boolean;
begin
   oCaixa.User_Update := 'Bryan Silva';
   oCaixa.DataUltAlt := now;
   result := CaixaDao.Alterar(oCaixa);
end;

constructor TCaixasFactory.create;
begin
   CaixaDao := TCaixasDao.Create;
end;

function TCaixasFactory.Excluir(oCaixa: TCaixas): Boolean;
begin
   result := CaixaDao.Excluir(oCaixa);
end;

destructor TCaixasFactory.free;
begin
   freeandnil(CaixaDao);
end;

function TCaixasFactory.Inserir(oCaixa: TCaixas): Boolean;
begin
   oCaixa.User_Insert := 'Bryan';
   oCaixa.User_Update := 'Bryan';
   oCaixa.DataCad := now;
   oCaixa.DataUltAlt := now;
   result := CaixaDao.Inserir(oCaixa);
end;

procedure TCaixasFactory.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
   CaixaDao.Pesquisar(sNome, Dset);
end;

function TCaixasFactory.Recuperar(var oCaixa: TCaixas): Boolean;
begin
   result := CaixaDao.Recuperar(oCaixa);
end;

function TCaixasFactory.VerificarExclusao(Value: TCaixas): boolean;
begin
   result :=  CaixaDao.VerificarExclusao(Value);
end;

function TCaixasFactory.VerificarNome(Value: TCaixas): boolean;
begin
   result := CaixaDao.VerificarNome(Value);
end;

end.
