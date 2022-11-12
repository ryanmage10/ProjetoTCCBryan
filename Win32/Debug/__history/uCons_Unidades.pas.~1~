unit uCons_Unidades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCons_Base, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Datasnap.DBClient,
  uUnidades, uUnidadesController, uCad_Unidades;

type
  TCons_Unidades = class(TCons_Base)
    ds_Unidade: TDataSource;
    dset_Unidade: TClientDataSet;
    dset_UnidadeID: TIntegerField;
    dset_UnidadeDESCRICAO: TStringField;
    dset_UnidadeSIGLA: TStringField;
    dset_UnidadeDATA_INSERT: TDateField;
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
    UnidadeControl : TUnidadesController;
  public
    { Public declarations }
    Unidade: TUnidades;
  end;

var
  Cons_Unidades: TCons_Unidades;

implementation

{$R *.dfm}

procedure TCons_Unidades.btn_AlterarClick(Sender: TObject);
var CadUnidadeForm: TCad_Unidades;
begin
   if (dset_Unidade.Active) and (dset_Unidade.RecordCount > 0) then
   begin
     CadUnidadeForm := TCad_Unidades.Create(nil);
     Unidade.LimparDados;
     Unidade.id := Dset_Unidade.FieldByName('id').asInteger;
     if UnidadeControl.Recuperar(Unidade) then
     begin
       try
          CadUnidadeForm.Unidade.CopiarDados(Unidade);
          CadUnidadeForm.Inclusao := False;
          CadUnidadeForm.ShowModal;
          UnidadeControl.Pesquisar(edt_Pesquisa.Text, Dset_Unidade);
       finally
          //
       end;
     end;
   end
   else
     raise Exception.Create('Erro ao Alterar: Lista Vazia');
end;

procedure TCons_Unidades.btn_ExcluirClick(Sender: TObject);
begin
  inherited;
  if (dset_Unidade.Active) and (dset_Unidade.RecordCount > 0) then
  begin
      Unidade.ID := dset_UnidadeID.AsInteger;
      if not UnidadeControl.VerificarExclusao(Unidade) then
      begin
        if MessageDlg('Deseja Realmente excluir a Unidade : '+ dset_UnidadeDescricao.AsString +' ?', mtConfirmation, [mbYes, mbNo], 0) = idYES then
        begin
            UnidadeControl.Excluir(Unidade);
            UnidadeControl.Pesquisar(edt_Pesquisa.Text, Dset_Unidade);
        end;
      end
      else
        raise Exception.Create('Erro ao excluir: Há registros vinculados à essa Unidade');
  end
  else
  begin
    raise Exception.Create('Erro ao excluir: Nenhum registro Selecionado');
  end;
end;

procedure TCons_Unidades.btn_NovoClick(Sender: TObject);
var CadUnidadeForm: TCad_Unidades;
begin
   CadUnidadeForm := TCad_Unidades.Create(nil);
   try
      CadUnidadeForm.Inclusao := True;
      CadUnidadeForm.ShowModal;
      edt_Pesquisa.Clear;
      UnidadeControl.Pesquisar(edt_Pesquisa.Text, Dset_Unidade);
   finally
      //
   end;
end;

procedure TCons_Unidades.btn_PesquisarClick(Sender: TObject);
begin
  inherited;
  UnidadeControl.Pesquisar(edt_Pesquisa.Text, Dset_Unidade);
end;

procedure TCons_Unidades.btn_SelecionarClick(Sender: TObject);
begin
  inherited;
  if dset_Unidade.RecordCount > 0 then
  begin
    Unidade.ID := dset_Unidadeid.AsInteger;
    if UnidadeControl.Recuperar(Unidade) then
      self.Close;
  end;
end;

procedure TCons_Unidades.FormCreate(Sender: TObject);
begin
  inherited;
  UnidadeControl := TUnidadesController.Create;
  Unidade := TUnidades.Create;

  if ( not Dset_Unidade.IsEmpty ) then
    Dset_Unidade.EmptyDataSet;
  Dset_Unidade.Active := False;
  Dset_Unidade.CreateDataSet;
  Dset_Unidade.Open;
end;

procedure TCons_Unidades.FormDestroy(Sender: TObject);
begin
  inherited;
  Unidade.Free;
  UnidadeControl.Free;
end;

procedure TCons_Unidades.FormShow(Sender: TObject);
begin
  inherited;
  UnidadeControl.Pesquisar(edt_Pesquisa.Text, Dset_Unidade);
end;

end.
