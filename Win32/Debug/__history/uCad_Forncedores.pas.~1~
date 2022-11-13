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
  private
    { Private declarations }
  public
    { Public declarations }
    Fornecedor : TFornecedores;
    FornecedorControl : TFornecedoresController;
  end;

var
  Cad_Fornecedores: TCad_Fornecedores;

implementation

{$R *.dfm}

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

procedure TCad_Fornecedores.FormCreate(Sender: TObject);
begin
  inherited;
  Forncedor := TClientes.Create;
  ForncedorControl := TClientesController.Create;
end;

end.
