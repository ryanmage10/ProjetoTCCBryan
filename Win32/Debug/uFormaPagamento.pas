unit uFormaPagamento;

interface

uses
  uBase;

type
  TFormaPagamento = class(TBase)
  protected
    FDescricao: string;

    function GetDescricao: string;

    procedure SetDescricao(Value: string);

  public

    property Descricao: string read GetDescricao write SetDescricao;


    constructor Create;
    Destructor Free;
    function clone: TFormaPagamento;
    procedure CopiarDados(Value: TFormaPagamento);

    procedure LimparDados;
  end;

implementation

{ TFormaPagamento }

function TFormaPagamento.clone: TFormaPagamento;
begin
  result := TFormaPagamento.Create;
  result.CopiarDados(Self);
end;

procedure TFormaPagamento.CopiarDados(Value: TFormaPagamento);
begin
  inherited CopiarDados(Value);
  FDescricao := Value.Descricao;
end;

constructor TFormaPagamento.Create;
begin
  inherited;
end;

destructor TFormaPagamento.Free;
begin
  inherited;
end;

function TFormaPagamento.GetDescricao: string;
begin
  result := FDescricao;
end;

procedure TFormaPagamento.LimparDados;
begin
  inherited LimparDados;
  FDescricao := '';
end;

procedure TFormaPagamento.SetDescricao(Value: string);
begin
  FDescricao := Value;
end;

end.
