unit uEmpresasController;

interface
  uses uEmpresas, uEmpresasService, system.SysUtils, DBClient;
  type
  TEmpresasController = class(TObject)
    private
      EmpresaService : TEmpresasService;
    protected
    public
      constructor create;
      destructor free;
      function Inserir(oEmpresa: TEmpresas):Boolean;
      function Alterar(oEmpresa: TEmpresas):Boolean;
      function Excluir(oEmpresa: TEmpresas):Boolean;
      function Recuperar(var oEmpresa: TEmpresas):Boolean;
      procedure Pesquisar(sNome: string; var Dset: TClientDataSet);
      function VerificarCpfCnpj(Value: TEmpresas): boolean;
      function VerificarExclusao(Value: TEmpresas): boolean;
  end;
implementation

{ TEmpresasController }

function TEmpresasController.Alterar(oEmpresa: TEmpresas): Boolean;
begin
   result := EmpresaService.Alterar(oEmpresa);
end;

constructor TEmpresasController.create;
begin
   EmpresaService := TEmpresasService.Create;
end;

function TEmpresasController.Excluir(oEmpresa: TEmpresas): Boolean;
begin
   result := EmpresaService.Excluir(oEmpresa);
end;

destructor TEmpresasController.free;
begin
   freeandnil(EmpresaService);
end;

function TEmpresasController.Inserir(oEmpresa: TEmpresas): Boolean;
begin
   result := EmpresaService.Inserir(oEmpresa);
end;

procedure TEmpresasController.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
  EmpresaService.Pesquisar(sNome, dset);
end;

function TEmpresasController.Recuperar(var oEmpresa: TEmpresas): Boolean;
begin
   result := EmpresaService.Recuperar(oEmpresa);
end;

function TEmpresasController.VerificarExclusao(Value: TEmpresas): boolean;
begin
  result := EmpresaService.VerificarExclusao(Value);
end;

function TEmpresasController.VerificarCpfCnpj(Value: TEmpresas): boolean;
begin
  result := EmpresaService.VerificarCpfCnpj(Value);
end;

end.
