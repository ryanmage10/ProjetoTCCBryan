unit uFormaPagamentoController;

interface
uses uFormaPagamento, system.SysUtils, DBClient, FormaPagamentoService;
  type
  TFormaPagamentoController = class
    private
      FormaPagamentoervice : TFormaPagamentoService;
    protected
    public
      constructor create;
      destructor Free;
      function Inserir(oFormasPagamento: TFormaPagamento):Boolean;
      function Alterar(oFormasPagamento: TFormaPagamento):Boolean;
      function Excluir(oFormasPagamento: TFormaPagamento):Boolean;
      function Recuperar(oFormasPagamento: TFormaPagamento):Boolean;
      procedure Pesquisar(sNome: string; var Dset: TClientDataSet);
      function VerificarNome(Value: TFormaPagamento): boolean;
      function VerificarExclusao(Value: TFormaPagamento): boolean;

  end;
implementation

{ TFormaPagamentoController }

function TFormaPagamentoController.Alterar(oFormasPagamento: TFormaPagamento): Boolean;
begin
   result := FormaPagamentoervice.Alterar(oFormasPagamento);
end;

constructor TFormaPagamentoController.create;
begin
   FormaPagamentoervice := TFormaPagamentoService.Create;
end;

function TFormaPagamentoController.Excluir(oFormasPagamento: TFormaPagamento): Boolean;
begin
  result := FormaPagamentoervice.Excluir(oFormasPagamento);
end;

destructor TFormaPagamentoController.Free;
begin
  FormaPagamentoervice.Free;
end;

function TFormaPagamentoController.Inserir(oFormasPagamento: TFormaPagamento): Boolean;
begin
   result := FormaPagamentoervice.Inserir(oFormasPagamento);
end;

procedure TFormaPagamentoController.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
   FormaPagamentoervice.Pesquisar(sNome, Dset);
end;

function TFormaPagamentoController.Recuperar(oFormasPagamento: TFormaPagamento): Boolean;
begin
  result := FormaPagamentoervice.Recuperar(oFormasPagamento);
end;

function TFormaPagamentoController.VerificarExclusao(Value: TFormaPagamento): boolean;
begin
  result := FormaPagamentoervice.VerificarExclusao(Value);
end;

function TFormaPagamentoController.VerificarNome(Value: TFormaPagamento): boolean;
begin
  result := FormaPagamentoervice.VerificarNome(Value);
end;

end.
