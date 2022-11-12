unit uUnidadesController;

interface
  uses uUnidades, uUnidadesService, system.SysUtils, DBClient;
  type
  TUnidadesController = class(TObject)
    private
      UnidadeService : TUnidadesService;
    protected
    public
      constructor create;
      destructor free;
      function Inserir(Value: TUnidades):Boolean;
      function Alterar(Value: TUnidades):Boolean;
      function Excluir(Value: TUnidades):Boolean;
      function Recuperar(var Value: TUnidades):Boolean;
      procedure Pesquisar(sNome: string; var Dset: TClientDataSet);
      function VerificarNome(Value: TUnidades): boolean;
      function VerificarExclusao(Value: TUnidades): boolean;
  end;
implementation

{ TUnidadesController }

function TUnidadesController.Alterar(Value: TUnidades): Boolean;
begin
   result := UnidadeService.Alterar(Value);
end;

constructor TUnidadesController.create;
begin
   UnidadeService := TUnidadesService.Create;
end;

function TUnidadesController.Excluir(Value: TUnidades): Boolean;
begin
   result := UnidadeService.Excluir(Value);
end;

destructor TUnidadesController.free;
begin
   freeandnil(UnidadeService);
end;

function TUnidadesController.Inserir(Value: TUnidades): Boolean;
begin
   result := UnidadeService.Inserir(Value);
end;

procedure TUnidadesController.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
  UnidadeService.Pesquisar(sNome, dset);
end;

function TUnidadesController.Recuperar(var Value: TUnidades): Boolean;
begin
   result := UnidadeService.Recuperar(Value);
end;

function TUnidadesController.VerificarExclusao(Value: TUnidades): boolean;
begin
  result := UnidadeService.VerificarExclusao(Value);
end;

function TUnidadesController.VerificarNome(Value: TUnidades): boolean;
begin
  result := UnidadeService.VerificarNome(Value);
end;

end.
