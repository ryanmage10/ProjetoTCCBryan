unit uCons_Caixas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCons_Base, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Datasnap.DBClient, uCaixas, uCaixasController,
  uCad_Caixas;

type
  TCons_Caixas = class(TCons_Base)
    dset_Caixas: TClientDataSet;
    ds_Caixas: TDataSource;
    dset_CaixasID: TIntegerField;
    dset_CaixasCAIXA: TStringField;
    dset_CaixasMOEDA: TStringField;
    dset_CaixasDATA_INSERT: TDateField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btn_SelecionarClick(Sender: TObject);
    procedure btn_NovoClick(Sender: TObject);
    procedure btn_AlterarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure btn_PesquisarClick(Sender: TObject);
  private
    { Private declarations }
    CaixaControl : TCaixasController;
  public
    { Public declarations }
    Caixa : TCaixas;
  end;

var
  Cons_Caixas: TCons_Caixas;

implementation

{$R *.dfm}

procedure TCons_Caixas.btn_AlterarClick(Sender: TObject);
var CadCaixaForm: TCad_Caixas;
begin
  if (dset_Caixas.Active) and (dset_Caixas.RecordCount > 0) then
  begin
     CadCaixaForm := TCad_Caixas.Create(nil);
     Caixa.LimparDados;
     Caixa.id := Dset_Caixas.FieldByName('id').asInteger;
     if CaixaControl.Recuperar(Caixa) then
     begin
       try
          CadCaixaForm.Caixa.CopiarDados(Caixa);
          CadCaixaForm.Inclusao := False;
          CadCaixaForm.ShowModal;
          CaixaControl.Pesquisar(edt_Pesquisa.Text, Dset_Caixas);
       finally
          //FreeAndNil(CadEstadoForm);
       end;
     end;
  end
  else
    raise Exception.Create('Erro ao Alterar: Nenhum registro Selecionado');
end;

procedure TCons_Caixas.btn_ExcluirClick(Sender: TObject);
begin
  inherited;
  if (dset_Caixas.Active) and (dset_Caixas.RecordCount > 0) then
  begin
      Caixa.ID := dset_CaixasID.AsInteger;
      if not CaixaControl.VerificarExclusao(Caixa) then
      begin
        if MessageDlg('Deseja Realmente excluir o Caixa: '+ dset_CaixasCaixa.AsString +' ?', mtConfirmation, [mbYes, mbNo], 0) = idYES then
        begin
          CaixaControl.Excluir(Caixa);
          CaixaControl.Pesquisar(edt_Pesquisa.Text, Dset_Caixas);
        end;
      end
      Else
        raise Exception.Create('Erro ao excluir: Há registros vinculados à esse Caixa');
  end
  else
  begin
    raise Exception.Create('Erro ao excluir: Nenhum registro Selecionado');
  end;
end;

procedure TCons_Caixas.btn_NovoClick(Sender: TObject);
var CadCaixaForm: TCad_Caixas;
begin
   CadCaixaForm := TCad_Caixas.Create(nil);
   try
      CadCaixaForm.Inclusao := True;
      CadCaixaForm.ShowModal;
      edt_Pesquisa.Clear;
      CaixaControl.Pesquisar(edt_Pesquisa.Text, Dset_Caixas);
   finally
      //FreeAndNil(CadEstadoForm);
   end;
end;

procedure TCons_Caixas.btn_PesquisarClick(Sender: TObject);
begin
  inherited;
  CaixaControl.Pesquisar(edt_Pesquisa.Text, Dset_Caixas);
end;

procedure TCons_Caixas.btn_SelecionarClick(Sender: TObject);
begin
  inherited;
  if dset_Caixas.RecordCount > 0 then
  begin
    Caixa.ID := dset_Caixasid.AsInteger;
    if CaixaControl.Recuperar(Caixa) then
      self.Close;
  end;
end;

procedure TCons_Caixas.FormCreate(Sender: TObject);
begin
  inherited;
  CaixaControl := TCaixasController.Create;
  Caixa := TCaixas.Create;

  if ( not Dset_Caixas.IsEmpty ) then
    Dset_Caixas.EmptyDataSet;
  Dset_Caixas.Active := False;
  Dset_Caixas.CreateDataSet;
  Dset_Caixas.Open;
end;

procedure TCons_Caixas.FormDestroy(Sender: TObject);
begin
  inherited;
  Caixa.Free;
  CaixaControl.Free;
end;

procedure TCons_Caixas.FormShow(Sender: TObject);
begin
  inherited;
  CaixaControl.Pesquisar(edt_Pesquisa.Text, Dset_Caixas);
end;

end.
