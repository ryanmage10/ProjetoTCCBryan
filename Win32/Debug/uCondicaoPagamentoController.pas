unit uCondicaoPagamentoController;

interface
uses uCondicaoPagamento, system.SysUtils, DBClient, uCondicaoPagamentoService;
  type
  TCondicaoPagamentoController = class
    private
      CondicaoPagamentoervice : TCondicaoPagamentoService;
    protected
    public
      constructor create;
      destructor Free;
      function Inserir(oFormasPagamento: TCondicaoPagamento):Boolean;
      function Alterar(oFormasPagamento: TCondicaoPagamento):Boolean;
      function Excluir(oFormasPagamento: TCondicaoPagamento):Boolean;
      function Recuperar(oFormasPagamento: TCondicaoPagamento):Boolean;
      procedure Pesquisar(sNome: string; var Dset: TClientDataSet);
      function VerificarNome(Value: TCondicaoPagamento): boolean;
      function VerificarExclusao(Value: TCondicaoPagamento): boolean;

  end;
implementation

{ TCondicaoPagamentoController }

function TCondicaoPagamentoController.Alterar(oFormasPagamento: TCondicaoPagamento): Boolean;
begin
   result := CondicaoPagamentoervice.Alterar(oFormasPagamento);
end;

constructor TCondicaoPagamentoController.create;
begin
   CondicaoPagamentoervice := TCondicaoPagamentoService.Create;
end;

function TCondicaoPagamentoController.Excluir(oFormasPagamento: TCondicaoPagamento): Boolean;
begin
  result := CondicaoPagamentoervice.Excluir(oFormasPagamento);
end;

destructor TCondicaoPagamentoController.Free;
begin
  CondicaoPagamentoervice.Free;
end;

function TCondicaoPagamentoController.Inserir(oFormasPagamento: TCondicaoPagamento): Boolean;
begin
   result := CondicaoPagamentoervice.Inserir(oFormasPagamento);
end;

procedure TCondicaoPagamentoController.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
   CondicaoPagamentoervice.Pesquisar(sNome, Dset);
end;

function TCondicaoPagamentoController.Recuperar(oFormasPagamento: TCondicaoPagamento): Boolean;
begin
  result := CondicaoPagamentoervice.Recuperar(oFormasPagamento);
end;

function TCondicaoPagamentoController.VerificarExclusao(Value: TCondicaoPagamento): boolean;
begin
  result := CondicaoPagamentoervice.VerificarExclusao(Value);
end;

function TCondicaoPagamentoController.VerificarNome(Value: TCondicaoPagamento): boolean;
begin
  result := CondicaoPagamentoervice.VerificarNome(Value);
end;

end.
