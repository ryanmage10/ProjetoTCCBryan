unit uProdutosDao;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Data.SqlExpr,
  Datasnap.Provider, Datasnap.DBClient, uDmConexao, uProdutos, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uUnidades, uUnidadesDao;

type
  TProdutosDao = class(TObject)

  private
    { Private declarations }
    constructor Create;
    destructor free;
    procedure FieldToObj(var Value: TProdutos; Qry: TFDQuery);
    procedure ObjToField(var Value: TProdutos; Qry: TFDQuery);
  public
    { Public declarations }
    procedure Pesquisar(Value: string; var dset: TClientDataSet);
    function Recuperar(Var Value: TProdutos): boolean;
    function inserir(Value: TProdutos): boolean;
    function Alterar(Value: TProdutos): boolean;
    function Excluir(Value: TProdutos): boolean;
    function VerificarNome(Value: TProdutos): boolean;
    function VerificarExclusao(Value: TProdutos): boolean;

  end;

var
  ProdutosDao: TProdutosDao;

implementation

function TProdutosDao.Alterar(Value: TProdutos): boolean;
begin
  result := False;
  with DmConexao.Qry, Value do
  begin
    Sql.Clear;
    sql.add('UPDATE Produtos SET DESCRICAO = :DESCRICAO, CODIGO = :CODIGO, NCM = :NCM, ID_UNIDADE = :ID_UNIDADE, ');
    Sql.Add('USER_INSERT = :USER_INSERT, USER_UPDATE = :USER_UPDATE, DATE_INSERT = :DATE_INSERT, DATE_UPDATE = :DATE_UPDATE');
    Sql.Add(' WHERE ID = :ID');

    paramByName('id').AsInteger := Value.Id;
    ObjToField(Value, DmConexao.Qry);
    ExecSql();
    result := true;
    close;
  end;
end;

constructor TProdutosDao.Create;
begin
   //
end;

function TProdutosDao.Excluir(Value: TProdutos): boolean;
begin
    result := False;
    with DmConexao.Qry do
    begin
      Sql.Clear;
      Sql.Add('DELETE FROM Produtos WHERE ID = :ID');
      paramByName('ID').AsInteger := Value.ID;
      ExecSql();
      result := true;
      close;
    end;
end;

procedure TProdutosDao.FieldToObj(var Value: TProdutos; Qry: TFDQuery);
begin
  with Value, Qry do
  begin
    ID := FieldByName('ID').AsInteger;
    Descricao := FieldByName('Descricao').AsString;
    Codigo := FieldByName('CODIGO').AsString;
    //Unidade := FieldByName('CODIGO').AsString;
    NCM := FieldByName('NCM').AsString;
    Unidade.Id := FieldByName('ID_UNIDADE').AsInteger;
    DataCad := FieldByName('date_insert').AsDatetime;
    DataUltAlt := FieldByName('date_update').AsDatetime;
    user_insert := FieldByName('User_Insert').AsString;
    user_update := FieldByName('User_Update').AsString;
  end;
end;

destructor TProdutosDao.free;
begin
  //
end;

function TProdutosDao.inserir(Value: TProdutos): boolean;
begin
  result := False;
  with DmConexao.Qry, Value do
  begin
      Sql.Clear;
      sql.add('INSERT INTO Produtos (DESCRICAO, CODIGO, NCM, ID_UNIDADE, USER_INSERT,USER_UPDATE, DATE_INSERT, DATE_UPDATE)');
      Sql.add(' VALUES (:DESCRICAO, :CODIGO, :NCM, :ID_UNIDADE, :USER_INSERT, :USER_UPDATE, :DATE_INSERT, :DATE_UPDATE)');

      ObjToField(Value, DmConexao.Qry);
      ExecSql();
      result := true;
      Close;
  end;
end;

procedure TProdutosDao.ObjToField(var Value: TProdutos; Qry: TFDQuery);
begin
  with Value, Qry do
  begin
    paramByName('DESCRICAO').AsString := Descricao;
    paramByName('CODIGO').AsString := Codigo;
    paramByName('NCM').AsString := NCM;
    paramByName('ID_UNIDADE').AsInteger := Unidade.ID;
    paramByName('date_insert').AsDatetime := DataCad;
    paramByName('date_update').AsDatetime := DataUltAlt;
    paramByName('User_Insert').AsString := user_insert;
    paramByName('User_Update').AsString := user_update;
  end;
end;

procedure TProdutosDao.Pesquisar(Value: string; Var dset: TClientDataSet);
begin
  with DmConexao.Qry do
  begin
    dset.EmptyDataSet;
    Sql.Clear;

      if Value = '' then
      begin
        Sql.Add('SELECT P.ID, P.DESCRICAO, P.CODIGO, U.DESCRICAO AS UNIDADE, P.DATE_INSERT FROM Produtos P');
        Sql.Add('LEFT JOIN UNIDADES U ON U.ID = P.ID_UNIDADE');
      end
      else
      begin
        Sql.Add('SELECT p.ID, p.DESCRICAO, p.CODIGO, p.DATE_INSERT, u.DESCRICAO as UNIDADE FROM Produtos p ');
        Sql.Add('LEFT JOIN UNIDADES U ON U.ID = P.ID_UNIDADE ');
        Sql.Add('WHERE p.DESCRICAO LIKE :DESCRICAO');
        paramByName('DESCRICAO').AsString := '%' + Value + '%';
      end;
      open;
      while not eof do
      begin
        dset.Append;
        dset.FieldByName('id').AsInteger := FieldByName('id').AsInteger;
        dset.FieldByName('DESCRICAO').AsString := FieldByName('DESCRICAO').AsString;
        dset.FieldByName('CODIGO').AsString := FieldByName('CODIGO').AsString;
        dset.FieldByName('UNIDADE').AsString := FieldByName('UNIDADE').AsString;
        dset.FieldByName('DATA_INSERT').AsDateTime := FieldByName('DATE_INSERT').AsDateTime;
        dset.Post;
        next;
      end;

      close;
  end;
end;

function TProdutosDao.Recuperar(var Value: TProdutos): boolean;
var UnidadeAux : TUnidades;
    UnidadesDao : TUnidadesDao;
begin
    result := False;
    with DmConexao.Qry do
    begin
      sql.clear;
      UnidadeAux := TUnidades.Create;
      Sql.Add('SELECT * FROM Produtos WHERE ID = :ID');
      paramByName('ID').AsInteger := Value.ID;
      open;
      FieldtoObj(Value, DmConexao.Qry);
      UnidadeAux.Id := FieldbyName('Id_Unidade').AsInteger;
      result := true;
      close;

      UnidadesDao := TUnidadesDao.Create;
      try
        UnidadesDao.Recuperar(UnidadeAux);
        Value.Unidade.CopiarDados(UnidadeAux);
      finally
        UnidadesDao.Free;
        UnidadeAux.Free;
      end;
    end;
end;

function TProdutosDao.VerificarExclusao(Value: TProdutos): boolean;
begin
   result := False;
   {with DmConexao.Qry do
    begin
      sql.clear;
      Sql.Add('SELECT * FROM ESTADOS WHERE ID_Produto = :ID_Produto');
      paramByName('ID_Produto').AsInteger := Value.id;
      open;
      if not IsEmpty then
        result := true;
      close;
    end;}
end;

function TProdutosDao.VerificarNome(Value: TProdutos): boolean;
begin
   result := False;
   with DmConexao.Qry do
    begin
      sql.clear;
      Sql.Add('SELECT * FROM Produtos WHERE DESCRICAO = :DESCRICAO AND NOT ID = :ID');
      paramByName('ID').AsInteger := Value.ID;
      paramByName('DESCRICAO').AsString := Value.Descricao;
      open;
      if not IsEmpty then
        result := true;
      close;
    end;
end;

end.
