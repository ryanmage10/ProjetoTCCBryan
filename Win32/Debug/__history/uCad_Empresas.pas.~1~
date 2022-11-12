unit uCad_Empresas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCad_Pessoa, Vcl.ComCtrls, Vcl.Mask,
  Vcl.StdCtrls, Vcl.ExtCtrls, uCidades, uEmpresas, uEmpresasController, uCons_Cidades, uPessoas;

type
  TCad_Empresa = class(TCad_Pessoa)
    procedure btn_PesquisarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
  private
    { Private declarations }
    procedure popularInterface;
    procedure PopularObjeto;
    function ValidarDados: boolean;
  public
    { Public declarations }
    Empresa : TEmpresas;
    EmpresaControl : TEmpresasController;
  end;

var
  Cad_Empresa: TCad_Empresa;

implementation

{$R *.dfm}

procedure TCad_Empresa.btn_PesquisarClick(Sender: TObject);
var ConsCidadeForm: TCons_Cidades;
begin
   ConsCidadeForm := TCons_Cidades.Create(nil);
   try
      ConsCidadeForm.Selecao := True;
      ConsCidadeForm.ShowModal;
      Empresa.Cidade := (ConsCidadeForm.Cidade.clone);
      edt_Cidade.text := Empresa.Cidade.Nome;
      edt_uf.text := Empresa.Cidade.Estado.uf;
   finally
      FreeAndNil(ConsCidadeForm);
   end;
end;

procedure TCad_Empresa.btn_SalvarClick(Sender: TObject);
begin
  inherited;
  if ValidarDados then
  begin
    popularObjeto;

    if not EmpresaControl.VerificarCpfCnpj(Empresa) then
     begin
        if Inclusao then
           EmpresaControl.Inserir(Empresa)
        else
          EmpresaControl.Alterar(Empresa);

        self.Close;
     end
     else
      raise Exception.Create('Já Existe uma Empresa cadastrado com esse CNPJ');
  end;
end;

procedure TCad_Empresa.FormCreate(Sender: TObject);
begin
  inherited;
  Empresa := TEmpresas.Create;
  EmpresaControl := TEmpresasController.Create;
end;

procedure TCad_Empresa.FormDestroy(Sender: TObject);
begin
  inherited;
  Empresa.Free;
  EmpresaControl.Free;
end;

procedure TCad_Empresa.FormShow(Sender: TObject);
begin
  inherited;

  if not inclusao then
    popularInterface;
end;

procedure TCad_Empresa.popularInterface;
begin
  edt_id.text := inttostr(Empresa.ID);
  edt_Nome.text := Empresa.Nome;
  edt_Razao_Social.text := Empresa.RazaoSocial;
  edt_CPFCNPJ.Text := Empresa.CPFCNPJ;
  edt_RGIE.Text  := Empresa.RGIE;
  edt_Logradouro.Text := Empresa.endereco;
  edt_numero.Text := Empresa.numero;
  edt_CEP.Text := Empresa.Cep;
  edt_Bairro.Text := Empresa.bairro;
  edt_Complemento.Text := Empresa.Complemento;
  edt_Cidade.Text := Empresa.Cidade.Nome;
  edt_UF.Text := Empresa.Cidade.Estado.UF;
  edt_Tel_Fixo.Text := Empresa.TelFixo;
  edt_Tel_Cel.Text := Empresa.TelCel;
  edt_dataNasc.Date := Empresa.DtNasc;

  lbl_Cad.Visible := True;
  lbl_DataCad.Visible := True;
  lbl_DataCad.Caption := Empresa.User_Insert + '-' + DatetoStr(Empresa.DataCad);

  lbl_DataAlt.Caption := Empresa.User_Update + '-' + DatetoStr(Empresa.DataUltAlt);
  Lbl_Alt.Visible := True;
  lbl_DataAlt.Visible := True;
end;

procedure TCad_Empresa.PopularObjeto;
begin
  Empresa.ID := StrtoInt(edt_id.text);
  Empresa.Nome := edt_Nome.text;
  Empresa.RazaoSocial := edt_Razao_Social.text;
  Empresa.CPFCNPJ := edt_CPFCNPJ.Text;
  Empresa.RGIE := edt_RGIE.Text;
  Empresa.endereco := edt_Logradouro.Text;
  Empresa.numero := edt_numero.Text;
  Empresa.Cep := edt_CEP.Text;
  Empresa.bairro := edt_Bairro.Text;
  Empresa.Complemento := edt_Complemento.Text;
  Empresa.TelFixo := edt_Tel_Fixo.Text;
  Empresa.TelCel := edt_Tel_Cel.Text;
  Empresa.Tipo := TpJuridica;
  Empresa.Sexo := TpIndefinido;
  Empresa.DtNasc := edt_dataNasc.Date;
end;

function TCad_Empresa.ValidarDados: boolean;
begin
  result := false;
  if not (length(edt_Nome.Text) > 0) then
  begin
    ShowMessage('Insira o nome da Empresa');
    edt_Nome.setFocus;
    exit;
  end;

  if not (length(edt_Razao_Social.Text) > 0) then
  begin
    ShowMessage('Insira a Razao social da Empresa');
    edt_Razao_Social.setFocus;
    exit;
  end;

  if edt_CPFCNPJ.Text = '  .   .   /    -  ' then
  begin
    ShowMessage('Insira o CNPJ da empresa');
    edt_CPFCNPJ.setFocus;
    exit;
  end;

  if not (length(edt_RGIE.Text) > 0) then
  begin
    ShowMessage('Insira a Incrição Estadual da empresa');
    edt_RGIE.setFocus;
    exit;
  end;

  if not (length(edt_Logradouro.Text) > 0) then
  begin
    ShowMessage('Insira o Logradouro da empresa');
    edt_Logradouro.setFocus;
    exit;
  end;

  if not (length(edt_numero.Text) > 0) then
  begin
    ShowMessage('Insira o Numero da empresa');
    edt_numero.setFocus;
    exit;
  end;

  if not (length(edt_CEP.Text) > 0) then
  begin
    ShowMessage('Insira o CEP da empresa');
    edt_CEP.setFocus;
    exit;
  end;

  if not (length(edt_Bairro.Text) > 0) then
  begin
    ShowMessage('Insira o Bairro da empresa');
     edt_Bairro.setFocus;
    exit;
  end;

  if not (length(edt_Tel_Fixo.Text) > 0) then
  begin
    ShowMessage('Insira o Telefone Fixo da empresa');
    edt_Tel_Fixo.setFocus;
    exit;
  end;

  if not (length(edt_Tel_Cel.Text) > 0) then
  begin
    ShowMessage('Insira o Telefone Celular da empresa');
    edt_Tel_Cel.setFocus;
    exit;
  end;

  if not (length(edt_Cidade.Text) > 0) then
  begin
    ShowMessage('Insira a Cidade da empresa');
    btn_Pesquisar.setFocus;
    exit;
  end;

  result := true;
end;

end.
