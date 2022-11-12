unit uFuncionariosController;

interface
  uses uFuncionarios, uFuncionariosService, system.SysUtils, DBClient;
  type
  TFuncionariosController = class(TObject)
    private
      Funcionarioservice : TFuncionariosService;
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
implementation

{ TFuncionariosController }

function TFuncionariosController.Alterar(oFuncionario: TFuncionarios): Boolean;
begin
   result := Funcionarioservice.Alterar(oFuncionario);
end;

constructor TFuncionariosController.create;
begin
   Funcionarioservice := TFuncionariosService.Create;
end;

function TFuncionariosController.Excluir(oFuncionario: TFuncionarios): Boolean;
begin
   result := Funcionarioservice.Excluir(oFuncionario);
end;

destructor TFuncionariosController.free;
begin
   freeandnil(Funcionarioservice);
end;

function TFuncionariosController.Inserir(oFuncionario: TFuncionarios): Boolean;
begin
   result := Funcionarioservice.Inserir(oFuncionario);
end;

procedure TFuncionariosController.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
  Funcionarioservice.Pesquisar(sNome, dset);
end;

function TFuncionariosController.Recuperar(var oFuncionario: TFuncionarios): Boolean;
begin
   result := Funcionarioservice.Recuperar(oFuncionario);
end;

function TFuncionariosController.VerificarExclusao(Value: TFuncionarios): boolean;
begin
  result := Funcionarioservice.VerificarExclusao(Value);
end;

function TFuncionariosController.VerificarCpfCnpj(Value: TFuncionarios): boolean;
begin
  result := Funcionarioservice.VerificarCpfCnpj(Value);
end;

end.
