unit uParcelaModelos;

interface

uses
  uBase, uFormaPagamento;

type
  TParcelaModelo = class(TBase)
  protected
    FCod_CondPag: Integer;
    FNumero: Integer;
    FDias: integer;
    FPercentual: Currency;
    //FCod_ContasPag: Integer;
    FFormaPag: TFormaPagamento;

    function GetCod_CondPag: Integer;
    function GetNumero: Integer;
    function GetDias: integer;
    function GetPercentual: Currency;
    //function GetCod_ContasPag: Integer;
    function GetFormaPag: TFormaPagamento;

    procedure SetCod_CondPag(Value: Integer);
    procedure SetNumero(Value: Integer);
    procedure SetDias(Value: integer);
    procedure SetPercentual(Value: Currency);
   // procedure SetCod_ContasPag(Value: Integer);
    procedure SetFormaPag(Value: TFormaPagamento);

  public

    property Cod_CondPag: integer read GetCod_CondPag write SetCod_CondPag;
    property Numero: Integer read GetNumero write SetNumero;
    property Dias: integer read GetDias write SetDias;
    property Percentual: Currency read GetPercentual write SetPercentual;
    //property Cod_ContasPag: integer read GetCod_ContasPag write SetCod_ContasPag;
    property FormaPag: TFormaPagamento read GetFormaPag write SetFormaPag;

    constructor Create;
    Destructor Free;
    function clone: TParcelaModelo;
    procedure CopiarDados(Value: TParcelaModelo);

    procedure LimparDados;
  end;

implementation

{ TParcelaModelo }

function TParcelaModelo.clone: TParcelaModelo;
begin
  result := TParcelaModelo.Create;
  result.CopiarDados(Self);
end;

procedure TParcelaModelo.CopiarDados(Value: TParcelaModelo);
begin
  inherited CopiarDados(Value);
  FCod_CondPag := Value.Cod_CondPag;
  FNumero := Value.Numero;
  FDias := Value.Dias;
  FPercentual := Value.Percentual;
  //FCod_ContasPag := Value.Cod_ContasPag;
  FFormaPag := Value.FormaPag;
end;

constructor TParcelaModelo.Create;
begin
  inherited;
  FFormaPag := TFormaPagamento.Create;
  LimparDados;
end;

destructor TParcelaModelo.Free;
begin
  FFormaPag.Free;
  Inherited;
end;

function TParcelaModelo.GetCod_CondPag: Integer;
begin
  result := FCod_CondPag;
end;

{function TParcelaModelo.GetCod_ContasPag: Integer;
begin
  result := FCod_ContasPag;
end;}

function TParcelaModelo.GetDias: integer;
begin
  result := FDias;
end;

function TParcelaModelo.GetFormaPag: TFormaPagamento;
begin
  result := FFormaPag;
end;

function TParcelaModelo.GetNumero: Integer;
begin
  result := Fnumero;
end;

function TParcelaModelo.GetPercentual: Currency;
begin
  result := FPercentual;
end;

procedure TParcelaModelo.LimparDados;
begin
  inherited LimparDados;
  FCod_CondPag := 0;
  FNumero := 0;
  FDias := 0;
  FPercentual := 0;
  //FCod_ContasPag := 0;
  FFormaPag.LimparDados;
end;

procedure TParcelaModelo.SetCod_CondPag(Value: Integer);
begin
  FCod_CondPag := Value;
end;

{procedure TParcelaModelo.SetCod_ContasPag(Value: Integer);
begin
  FCod_ContasPag := Value;
end; }

procedure TParcelaModelo.SetDias(Value: integer);
begin
  FDias := Value;
end;

procedure TParcelaModelo.SetFormaPag(Value: TFormaPagamento);
begin
  FFormaPag.CopiarDados(Value);
end;

procedure TParcelaModelo.SetNumero(Value: Integer);
begin
  FNumero := Value;
end;

procedure TParcelaModelo.SetPercentual(Value: Currency);
begin
  FPercentual := Value;
end;

end.
