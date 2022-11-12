unit uCaixasController;

interface
  uses uCaixas, uCaixasService, system.SysUtils, DBClient;
  type
  TCaixasController = class(TObject)
    private
      CaixaService : TCaixasService;
    protected
    public
      constructor create;
      destructor free;
      function Inserir(oCaixa: TCaixas):Boolean;
      function Alterar(oCaixa: TCaixas):Boolean;
      function Excluir(oCaixa: TCaixas):Boolean;
      function Recuperar(var oCaixa: TCaixas):Boolean;
      procedure Pesquisar(sNome: string; var Dset: TClientDataSet);
      function VerificarNome(Value: TCaixas): boolean;
      function VerificarExclusao(Value: TCaixas): boolean;
  end;
implementation

{ TCaixasController }

function TCaixasController.Alterar(oCaixa: TCaixas): Boolean;
begin
   result := CaixaService.Alterar(oCaixa);
end;

constructor TCaixasController.create;
begin
   CaixaService := TCaixasService.Create;
end;

function TCaixasController.Excluir(oCaixa: TCaixas): Boolean;
begin
   result := CaixaService.Excluir(oCaixa);
end;

destructor TCaixasController.free;
begin
   freeandnil(CaixaService);
end;

function TCaixasController.Inserir(oCaixa: TCaixas): Boolean;
begin
   result := CaixaService.Inserir(oCaixa);
end;

procedure TCaixasController.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
  CaixaService.Pesquisar(sNome, dset);
end;

function TCaixasController.Recuperar(var oCaixa: TCaixas): Boolean;
begin
   result := CaixaService.Recuperar(oCaixa);
end;

function TCaixasController.VerificarExclusao(Value: TCaixas): boolean;
begin
  result := CaixaService.VerificarExclusao(Value);
end;

function TCaixasController.VerificarNome(Value: TCaixas): boolean;
begin
  result := CaixaService.VerificarNome(Value);
end;

end.
