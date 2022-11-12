unit uCons_Fornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCons_Base, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Datasnap.DBClient, uFornecedores,
  uCad_Fornecedores, uFornecedoresController;

type
  TCons_Fornecedores = class(TCons_Base)
    ds_Fornecedores: TDataSource;
    dset_Fornecedores: TClientDataSet;
    dset_FornecedoresID: TIntegerField;
    dset_FornecedoresFORNECEDOR: TStringField;
    dset_FornecedoresCPFCNPJ: TStringField;
    dset_FornecedoresDATA_INSERT: TDateField;
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
    FornecedoresControl : TFornecedoresController;
  public
    { Public declarations }
    Fornecedor: TFornecedores;
  end;

var
  Cons_Fornecedores: TCons_Fornecedores;

implementation

{$R *.dfm}

procedure TCons_Fornecedores.btn_AlterarClick(Sender: TObject);
var CadFornecedoresForm: TCad_Fornecedores;
begin
   if (dset_Fornecedores.Active) and (dset_Fornecedores.RecordCount > 0) then
   begin
     CadFornecedoresForm := TCad_Fornecedores.Create(nil);
     Fornecedor.LimparDados;
     Fornecedor.id := Dset_Fornecedores.FieldByName('id').asInteger;
     if FornecedoresControl.Recuperar(Fornecedor) then
     begin
       try
          CadFornecedoresForm.Fornecedor.CopiarDados(Fornecedor);
          CadFornecedoresForm.Inclusao := False;
          CadFornecedoresForm.ShowModal;
          FornecedoresControl.Pesquisar(edt_Pesquisa.Text, Dset_Fornecedores);
       finally

       end;
     end;
   end
   else
     raise Exception.Create('Erro ao Alterar: Nenhum registro Selecionado');
end;

procedure TCons_Fornecedores.btn_ExcluirClick(Sender: TObject);
begin
  inherited;
  if (dset_Fornecedores.Active) and (dset_Fornecedores.RecordCount > 0) then
    begin
        Fornecedor.ID := dset_FornecedoresID.AsInteger;
        if not FornecedoresControl.VerificarExclusao(Fornecedor) then
        begin
          if MessageDlg('Deseja Realmente excluir o Fornecedor : '+ dset_FornecedoresFornecedor.AsString +' ?', mtConfirmation, [mbYes, mbNo], 0) = idYES then
          begin
            FornecedoresControl.Excluir(Fornecedor);
            FornecedoresControl.Pesquisar(edt_Pesquisa.Text, Dset_Fornecedores);
          end;
        end
        else
          raise Exception.Create('Erro ao excluir: Há registros vinculados à esse Fornecedor');
    end
    else
    begin
      raise Exception.Create('Erro ao excluir: Nenhum registro Selecionado');
    end;
end;

procedure TCons_Fornecedores.btn_NovoClick(Sender: TObject);
var CadFornecedoresForm: TCad_Fornecedores;
begin
   CadFornecedoresForm := TCad_Fornecedores.Create(nil);
   try
      CadFornecedoresForm.Inclusao := True;
      CadFornecedoresForm.ShowModal;
      edt_Pesquisa.Clear;
      FornecedoresControl.Pesquisar(edt_Pesquisa.Text, Dset_Fornecedores);
   finally
      //FreeAndNil(CadPaisesForm);
   end;
end;

procedure TCons_Fornecedores.btn_PesquisarClick(Sender: TObject);
begin
  inherited;
  FornecedoresControl.Pesquisar(edt_Pesquisa.Text, Dset_Fornecedores);
end;

procedure TCons_Fornecedores.btn_SelecionarClick(Sender: TObject);
begin
  inherited;
  if dset_Fornecedores.RecordCount > 0 then
  begin
    Fornecedor.ID := dset_Fornecedoresid.AsInteger;
    if FornecedoresControl.Recuperar(Fornecedor) then
      self.Close;
  end;
end;

procedure TCons_Fornecedores.FormCreate(Sender: TObject);
begin
  inherited;
  FornecedoresControl := TFornecedoresController.Create;
  Fornecedor := TFornecedores.Create;

  if ( not Dset_Fornecedores.IsEmpty ) then
    Dset_Fornecedores.EmptyDataSet;
  Dset_Fornecedores.Active := False;
  Dset_Fornecedores.CreateDataSet;
  Dset_Fornecedores.Open;
end;

procedure TCons_Fornecedores.FormDestroy(Sender: TObject);
begin
  inherited;
  Fornecedor.Free;
  FornecedoresControl.Free;
end;

procedure TCons_Fornecedores.FormShow(Sender: TObject);
begin
  inherited;
  FornecedoresControl.Pesquisar(edt_Pesquisa.Text, Dset_Fornecedores);
end;

end.
