unit uCons_Funcionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCons_Base, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Datasnap.DBClient, uFuncionarios,
  uFuncionariosController, uCad_Funcionarios;

type
  TCons_Funcionarios = class(TCons_Base)
    ds_Funcionarios: TDataSource;
    dset_Funcionarios: TClientDataSet;
    dset_FuncionariosID: TIntegerField;
    dset_FuncionariosFUNCIONARIO: TStringField;
    dset_FuncionariosCPFCNPJ: TStringField;
    dset_FuncionariosDATA_INSERT: TDateTimeField;
    procedure btn_PesquisarClick(Sender: TObject);
    procedure btn_SelecionarClick(Sender: TObject);
    procedure btn_NovoClick(Sender: TObject);
    procedure btn_AlterarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FuncionarioControl : TFuncionariosController;
  public
    { Public declarations }
    Funcionario : TFuncionarios;
  end;

var
  Cons_Funcionarios: TCons_Funcionarios;

implementation

{$R *.dfm}

procedure TCons_Funcionarios.btn_AlterarClick(Sender: TObject);
var CadFuncionariosForm: TCad_Funcionarios;
begin
   if (dset_Funcionarios.Active) and (dset_Funcionarios.RecordCount > 0) then
   begin
     CadFuncionariosForm := TCad_Funcionarios.Create(nil);
     Funcionario.LimparDados;
     Funcionario.id := Dset_Funcionarios.FieldByName('id').asInteger;
     if FuncionarioControl.Recuperar(Funcionario) then
     begin
       try
          CadFuncionariosForm.Funcionario.CopiarDados(Funcionario);
          CadFuncionariosForm.Inclusao := False;
          CadFuncionariosForm.ShowModal;
          FuncionarioControl.Pesquisar(edt_Pesquisa.Text, Dset_Funcionarios);
       finally

       end;
     end;
   end
   else
     raise Exception.Create('Erro ao Alterar: Nenhum registro Selecionado');
end;

procedure TCons_Funcionarios.btn_ExcluirClick(Sender: TObject);
begin
    if (dset_Funcionarios.Active) and (dset_Funcionarios.RecordCount > 0) then
    begin
        Funcionario.ID := dset_FuncionariosID.AsInteger;
        if not FuncionarioControl.VerificarExclusao(Funcionario) then
        begin
          if MessageDlg('Deseja Realmente excluir o Funcionário : '+ dset_FuncionariosFuncionario.AsString +' ?', mtConfirmation, [mbYes, mbNo], 0) = idYES then
          begin
            FuncionarioControl.Excluir(Funcionario);
            FuncionarioControl.Pesquisar(edt_Pesquisa.Text, Dset_Funcionarios);
          end;
        end
        else
          raise Exception.Create('Erro ao excluir: Há registros vinculados à esse Funcionario');
    end
    else
    begin
      raise Exception.Create('Erro ao excluir: Nenhum registro Selecionado');
    end;
end;

procedure TCons_Funcionarios.btn_NovoClick(Sender: TObject);
var CadFuncionariosForm: TCad_Funcionarios;
begin
   CadFuncionariosForm := TCad_Funcionarios.Create(nil);
   try
      CadFuncionariosForm.Inclusao := True;
      CadFuncionariosForm.ShowModal;
      edt_Pesquisa.Clear;
      FuncionarioControl.Pesquisar(edt_Pesquisa.Text, Dset_Funcionarios);
   finally
      //FreeAndNil(CadPaisesForm);
   end;
end;

procedure TCons_Funcionarios.btn_PesquisarClick(Sender: TObject);
begin
  inherited;
  FuncionarioControl.Pesquisar(edt_Pesquisa.Text, Dset_Funcionarios);
end;

procedure TCons_Funcionarios.btn_SelecionarClick(Sender: TObject);
begin
  inherited;
  if dset_Funcionarios.RecordCount > 0 then
  begin
    Funcionario.ID := dset_Funcionariosid.AsInteger;
    if FuncionarioControl.Recuperar(Funcionario) then
      self.Close;
  end;
end;

procedure TCons_Funcionarios.FormCreate(Sender: TObject);
begin
  inherited;
  FuncionarioControl := TFuncionariosController.Create;
  Funcionario := TFuncionarios.Create;

  if ( not Dset_Funcionarios.IsEmpty ) then
    Dset_Funcionarios.EmptyDataSet;
  Dset_Funcionarios.Active := False;
  Dset_Funcionarios.CreateDataSet;
  Dset_Funcionarios.Open;
end;

procedure TCons_Funcionarios.FormDestroy(Sender: TObject);
begin
  inherited;
  Funcionario.Free;
  FuncionarioControl.Free;
end;

procedure TCons_Funcionarios.FormShow(Sender: TObject);
begin
  inherited;
  FuncionarioControl.Pesquisar(edt_Pesquisa.Text, Dset_Funcionarios);
end;

end.
