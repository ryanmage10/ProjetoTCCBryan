unit uClientes;

interface
uses uPessoas;
type
  TClientes = class(TPessoas)

  protected

  public
    constructor Create;
    procedure copiarDados(value: TClientes);
    function Clone: TClientes;
    procedure LimparDados;
    destructor Free;
  end;
implementation

{ TClientes }

function TClientes.Clone: TClientes;
begin
   Result := TClientes.Create;
   result.CopiarDados(Self);
end;

procedure TClientes.copiarDados(value: TClientes);
begin
   inherited copiarDados(Value);
end;

constructor TClientes.Create;
begin
   inherited;
   LimparDados;
end;

destructor TClientes.Free;
begin
   inherited;
end;

procedure TClientes.LimparDados;
begin
   inherited LimparDados;
end;

end.

