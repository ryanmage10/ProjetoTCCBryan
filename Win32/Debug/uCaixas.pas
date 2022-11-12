unit uCaixas;

interface

uses
  uBase, uEmpresas;

type
  TCaixas = class(TBase)
  protected
    FNome: string[50];
    FMoeda: string[3];
    FEmpresa: TEmpresas;

    function GetNome: string;
    function GetMoeda: string;
    function GetEmpresa: TEmpresas;
    procedure SetNome(Value: string);
    procedure SetMoeda(Value: string);
    procedure SetEmpresa(Value: TEmpresas);

  public

    property Nome: string read GetNome write SetNome;
    property Moeda: string read GetMoeda write SetMoeda;
    property Empresa: TEmpresas read GetEmpresa write SetEmpresa;

    constructor Create;
    Destructor Free;
    function clone: TCaixas;
    procedure CopiarDados(Value: TCaixas);

    procedure LimparDados;
  end;

implementation



{ TCaixas }

function TCaixas.clone: TCaixas;
begin
  result := TCaixas.Create;
  result.CopiarDados(Self);
end;

procedure TCaixas.CopiarDados(Value: TCaixas);
begin
  inherited CopiarDados(Value);
  FNome := Value.Nome;
  FMoeda := Value.Moeda;
  FEmpresa.CopiarDados(Value.Empresa);
end;

constructor TCaixas.Create;
begin
  inherited;
  FEmpresa := TEmpresas.Create;
  LimparDados;
end;

destructor TCaixas.Free;
begin
  inherited;
  FEmpresa.Free;
end;

function TCaixas.GetEmpresa: TEmpresas;
begin
  result := FEmpresa;
end;

function TCaixas.GetMoeda: string;
begin
  result := FMoeda;
end;

function TCaixas.GetNome: string;
begin
  result := FNome;
end;

procedure TCaixas.LimparDados;
begin
   inherited LimparDados;
   Fnome := '';
   FMoeda := '';
   FEmpresa.LimparDados;
end;

procedure TCaixas.SetEmpresa(Value: TEmpresas);
begin
   FEmpresa.copiarDados(Value);
end;

procedure TCaixas.SetMoeda(Value: string);
begin
   FMoeda := Value;
end;

procedure TCaixas.SetNome(Value: string);
begin
   FNome := Value;
end;

end.
