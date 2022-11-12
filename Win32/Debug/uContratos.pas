unit uContratos;

interface

uses
  uBase, uFornecedores, uClientes, uEmpresas;

type
  TTipoContrato = (TpIndefinido = -1, TpReceber = 0, TpPagar = 1);

  TContratos = class(TBase)
  protected
    FCodigoDoc: string[10];
    FDescricao: string[50];
    FMoeda: string[2];
    FEmpresa: TEmpresas;
    FCliente: TClientes;
    FFornecedor: TFornecedores;
    FValor: Currency;
    Ftipo: TTipoContrato;

    procedure SetCodigoDoc(Value: string);
    procedure SetDescricao(Value: string);
    procedure SetMoeda(Value: string);
    procedure SetEmpresa(Value: TEmpresas);
    procedure SetCliente(Value: TClientes);
    procedure SetFornecedor(Value: TFornecedores);
    procedure SetValor(Value: Currency);
    procedure SetTipo(Value: TTipoContrato);
    function GetCodigoDoc: string;
    function GetDescricao: string;
    function GetMoeda: string;
    function GetEmpresa: TEmpresas;
    function GetCliente: TClientes;
    function GetFornecedor: TFornecedores;
    function GetValor: Currency;
    function GetTipo: TTipoContrato;

  public

    property CodigoDoc: string read GetCodigoDoc write SetCodigoDoc;
    property Descricao: string read GetDescricao write SetDescricao;
    property Moeda: string read GetMoeda write SetMoeda;
    property Empresa: TEmpresas read GetEmpresa write SetEmpresa;
    property Cliente: TClientes read GetCliente write SetCliente;
    property Fornecedor: TFornecedores read GetFornecedor write SetFornecedor;
    property Valor: Currency read GetValor write SetValor;
    property Tipo: TTipoContrato read GetTipo write SetTipo;

    constructor Create;
    destructor Free;
    function clone: TContratos;
    procedure LimparDados;
    procedure CopiarDados(Value: TContratos);
  end;


implementation

{ TContratos }

function TContratos.clone: TContratos;
begin
  result := TContratos.Create;
  result.CopiarDados(Self);
end;

procedure TContratos.CopiarDados(Value: TContratos);
begin
   inherited CopiarDados(Value);
    FCodigoDoc := Value.CodigoDoc;
    FDescricao := Value.Descricao;
    FMoeda := Value.Moeda;
    FEmpresa.CopiarDados(Value.Empresa);
    FCliente.CopiarDados(Value.Cliente);
    FFornecedor.CopiarDados(Value.Fornecedor);
    FValor := Value.Valor;
    FTipo := Value.Tipo;
end;

constructor TContratos.Create;
begin
  inherited;
  FEmpresa := TEmpresas.Create;
  FCliente := TClientes.Create;
  FFornecedor := TFornecedores.Create;
  LimparDados;
end;

destructor TContratos.Free;
begin
  inherited;
  FEmpresa.Free;
  FCliente.Free;
  FFornecedor.Free;
end;

function TContratos.GetCliente: TClientes;
begin
   result := FCliente;
end;

function TContratos.GetCodigoDoc: string;
begin
   result := FCodigoDoc;
end;

function TContratos.GetDescricao: string;
begin
    result := FDescricao;
end;

function TContratos.GetEmpresa: TEmpresas;
begin
    result := FEmpresa;
end;

function TContratos.GetFornecedor: TFornecedores;
begin
    result := FFornecedor;
end;

function TContratos.GetMoeda: string;
begin
    result := FMoeda;
end;

function TContratos.GetTipo: TTipoContrato;
begin
  result := FTipo;
end;

function TContratos.GetValor: Currency;
begin
     result := FValor;
end;

procedure TContratos.LimparDados;
begin
   inherited LimparDados;
    FCodigoDoc := '';
    FDescricao := '';
    FMoeda := '';
    FEmpresa.LimparDados;
    FCliente.LimparDados;
    FFornecedor.LimparDados;
    FValor := 0;
    FTipo := TpIndefinido;
end;

procedure TContratos.SetCliente(Value: TClientes);
begin
   FCliente.CopiarDados(Value);
end;

procedure TContratos.SetCodigoDoc(Value: string);
begin
   FCodigoDoc := Value;
end;

procedure TContratos.SetDescricao(Value: string);
begin
   FDescricao := Value;
end;

procedure TContratos.SetEmpresa(Value: TEmpresas);
begin
   FEmpresa.CopiarDados(Value);
end;

procedure TContratos.SetFornecedor(Value: TFornecedores);
begin
   FFornecedor.CopiarDados(Value);
end;

procedure TContratos.SetMoeda(Value: string);
begin
   FMoeda := Value;
end;

procedure TContratos.SetTipo(Value: TTipoContrato);
begin
   FTipo := Value;
end;

procedure TContratos.SetValor(Value: Currency);
begin
   FValor := Value;
end;

end.
