unit uCidadesController;

interface
uses uCidades, uCidadesService, system.SysUtils, DBClient;
  type
  TCidadesController = class
    private
    protected
      CidadeService : TCidadesService;
    public
      constructor create;
      destructor Free;
      function Inserir(oCidade: TCidades):Boolean;
      function Alterar(oCidade: TCidades):Boolean;
      function Excluir(oCidade: TCidades):Boolean;
      function Recuperar(oCidade: TCidades):Boolean;
      procedure Pesquisar(sNome: string; var Dset: TClientDataSet);
      function VerificarNome(Value: TCidades): boolean;
      function VerificarExclusao(Value: TCidades): boolean;

  end;
implementation

{ TCidadesController }

function TCidadesController.Alterar(oCidade: TCidades): Boolean;
begin
   result := CidadeService.Alterar(oCidade);
end;

constructor TCidadesController.create;
begin
   CidadeService := TCidadesService.Create;
end;

function TCidadesController.Excluir(oCidade: TCidades): Boolean;
begin
   result := CidadeService.Excluir(oCidade);
end;

destructor TCidadesController.Free;
begin
   CidadeService.Free;
end;

function TCidadesController.Inserir(oCidade: TCidades): Boolean;
begin
   result := CidadeService.Inserir(oCidade);
end;

procedure TCidadesController.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
  CidadeService.Pesquisar(sNome, Dset);
end;

function TCidadesController.Recuperar(oCidade: TCidades): Boolean;
begin
   result := CidadeService.Recuperar(oCidade);
end;

function TCidadesController.VerificarExclusao(Value: TCidades): boolean;
begin
  result := CidadeService.VerificarExclusao(Value);
end;

function TCidadesController.VerificarNome(Value: TCidades): boolean;
begin
  result := CidadeService.VerificarNome(Value);
end;

end.
