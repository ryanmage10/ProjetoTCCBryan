unit uCad_Fornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCad_Pessoa, Vcl.ComCtrls, Vcl.Mask,
  Vcl.StdCtrls, Vcl.ExtCtrls, uFornecedores, uFornecedoresController, uCons_Cidades, uPessoas, uCidades;

type
  TCad_Fornecedores = class(TCad_Pessoa)
    procedure btn_PesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Rg_TipoPessoaClick(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
  private
    { Private declarations }
    procedure popularInterface;
    procedure PopularObjeto;
    function ValidarDados: boolean;
    procedure AlterarCampos;
  public
    { Public declarations }
    Fornecedor : TFornecedores;
    FornecedorControl : TFornecedoresController;
  end;

var
  Cad_Fornecedores: TCad_Fornecedores;

implementation

{$R *.dfm}

procedure TCad_Fornecedores.AlterarCampos;
begin
  if rg_tipoPessoa.ItemIndex = 0 then
  begin
    rg_Sexo.Visible := True;
    Lbl_RazaoSocial.Visible := False;
    edt_Razao_Social.Visible := False;
    lbl_CPFCNPJ.Caption := 'CPF';
    edt_CPFCNPJ.EditMask := '000\.000\.000-00;1;_';
    edt_CPFCNPJ.Text := '';
    lbl_RGIE.Caption := 'RG';
    edt_RGIE.EditMask := '00\.000\.000-0;1;_';
    edt_RGIE.Text := '';
    lbl_dataNasc.Caption := 'Data Nascimento';
    lbl_dataNasc.Font.Color := clRed;
  end
  else
  begin
    Lbl_RazaoSocial.Visible := True;
    edt_Razao_Social.Visible := True;
    rg_Sexo.Visible := False;
    lbl_CPFCNPJ.Caption := 'CNPJ';
    edt_CPFCNPJ.EditMask := '00\.000\.000/0000-00;1;_';
    edt_CPFCNPJ.Text := '';
    lbl_RGIE.Caption := 'IE';
    edt_RGIE.EditMask := '';
    edt_RGIE.Text := '';
    lbl_dataNasc.Caption := 'Data DE Fundação';
    lbl_dataNasc.Font.Color := clBlack;
  end;
end;

procedure TCad_Fornecedores.btn_PesquisarClick(Sender: TObject);
var ConsCidadeForm: TCons_Cidades;
begin
   ConsCidadeForm := TCons_Cidades.Create(nil);
   try
      ConsCidadeForm.Selecao := True;
      ConsCidadeForm.ShowModal;
      Fornecedor.Cidade := (ConsCidadeForm.Cidade.clone);
      edt_Cidade.text := Fornecedor.Cidade.Nome;
      edt_uf.text := Fornecedor.Cidade.Estado.uf;
   finally
      FreeAndNil(ConsCidadeForm);
   end;
end;

procedure TCad_Fornecedores.btn_SalvarClick(Sender: TObject);
begin
  inherited;
  if ValidarDados then
  begin
    popularObjeto;

    if not FornecedorControl.VerificarCpfCnpj(Fornecedor) then
     begin
        if Inclusao then
           FornecedorControl.Inserir(Fornecedor)
        else
          FornecedorControl.Alterar(Fornecedor);

        self.Close;
     end
     else
      raise Exception.Create('Já Existe um Fornecedor cadastrado com esse CPF/CNPJ');
  end;
end;

procedure TCad_Fornecedores.FormCreate(Sender: TObject);
begin
  inherited;
  Fornecedor := TFornecedores.Create;
  FornecedorControl := TFornecedoresController.Create;
end;

procedure TCad_Fornecedores.FormDestroy(Sender: TObject);
begin
  inherited;
  Fornecedor.Free;
  FornecedorControl.Free;
end;

procedure TCad_Fornecedores.FormShow(Sender: TObject);
begin
  inherited;
  if not inclusao then
    popularInterface;
end;

procedure TCad_Fornecedores.popularInterface;
begin
  rg_TipoPessoa.ItemIndex := Integer(Fornecedor.Tipo);
  AlterarCampos;
  edt_id.text := inttostr(Fornecedor.ID);
  edt_Nome.text := Fornecedor.Nome;
  edt_Razao_Social.text := Fornecedor.RazaoSocial;
  edt_CPFCNPJ.Text := Fornecedor.CPFCNPJ;
  edt_RGIE.Text  := Fornecedor.RGIE;
  edt_Logradouro.Text := Fornecedor.endereco;
  edt_numero.Text := Fornecedor.numero;
  edt_CEP.Text := Fornecedor.Cep;
  edt_Bairro.Text := Fornecedor.bairro;
  edt_Complemento.Text := Fornecedor.Complemento;
  edt_Cidade.Text := Fornecedor.Cidade.Nome;
  edt_UF.Text := Fornecedor.Cidade.Estado.UF;
  edt_Tel_Fixo.Text := Fornecedor.TelFixo;
  edt_Tel_Cel.Text := Fornecedor.TelCel;
  edt_DataNasc.Date := Fornecedor.DtNasc;
  rg_Sexo.ItemIndex := Integer(Fornecedor.Sexo);

  lbl_Cad.Visible := True;
  lbl_DataCad.Visible := True;
  lbl_DataCad.Caption := Fornecedor.User_Insert + '-' + DatetoStr(Fornecedor.DataCad);

  lbl_DataAlt.Caption := Fornecedor.User_Update + '-' + DatetoStr(Fornecedor.DataUltAlt);
  Lbl_Alt.Visible := True;
  lbl_DataAlt.Visible := True;
end;

procedure TCad_Fornecedores.PopularObjeto;
begin
  Fornecedor.ID := StrtoInt(edt_id.text);
  Fornecedor.Nome := edt_Nome.text;
  Fornecedor.RazaoSocial := edt_Razao_Social.text;
  Fornecedor.CPFCNPJ := edt_CPFCNPJ.Text;
  Fornecedor.RGIE := edt_RGIE.Text;
  Fornecedor.endereco := edt_Logradouro.Text;
  Fornecedor.numero := edt_numero.Text;
  Fornecedor.Cep := edt_CEP.Text;
  Fornecedor.bairro := edt_Bairro.Text;
  Fornecedor.Complemento := edt_Complemento.Text;
  Fornecedor.TelFixo := edt_Tel_Fixo.Text;
  Fornecedor.TelCel := edt_Tel_Cel.Text;
  Fornecedor.Tipo := TtipoPessoa(rg_TipoPessoa.ItemIndex);
  Fornecedor.Sexo := TSexo(rg_Sexo.ItemIndex);
  Fornecedor.DtNasc := edt_DataNasc.Date;
end;

procedure TCad_Fornecedores.Rg_TipoPessoaClick(Sender: TObject);
begin
  inherited;
  AlterarCampos;
end;

function TCad_Fornecedores.ValidarDados: boolean;
begin
  result := false;
  if not (length(edt_Nome.Text) > 0) then
  begin
    ShowMessage('Insira o nome do cliente');
    edt_Nome.setFocus;
    exit;
  end;

  if not (length(edt_Logradouro.Text) > 0) then
  begin
    ShowMessage('Insira o Logradouro do cliente');
    edt_Logradouro.setFocus;
    exit;
  end;

  if not (length(edt_numero.Text) > 0) then
  begin
    ShowMessage('Insira o Numero do cliente');
    edt_numero.setFocus;
    exit;
  end;

  if not (length(edt_CEP.Text) > 0) then
  begin
    ShowMessage('Insira o CEP do cliente');
    edt_CEP.setFocus;
    exit;
  end;

  if not (length(edt_Bairro.Text) > 0) then
  begin
    ShowMessage('Insira o Bairro do cliente');
     edt_Bairro.setFocus;
    exit;
  end;

  if not (length(edt_Tel_Fixo.Text) > 0) then
  begin
    ShowMessage('Insira o Telefone Fixo do cliente');
    edt_Tel_Fixo.setFocus;
    exit;
  end;

  if not (length(edt_Tel_Cel.Text) > 0) then
  begin
    ShowMessage('Insira o Telefone Celular do cliente');
    edt_Tel_Cel.setFocus;
    exit;
  end;

  if not (length(edt_Cidade.Text) > 0) then
  begin
    ShowMessage('Insira a Cidade do cliente');
    btn_Pesquisar.setFocus;
    exit;
  end;

  if rg_TipoPessoa.ItemIndex = 1 then
  begin
    if not (length(edt_Razao_Social.Text) > 0) then
    begin
      ShowMessage('Insira a Razao social do cliente');
      edt_Razao_Social.setFocus;
      exit;
    end;

    if edt_CPFCNPJ.Text = '  .   .   /    -  ' then
    begin
      ShowMessage('Insira o CNPJ do cliente');
      edt_CPFCNPJ.setFocus;
      exit;
    end;

    if not (length(edt_RGIE.Text) > 0) then
    begin
      ShowMessage('Insira a Incrição Estadual do cliente');
      edt_RGIE.setFocus;
      exit;
    end;
  end
  else
  begin
    if (edt_CPFCNPJ.Text = '   .   .   -  ')then
    begin
      ShowMessage('Insira o CPF do cliente');
      edt_CPFCNPJ.setFocus;
      exit;
    end;

    if (edt_RGIE.Text = '  .   .   - ') then
    begin
      ShowMessage('Insira o RG do cliente');
      edt_RGIE.setFocus;
      exit;
    end;

    if not rg_sexo.ItemIndex >= 0 then
    begin
      ShowMessage('Insira o Sexo do cliente');
      rg_sexo.setFocus;
      exit;
    end;

    if (edt_dataNasc.Date > StrToDate('01/01/2004')) or (edt_dataNasc.Date < StrToDate('01/01/1922')) then
    begin
      ShowMessage('Insira Corretamente a data de Nascimento do cliente');
      edt_dataNasc.setFocus;
      exit;
    end;
  end;

  result := true;
end;

end.
