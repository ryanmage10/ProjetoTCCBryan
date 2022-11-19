unit uParcelaModeloDao;

interface

uses
  System.SysUtils, System.Classes,
  System.Generics.Collections, Data.FMTBcd, Data.DB, Data.SqlExpr,
  Datasnap.Provider, Datasnap.DBClient, uDmConexao, uParcelaModelos, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uFormaPagamento, uFormaPagamentoDao,
  uCondicaoPagamento;

type
  TParcelaModeloDao = class(TObject)

  private
    { Private declarations }
    constructor Create;
    destructor free;
    procedure FieldToObj(var oParcelaModelo: TParcelaModelo; Qry: TFDQuery);
    procedure ObjToField(var oParcelaModelo: TParcelaModelo; Qry: TFDQuery);
  public
    { Public declarations }
    function Recuperar(Var oParcelaModelo: TParcelaModelo): boolean;
    function RecuperarPorCondicaoPagamento(Var CondicaoPagamento: TCondicaoPagamento): boolean;
    function inserir(oParcelaModelo: TParcelaModelo): boolean;
    function InserirParcelas(ListaParcelas: TList<TParcelaModelo>): boolean;
    function Excluir(oParcelaModelo: TParcelaModelo): boolean;
    function ExcluirPorCondicaoPagamento(Id: Integer): Boolean;
    //function RetornaUltIdCondicao: Integer;

  end;

var
  ParcelaModeloDao: TParcelaModeloDao;

implementation


constructor TParcelaModeloDao.Create;
begin
   //
end;

function TParcelaModeloDao.Excluir(oParcelaModelo: TParcelaModelo): boolean;
begin
    result := False;
    with DmConexao.Qry do
    begin
      Sql.Clear;
      Sql.Add('DELETE FROM PARCELA_MODELO WHERE ID = :ID');
      paramByName('ID').AsInteger := oParcelaModelo.ID;
      ExecSql();
      result := true;
      close;
    end;
end;

function TParcelaModeloDao.ExcluirPorCondicaoPagamento(Id: Integer): Boolean;
begin
   result := False;
    with DmConexao.Qry do
    begin
      Sql.Clear;
      Sql.Add('DELETE FROM PARCELA_MODELO WHERE ID_CONDICAO_PAGAMENTO = :ID');
      paramByName('ID').AsInteger := ID;
      ExecSql();
      result := true;
      close;
    end;
end;

procedure TParcelaModeloDao.FieldToObj(var oParcelaModelo: TParcelaModelo; Qry: TFDQuery);
begin
  with oParcelaModelo, Qry do
  begin
    ID := FieldByName('ID').AsInteger;
    Numero := FieldByName('NUMERO').AsInteger;
    Dias := FieldByName('DIAS').AsInteger;
    Percentual := FieldByName('PERCENTUAL').AsCurrency;
    Cod_CondPag := FieldByName('ID_CONDICAO_PAGAMENTO').AsInteger;

    DataCad := FieldByName('date_insert').AsDatetime;
    DataUltAlt := FieldByName('date_update').AsDatetime;
    user_insert := FieldByName('User_Insert').AsString;
    user_update := FieldByName('User_Update').AsString;
  end;
end;

destructor TParcelaModeloDao.free;
begin
  //
end;

function TParcelaModeloDao.inserir(oParcelaModelo: TParcelaModelo): boolean;
begin
  result := False;
  with DmConexao.Qry, oParcelaModelo do
  begin
      Sql.Clear;

      sql.add('INSERT INTO PARCELA_MODELO ( NUMERO, DIAS, PERCENTUAL, ID_FORMA_PAGAMENTO, ID_CONDICAO_PAGAMENTO, USER_INSERT, USER_UPDATE, DATE_INSERT, DATE_UPDATE)');
      Sql.add(' VALUES (:NUMERO, :DIAS, :PERCENTUAL, :ID_FORMA_PAGAMENTO, :ID_CONDICAO_PAGAMENTO, :USER_INSERT, :USER_UPDATE, :DATE_INSERT, :DATE_UPDATE)');

      ObjToField(oParcelaModelo, DmConexao.Qry);
      ExecSql();
      result := true;
      Close;
  end;
end;

function TParcelaModeloDao.InserirParcelas(
  ListaParcelas: TList<TParcelaModelo>): boolean;
  var i: Integer;
begin
    for I := 0 to ListaParcelas.Count - 1 do
    begin
        if not Self.Inserir(ListaParcelas.Items[I]) then
          raise Exception.Create('Erro Ao Inserir Parcela');
    end;
end;

procedure TParcelaModeloDao.ObjToField(var oParcelaModelo: TParcelaModelo; Qry: TFDQuery);
begin
  with oParcelaModelo, Qry do
  begin
    paramByName('NUMERO').AsInteger := Numero;
    paramByName('DIAS').AsInteger := Dias;
    paramByName('PERCENTUAL').AsCurrency := Percentual;
    paramByName('ID_FORMA_PAGAMENTO').AsInteger := FormaPag.Id;
    paramByName('ID_CONDICAO_PAGAMENTO').AsInteger := Cod_CondPag;
    paramByName('date_insert').AsDatetime := DataCad;
    paramByName('date_update').AsDatetime := DataUltAlt;
    paramByName('User_Insert').AsString := user_insert;
    paramByName('User_Update').AsString := user_update;
  end;
end;

function TParcelaModeloDao.Recuperar(var oParcelaModelo: TParcelaModelo): boolean;
var FormaPagamento: TFormaPagamento;
    FormaPagamentoDao: TFormaPagamentoDao;
begin
    result := False;
    with DmConexao.Qry do
    begin
      sql.clear;
      FormaPagamento := TFormaPagamento.Create;
      Sql.Add('SELECT * FROM PARCELA_MODELO WHERE ID = :ID');
      paramByName('ID').AsInteger := oParcelaModelo.ID;
      open;
      FieldtoObj(oParcelaModelo, DmConexao.Qry);
      FormaPagamento.Id := FieldByName('ID_FORMA_PAGAMENTO').AsInteger;
      result := true;
      close;

      FormaPagamentoDao := TFormaPagamentoDao.Create;
      try
         FormaPagamentoDao.Recuperar(FormaPagamento);
         oParcelaModelo.FormaPag.CopiarDados(FormaPagamento);
      finally
         FormaPagamentoDao.Free;
         FormaPagamento.Free;
      end;
    end;
end;

function TParcelaModeloDao.RecuperarPorCondicaoPagamento(
  var CondicaoPagamento: TCondicaoPagamento): boolean;
  var oParcelaModelo : TParcelaModelo;
      FormaPagamento: TFormaPagamento;
      FormaPagamentoDao: TFormaPagamentoDao;
      I: Integer;
begin
  result := False;
  with DmConexao.Qry do
  begin
    Sql.Clear;
    FormaPagamento := TFormaPagamento.Create;
    FormaPagamentoDao := TFormaPagamentoDao.Create;
    Sql.Add('SELECT * FROM PARCELA_MODELO WHERE ID_CONDICAO_PAGAMENTO = :ID');
    paramByName('ID').AsInteger := CondicaoPagamento.ID;
    open;
    while (not eof) do
    begin
        oParcelaModelo := TParcelaModelo.Create;
        FieldtoObj(oParcelaModelo, DmConexao.Qry);
        oParcelaModelo.FormaPag.Id := FieldByName('ID_FORMA_PAGAMENTO').AsInteger;
        CondicaoPagamento.ParcelaModelos.Add(oParcelaModelo);
        Next;
    end;

    close;

    for I := 0 to CondicaoPagamento.ParcelaModelos.Count - 1 do
    begin
       oParcelaModelo := CondicaoPagamento.ParcelaModelos.Items[I];
       FormaPagamento.id := oParcelaModelo.FormaPag.Id;
       FormaPagamentoDao.Recuperar(FormaPagamento);
       oParcelaModelo.FormaPag.CopiarDados(FormaPagamento);
    end;

    Result:= True;

    FormaPagamento.Free;
    FormaPagamentoDao.Free;
  end;
end;

{function TParcelaModeloDao.RetornaUltIdCondicao: Integer;
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
