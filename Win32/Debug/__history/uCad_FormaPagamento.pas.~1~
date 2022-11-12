unit uCad_FormaPagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCad_Base, Vcl.StdCtrls, Vcl.ExtCtrls, uFormaPagamento,
  uFormaPagamentoController;

type
  TCad_FormaPagamento = class(TCad_Base)
    edt_Descricao: TEdit;
    lbl_Descricao: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
  private
    { Private declarations }
    FormaPagamentoControl: TFormaPagamentoController;
    function validarDados: boolean;
    procedure popularInterface;
    procedure PopularObjeto;
  public
    { Public declarations }

    FormaPagamento: TFormaPagamento;
  end;

var
  Cad_FormaPagamento: TCad_FormaPagamento;

implementation

{$R *.dfm}

procedure TCad_FormaPagamento.btn_SalvarClick(Sender: TObject);
begin
  inherited;
  if validarDados then
  begin
     popularObjeto;

     if not FormaPagamentoControl.VerificarNome(FormaPagamento) then
     begin
       if Inclusao then
          FormaPagamentoControl.Inserir(FormaPagamento)
       else
          FormaPagamentoControl.Alterar(FormaPagamento);

       Self.Close;
     end
     else
      raise Exception.Create('Já Existe uma forma de pagamento cadastrada com esse nome');
  end;
end;

procedure TCad_FormaPagamento.FormCreate(Sender: TObject);
begin
  inherited;
  FormaPagamento := TFormaPagamento.Create;
  FormaPagamentoControl := TFormaPagamentoController.Create;
end;

procedure TCad_FormaPagamento.FormDestroy(Sender: TObject);
begin
  inherited;
  FormaPagamento.Free;
  FormaPagamentoControl.Free;
end;

procedure TCad_FormaPagamento.FormShow(Sender: TObject);
begin
  inherited;
  if not inclusao then
     popularInterface;
end;

procedure TCad_FormaPagamento.popularInterface;
begin
    edt_id.text := inttostr(FormaPagamento.ID);
    edt_Descricao.text := FormaPagamento.Descricao;


    lbl_Cad.Visible := True;
    lbl_DataCad.Visible := True;
    lbl_DataCad.Caption := FormaPagamento.User_Insert + '-' + DatetoStr(FormaPagamento.DataCad);

    lbl_DataAlt.Caption := FormaPagamento.User_Update + '-' + DatetoStr(FormaPagamento.DataUltAlt);
    Lbl_Alt.Visible := True;
    lbl_DataAlt.Visible := True;
end;

procedure TCad_FormaPagamento.PopularObjeto;
begin
   FormaPagamento.ID := strtoint(edt_id.text);
   FormaPagamento.Descricao := edt_Descricao.text;
end;

function TCad_FormaPagamento.validarDados: boolean;
begin
   result := False;
  if not (length(edt_Descricao.Text) > 0) then
  begin
    ShowMessage('Insira a Descrição da Forma de Pagamento');
    edt_Descricao.setFocus;
    exit;
  end;

  result := True;
end;

end.
