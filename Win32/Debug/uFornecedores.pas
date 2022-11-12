unit uFornecedores;

interface
uses uPessoas;
type
  TFornecedores = class(TPessoas)

  protected

  public
    constructor Create;
    procedure copiarDados(value: TFornecedores);
    function Clone: TFornecedores;
    procedure LimparDados;
    destructor Free;
  end;
implementation

{ TFornecedores }

function TFornecedores.Clone: TFornecedores;
begin
   Result := TFornecedores.Create;
   result.CopiarDados(Self);
end;

procedure TFornecedores.copiarDados(value: TFornecedores);
begin
   inherited copiarDados(Value);
end;

constructor TFornecedores.Create;
begin
   inherited;
   LimparDados;
end;

destructor TFornecedores.Free;
begin
   inherited;
end;

procedure TFornecedores.LimparDados;
begin
   inherited LimparDados;
end;

end.

