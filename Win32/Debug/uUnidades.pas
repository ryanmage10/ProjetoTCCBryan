unit uUnidades;

interface

uses
  uBase;

type
  TUnidades = class(TBase)
  protected
    FDescricao: string[50];
    Fsigla: String[3];

    function GetDescricao: string;
    function GetSigla: string;
    procedure SetDescricao(Value: string);
    procedure SetSigla(Value: string);

  public

    property Descricao: string read GetDescricao write SetDescricao;
    property sigla: string read GetSigla write SetSigla;

    constructor Create;
    Destructor Free;
    function clone: TUnidades;
    procedure CopiarDados(Value: TUnidades);

    procedure LimparDados;
  end;

implementation



{ TUnidades }

function TUnidades.clone: TUnidades;
begin
  result := TUnidades.Create;
  result.CopiarDados(Self);
end;

procedure TUnidades.CopiarDados(Value: TUnidades);
begin
  inherited CopiarDados(Value);
  FDescricao := Value.Descricao;
  FSigla     := Value.sigla;
end;

constructor TUnidades.Create;
begin
  inherited;
  LimparDados;
end;

destructor TUnidades.Free;
begin
  inherited;
end;

function TUnidades.GetDescricao: string;
begin
  result := FDescricao;
end;

function TUnidades.GetSigla: string;
begin
  Result := FSigla;
end;

procedure TUnidades.LimparDados;
begin
  inherited LimparDados;
  FDescricao := '';
  FSigla     := '';
end;

procedure TUnidades.SetDescricao(Value: string);
begin
  FDescricao := Value;
end;

procedure TUnidades.SetSigla(Value: string);
begin
  FSigla    := Value;
end;

end.
