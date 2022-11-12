unit uProdutos;

interface

uses
  uBase, uUnidades;

type
  TProdutos = class(TBase)
  protected
    FDescricao: string[50];
    FCodigo: string[15];
	  FUnidade: TUnidades;
	  FNCM: String[6];

    function GetDescricao: string;
	  function GetCodigo: string;
	  function GetUnidade: TUnidades;
	  function GetNCM: string;
    procedure SetDescricao(Value: string);
	  procedure SetCodigo(Value: string);
	  procedure SetUnidade(Value: TUnidades);
	  procedure SetNCM(Value: string);
  public

    property Descricao: string read GetDescricao write SetDescricao;
    property Codigo: string read GetCodigo write SetCodigo;
	  property Unidade: TUnidades read GetUnidade write SetUnidade;
	  property NCM: string read GetNCM write SetNCM;

    constructor Create;
    Destructor Free;
    function clone: TProdutos;
    procedure CopiarDados(Value: TProdutos);

    procedure LimparDados;
  end;

implementation

{ TProdutos }

function TProdutos.clone: TProdutos;
begin
  result := TProdutos.Create;
  result.CopiarDados(Self);
end;

procedure TProdutos.CopiarDados(Value: TProdutos);
begin
  inherited CopiarDados(Value);
  FDescricao := Value.Descricao;
  FCodigo := Value.Codigo;
  FUnidade.CopiarDados(Value.Unidade);
  FNCM := Value.NCM;
end;

constructor TProdutos.Create;
begin
  Inherited;
  Funidade := Tunidades.Create;
end;

destructor TProdutos.Free;
begin
  Funidade.Free;
  inherited;
end;

function TProdutos.GetCodigo: string;
begin
  result := FCodigo;
end;

function TProdutos.GetDescricao: string;
begin
  result := FDescricao;
end;

function TProdutos.GetNCM: string;
begin
  result := FNCM;
end;

function TProdutos.GetUnidade: TUnidades;
begin
  result := FUnidade;
end;

procedure TProdutos.LimparDados;
begin
  inherited LimparDados;
  FDescricao := '';
  FCodigo := '';
  FUnidade.LimparDados;
  FNCM := '';
end;

procedure TProdutos.SetCodigo(Value: string);
begin
  FCodigo := Value;
end;

procedure TProdutos.SetDescricao(Value: string);
begin
  FDescricao := Value;
end;

procedure TProdutos.SetNCM(Value: string);
begin
  FNCM := Value;
end;

procedure TProdutos.SetUnidade(Value: TUnidades);
begin
  FUnidade.CopiarDados(Value);
end;

end.
