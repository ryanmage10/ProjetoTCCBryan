unit uFormaPagamentoController;

interface
uses uFormaPagamento, system.SysUtils, DBClient, uFormaPagamentoService;
  type
  TFormaPagamentoController = class
    private
      FormaPagamentoService : TFormaPagamentoService;
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
   result := FormaPagamentoService.Alterar(oFormasPagamento);
end;

constructor TFormaPagamentoController.create;
begin
   FormaPagamentoService := TFormaPagamentoService.Create;
end;

function TFormaPagamentoController.Excluir(oFormasPagamento: TFormaPagamento): Boolean;
begin
  result := FormaPagamentoService.Excluir(oFormasPagamento);
end;

destructor TFormaPagamentoController.Free;
begin
  FormaPagamentoService.Free;
end;

function TFormaPagamentoController.Inserir(oFormasPagamento: TFormaPagamento): Boolean;
begin
   result := FormaPagamentoService.Inserir(oFormasPagamento);
end;

procedure TFormaPagamentoController.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
   FormaPagamentoService.Pesquisar(sNome, Dset);
end;

function TFormaPagamentoController.Recuperar(oFormasPagamento: TFormaPagamento): Boolean;
begin
  result := FormaPagamentoService.Recuperar(oFormasPagamento);
end;

function TFormaPagamentoController.VerificarExclusao(Value: TFormaPagamento): boolean;
begin
  result := FormaPagamentoService.VerificarExclusao(Value);
end;

function TFormaPagamentoController.VerificarNome(Value: TFormaPagamento): boolean;
begin
  result := FormaPagamentoService.VerificarNome(Value);
end;

end.
