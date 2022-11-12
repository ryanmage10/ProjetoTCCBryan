unit uFornecedoresFactory;

interface
uses uFornecedores, system.SysUtils, DBClient, uFornecedoresDao, uDmConexao;
  type
  TFornecedoresFactory = class(TObject)
    private
      FornecedorDao : TFornecedoresDao;
    protected
    public
      constructor create;
      destructor free;
      function Inserir(oFornecedor: TFornecedores):Boolean;
      function Alterar(oFornecedor: TFornecedores):Boolean;
      function Excluir(oFornecedor: TFornecedores):Boolean;
      function Recuperar(var oFornecedor: TFornecedores):Boolean;
      procedure Pesquisar(sNome: string; var Dset: TClientDataSet);
      function VerificarCpfCnpj(Value: TFornecedores): boolean;
      function VerificarExclusao(Value: TFornecedores): boolean;
  end;

  var
  FornecedoresFactory: TFornecedoresFactory;
implementation

{ TFornecedoresFactory }

function TFornecedoresFactory.Alterar(oFornecedor: TFornecedores): Boolean;
begin
   oFornecedor.User_Update := 'Bryan Silva';
   oFornecedor.DataUltAlt := now;
   result := FornecedorDao.Alterar(oFornecedor);
end;

constructor TFornecedoresFactory.create;
begin
   FornecedorDao := TFornecedoresDao.Create;
end;

function TFornecedoresFactory.Excluir(oFornecedor: TFornecedores): Boolean;
begin
   result := FornecedorDao.Excluir(oFornecedor);
end;

destructor TFornecedoresFactory.free;
begin
   freeandnil(FornecedorDao);
end;

function TFornecedoresFactory.Inserir(oFornecedor: TFornecedores): Boolean;
begin
   oFornecedor.User_Insert := 'Bryan';
   oFornecedor.User_Update := 'Bryan';
   oFornecedor.DataCad := now;
   oFornecedor.DataUltAlt := now;
   result := FornecedorDao.Inserir(oFornecedor);
end;

procedure TFornecedoresFactory.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
   FornecedorDao.Pesquisar(sNome, Dset);
end;

function TFornecedoresFactory.Recuperar(var oFornecedor: TFornecedores): Boolean;
begin
   result := FornecedorDao.Recuperar(oFornecedor);
end;

function TFornecedoresFactory.VerificarExclusao(Value: TFornecedores): boolean;
begin
   result :=  FornecedorDao.VerificarExclusao(Value);
end;

function TFornecedoresFactory.VerificarCpfCnpj(Value: TFornecedores): boolean;
begin
   result := FornecedorDao.VerificarCpfCnpj(Value);
end;

end.
