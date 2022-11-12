unit uEstadosController;

interface
uses uEstados, system.SysUtils, DBClient, uEstadosService;
  type
  TEstadosController = class
    private
      EstadoService : TEstadosService;
    protected
    public
      constructor create;
      destructor Free;
      function Inserir(oEstado: TEstados):Boolean;
      function Alterar(oEstado: TEstados):Boolean;
      function Excluir(oEstado: TEstados):Boolean;
      function Recuperar(oEstado: TEstados):Boolean;
      procedure Pesquisar(sNome: string; var Dset: TClientDataSet);
      function VerificarNome(Value: TEstados): boolean;
      function VerificarExclusao(Value: TEstados): boolean;

  end;
implementation

{ TEstadosController }

function TEstadosController.Alterar(oEstado: TEstados): Boolean;
begin
   result := EstadoService.Alterar(oEstado);
end;

constructor TEstadosController.create;
begin
   EstadoService := TEstadosService.Create;
end;

function TEstadosController.Excluir(oEstado: TEstados): Boolean;
begin
  result := EstadoService.Excluir(oEstado);
end;

destructor TEstadosController.Free;
begin
  EstadoService.Free;
end;

function TEstadosController.Inserir(oEstado: TEstados): Boolean;
begin
   result := EstadoService.Inserir(oEstado);
end;

procedure TEstadosController.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
   EstadoService.Pesquisar(sNome, Dset);
end;

function TEstadosController.Recuperar(oEstado: TEstados): Boolean;
begin
  result := EstadoService.Recuperar(oEstado);
end;

function TEstadosController.VerificarExclusao(Value: TEstados): boolean;
begin
  result := EstadoService.VerificarExclusao(Value);
end;

function TEstadosController.VerificarNome(Value: TEstados): boolean;
begin
  result := EstadoService.VerificarNome(Value);
end;

end.
