unit uContasPagar;

interface

uses
  uBase, uFormaPagamento;

  type
  TTipoConta = (TpIndefinido = -1, TpPagar = 0, TpReceber = 1);

  TContasPagar = class(TBase)
  protected
    FSeq: Integer;
    Fid_compra: integer;
    FTipo: TTipoConta;
    FValor: Currency;
    FData_Venc: TDateTime;
    FFormaPagamento: TFormaPagamento;

    function GetSeq: Integer;
    function Getid_compra: integer;
    function GetTipo: TTipoConta;
    function GetValor: Currency;
    function GetData_Venc: TDateTime;
    function GetFormaPagamento: TFormaPagamento;

    procedure SetSeq(Value: Integer);
    procedure Setid_compra(Value: integer);
    procedure SetTipo(Value: TTipoConta);
    procedure SetValor(Value: Currency);
    procedure SetData_Venc(Value: TDateTime);
    procedure SetFormaPagamento(Value: TFormaPagamento);

  public
    property Seq: Integer read GetSeq write SetSeq;
    property id_compra: integer read Getid_compra write Setid_compra;
    property Tipo: TTipoConta read GetTipo write SetTipo;
    property Valor: Currency read GetValor write SetValor;
    property Data_Venc: TDateTime read GetData_Venc write SetData_Venc;
    property FormaPagamento: TFormaPagamento read GetFormaPagamento write SetFormaPagamento;

    constructor Create;
    Destructor Free;
    function clone: TContasPagar;
    procedure CopiarDados(Value: TContasPagar);
    procedure LimparDados;
  end;



implementation

{ TContasPagar }

function TContasPagar.clone: TContasPagar;
begin
  result := TContasPagar.Create;
  result.CopiarDados(Self);
end;

procedure TContasPagar.CopiarDados(Value: TContasPagar);
begin
  inherited CopiarDados(Value);
  Seq := Value.Seq;
  id_compra := Value.id_compra;
  Tipo := Value.Tipo;
  Valor := Value.Valor;
  Data_Venc := Value.Data_Venc;
  FormaPagamento := Value.FormaPagamento;
end;

constructor TContasPagar.Create;
begin
  inherited;
  FFormaPagamento := TFormaPagamento.Create;
  LimparDados;
end;

destructor TContasPagar.Free;
begin
  FFormaPagamento.Free;
  Inherited;
end;

function TContasPagar.GetData_Venc: TDateTime;
begin
  result := FData_Venc;
end;

function TContasPagar.GetFormaPagamento: TFormaPagamento;
begin
  result := FFormaPagamento;
end;

function TContasPagar.Getid_compra: integer;
begin
  result := FID_compra;
end;

function TContasPagar.GetSeq: Integer;
begin
  result := FSeq;
end;

function TContasPagar.GetTipo: TTipoConta;
begin
  result := FTipo;
end;

function TContasPagar.GetValor: Currency;
begin
  result := FValor;
end;

procedure TContasPagar.LimparDados;
begin
  inherited LimparDados;
  Seq := 0;
  id_compra := 0;
  Tipo := TpIndefinido;
  Valor := 0;
  Data_Venc := 0;
  FormaPagamento.LimparDados;
end;

procedure TContasPagar.SetData_Venc(Value: TDateTime);
begin
  FData_Venc := Value;
end;

procedure TContasPagar.SetFormaPagamento(Value: TFormaPagamento);
begin
  FFormaPagamento.CopiarDados(Value);
end;

procedure TContasPagar.Setid_compra(Value: integer);
begin
  FId_Compra := Value;
end;

procedure TContasPagar.SetSeq(Value: Integer);
begin
  FSeq := Value;
end;

procedure TContasPagar.SetTipo(Value: TTipoConta);
begin
  FTipo := Value;
end;

procedure TContasPagar.SetValor(Value: Currency);
begin
  FValor := Value;
end;

end.
