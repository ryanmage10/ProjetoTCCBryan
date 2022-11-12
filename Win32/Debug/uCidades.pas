unit uCidades;

interface

uses
  uBase, uEstados;

type
  TCidades = class(TBase)
  protected
    FNome: string[50];
    FDDD: string[2];
    FCodIbge: string[6];
    FEstado: TEstados;
    function GetNome: string;
    function GetDDD: string;
    function GetCodIbge: string;
    function GetEstado: TEstados;
    procedure SetNome(Value: string);
    procedure SetDDD(Value: string);
    procedure SetCodIbge(Value: string);
    procedure SetEstado(Value: TEstados);
  public
    property Nome: string read GetNome write SetNome;
    property DDD: string read GetDDD write SetDDD;
    property Estado: TEstados read GetEstado write SetEstado;
    property CodIbge: string read GetCodIbge write SetCodIbge;

    constructor Create;
    destructor Free;
    function clone: TCidades;
    procedure CopiarDados(Value: TCidades);
    procedure LimparDados;
  end;

implementation

function TCidades.GetNome: string;
begin
  result := Fnome;
end;

procedure TCidades.LimparDados;
begin
  inherited LimparDados;
  FNome := '';
  FDDD := '';
  FCodIbge := '';
  FEstado.LimparDados;
end;

procedure TCidades.CopiarDados(Value: TCidades);
begin
  inherited copiarDados(Value);
  FNome := Value.Nome;
  FDDD := Value.DDD;
  FCodIbge := Value.CodIbge;
  FEstado.CopiarDados(Value.Estado);
end;

constructor TCidades.Create;
begin
  FEstado := TEstados.Create;
  LimparDados;
end;

destructor TCidades.Free;
begin
  FEstado.Free;
end;

function TCidades.GetCodIbge: string;
begin
  result := FCodIbge;
end;

function TCidades.GetDDD: string;
begin
  result := FDDD;
end;

function TCidades.GetEstado: TEstados;
begin
  result := FEstado;
end;

function TCidades.clone: TCidades;
begin
  result := TCidades.Create;
  result.CopiarDados(Self);
end;

procedure TCidades.SetNome(Value: string);
begin
  Fnome := Value;
end;

procedure TCidades.SetCodIbge(Value: string);
begin
  FCodIbge := Value;
end;

procedure TCidades.SetDDD(Value: string);
begin
  FDDD := Value;
end;

procedure TCidades.SetEstado(Value: TEstados);
begin
  FEstado.CopiarDados(Value);
end;

end.
