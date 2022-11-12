unit uPaises;

interface

uses
  uBase;

type
  TPaises = class(TBase)
  protected
    FNome: string[50];
    FDDI: string[3];
    Fsigla: String[3];

    function GetNome: string;
    function GetDDI: string;
    function GetSigla: string;
    procedure SetNome(Value: string);
    procedure SetDDI(Value: string);
    procedure SetSigla(Value: string);

  public

    property Nome: string read GetNome write SetNome;
    property DDI: string read GetDDI write SetDDI;
    property sigla: string read GetSigla write SetSigla;

    constructor Create;
    Destructor Free;
    function clone: TPaises;
    procedure CopiarDados(Value: TPaises);

    procedure LimparDados;
  end;

implementation

constructor TPaises.Create;
begin
  inherited;
  LimparDados;
end;

Destructor TPaises.Free;
begin
  inherited;
end;

procedure TPaises.LimparDados;
begin
  inherited LimparDados;
  Nome := '';
  DDI := '';
  sigla := '';
end;

function TPaises.clone: TPaises;
begin
  result := TPaises.Create;
  result.CopiarDados(Self);
end;

procedure TPaises.CopiarDados(Value: TPaises);
begin
  inherited CopiarDados(Value);
  Nome := Value.Nome;
  DDI := Value.DDI;
  sigla := Value.sigla;
end;

function TPaises.GetNome: string;
begin
  result := FNome;
end;

function TPaises.GetDDI: string;
begin
  result := FDDI;
end;

function TPaises.GetSigla: string;
begin
  result := Fsigla;
end;

procedure TPaises.SetNome(Value: string);
begin
  FNome := Value;
end;

procedure TPaises.SetDDI(Value: string);
begin
  FDDI := Value;
end;

procedure TPaises.SetSigla(Value: string);
begin
  Fsigla := Value;
end;

end.
