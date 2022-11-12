unit uCad_Caixas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCad_Base, Vcl.StdCtrls, Vcl.ExtCtrls,
  uCaixas, uCaixasController, uCons_Empresas;

type
  TCad_Caixas = class(TCad_Base)
    lbl_Caixa: TLabel;
    lbl_moeda: TLabel;
    lbl_empresa: TLabel;
    edt_Caixa: TEdit;
    edt_Empresa: TEdit;
    edt_Moeda: TEdit;
    btn_Pesquisar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btn_PesquisarClick(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
  private
    { Private declarations }
    procedure popularInterface;
    procedure PopularObjeto;
    function ValidarDados: boolean;
  public
    { Public declarations }
    Caixa : TCaixas;
    CaixaControl : TCaixasController;
  end;

var
  Cad_Caixas: TCad_Caixas;

implementation

{$R *.dfm}

{ TCad_Caixas }

procedure TCad_Caixas.btn_PesquisarClick(Sender: TObject);
var ConsEmpresaForm: TCons_Empresas;
begin
   ConsEmpresaForm := TCons_Empresas.Create(nil);
   try
      ConsEmpresaForm.Selecao := True;
      ConsEmpresaForm.ShowModal;
      Caixa.Empresa := (ConsEmpresaForm.Empresa.clone);
      edt_Empresa.text := Caixa.Empresa.Nome;
   finally
      FreeAndNil(ConsEmpresaForm);
   end;
end;

procedure TCad_Caixas.btn_SalvarClick(Sender: TObject);
begin
  inherited;
  if ValidarDados then
  begin
    popularObjeto;

    if not CaixaControl.VerificarNome(Caixa) then
     begin
        if Inclusao then
           CaixaControl.Inserir(Caixa)
        else
          CaixaControl.Alterar(Caixa);

        self.Close;
     end
     else
      raise Exception.Create('Já Existe um Caixa cadastrado com esse Nome');
  end;
end;

procedure TCad_Caixas.FormCreate(Sender: TObject);
begin
  inherited;
  Caixa := TCaixas.Create;
  CaixaControl := TCaixasController.Create;
end;

procedure TCad_Caixas.FormDestroy(Sender: TObject);
begin
  inherited;
  Caixa.Free;
  CaixaControl.Free;
end;

procedure TCad_Caixas.FormShow(Sender: TObject);
begin
  inherited;
  if not inclusao then
    popularInterface;
end;

procedure TCad_Caixas.popularInterface;
begin
  edt_id.text := inttostr(Caixa.ID);
  edt_Caixa.text := Caixa.Nome;
  edt_moeda.text := Caixa.Moeda;
  edt_Empresa.text := Caixa.Empresa.Nome;

  lbl_Cad.Visible := True;
  lbl_DataCad.Visible := True;
  lbl_DataCad.Caption := Caixa.User_Insert + '-' + DatetoStr(Caixa.DataCad);

  lbl_DataAlt.Caption := Caixa.User_Update + '-' + DatetoStr(Caixa.DataUltAlt);
  Lbl_Alt.Visible := True;
  lbl_DataAlt.Visible := True;
end;

procedure TCad_Caixas.PopularObjeto;
begin
  Caixa.ID := strtoint(edt_id.text);
  Caixa.Nome := edt_Caixa.text;
  Caixa.Moeda := edt_Moeda.text;
end;

function TCad_Caixas.ValidarDados: boolean;
begin
  result := false;
  if not (length(edt_Caixa.Text) > 0) then
  begin
    ShowMessage('Insira o nome do Caixa');
    edt_Caixa.setFocus;
    exit;
  end;

  if not (length(edt_Moeda.Text) > 0) then
  begin
    ShowMessage('Insira a sigla da Moeda do Caixa');
    edt_Moeda.setFocus;
    exit;
  end;

  if not (length(edt_Empresa.Text) > 0) then
  begin
    ShowMessage('Insira a Empresa do Caixa');
    btn_Pesquisar.setFocus;
    exit;
  end;

  result := true;
end;

end.
