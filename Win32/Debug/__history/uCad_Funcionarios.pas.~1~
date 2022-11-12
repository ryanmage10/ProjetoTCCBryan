unit uCad_Funcionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCad_Pessoa, Vcl.ComCtrls, Vcl.Mask,
  Vcl.StdCtrls, Vcl.ExtCtrls, uFuncionarios, uFuncionariosController, uEmpresas, uCons_Empresas,
  uCidades, uCons_Cidades, uPessoas;

type
  TCad_Funcionarios = class(TCad_Pessoa)
    edt_Empresa: TEdit;
    lbl_empresa: TLabel;
    btn_pesquisarEmpresa: TButton;
    lbl_Salario: TLabel;
    edt_salario: TMaskEdit;
    procedure btn_PesquisarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_pesquisarEmpresaClick(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure popularInterface;
    procedure PopularObjeto;
    function ValidarDados: boolean;
  public
    { Public declarations }
    Funcionario : TFuncionarios;
    FuncionarioControl : TFuncionariosController;
  end;

var
  Cad_Funcionarios: TCad_Funcionarios;

implementation

{$R *.dfm}

procedure TCad_Funcionarios.btn_PesquisarClick(Sender: TObject);
var ConsCidadeForm: TCons_Cidades;
begin
   ConsCidadeForm := TCons_Cidades.Create(nil);
   try
      ConsCidadeForm.Selecao := True;
      ConsCidadeForm.ShowModal;
      Funcionario.Cidade := (ConsCidadeForm.Cidade.clone);
      edt_Cidade.text := Funcionario.Cidade.Nome;
      edt_uf.text := Funcionario.Cidade.Estado.uf;
   finally
      FreeAndNil(ConsCidadeForm);
   end;
end;

procedure TCad_Funcionarios.btn_pesquisarEmpresaClick(Sender: TObject);
var ConsEmpresaForm: TCons_Empresas;
begin
   ConsEmpresaForm := TCons_Empresas.Create(nil);
   try
      ConsEmpresaForm.Selecao := True;
      ConsEmpresaForm.ShowModal;
      Funcionario.Empresa := (ConsEmpresaForm.Empresa.clone);
      edt_Empresa.text := Funcionario.Empresa.Nome;
   finally
      FreeAndNil(ConsEmpresaForm);
   end;
end;

procedure TCad_Funcionarios.btn_SalvarClick(Sender: TObject);
begin
if ValidarDados then
  begin
    popularObjeto;

    if not FuncionarioControl.VerificarCpfCnpj(Funcionario) then
     begin
        if Inclusao then
           FuncionarioControl.Inserir(Funcionario)
        else
          FuncionarioControl.Alterar(Funcionario);

        self.Close;
     end
     else
      raise Exception.Create('Já Existe um Funcionario cadastrado com esse Cpf');
  end;
end;

procedure TCad_Funcionarios.FormCreate(Sender: TObject);
begin
  inherited;
  Funcionario := TFuncionarios.Create;
  FuncionarioControl := TFuncionariosController.Create;
end;

procedure TCad_Funcionarios.FormDestroy(Sender: TObject);
begin
  inherited;
  Funcionario.Free;
  FuncionarioControl.Free;
end;

procedure TCad_Funcionarios.FormShow(Sender: TObject);
begin
  inherited;
  if not inclusao then
    popularInterface;
end;

procedure TCad_Funcionarios.popularInterface;
begin
  edt_id.text := inttostr(Funcionario.ID);
  edt_Nome.text := Funcionario.Nome;
  edt_Razao_Social.text := Funcionario.RazaoSocial;
  edt_CPFCNPJ.Text := Funcionario.CPFCNPJ;
  edt_RGIE.Text  := Funcionario.RGIE;
  edt_Logradouro.Text := Funcionario.endereco;
  edt_numero.Text := Funcionario.numero;
  edt_CEP.Text := Funcionario.Cep;
  edt_Bairro.Text := Funcionario.bairro;
  edt_Complemento.Text := Funcionario.Complemento;
  edt_Cidade.Text := Funcionario.Cidade.Nome;
  edt_UF.Text := Funcionario.Cidade.Estado.UF;
  edt_Tel_Fixo.Text := Funcionario.TelFixo;
  edt_Tel_Cel.Text := Funcionario.TelCel;
  edt_Empresa.Text := Funcionario.Empresa.Nome;
  edt_Salario.Text := CurrToStr(Funcionario.Salario);
  rg_sexo.ItemIndex := Integer(Funcionario.Sexo);
  Edt_DataNasc.Date := Funcionario.DtNasc;

  lbl_Cad.Visible := True;
  lbl_DataCad.Visible := True;
  lbl_DataCad.Caption := Funcionario.User_Insert + '-' + DatetoStr(Funcionario.DataCad);

  lbl_DataAlt.Caption := Funcionario.User_Update + '-' + DatetoStr(Funcionario.DataUltAlt);
  Lbl_Alt.Visible := True;
  lbl_DataAlt.Visible := True;
end;

procedure TCad_Funcionarios.PopularObjeto;
begin
  Funcionario.ID := StrtoInt(edt_id.text);
  Funcionario.Nome := edt_Nome.text;
  Funcionario.CPFCNPJ := edt_CPFCNPJ.Text;
  Funcionario.RGIE := edt_RGIE.Text;
  Funcionario.endereco := edt_Logradouro.Text;
  Funcionario.numero := edt_numero.Text;
  Funcionario.Cep := edt_CEP.Text;
  Funcionario.bairro := edt_Bairro.Text;
  Funcionario.Complemento := edt_Complemento.Text;
  Funcionario.TelFixo := edt_Tel_Fixo.Text;
  Funcionario.TelCel := edt_Tel_Cel.Text;
  Funcionario.Tipo := TpFisica;
  Funcionario.Sexo := TSexo(Rg_Sexo.ItemIndex);
  Funcionario.Salario := StrtoCurr(edt_Salario.Text);
  Funcionario.DtNasc := Edt_DataNasc.Date;
end;

function TCad_Funcionarios.ValidarDados: boolean;
begin
  result := false;
  if not (length(edt_Nome.Text) > 0) then
  begin
    ShowMessage('Insira o nome do funcionário');
    edt_Nome.setFocus;
    exit;
  end;

  if not (rg_sexo.ItemIndex >= 0) then
  begin
    ShowMessage('Insira o Sexo do funcionário');
    btn_Pesquisar.setFocus;
    exit;
  end;

  if (edt_CPFCNPJ.Text = '   .   .   -  ') then
    begin
      ShowMessage('Insira o CPF do funcionário');
      edt_CPFCNPJ.setFocus;
      exit;
    end;

    if (edt_RGIE.Text = '  .   .   - ') then
    begin
      ShowMessage('Insira o RG do funcionário');
      edt_RGIE.setFocus;
      exit;
    end;

  if not (length(edt_Logradouro.Text) > 0) then
  begin
    ShowMessage('Insira o Logradouro do funcionário');
    edt_Logradouro.setFocus;
    exit;
  end;

  if not (length(edt_numero.Text) > 0) then
  begin
    ShowMessage('Insira o Numero do funcionário');
    edt_numero.setFocus;
    exit;
  end;

  if not (length(edt_CEP.Text) > 0) then
  begin
    ShowMessage('Insira o CEP do funcionário');
    edt_CEP.setFocus;
    exit;
  end;

  if not (length(edt_Bairro.Text) > 0) then
  begin
    ShowMessage('Insira o Bairro do funcionário');
     edt_Bairro.setFocus;
    exit;
  end;

  if not (length(edt_Tel_Fixo.Text) > 0) then
  begin
    ShowMessage('Insira o Telefone Fixo do funcionário');
    edt_Tel_Fixo.setFocus;
    exit;
  end;

  if not (length(edt_Tel_Cel.Text) > 0) then
  begin
    ShowMessage('Insira o Telefone Celular do funcionário');
    edt_Tel_Cel.setFocus;
    exit;
  end;

  if not (length(edt_Cidade.Text) > 0) then
  begin
    ShowMessage('Insira a Cidade do funcionário');
    btn_Pesquisar.setFocus;
    exit;
  end;

  if not (length(edt_Salario.Text) > 0) then
  begin
    ShowMessage('Insira o Salario do funcionário');
    btn_Pesquisar.setFocus;
    exit;
  end;

  if (edt_dataNasc.Date > StrToDate('01/01/2004')) or (edt_dataNasc.Date < StrToDate('01/01/1922')) then
    begin
      ShowMessage('Insira Corretamente a data de Nascimento do Funcionario');
      edt_dataNasc.setFocus;
      exit;
    end;

  result := true;
end;

end.
