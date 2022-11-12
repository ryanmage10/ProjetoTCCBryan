unit uFuncionarios;

interface
uses uPessoas, uEmpresas;
type
  TFuncionarios = class(TPessoas)

  protected
    FSalario : Currency;
	  FEmpresa : TEmpresas;

	  function GetSalario: Currency;
	  function GetEmpresa: TEmpresas;

	  procedure SetSalario(Value: Currency);
	  procedure SetEmpresa(Value: TEmpresas);
  public
    property Empresa: TEmpresas read getEmpresa write setEmpresa;
    property Salario: Currency read getSalario write setSalario;

    constructor Create;
    procedure copiarDados(value: TFuncionarios);
    function Clone: TFuncionarios;
    procedure LimparDados;
    destructor Free;
  end;
implementation

{ TFuncionarios }

function TFuncionarios.Clone: TFuncionarios;
begin
   Result := TFuncionarios.Create;
   result.CopiarDados(Self);
end;

procedure TFuncionarios.copiarDados(value: TFuncionarios);
begin
   inherited copiarDados(Value);
   FEmpresa.copiarDados(Value.Empresa);
   FSalario := Value.Salario;
end;

constructor TFuncionarios.Create;
begin
   inherited;
   FEmpresa := TEmpresas.Create;
   LimparDados;
end;

destructor TFuncionarios.Free;
begin
   inherited;
   FEmpresa.Free;
end;

function TFuncionarios.GetEmpresa: TEmpresas;
begin
  result := FEmpresa;
end;

function TFuncionarios.GetSalario: Currency;
begin
  result := FSalario;
end;

procedure TFuncionarios.LimparDados;
begin
   inherited LimparDados;
   FEmpresa.LimparDados;
   FSalario := 0;
end;

procedure TFuncionarios.SetEmpresa(Value: TEmpresas);
begin
   FEmpresa.CopiarDados(Value);
end;

procedure TFuncionarios.SetSalario(Value: Currency);
begin
   FSalario := Value;
end;

end.

