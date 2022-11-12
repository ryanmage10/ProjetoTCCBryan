unit uPaisesController;

interface
  uses uPaises, uPaisesService, system.SysUtils, DBClient;
  type
  TPaisesController = class(TObject)
    private
      PaisService : TPaisesService;
    protected
    public
      constructor create;
      destructor free;
      function Inserir(oPais: TPaises):Boolean;
      function Alterar(oPais: TPaises):Boolean;
      function Excluir(oPais: TPaises):Boolean;
      function Recuperar(var oPais: TPaises):Boolean;
      procedure Pesquisar(sNome: string; var Dset: TClientDataSet);
      function VerificarNome(Value: TPaises): boolean;
      function VerificarExclusao(Value: TPaises): boolean;
  end;
implementation

{ TPaisesController }

function TPaisesController.Alterar(oPais: TPaises): Boolean;
begin
   result := PaisService.Alterar(oPais);
end;

constructor TPaisesController.create;
begin
   PaisService := TPaisesService.Create;
end;

function TPaisesController.Excluir(oPais: TPaises): Boolean;
begin
   result := PaisService.Excluir(oPais);
end;

destructor TPaisesController.free;
begin
   freeandnil(PaisService);
end;

function TPaisesController.Inserir(oPais: TPaises): Boolean;
begin
   result := PaisService.Inserir(oPais);
end;

procedure TPaisesController.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
  PaisService.Pesquisar(sNome, dset);
end;

function TPaisesController.Recuperar(var oPais: TPaises): Boolean;
begin
   result := PaisService.Recuperar(oPais);
end;

function TPaisesController.VerificarExclusao(Value: TPaises): boolean;
begin
  result := PaisService.VerificarExclusao(Value);
end;

function TPaisesController.VerificarNome(Value: TPaises): boolean;
begin
  result := PaisService.VerificarNome(Value);
end;

end.
