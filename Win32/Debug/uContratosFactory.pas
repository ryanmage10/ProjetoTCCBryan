unit uContratosFactory;

interface
uses uContratos, system.SysUtils, DBClient, uContratosDao, uDmConexao;
  type
  TContratosFactory = class(TObject)
    private
      ContratoDao : TContratosDao;
    protected
    public
      constructor create;
      destructor free;
      function Inserir(oContrato: TContratos):Boolean;
      function Alterar(oContrato: TContratos):Boolean;
      function Excluir(oContrato: TContratos):Boolean;
      function Recuperar(var oContrato: TContratos):Boolean;
      procedure Pesquisar(sNome: string; var Dset: TClientDataSet);
      function VerificarNome(Value: TContratos): boolean;
      function VerificarExclusao(Value: TContratos): boolean;
  end;

  var
  ContratosFactory: TContratosFactory;
implementation

{ TContratosFactory }

function TContratosFactory.Alterar(oContrato: TContratos): Boolean;
begin
   oContrato.User_Update := 'Bryan Silva';
   oContrato.DataUltAlt := now;
   result := ContratoDao.Alterar(oContrato);
end;

constructor TContratosFactory.create;
begin
   ContratoDao := TContratosDao.Create;
end;

function TContratosFactory.Excluir(oContrato: TContratos): Boolean;
begin
   result := ContratoDao.Excluir(oContrato);
end;

destructor TContratosFactory.free;
begin
   freeandnil(ContratoDao);
end;

function TContratosFactory.Inserir(oContrato: TContratos): Boolean;
begin
   oContrato.User_Insert := 'Bryan';
   oContrato.User_Update := 'Bryan';
   oContrato.DataCad := now;
   oContrato.DataUltAlt := now;
   result := ContratoDao.Inserir(oContrato);
end;

procedure TContratosFactory.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
   ContratoDao.Pesquisar(sNome, Dset);
end;

function TContratosFactory.Recuperar(var oContrato: TContratos): Boolean;
begin
   result := ContratoDao.Recuperar(oContrato);
end;

function TContratosFactory.VerificarExclusao(Value: TContratos): boolean;
begin
   result :=  ContratoDao.VerificarExclusao(Value);
end;

function TContratosFactory.VerificarNome(Value: TContratos): boolean;
begin
   result := ContratoDao.VerificarNome(Value);
end;

end.
