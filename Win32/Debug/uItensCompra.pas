unit uItensCompra;

interface
    uses uBase, uProdutos, uUnidades;
Type
   TItensCompra = class(TBase)
   protected
        FProduto: TProdutos;
        //FUnidade: TUnidades;
        Fqtd: Currency;
        FPreco: Currency;
        FTotal: Currency;
        FDesconto: Currency;
        FCusto: Currency;
        FIdCompra: Integer;

        Function getProduto: TProdutos;
        //Function getUnidade: TUnidades;
        Function getqtd: Currency;
        Function getPreco: Currency;
        Function getTotal: Currency;
        Function getDesconto: Currency;
        Function getCusto: Currency;
        Function getIdCompra: Integer;

        procedure SetProduto(Value: TProdutos);
       // procedure SetUnidade(Value: TUnidades);
        procedure Setqtd(Value: Currency);
        procedure SetPreco(Value: Currency);
        procedure SetTotal(Value: Currency);
        procedure SetDesconto(Value: Currency);
        procedure SetCusto(Value: Currency);
        procedure SetIdCompra(Value: Integer);

   public
    property Produto: TProdutos read getProduto write setProduto;
    //property Unidade: TUnidades read getUnidade write setUnidade;
    property Qtd: Currency read getQtd write setQtd;
    property Preco: Currency read getPreco write setPreco;
    property Total: Currency read getTotal write setTotal;
    property Desconto: Currency read getDesconto write setDesconto;
    property Custo: Currency read getCusto write setCusto;
    property IdCompra: Integer read getIdCompra write setIdCompra;

    constructor Create;
    Destructor Free;
    function clone: TItensCompra;
    procedure CopiarDados(Value: TItensCompra);

    procedure LimparDados;
  end;

implementation

{ TItensCompra }

function TItensCompra.clone: TItensCompra;
begin
  result := TItensCompra.Create;
  result.CopiarDados(Self);
end;

procedure TItensCompra.CopiarDados(Value: TItensCompra);
begin
  inherited CopiarDados(Value);
  Produto.CopiarDados(Produto);
  //Unidade.CopiarDados(Unidade);
  qtd := Value.Qtd;
  Preco := Value.Preco;
  Total := Value.Total;
  Desconto := Value.Desconto;
  Custo := Value.Custo;
  IdCompra := Value.IdCompra;
end;

constructor TItensCompra.Create;
begin
  inherited;
  FProduto := TProdutos.Create;
  //FUnidade := TUnidades.Create;
end;

destructor TItensCompra.Free;
begin
  FProduto.Free;
  //FUnidade.Free;
  inherited;
end;

function TItensCompra.getCusto: Currency;
begin
   result := FCusto;
end;

function TItensCompra.getDesconto: Currency;
begin
   result := FDesconto;
end;

function TItensCompra.getIdCompra: Integer;
begin
  result := FIDCompra;
end;

function TItensCompra.getPreco: Currency;
begin
   result := FPreco;
end;

function TItensCompra.getProduto: TProdutos;
begin
   result := FProduto;
end;

function TItensCompra.getqtd: Currency;
begin
   result := FQtd;
end;

function TItensCompra.getTotal: Currency;
begin
   result := FTotal;
end;

//function TItensCompra.getUnidade: TUnidades;
//begin
//   result := FUnidade;
//end;

procedure TItensCompra.LimparDados;
begin
   inherited LimparDados;
   FProduto.LimparDados;
   //FUnidade.LimparDados;
   Fqtd := 0;
   FPreco := 0;
   FTotal := 0;;
   FDesconto := 0;
   FCusto := 0;
   FIdCompra := 0;
end;

procedure TItensCompra.SetCusto(Value: Currency);
begin
   FCusto := Value;
end;

procedure TItensCompra.SetDesconto(Value: Currency);
begin
   FDesconto := Value;
end;

procedure TItensCompra.SetIdCompra(Value: Integer);
begin
   FIdCompra := Value;
end;

procedure TItensCompra.SetPreco(Value: Currency);
begin
   FPreco := Value;
end;

procedure TItensCompra.SetProduto(Value: TProdutos);
begin
   FProduto.CopiarDados(Value);
end;

procedure TItensCompra.Setqtd(Value: Currency);
begin
   FQtd := Value;
end;

procedure TItensCompra.SetTotal(Value: Currency);
begin
   FTotal := Value;
end;

//procedure TItensCompra.SetUnidade(Value: TUnidades);
//begin
//  FUnidade.CopiarDados(Value);
//end;

end.
