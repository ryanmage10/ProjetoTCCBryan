unit uPaisesDao;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Data.SqlExpr,
  Datasnap.Provider, Datasnap.DBClient, uDmConexao, uPaises, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPaisesDao = class(TObject)

  private
    { Private declarations }
    constructor Create;
    destructor free;
    procedure FieldToObj(var oPais: TPaises; Qry: TFDQuery);
    procedure ObjToField(var oPais: TPaises; Qry: TFDQuery);
  public
    { Public declarations }
    procedure Pesquisar(Value: string; var dset: TClientDataSet);
    function Recuperar(Var oPais: TPaises): boolean;
    function inserir(oPais: TPaises): boolean;
    function Alterar(oPais: TPaises): boolean;
    function Excluir(oPais: TPaises): boolean;
    function VerificarNome(Value: TPaises): boolean;
    function VerificarExclusao(Value: TPaises): boolean;

  end;

var
  PaisesDao: TPaisesDao;

implementation

function TPaisesDao.Alterar(oPais: TPaises): boolean;
begin
  result := False;
  with DmConexao.Qry, oPais do
  begin
    Sql.Clear;
    sql.add('UPDATE PAISES SET PAIS = :NOME, SIGLA = :SIGLA, DDI = :DDI, ');
    Sql.Add('USER_INSERT = :USER_INSERT, USER_UPDATE = :USER_UPDATE, DATE_INSERT = :DATE_INSERT, DATE_UPDATE = :DATE_UPDATE');
    Sql.Add(' WHERE ID = :ID');

    paramByName('id').AsInteger := oPais.Id;
    ObjToField(oPais, DmConexao.Qry);
    ExecSql();
    result := true;
    close;
  end;
end;

constructor TPaisesDao.Create;
begin
   //
end;

function TPaisesDao.Excluir(oPais: TPaises): boolean;
begin
    result := False;
    with DmConexao.Qry do
    begin
      Sql.Clear;
      Sql.Add('DELETE FROM PAISES WHERE ID = :ID');
      paramByName('ID').AsInteger := oPais.ID;
      ExecSql();
      result := true;
      close;
    end;
end;

procedure TPaisesDao.FieldToObj(var oPais: TPaises; Qry: TFDQuery);
begin
  with oPais, Qry do
  begin
    ID := FieldByName('ID').AsInteger;
    Nome := FieldByName('pais').AsString;
    Sigla := FieldByName('Sigla').AsString;
    DDI := FieldByName('DDI').AsString;
    DataCad := FieldByName('date_insert').AsDatetime;
    DataUltAlt := FieldByName('date_update').AsDatetime;
    user_insert := FieldByName('User_Insert').AsString;
    user_update := FieldByName('User_Update').AsString;
  end;
end;

destructor TPaisesDao.free;
begin
  //
end;

function TPaisesDao.inserir(oPais: TPaises): boolean;
begin
  result := False;
  with DmConexao.Qry, oPais do
  begin
      Sql.Clear;
      sql.add('INSERT INTO PAISES (PAIS, SIGLA, DDI, USER_INSERT,USER_UPDATE, DATE_INSERT, DATE_UPDATE)');
      Sql.add(' VALUES (:NOME, :SIGLA, :DDI, :USER_INSERT, :USER_UPDATE, :DATE_INSERT, :DATE_UPDATE)');

      ObjToField(oPais, DmConexao.Qry);
      ExecSql();
      result := true;
      Close;
  end;
end;

procedure TPaisesDao.ObjToField(var oPais: TPaises; Qry: TFDQuery);
begin
  with oPais, Qry do
  begin
    paramByName('nome').AsString := Nome;
    paramByName('sigla').AsString := Sigla;
    paramByName('DDI').AsString := DDI;
    paramByName('date_insert').AsDatetime := DataCad;
    paramByName('date_update').AsDatetime := DataUltAlt;
    paramByName('User_Insert').AsString := user_insert;
    paramByName('User_Update').AsString := user_update;
  end;
end;

procedure TPaisesDao.Pesquisar(Value: string; Var dset: TClientDataSet);
begin
  with DmConexao.Qry do
  begin
    dset.EmptyDataSet;
    Sql.Clear;

      if Value = '' then
      begin
        Sql.Add('SELECT ID, PAIS, SIGLA, DATE_INSERT FROM PAISES');
      end
      else
      begin
        Sql.Add('SELECT ID, PAIS, SIGLA, DATE_INSERT FROM PAISES WHERE PAIS LIKE :NOME');
        paramByName('NOME').AsString := '%' + Value + '%';
      end;
      open;
      while not eof do
      begin
        dset.Append;
        dset.FieldByName('id').AsInteger := FieldByName('id').AsInteger;
        dset.FieldByName('PAIS').AsString := FieldByName('PAIS').AsString;
        dset.FieldByName('sigla').AsString := FieldByName('sigla').AsString;
        dset.FieldByName('DATA_INSERT').AsDateTime := FieldByName('DATE_INSERT').AsDateTime;
        dset.Post;
        next;
      end;

      close;
  end;
end;

function TPaisesDao.Recuperar(var oPais: TPaises): boolean;
begin
    result := False;
    with DmConexao.Qry do
    begin
      sql.clear;
      Sql.Add('SELECT * FROM PAISES WHERE ID = :ID');
      paramByName('ID').AsInteger := oPais.ID;
      open;
      FieldtoObj(oPais, DmConexao.Qry);
      result := true;
      close;
    end;
end;

function TPaisesDao.VerificarExclusao(Value: TPaises): boolean;
begin
   result := False;
   with DmConexao.Qry do
    begin
      sql.clear;
      Sql.Add('SELECT * FROM ESTADOS WHERE ID_PAIS = :ID_PAIS');
      paramByName('ID_PAIS').AsInteger := Value.id;
      open;
      if not IsEmpty then
        result := true;
      close;
    end;
end;

function TPaisesDao.VerificarNome(Value: TPaises): boolean;
begin
   result := False;
   with DmConexao.Qry do
    begin
      sql.clear;
      Sql.Add('SELECT * FROM PAISES WHERE PAIS = :PAIS AND NOT ID = :ID');
      paramByName('ID').AsInteger := Value.ID;
      paramByName('PAIS').AsString := Value.Nome;
      open;
      if not IsEmpty then
        result := true;
      close;
    end;
end;

end.
