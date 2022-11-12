unit uCad_Clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCad_Pessoa, Vcl.ComCtrls, Vcl.Mask,
  Vcl.StdCtrls, Vcl.ExtCtrls, uClientes, uClientesController, uCons_Cidades, uPessoas, uCidades;

type
  TCad_Clientes = class(TCad_Pessoa)
    procedure btn_PesquisarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
    procedure Rg_TipoPessoaClick(Sender: TObject);
  private
    { Private declarations }
    procedure popularInterface;
    procedure PopularObjeto;
    function ValidarDados: boolean;
    procedure AlterarCampos;
  public
    { Public declarations }
    Cliente : TClientes;
    ClienteControl : TClientesController;
  end;

var
  Cad_Clientes: TCad_Clientes;

implementation

{$R *.dfm}

procedure TCad_Clientes.AlterarCampos;
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

procedure TCad_Clientes.btn_PesquisarClick(Sender: TObject);
var ConsCidadeForm: TCons_Cidades;
begin
   ConsCidadeForm := TCons_Cidades.Create(nil);
   try
      ConsCidadeForm.Selecao := True;
      ConsCidadeForm.ShowModal;
      Cliente.Cidade := (ConsCidadeForm.Cidade.clone);
      edt_Cidade.text := Cliente.Cidade.Nome;
      edt_uf.text := Cliente.Cidade.Estado.uf;
   finally
      FreeAndNil(ConsCidadeForm);
   end;
end;

procedure TCad_Clientes.btn_SalvarClick(Sender: TObject);
begin
  inherited;
  if ValidarDados then
  begin
    popularObjeto;

    if not ClienteControl.VerificarCpfCnpj(Cliente) then
     begin
        if Inclusao then
           ClienteControl.Inserir(Cliente)
        else
          ClienteControl.Alterar(Cliente);

        self.Close;
     end
     else
      raise Exception.Create('Já Existe um Cliente cadastrado com esse CPF/CNPJ');
  end;
end;

procedure TCad_Clientes.FormCreate(Sender: TObject);
begin
  inherited;
  Cliente := TClientes.Create;
  ClienteControl := TClientesController.Create;
end;

procedure TCad_Clientes.FormDestroy(Sender: TObject);
begin
  inherited;
  Cliente.Free;
  ClienteControl.Free;
end;

procedure TCad_Clientes.FormShow(Sender: TObject);
begin
  inherited;
  if not inclusao then
    popularInterface;
end;

procedure TCad_Clientes.popularInterface;
begin
  rg_TipoPessoa.ItemIndex := Integer(Cliente.Tipo);
  AlterarCampos;
  edt_id.text := inttostr(Cliente.ID);
  edt_Nome.text := Cliente.Nome;
  edt_Razao_Social.text := Cliente.RazaoSocial;
  edt_CPFCNPJ.Text := Cliente.CPFCNPJ;
  edt_RGIE.Text  := Cliente.RGIE;
  edt_Logradouro.Text := Cliente.endereco;
  edt_numero.Text := Cliente.numero;
  edt_CEP.Text := Cliente.Cep;
  edt_Bairro.Text := Cliente.bairro;
  edt_Complemento.Text := Cliente.Complemento;
  edt_Cidade.Text := Cliente.Cidade.Nome;
  edt_UF.Text := Cliente.Cidade.Estado.UF;
  edt_Tel_Fixo.Text := Cliente.TelFixo;
  edt_Tel_Cel.Text := Cliente.TelCel;
  edt_DataNasc.Date := Cliente.DtNasc;
  rg_Sexo.ItemIndex := Integer(Cliente.Sexo);

  lbl_Cad.Visible := True;
  lbl_DataCad.Visible := True;
  lbl_DataCad.Caption := Cliente.User_Insert + '-' + DatetoStr(Cliente.DataCad);

  lbl_DataAlt.Caption := Cliente.User_Update + '-' + DatetoStr(Cliente.DataUltAlt);
  Lbl_Alt.Visible := True;
  lbl_DataAlt.Visible := True;
end;

procedure TCad_Clientes.PopularObjeto;
begin
  Cliente.ID := StrtoInt(edt_id.text);
  Cliente.Nome := edt_Nome.text;
  Cliente.RazaoSocial := edt_Razao_Social.text;
  Cliente.CPFCNPJ := edt_CPFCNPJ.Text;
  Cliente.RGIE := edt_RGIE.Text;
  Cliente.endereco := edt_Logradouro.Text;
  Cliente.numero := edt_numero.Text;
  Cliente.Cep := edt_CEP.Text;
  Cliente.bairro := edt_Bairro.Text;
  Cliente.Complemento := edt_Complemento.Text;
  Cliente.TelFixo := edt_Tel_Fixo.Text;
  Cliente.TelCel := edt_Tel_Cel.Text;
  Cliente.Tipo := TtipoPessoa(rg_TipoPessoa.ItemIndex);
  Cliente.Sexo := TSexo(rg_Sexo.ItemIndex);
  Cliente.DtNasc := edt_DataNasc.Date;
end;

procedure TCad_Clientes.Rg_TipoPessoaClick(Sender: TObject);
begin
  inherited;
  AlterarCampos;
end;

function TCad_Clientes.ValidarDados: boolean;
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
