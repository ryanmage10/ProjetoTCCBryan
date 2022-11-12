unit uUnidadesDao;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Data.SqlExpr,
  Datasnap.Provider, Datasnap.DBClient, uDmConexao, uUnidades, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TUnidadesDao = class(TObject)

  private
    { Private declarations }
    constructor Create;
    destructor free;
    procedure FieldToObj(var Value: TUnidades; Qry: TFDQuery);
    procedure ObjToField(var Value: TUnidades; Qry: TFDQuery);
  public
    { Public declarations }
    procedure Pesquisar(Value: string; var dset: TClientDataSet);
    function Recuperar(Var Value: TUnidades): boolean;
    function inserir(Value: TUnidades): boolean;
    function Alterar(Value: TUnidades): boolean;
    function Excluir(Value: TUnidades): boolean;
    function VerificarNome(Value: TUnidades): boolean;
    function VerificarExclusao(Value: TUnidades): boolean;

  end;

var
  UnidadesDao: TUnidadesDao;

implementation

function TUnidadesDao.Alterar(Value: TUnidades): boolean;
begin
  result := False;
  with DmConexao.Qry, Value do
  begin
    Sql.Clear;
    sql.add('UPDATE Unidades SET DESCRICAO = :DESCRICAO, SIGLA = :SIGLA, ');
    Sql.Add('USER_INSERT = :USER_INSERT, USER_UPDATE = :USER_UPDATE, DATE_INSERT = :DATE_INSERT, DATE_UPDATE = :DATE_UPDATE');
    Sql.Add(' WHERE ID = :ID');

    paramByName('id').AsInteger := Value.Id;
    ObjToField(Value, DmConexao.Qry);
    ExecSql();
    result := true;
    close;
  end;
end;

constructor TUnidadesDao.Create;
begin
   //
end;

function TUnidadesDao.Excluir(Value: TUnidades): boolean;
begin
    result := False;
    with DmConexao.Qry do
    begin
      Sql.Clear;
      Sql.Add('DELETE FROM Unidades WHERE ID = :ID');
      paramByName('ID').AsInteger := Value.ID;
      ExecSql();
      result := true;
      close;
    end;
end;

procedure TUnidadesDao.FieldToObj(var Value: TUnidades; Qry: TFDQuery);
begin
  with Value, Qry do
  begin
    ID := FieldByName('ID').AsInteger;
    Descricao := FieldByName('Descricao').AsString;
    Sigla := FieldByName('Sigla').AsString;
    DataCad := FieldByName('date_insert').AsDatetime;
    DataUltAlt := FieldByName('date_update').AsDatetime;
    user_insert := FieldByName('User_Insert').AsString;
    user_update := FieldByName('User_Update').AsString;
  end;
end;

destructor TUnidadesDao.free;
begin
  //
end;

function TUnidadesDao.inserir(Value: TUnidades): boolean;
begin
  result := False;
  with DmConexao.Qry, Value do
  begin
      Sql.Clear;
      sql.add('INSERT INTO Unidades (DESCRICAO, SIGLA, USER_INSERT,USER_UPDATE, DATE_INSERT, DATE_UPDATE)');
      Sql.add(' VALUES (:DESCRICAO, :SIGLA, :USER_INSERT, :USER_UPDATE, :DATE_INSERT, :DATE_UPDATE)');

      ObjToField(Value, DmConexao.Qry);
      ExecSql();
      result := true;
      Close;
  end;
end;

procedure TUnidadesDao.ObjToField(var Value: TUnidades; Qry: TFDQuery);
begin
  with Value, Qry do
  begin
    paramByName('DESCRICAO').AsString := Descricao;
    paramByName('sigla').AsString := Sigla;
    paramByName('date_insert').AsDatetime := DataCad;
    paramByName('date_update').AsDatetime := DataUltAlt;
    paramByName('User_Insert').AsString := user_insert;
    paramByName('User_Update').AsString := user_update;
  end;
end;

procedure TUnidadesDao.Pesquisar(Value: string; Var dset: TClientDataSet);
begin
  with DmConexao.Qry do
  begin
    dset.EmptyDataSet;
    Sql.Clear;

      if Value = '' then
      begin
        Sql.Add('SELECT ID, DESCRICAO, SIGLA, DATE_INSERT FROM Unidades');
      end
      else
      begin
        Sql.Add('SELECT ID, DESCRICAO, SIGLA, DATE_INSERT FROM Unidades WHERE Unidade LIKE :DESCRICAO');
        paramByName('DESCRICAO').AsString := '%' + Value + '%';
      end;
      open;
      while not eof do
      begin
        dset.Append;
        dset.FieldByName('id').AsInteger := FieldByName('id').AsInteger;
        dset.FieldByName('DESCRICAO').AsString := FieldByName('DESCRICAO').AsString;
        dset.FieldByName('sigla').AsString := FieldByName('sigla').AsString;
        dset.FieldByName('DATA_INSERT').AsDateTime := FieldByName('DATE_INSERT').AsDateTime;
        dset.Post;
        next;
      end;

      close;
  end;
end;

function TUnidadesDao.Recuperar(var Value: TUnidades): boolean;
begin
    result := False;
    with DmConexao.Qry do
    begin
      sql.clear;
      Sql.Add('SELECT * FROM Unidades WHERE ID = :ID');
      paramByName('ID').AsInteger := Value.ID;
      open;
      FieldtoObj(Value, DmConexao.Qry);
      result := true;
      close;
    end;
end;

function TUnidadesDao.VerificarExclusao(Value: TUnidades): boolean;
begin
   result := False;
   {with DmConexao.Qry do
    begin
      sql.clear;
      Sql.Add('SELECT * FROM ESTADOS WHERE ID_Unidade = :ID_Unidade');
      paramByName('ID_Unidade').AsInteger := Value.id;
      open;
      if not IsEmpty then
        result := true;
      close;
    end;}
end;

function TUnidadesDao.VerificarNome(Value: TUnidades): boolean;
begin
   result := False;
   with DmConexao.Qry do
    begin
      sql.clear;
      Sql.Add('SELECT * FROM Unidades WHERE DESCRICAO = :DESCRICAO AND NOT ID = :ID');
      paramByName('ID').AsInteger := Value.ID;
      paramByName('DESCRICAO').AsString := Value.Descricao;
      open;
      if not IsEmpty then
        result := true;
      close;
    end;
end;

end.
