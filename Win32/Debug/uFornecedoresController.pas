unit uFornecedoresController;

interface
  uses uFornecedores, uFornecedoresService, system.SysUtils, DBClient;
  type
  TFornecedoresController = class(TObject)
    private
      Fornecedorservice : TFornecedoresService;
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
implementation

{ TFornecedoresController }

function TFornecedoresController.Alterar(oFornecedor: TFornecedores): Boolean;
begin
   result := Fornecedorservice.Alterar(oFornecedor);
end;

constructor TFornecedoresController.create;
begin
   Fornecedorservice := TFornecedoresService.Create;
end;

function TFornecedoresController.Excluir(oFornecedor: TFornecedores): Boolean;
begin
   result := Fornecedorservice.Excluir(oFornecedor);
end;

destructor TFornecedoresController.free;
begin
   freeandnil(Fornecedorservice);
end;

function TFornecedoresController.Inserir(oFornecedor: TFornecedores): Boolean;
begin
   result := Fornecedorservice.Inserir(oFornecedor);
end;

procedure TFornecedoresController.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
  Fornecedorservice.Pesquisar(sNome, dset);
end;

function TFornecedoresController.Recuperar(var oFornecedor: TFornecedores): Boolean;
begin
   result := Fornecedorservice.Recuperar(oFornecedor);
end;

function TFornecedoresController.VerificarExclusao(Value: TFornecedores): boolean;
begin
  result := Fornecedorservice.VerificarExclusao(Value);
end;

function TFornecedoresController.VerificarCpfCnpj(Value: TFornecedores): boolean;
begin
  result := Fornecedorservice.VerificarCpfCnpj(Value);
end;

end.
