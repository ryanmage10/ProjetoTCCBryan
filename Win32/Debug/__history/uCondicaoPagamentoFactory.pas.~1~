unit uCondicaoPagamentoFactory;

interface
uses uCondicaoPagamento, system.SysUtils, DBClient, uCondicaoPagamentoDao, uDmConexao,
  uParcelaModeloFactory;
  type
  TCondicaoPagamentoFactory = class(TObject)
    private
      CondicaoPagamentoDao : TCondicaoPagamentoDao;
      ParcelaModeloFactory: TParcelaModeloFactory;
    protected
    public
      constructor create;
      destructor free;
      function Inserir(oCondicaoPagamento: TCondicaoPagamento):Boolean;
      function Alterar(oCondicaoPagamento: TCondicaoPagamento):Boolean;
      function Excluir(oCondicaoPagamento: TCondicaoPagamento):Boolean;
      function Recuperar(var oCondicaoPagamento: TCondicaoPagamento):Boolean;
      procedure Pesquisar(sNome: string; var Dset: TClientDataSet);
      function VerificarNome(Value: TCondicaoPagamento): boolean;
      function VerificarExclusao(Value: TCondicaoPagamento): boolean;
  end;

  var
  CondicaoPagamentoFactory: TCondicaoPagamentoFactory;
implementation

{ TCondicaoPagamentoFactory }

function TCondicaoPagamentoFactory.Alterar(oCondicaoPagamento: TCondicaoPagamento): Boolean;
begin
   oCondicaoPagamento.User_Update := 'Bryan Silva';
   oCondicaoPagamento.DataUltAlt := now;
   if ParcelaModeloFactory.ExcluirPorCondicaoPagamento(oCondicaoPagamento.Id) then
     if CondicaoPagamentoDao.Alterar(oCondicaoPagamento) then
        result := ParcelaModeloFactory.InserirParcelas(oCondicaoPagamento.ParcelaModelos);
end;

constructor TCondicaoPagamentoFactory.create;
begin
   CondicaoPagamentoDao := TCondicaoPagamentoDao.Create;
   ParcelaModeloFactory := TParcelaModeloFactory.Create;
end;

function TCondicaoPagamentoFactory.Excluir(oCondicaoPagamento: TCondicaoPagamento): Boolean;
begin
   if ParcelaModeloFactory.ExcluirPorCondicaoPagamento(oCondicaoPagamento.Id) then
      result := CondicaoPagamentoDao.Excluir(oCondicaoPagamento);
end;

destructor TCondicaoPagamentoFactory.free;
begin
   freeandnil(CondicaoPagamentoDao);
   ParcelaModeloFactory.Free;
end;

function TCondicaoPagamentoFactory.Inserir(oCondicaoPagamento: TCondicaoPagamento): Boolean;
begin
   oCondicaoPagamento.User_Insert := 'Bryan';
   oCondicaoPagamento.User_Update := 'Bryan';
   oCondicaoPagamento.DataCad := now;
   oCondicaoPagamento.DataUltAlt := now;
   if CondicaoPagamentoDao.Inserir(oCondicaoPagamento) then
      result := ParcelaModeloFactory.InserirParcelas(oCondicaoPagamento.ParcelaModelos);

end;

procedure TCondicaoPagamentoFactory.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
   CondicaoPagamentoDao.Pesquisar(sNome, Dset);
end;

function TCondicaoPagamentoFactory.Recuperar(var oCondicaoPagamento: TCondicaoPagamento): Boolean;
begin
   if CondicaoPagamentoDao.Recuperar(oCondicaoPagamento) then
    result := ParcelaModeloFactory.RecuperarPorCondicaoPagamento(oCondicaoPagamento);
end;

function TCondicaoPagamentoFactory.VerificarExclusao(Value: TCondicaoPagamento): boolean;
begin
   result :=  CondicaoPagamentoDao.VerificarExclusao(Value);
end;

function TCondicaoPagamentoFactory.VerificarNome(Value: TCondicaoPagamento): boolean;
begin
   result := CondicaoPagamentoDao.VerificarNome(Value);
end;

end.
