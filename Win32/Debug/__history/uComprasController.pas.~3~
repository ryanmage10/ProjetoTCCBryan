unit uComprasController;

interface
  uses uCompras, uComprasService, system.SysUtils, DBClient;
  type
  TComprasController = class(TObject)
    private
      CompraService : TComprasService;
    protected
    public
      constructor create;
      destructor free;
      function Inserir(oCompra: TCompras):Boolean;
      function Alterar(oCompra: TCompras):Boolean;
      function Excluir(oCompra: TCompras):Boolean;
      function Recuperar(var oCompra: TCompras):Boolean;
      procedure Pesquisar(sNome: string; var Dset: TClientDataSet);
      function VerificarExiste(Value: TCompras): boolean;
      function VerificarExclusao(Value: TCompras): boolean;
  end;
implementation

{ TComprasController }

function TComprasController.Alterar(oCompra: TCompras): Boolean;
begin
   result := CompraService.Alterar(oCompra);
end;

constructor TComprasController.create;
begin
   CompraService := TComprasService.Create;
end;

function TComprasController.Excluir(oCompra: TCompras): Boolean;
begin
   result := CompraService.Excluir(oCompra);
end;

destructor TComprasController.free;
begin
   freeandnil(CompraService);
end;

function TComprasController.Inserir(oCompra: TCompras): Boolean;
begin
   result := CompraService.Inserir(oCompra);
end;

procedure TComprasController.Pesquisar(sNome: string; var Dset: TClientDataSet);
begin
  CompraService.Pesquisar(sNome, dset);
end;

function TComprasController.Recuperar(var oCompra: TCompras): Boolean;
begin
   result := CompraService.Recuperar(oCompra);
end;

function TComprasController.VerificarExclusao(Value: TCompras): boolean;
begin
  result := CompraService.VerificarExclusao(Value);
end;

function TComprasController.VerificarExiste(Value: TCompras): boolean;
begin
  result := CompraService.VerificarExiste(Value);
end;

end.
