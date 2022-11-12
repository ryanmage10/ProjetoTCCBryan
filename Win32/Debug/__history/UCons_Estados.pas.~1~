unit UCons_Estados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCons_Base, Data.DB, Datasnap.DBClient,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, uCad_Estados, uEstadosController, uEstados;

type
  TCons_Estados = class(TCons_Base)
    ds_Estados: TDataSource;
    Dset_Estados: TClientDataSet;
    Dset_EstadosID: TIntegerField;
    Dset_EstadosESTADO: TStringField;
    Dset_EstadosSIGLA: TStringField;
    Dset_EstadosDATA_INSERT: TDateField;
    Dset_EstadosPAIS: TStringField;
    procedure btn_AlterarClick(Sender: TObject);
    procedure btn_NovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btn_PesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure btn_SelecionarClick(Sender: TObject);
  private
    { Private declarations }
    EstadoControl : TEstadosController;

  public
    { Public declarations }
    Estado : TEstados;
  end;

var
  Cons_Estados: TCons_Estados;

implementation

{$R *.dfm}

procedure TCons_Estados.btn_AlterarClick(Sender: TObject);
var CadEstadoForm: TCad_Estados;
begin
  if (dset_Estados.Active) and (dset_Estados.RecordCount > 0) then
  begin
     CadEstadoForm := TCad_Estados.Create(nil);
     Estado.LimparDados;
     Estado.id := Dset_Estados.FieldByName('id').asInteger;
     if EstadoControl.Recuperar(Estado) then
     begin
       try
          CadEstadoForm.Estado.CopiarDados(Estado);
          CadEstadoForm.Inclusao := False;
          CadEstadoForm.ShowModal;
          EstadoControl.Pesquisar(edt_Pesquisa.Text, Dset_Estados);
       finally
          //FreeAndNil(CadEstadoForm);
       end;
     end;
  end
  else
    raise Exception.Create('Erro ao Alterar: Nenhum registro Selecionado');
end;

procedure TCons_Estados.btn_ExcluirClick(Sender: TObject);
begin
  inherited;
  if (dset_Estados.Active) and (dset_Estados.RecordCount > 0) then
  begin
      Estado.ID := dset_EstadosID.AsInteger;
      if not EstadoControl.VerificarExclusao(Estado) then
      begin
        if MessageDlg('Deseja Realmente excluir o Estado: '+ dset_EstadosEstado.AsString +' ?', mtConfirmation, [mbYes, mbNo], 0) = idYES then
        begin
          EstadoControl.Excluir(Estado);
          EstadoControl.Pesquisar(edt_Pesquisa.Text, Dset_Estados);
        end;
      end
      Else
        raise Exception.Create('Erro ao excluir: Há registros vinculados à esse estado');
  end
  else
  begin
    raise Exception.Create('Erro ao excluir: Nenhum registro Selecionado');
  end;
end;

procedure TCons_Estados.btn_NovoClick(Sender: TObject);
var CadEstadoForm: TCad_Estados;
begin
   CadEstadoForm := TCad_Estados.Create(nil);
   try
      CadEstadoForm.Inclusao := True;
      CadEstadoForm.ShowModal;
      edt_Pesquisa.Clear;
      EstadoControl.Pesquisar(edt_Pesquisa.Text, Dset_Estados);
   finally
      //FreeAndNil(CadEstadoForm);
   end;
end;

procedure TCons_Estados.btn_PesquisarClick(Sender: TObject);
begin
  inherited;
  EstadoControl.Pesquisar(edt_Pesquisa.Text, Dset_Estados);
end;

procedure TCons_Estados.btn_SelecionarClick(Sender: TObject);
begin
  inherited;
  if dset_estados.RecordCount > 0 then
  begin
    estado.ID := dset_estadosid.AsInteger;
    if estadoControl.Recuperar(estado) then
      self.Close;
  end;
end;

procedure TCons_Estados.FormCreate(Sender: TObject);
begin
  inherited;
  EstadoControl := TEstadosController.Create;
  Estado := TEstados.Create;

  if ( not Dset_Estados.IsEmpty ) then
    Dset_Estados.EmptyDataSet;
  Dset_Estados.Active := False;
  Dset_Estados.CreateDataSet;
  Dset_Estados.Open;
end;

procedure TCons_Estados.FormDestroy(Sender: TObject);
begin
  inherited;
  //Estado.Free;
  EstadoControl.Free;
end;

procedure TCons_Estados.FormShow(Sender: TObject);
begin
  inherited;
  EstadoControl.Pesquisar(edt_Pesquisa.Text, Dset_Estados);
end;

end.
