unit uEstados;

interface

uses
  uBase, uPaises;

type
  TEstados = class(TBase)
  protected
    FNome: string[50];
    FUF: string[2];
    FPais: TPaises;

    procedure SetNome(Value: string);
    procedure SetUF(Value: string);
    procedure SetPais(Value: TPaises);
    function GetNome: string;
    function GetUF: string;
    function GetPais: TPaises;

  public

    property Nome: string read GetNome write SetNome;
    property UF: string read GetUF write SetUF;
    property Pais: TPaises read GetPais write SetPais;

    constructor Create;
    destructor Free;
    function clone: TEstados;
    procedure LimparDados;
    procedure CopiarDados(Value: TEstados);
  end;

implementation

constructor TEstados.Create;
begin
  inherited;
  FPais := TPaises.Create;
  LimparDados;
end;

destructor TEstados.Free;
begin
  inherited;
  FPais.Free;
end;

procedure TEstados.LimparDados;
begin
  inherited LimparDados;
  FNome := '';
  FUF := '';
  FPais.LimparDados;
end;

procedure TEstados.CopiarDados(Value: TEstados);
begin
  inherited copiarDados(Value);
  FNome := Value.Nome;
  FUF := Value.UF;
  FPais.CopiarDados(Value.Pais);
end;

function TEstados.clone: TEstados;
begin
  result := TEstados.Create;
  result.CopiarDados(Self);
end;

function TEstados.GetNome: string;
begin
  result := FNome;
end;

function TEstados.GetUF: string;
begin
  result := FUF;
end;

function TEstados.GetPais: TPaises;
begin
  result := FPais;
end;

procedure TEstados.SetNome(Value: string);
begin
  FNome := Value;
end;

procedure TEstados.SetUF(Value: string);
begin
  FUF := Value;
end;

procedure TEstados.SetPais(Value: TPaises);
begin
  FPais.CopiarDados(Value);
end;

end.
