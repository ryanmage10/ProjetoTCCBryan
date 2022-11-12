unit uEmpresas;

interface
uses uPessoas;
type
  TEmpresas = class(TPessoas)

  protected

  public
    constructor Create;
    procedure copiarDados(value: TEmpresas);
    function Clone: TEmpresas;
    procedure LimparDados;
    destructor Free;
  end;
implementation

{ TEmpresas }

function TEmpresas.Clone: TEmpresas;
begin
   Result := TEmpresas.Create;
   result.CopiarDados(Self);
end;

procedure TEmpresas.copiarDados(value: TEmpresas);
begin
   inherited copiarDados(Value);
end;

constructor TEmpresas.Create;
begin
   inherited;
   LimparDados;
end;

destructor TEmpresas.Free;
begin
   inherited;
end;

procedure TEmpresas.LimparDados;
begin
   inherited LimparDados;
end;

end.
