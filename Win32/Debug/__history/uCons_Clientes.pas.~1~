unit uCons_Clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCons_Base, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Datasnap.DBClient, uClientes,
   uClientesController, uCad_clientes;

type
  TCons_Clientes = class(TCons_Base)
    ds_Clientes: TDataSource;
    dset_Clientes: TClientDataSet;
    dset_ClientesID: TIntegerField;
    dset_ClientesCLIENTE: TStringField;
    dset_ClientesCPFCNPJ: TStringField;
    dset_ClientesDATA_INSERT: TDateField;
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_PesquisarClick(Sender: TObject);
    procedure btn_SelecionarClick(Sender: TObject);
    procedure btn_NovoClick(Sender: TObject);
    procedure btn_AlterarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
  private
    { Private declarations }
    ClientesControl : TClientesController;
  public
    { Public declarations }
    Cliente: TClientes;
  end;

var
  Cons_Clientes: TCons_Clientes;

implementation

{$R *.dfm}

procedure TCons_Clientes.btn_AlterarClick(Sender: TObject);
var CadClientesForm: TCad_Clientes;
begin
   if (dset_Clientes.Active) and (dset_Clientes.RecordCount > 0) then
   begin
     CadClientesForm := TCad_Clientes.Create(nil);
     Cliente.LimparDados;
     Cliente.id := Dset_Clientes.FieldByName('id').asInteger;
     if ClientesControl.Recuperar(Cliente) then
     begin
       try
          CadClientesForm.Cliente.CopiarDados(Cliente);
          CadClientesForm.Inclusao := False;
          CadClientesForm.ShowModal;
          ClientesControl.Pesquisar(edt_Pesquisa.Text, Dset_Clientes);
       finally

       end;
     end;
   end
   else
     raise Exception.Create('Erro ao Alterar: Nenhum registro Selecionado');
end;

procedure TCons_Clientes.btn_ExcluirClick(Sender: TObject);
begin
if (dset_Clientes.Active) and (dset_Clientes.RecordCount > 0) then
    begin
        Cliente.ID := dset_ClientesID.AsInteger;
        if not ClientesControl.VerificarExclusao(Cliente) then
        begin
          if MessageDlg('Deseja Realmente excluir o Cliente : '+ dset_ClientesCliente.AsString +' ?', mtConfirmation, [mbYes, mbNo], 0) = idYES then
          begin
            ClientesControl.Excluir(Cliente);
            ClientesControl.Pesquisar(edt_Pesquisa.Text, Dset_Clientes);
          end;
        end
        else
          raise Exception.Create('Erro ao excluir: Há registros vinculados à esse Cliente');
    end
    else
    begin
      raise Exception.Create('Erro ao excluir: Nenhum registro Selecionado');
    end;
end;

procedure TCons_Clientes.btn_NovoClick(Sender: TObject);
var CadClientesForm: TCad_Clientes;
begin
   CadClientesForm := TCad_Clientes.Create(nil);
   try
      CadClientesForm.Inclusao := True;
      CadClientesForm.ShowModal;
      edt_Pesquisa.Clear;
      ClientesControl.Pesquisar(edt_Pesquisa.Text, Dset_Clientes);
   finally
      //FreeAndNil(CadPaisesForm);
   end;
end;

procedure TCons_Clientes.btn_PesquisarClick(Sender: TObject);
begin
  inherited;
  ClientesControl.Pesquisar(edt_Pesquisa.Text, Dset_Clientes);
end;

procedure TCons_Clientes.btn_SelecionarClick(Sender: TObject);
begin
  inherited;
  if dset_Clientes.RecordCount > 0 then
  begin
    Cliente.ID := dset_Clientesid.AsInteger;
    if ClientesControl.Recuperar(Cliente) then
      self.Close;
  end;
end;

procedure TCons_Clientes.FormCreate(Sender: TObject);
begin
  inherited;
  ClientesControl := TClientesController.Create;
  Cliente := TClientes.Create;

  if ( not Dset_Clientes.IsEmpty ) then
    Dset_Clientes.EmptyDataSet;
  Dset_Clientes.Active := False;
  Dset_Clientes.CreateDataSet;
  Dset_Clientes.Open;
end;

procedure TCons_Clientes.FormDestroy(Sender: TObject);
begin
  inherited;
  Cliente.Free;
  ClientesControl.Free;
end;

procedure TCons_Clientes.FormShow(Sender: TObject);
begin
  inherited;
  ClientesControl.Pesquisar(edt_Pesquisa.Text, Dset_Clientes);
end;

end.
