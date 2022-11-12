unit uCons_Contratos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCons_Base, Data.DB, Datasnap.DBClient,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, uContratos, uContratosController,
  uCad_Contratos;

type
  TCons_Contratos = class(TCons_Base)
    dset_Contratos: TClientDataSet;
    ds_Contratos: TDataSource;
    dset_ContratosID: TIntegerField;
    dset_ContratosCODIGODOC: TStringField;
    dset_ContratosDESCRICAO: TStringField;
    dset_ContratosMOEDA: TStringField;
    dset_ContratosTIPO: TStringField;
    dset_ContratosVALOR: TCurrencyField;
    dset_ContratosDATA_INSERT: TDateField;
    procedure FormShow(Sender: TObject);
    procedure btn_PesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btn_SelecionarClick(Sender: TObject);
    procedure btn_NovoClick(Sender: TObject);
    procedure btn_AlterarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
  private
    { Private declarations }
    ContratosControl : TContratosController;
  public
    { Public declarations }
    Contrato: TContratos;
  end;

var
  Cons_Contratos: TCons_Contratos;

implementation

{$R *.dfm}

procedure TCons_Contratos.btn_AlterarClick(Sender: TObject);
var CadContratoForm: TCad_Contratos;
begin
  if (dset_Contratos.Active) and (dset_Contratos.RecordCount > 0) then
  begin
     CadContratoForm := TCad_Contratos.Create(nil);
     Contrato.LimparDados;
     Contrato.id := Dset_Contratos.FieldByName('id').asInteger;
     if ContratosControl.Recuperar(Contrato) then
     begin
       try
          CadContratoForm.Contrato.CopiarDados(Contrato);
          CadContratoForm.Inclusao := False;
          CadContratoForm.ShowModal;
          ContratosControl.Pesquisar(edt_Pesquisa.Text, Dset_Contratos);
       finally
          //FreeAndNil(CadEstadoForm);
       end;
     end;
  end
  else
    raise Exception.Create('Erro ao Alterar: Nenhum registro Selecionado');
end;

procedure TCons_Contratos.btn_ExcluirClick(Sender: TObject);
begin
  inherited;
  if (dset_Contratos.Active) and (dset_Contratos.RecordCount > 0) then
  begin
      Contrato.ID := dset_ContratosID.AsInteger;
      if not ContratosControl.VerificarExclusao(Contrato) then
      begin
        if MessageDlg('Deseja Realmente excluir o Contrato: '+ dset_ContratosCodigoDoc.AsString +' ?', mtConfirmation, [mbYes, mbNo], 0) = idYES then
        begin
          ContratosControl.Excluir(Contrato);
          ContratosControl.Pesquisar(edt_Pesquisa.Text, Dset_Contratos);
        end;
      end
      Else
        raise Exception.Create('Erro ao excluir: Há registros vinculados à esse Contrato');
  end
  else
  begin
    raise Exception.Create('Erro ao excluir: Nenhum registro Selecionado');
  end;
end;

procedure TCons_Contratos.btn_NovoClick(Sender: TObject);
var CadContratoForm: TCad_Contratos;
begin
   CadContratoForm := TCad_Contratos.Create(nil);
   try
      CadContratoForm.Inclusao := True;
      CadContratoForm.ShowModal;
      edt_Pesquisa.Clear;
      ContratosControl.Pesquisar(edt_Pesquisa.Text, Dset_Contratos);
   finally
      //FreeAndNil(CadEstadoForm);
   end;
end;

procedure TCons_Contratos.btn_PesquisarClick(Sender: TObject);
begin
  inherited;
  ContratosControl.Pesquisar(edt_Pesquisa.Text, Dset_Contratos);
end;

procedure TCons_Contratos.btn_SelecionarClick(Sender: TObject);
begin
  inherited;
  if dset_Contratos.RecordCount > 0 then
  begin
    Contrato.ID := dset_Contratosid.AsInteger;
    if ContratosControl.Recuperar(Contrato) then
      self.Close;
  end;
end;

procedure TCons_Contratos.FormCreate(Sender: TObject);
begin
  inherited;
  ContratosControl := TContratosController.create;
  Contrato := TContratos.Create;

  if ( not Dset_Contratos.IsEmpty ) then
    Dset_Contratos.EmptyDataSet;
  Dset_Contratos.Active := False;
  Dset_Contratos.CreateDataSet;
  Dset_Contratos.Open;
end;

procedure TCons_Contratos.FormDestroy(Sender: TObject);
begin
  inherited;
  Contrato.Free;
  ContratosControl.Free;
end;

procedure TCons_Contratos.FormShow(Sender: TObject);
begin
  inherited;
  ContratosControl.Pesquisar(edt_Pesquisa.Text, Dset_Contratos);
end;

end.
