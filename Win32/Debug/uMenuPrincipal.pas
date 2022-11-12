unit uMenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus, uCons_paises, uCons_estados,
  uCons_Cidades, uCons_Empresas, uCons_Funcionarios, uCons_Clientes,
  uCons_Fornecedores, uCons_Caixas, uCons_Contratos, uCons_FormaPagamento,
  uCons_CondicaoPagamento, uCons_Unidades, uCons_Produtos;

type
  TMenuPrincipal = class(TForm)
    Panel1: TPanel;
    Menu1: TMainMenu;
    btn_Financeiro: TMenuItem;
    btn_Caixas: TMenuItem;
    btn_Contratos: TMenuItem;
    btn_FormaPagamento: TMenuItem;
    CondicaoPagamento1: TMenuItem;
    btn_Localidades: TMenuItem;
    btn_paises: TMenuItem;
    btn_estados: TMenuItem;
    btn_cidades: TMenuItem;
    btn_Pessoas: TMenuItem;
    btn_Empresas: TMenuItem;
    Btn_Funcionarios1: TMenuItem;
    Btn_Clientes: TMenuItem;
    btn_Fornecedores1: TMenuItem;
    btn_Unidades: TMenuItem;
    btn_produtos: TMenuItem;
    procedure btn_PaisesClick(Sender: TObject);
    procedure btn_EstadosClick(Sender: TObject);
    procedure btn_CidadesClick(Sender: TObject);
    procedure btn_EmpresaClick(Sender: TObject);
    procedure Btn_FuncionariosClick(Sender: TObject);
    procedure Btn_ClientesClick(Sender: TObject);
    procedure btn_FornecedoresClick(Sender: TObject);
    procedure btn_CaixasClick(Sender: TObject);
    procedure btn_ContratosClick(Sender: TObject);
    procedure btn_FormaPagamentoClick(Sender: TObject);
    procedure CondicaoPagamento1Click(Sender: TObject);
    procedure btn_UnidadesClick(Sender: TObject);
    procedure btn_produtosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
 var
  MenuPrincipal: TMenuPrincipal;
implementation

{$R *.dfm}

procedure TMenuPrincipal.btn_CaixasClick(Sender: TObject);
var ConsCaixaForm: TCons_Caixas;
begin
   ConsCaixaForm := TCons_Caixas.Create(nil);
   try
      ConsCaixaForm.ShowModal;
   finally
      FreeAndNil(ConsCaixaForm);
   end;
end;

procedure TMenuPrincipal.btn_CidadesClick(Sender: TObject);
var ConsCidadeForm: TCons_Cidades;
begin
   ConsCidadeForm := TCons_Cidades.Create(nil);
   try
      ConsCidadeForm.ShowModal;
   finally
      FreeAndNil(ConsCidadeForm);
   end;
end;

procedure TMenuPrincipal.Btn_ClientesClick(Sender: TObject);
var ConsClienteForm: TCons_Clientes;
begin
   ConsClienteForm := TCons_Clientes.Create(nil);
   try
      ConsClienteForm.ShowModal;
   finally
      FreeAndNil(ConsClienteForm);
   end;
end;

procedure TMenuPrincipal.btn_ContratosClick(Sender: TObject);
var ConsContratoForm: TCons_Contratos;
begin
   ConsContratoForm := TCons_Contratos.Create(nil);
   try
      ConsContratoForm.ShowModal;
   finally
      FreeAndNil(ConsContratoForm);
   end;
end;

procedure TMenuPrincipal.btn_EmpresaClick(Sender: TObject);
var ConsEmpresaForm: TCons_Empresas;
begin
   ConsEmpresaForm := TCons_Empresas.Create(nil);
   try
      ConsEmpresaForm.ShowModal;
   finally
      FreeAndNil(ConsEmpresaForm);
   end;
end;

procedure TMenuPrincipal.btn_EstadosClick(Sender: TObject);
var ConsEstadoForm: TCons_Estados;
begin
   ConsEstadoForm := TCons_Estados.Create(nil);
   try
      ConsEstadoForm.ShowModal;
   finally
      FreeAndNil(ConsEstadoForm);
   end;
end;

procedure TMenuPrincipal.btn_FormaPagamentoClick(Sender: TObject);
var ConsFormaPagamentoForm: TCons_FormaPagamento;
begin
   ConsFormaPagamentoForm := TCons_FormaPagamento.Create(nil);
   try
      ConsFormaPagamentoForm.ShowModal;
   finally
      FreeAndNil(ConsFormaPagamentoForm);
   end;
end;

procedure TMenuPrincipal.btn_FornecedoresClick(Sender: TObject);
var ConsFornecedorForm: TCons_Fornecedores;
begin
   ConsFornecedorForm := TCons_Fornecedores.Create(nil);
   try
      ConsFornecedorForm.ShowModal;
   finally
      FreeAndNil(ConsFornecedorForm);
   end;
end;

procedure TMenuPrincipal.btn_PaisesClick(Sender: TObject);
var ConsPaisForm: TCons_Paises;
begin
   ConsPaisForm := TCons_Paises.Create(nil);
   try
      ConsPaisForm.ShowModal;
   finally
      FreeAndNil(ConsPaisForm);
   end;
end;

procedure TMenuPrincipal.btn_produtosClick(Sender: TObject);
var ConsProdutoForm: TCons_produtos;
begin
   ConsProdutoForm := TCons_produtos.Create(nil);
   try
      ConsprodutoForm.ShowModal;
   finally
      FreeAndNil(ConsprodutoForm);
   end;
end;

procedure TMenuPrincipal.btn_UnidadesClick(Sender: TObject);
var ConsUnidadeForm: TCons_Unidades;
begin
   ConsUnidadeForm := TCons_Unidades.Create(nil);
   try
      ConsUnidadeForm.ShowModal;
   finally
      FreeAndNil(ConsUnidadeForm);
   end;
end;

procedure TMenuPrincipal.CondicaoPagamento1Click(Sender: TObject);
var ConsCondicaoPagamentoForm: TCons_CondicaoPagamento;
begin
   ConsCondicaoPagamentoForm := TCons_CondicaoPagamento.Create(nil);
   try
      ConsCondicaoPagamentoForm.ShowModal;
   finally
      FreeAndNil(ConsCondicaoPagamentoForm);
   end;
end;

procedure TMenuPrincipal.Btn_FuncionariosClick(Sender: TObject);
var ConsFuncionarioForm: TCons_Funcionarios;
begin
   ConsFuncionarioForm := TCons_Funcionarios.Create(nil);
   try
      ConsFuncionarioForm.ShowModal;
   finally
      FreeAndNil(ConsFuncionarioForm);
   end;
end;

end.
