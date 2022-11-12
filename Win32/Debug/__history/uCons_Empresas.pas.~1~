unit uCons_Empresas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCons_Base, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Datasnap.DBClient, uEmpresas,
   uEmpresasController, uCad_Empresas;

type
  TCons_Empresas = class(TCons_Base)
    dset_Empresas: TClientDataSet;
    ds_Empresas: TDataSource;
    dset_Empresasid: TIntegerField;
    dset_EmpresasEmpresa: TStringField;
    dset_Empresascpfcnpj: TStringField;
    dset_Empresasdata_insert: TDateField;
    procedure btn_SelecionarClick(Sender: TObject);
    procedure btn_NovoClick(Sender: TObject);
    procedure btn_AlterarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure btn_PesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    EmpresaControl : TEmpresasController;
  public
    { Public declarations }
    Empresa : TEmpresas;
  end;

var
  Cons_Empresas: TCons_Empresas;

implementation

{$R *.dfm}

procedure TCons_Empresas.btn_AlterarClick(Sender: TObject);
var CadEmpresasForm: TCad_Empresa;
begin
   if (dset_Empresas.Active) and (dset_Empresas.RecordCount > 0) then
   begin
     CadEmpresasForm := TCad_Empresa.Create(nil);
     Empresa.LimparDados;
     Empresa.id := Dset_Empresas.FieldByName('id').asInteger;
     if EmpresaControl.Recuperar(Empresa) then
     begin
       try
          CadEmpresasForm.Empresa.CopiarDados(Empresa);
          CadEmpresasForm.Inclusao := False;
          CadEmpresasForm.ShowModal;
          EmpresaControl.Pesquisar(edt_Pesquisa.Text, Dset_Empresas);
       finally
          //FreeAndNil(CadPaisesForm );
       end;
     end;
   end
   else
     raise Exception.Create('Erro ao alterar: Nenhum registro Selecionado');
end;

procedure TCons_Empresas.btn_ExcluirClick(Sender: TObject);
begin
  if (dset_Empresas.Active) and (dset_Empresas.RecordCount > 0) then
    begin
        Empresa.ID := dset_EmpresasID.AsInteger;
        if not EmpresaControl.VerificarExclusao(Empresa) then
        begin
          if MessageDlg('Deseja Realmente excluir a Empresa : '+ dset_EmpresasEmpresa.AsString +' ?', mtConfirmation, [mbYes, mbNo], 0) = idYES then
          begin
            EmpresaControl.Excluir(Empresa);
            EmpresaControl.Pesquisar(edt_Pesquisa.Text, Dset_Empresas);
          end;
        end
        else
          raise Exception.Create('Erro ao excluir: Há registros vinculados à essa Empresa');
    end
    else
    begin
      raise Exception.Create('Erro ao excluir: Nenhum registro Selecionado');
    end;
end;

procedure TCons_Empresas.btn_NovoClick(Sender: TObject);
var CadEmpresasForm: TCad_Empresa;
begin
   CadEmpresasForm := TCad_Empresa.Create(nil);
   try
      CadEmpresasForm.Inclusao := True;
      CadEmpresasForm.ShowModal;
      edt_Pesquisa.Clear;
      EmpresaControl.Pesquisar(edt_Pesquisa.Text, Dset_Empresas);
   finally
      //FreeAndNil(CadPaisesForm);
   end;
end;

procedure TCons_Empresas.btn_PesquisarClick(Sender: TObject);
begin
  inherited;
  EmpresaControl.Pesquisar(edt_Pesquisa.Text, Dset_Empresas);
end;

procedure TCons_Empresas.btn_SelecionarClick(Sender: TObject);
begin
  inherited;
  if dset_Empresas.RecordCount > 0 then
  begin
    Empresa.ID := dset_Empresasid.AsInteger;
    if EmpresaControl.Recuperar(Empresa) then
      self.Close;
  end;
end;

procedure TCons_Empresas.FormCreate(Sender: TObject);
begin
  inherited;
  EmpresaControl := TEmpresasController.Create;
  Empresa := TEmpresas.Create;

  if ( not Dset_Empresas.IsEmpty ) then
    Dset_Empresas.EmptyDataSet;
  Dset_Empresas.Active := False;
  Dset_Empresas.CreateDataSet;
  Dset_Empresas.Open;
end;

procedure TCons_Empresas.FormDestroy(Sender: TObject);
begin
  inherited;
  Empresa.Free;
  EmpresaControl.Free;
end;

procedure TCons_Empresas.FormShow(Sender: TObject);
begin
  inherited;
  EmpresaControl.Pesquisar(edt_Pesquisa.Text, Dset_Empresas);
end;

end.
