unit uFormaPagamentoFactory;

interface
uses uFormaPagamento, system.SysUtils, DBClient, uFormaPagamentoDao, uDmConexao;
  type
  TFormaPagamentoFactory = class(TObject)
    private
      FormaPagamentoDao : TFormaPagamentoDao;
    protected
    public
      constructor create;
      destructor free;
      function Inserir(oFormaPagamento: TFormaPagamento):Boolean;
      function Alterar(oFormaPagamento: TFormaPagamento):Boolean;
      function Excluir(oFormaPagamento: TFormaPagamento):Boolean;
      function Recuperar(var oFormaPagamento: TFormaPagamento):Boolean;
      procedure Pesquisar(sNome: string; var Dset: TClientDataSet);
      function VerificarNome(Value: TFormaPagamento): boolean;
      function VerificarExclusao(Value: TFormaPagamento): boolean;
  end;

  var
  FormaPagamentoFactory: TFormaPagamentoFactory;
implementation

{ TFormaPagamentoFactory }

function TFormaPagamentoFactory.Alterar(oFormaPagamento: TFormaPagamento): Boolean;
begin
   oFormaPagamento.User_Update := 'Bryan Silva';
   oFormaPagamento.DataUltAlt := now;
   result := FormaPagamentoDao.Alterar(oFormaPagamento);
end;

constructor TFormaPagamentoFactory.create;
begin
   FormaPagamentoDao := TFormaPagamentoDao.Create;
end;

function TFormaPagamentoFactory.Excluir(oFormaPagamento: TFormaPagamento): Boolean;
begin
   result := FormaPagamentoDao.Excluir(oFormaPagamento);
end;

destructor TFormaPagamentoFactory.free;
begin
   freeandnil(FormaPagamentoDao);
end;

function TFormaPagamentoFactory.Inserir(oFormaPagamento: TFormaPagamento): Boolean;
begin
   oFormaPagamento.User_Insert := 'Bryan';
   oFormaPagamento.User_Update := 'Bryan';
   oFormaPagamento.DataCad := now;
   oFormaPagamento.DataUltAlt := now;
   result := FormaPagamentoDao.Inserir(oFormaPagamento);
end;

procedure TFormaPagamentoFactory.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
   FormaPagamentoDao.Pesquisar(sNome, Dset);
end;

function TFormaPagamentoFactory.Recuperar(var oFormaPagamento: TFormaPagamento): Boolean;
begin
   result := FormaPagamentoDao.Recuperar(oFormaPagamento);
end;

function TFormaPagamentoFactory.VerificarExclusao(Value: TFormaPagamento): boolean;
begin
   result :=  FormaPagamentoDao.VerificarExclusao(Value);
end;

function TFormaPagamentoFactory.VerificarNome(Value: TFormaPagamento): boolean;
begin
   result := FormaPagamentoDao.VerificarNome(Value);
end;

end.
