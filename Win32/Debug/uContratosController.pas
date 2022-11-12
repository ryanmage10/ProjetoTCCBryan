unit uContratosController;

interface
uses uContratos, system.SysUtils, DBClient, uContratosService;
  type
  TContratosController = class
    private
      Contratoservice : TContratosService;
    protected
    public
      constructor create;
      destructor Free;
      function Inserir(oContrato: TContratos):Boolean;
      function Alterar(oContrato: TContratos):Boolean;
      function Excluir(oContrato: TContratos):Boolean;
      function Recuperar(oContrato: TContratos):Boolean;
      procedure Pesquisar(sNome: string; var Dset: TClientDataSet);
      function VerificarNome(Value: TContratos): boolean;
      function VerificarExclusao(Value: TContratos): boolean;

  end;
implementation

{ TContratosController }

function TContratosController.Alterar(oContrato: TContratos): Boolean;
begin
   result := Contratoservice.Alterar(oContrato);
end;

constructor TContratosController.create;
begin
   Contratoservice := TContratosService.Create;
end;

function TContratosController.Excluir(oContrato: TContratos): Boolean;
begin
  result := Contratoservice.Excluir(oContrato);
end;

destructor TContratosController.Free;
begin
  Contratoservice.Free;
end;

function TContratosController.Inserir(oContrato: TContratos): Boolean;
begin
   result := Contratoservice.Inserir(oContrato);
end;

procedure TContratosController.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
   Contratoservice.Pesquisar(sNome, Dset);
end;

function TContratosController.Recuperar(oContrato: TContratos): Boolean;
begin
  result := Contratoservice.Recuperar(oContrato);
end;

function TContratosController.VerificarExclusao(Value: TContratos): boolean;
begin
  result := Contratoservice.VerificarExclusao(Value);
end;

function TContratosController.VerificarNome(Value: TContratos): boolean;
begin
  result := Contratoservice.VerificarNome(Value);
end;

end.
