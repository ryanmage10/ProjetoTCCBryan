unit uContasPagarDao;

interface

uses
  System.SysUtils, System.Classes,
  System.Generics.Collections, Data.FMTBcd, Data.DB, Data.SqlExpr,
  Datasnap.Provider, Datasnap.DBClient, uDmConexao, uContasPagar, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uFormaPagamento, uFormaPagamentoDao,
  uCompras;

type
  TContasPagarDao = class(TObject)

  private
    { Private declarations }
    constructor Create;
    destructor free;
    procedure FieldToObj(var oContasPagar: TContasPagar; Qry: TFDQuery);
    procedure ObjToField(var oContasPagar: TContasPagar; Qry: TFDQuery);
  public
    { Public declarations }
    function Recuperar(Var oContasPagar: TContasPagar): boolean;
    function RecuperarPorCompra(Var Compra: TCompra): boolean;
    function inserir(oContasPagar: TContasPagar): boolean;
    function InserirParcelas(ListaParcelas: TList<TContasPagar>): boolean;
    function Excluir(oContasPagar: TContasPagar): boolean;
    function ExcluirPorCompra(Id: Integer): Boolean;
    //function RetornaUltIdCondicao: Integer;

  end;

var
  ContasPagarDao: TContasPagarDao;

implementation


constructor TContasPagarDao.Create;
begin
   //
end;

function TContasPagarDao.Excluir(oContasPagar: TContasPagar): boolean;
begin
    result := False;
    with DmConexao.Qry do
    begin
      Sql.Clear;
      Sql.Add('DELETE FROM CONTAS_PAGAR WHERE ID = :ID');
      paramByName('ID').AsInteger := oContasPagar.ID;
      ExecSql();
      result := true;
      close;
    end;
end;

function TContasPagarDao.ExcluirPorCompra(Id: Integer): Boolean;
begin
   result := False;
    with DmConexao.Qry do
    begin
      Sql.Clear;
      Sql.Add('DELETE FROM CONTAS_PAGAR WHERE ID_COMPRA = :ID');
      paramByName('ID').AsInteger := ID;
      ExecSql();
      result := true;
      close;
    end;
end;

procedure TContasPagarDao.FieldToObj(var oContasPagar: TContasPagar; Qry: TFDQuery);
begin
  with oContasPagar, Qry do
  begin
    ID := FieldByName('ID').AsInteger;
    Seq := FieldByName('Seq').AsInteger;
    id_compra := FieldByName('ID_COMPRA').AsInteger;
    Tipo := TTipoConta(FieldByName('Tipo').AsInteger);
    Valor := FieldByName('Valor').AsInteger;
    Data_Venc := FieldByName('Data_Venc').AsDateTime;

    DataCad := FieldByName('date_insert').AsDatetime;
    DataUltAlt := FieldByName('date_update').AsDatetime;
    user_insert := FieldByName('User_Insert').AsString;
    user_update := FieldByName('User_Update').AsString;
  end;
end;

destructor TContasPagarDao.free;
begin
  //
end;

function TContasPagarDao.inserir(oContasPagar: TContasPagar): boolean;
begin
  result := False;
  with DmConexao.Qry, oContasPagar do
  begin
      Sql.Clear;

      sql.add('INSERT INTO CONTAS_PAGAR ( SEQ, ID_COMPRA, TIPO, ID_FORMA_PAGAMENTO, VALOR, DATA_VENC, USER_INSERT, USER_UPDATE, DATE_INSERT, DATE_UPDATE)');
      Sql.add(' VALUES (:SEQ, :ID_COMPRA, :TIPO, :ID_FORMA_PAGAMENTO, :VALOR, :DATA_VENC, :USER_INSERT, :USER_UPDATE, :DATE_INSERT, :DATE_UPDATE)');

      ObjToField(oContasPagar, DmConexao.Qry);
      ExecSql();
      result := true;
      Close;
  end;
end;

function TContasPagarDao.InserirParcelas(
  ListaParcelas: TList<TContasPagar>): boolean;
  var i: Integer;
begin
    for I := 0 to ListaParcelas.Count - 1 do
    begin
        if not Self.Inserir(ListaParcelas.Items[I]) then
          raise Exception.Create('Erro Ao Inserir Conta Pagar');
    end;
end;

procedure TContasPagarDao.ObjToField(var oContasPagar: TContasPagar; Qry: TFDQuery);
begin
  with oContasPagar, Qry do
  begin
    paramByName('SEQ').AsInteger := Seq;
    paramByName('ID_COMPRA').AsInteger := ID_COMPRA;
    paramByName('TIPO').AsInteger := Integer(Tipo);
    paramByName('ID_FORMA_PAGAMENTO').AsInteger := FormaPag.Id;
    paramByName('VALOR').AsCurrency := Valor;
    paramByName('DATA_VENC').AsDateTime := Data_Venc;
    paramByName('date_insert').AsDatetime := DataCad;
    paramByName('date_update').AsDatetime := DataUltAlt;
    paramByName('User_Insert').AsString := user_insert;
    paramByName('User_Update').AsString := user_update;
  end;
end;

function TContasPagarDao.Recuperar(var oContasPagar: TContasPagar): boolean;
var FormaPagamento: TFormaPagamento;
    FormaPagamentoDao: TFormaPagamentoDao;
begin
    result := False;
    with DmConexao.Qry do
    begin
      sql.clear;
      FormaPagamento := TFormaPagamento.Create;
      Sql.Add('SELECT * FROM CONTAS_PAGAR WHERE ID = :ID');
      paramByName('ID').AsInteger := oContasPagar.ID;
      open;
      FieldtoObj(oContasPagar, DmConexao.Qry);
      FormaPagamento.Id := FieldByName('ID_FORMA_PAGAMENTO').AsInteger;
      result := true;
      close;

      FormaPagamentoDao := TFormaPagamentoDao.Create;
      try
         FormaPagamentoDao.Recuperar(FormaPagamento);
         oContasPagar.FormaPagamento.CopiarDados(FormaPagamento);
      finally
         FormaPagamentoDao.Free;
         FormaPagamento.Free;
      end;
    end;
end;

function TContasPagarDao.RecuperarPorCompra(
  var Compra: TCompra): boolean;
  var oContasPagar : TContasPagar;
      FormaPagamento: TFormaPagamento;
      FormaPagamentoDao: TFormaPagamentoDao;
      I: Integer;
begin
  result := False;
  with DmConexao.Qry do
  begin
    Sql.Clear;
    Compra.ContasPagar.Clear;
    FormaPagamento := TFormaPagamento.Create;
    FormaPagamentoDao := TFormaPagamentoDao.Create;
    Sql.Add('SELECT * FROM CONTAS_PAGAR WHERE ID_COMPRA = :ID');
    paramByName('ID').AsInteger := Compra.ID;
    open;
    while (not eof) do
    begin
        oContasPagar := TContasPagar.Create;
        FieldtoObj(oContasPagar, DmConexao.Qry);
        oContasPagar.FormaPagamento.Id := FieldByName('ID_FORMA_PAGAMENTO').AsInteger;
        Compra.ContasPagar.Add(oContasPagar);
        Next;
    end;

    close;

    for I := 0 to Compra.ContasPagar.Count - 1 do
    begin
       oContasPagar := Compra.ContasPagars.Items[I];
       FormaPagamento.id := oContasPagar.FormaPag.Id;
       FormaPagamentoDao.Recuperar(FormaPagamento);
       oContasPagar.FormaPagamento.CopiarDados(FormaPagamento);
    end;

    Result:= True;

    FormaPagamento.Free;
    FormaPagamentoDao.Free;
  end;
end;

{function TContasPagarDao.RetornaUltIdCondicao: Integer;
begin
  with DmConexao.Qry do
  begin
    Sql.Clear;
    Sql.Add('SELECT GEN_ID(condicao_pagamento_gen, 0) FROM RDB$DATABASE');
    open;
    result := ParamByName('gen_id').AsInteger;
    close;
  end;
end;  }

end.
