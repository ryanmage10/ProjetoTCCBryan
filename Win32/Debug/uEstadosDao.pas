unit uEstadosDao;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Data.SqlExpr,
  Datasnap.Provider, Datasnap.DBClient, uDmConexao, uEstados, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uPaisesDao, uPaises;

type
  TEstadosDao = class(TObject)

  private
    { Private declarations }

    procedure FieldToObj(var oEstado: TEstados; Qry: TFDQuery);
    procedure ObjToField(var oEstado: TEstados; Qry: TFDQuery);
  public
    { Public declarations }

    constructor Create;
    destructor  Free;

    procedure Pesquisar(Value: string; var dset: TClientDataSet);
    function Recuperar(Var oEstado: TEstados): boolean;
    function inserir(oEstado: TEstados): boolean;
    function Alterar(oEstado: TEstados): boolean;
    function Excluir(oEstado: TEstados): boolean;
    function VerificarNome(Value: TEstados): boolean;
    function VerificarExclusao(Value: TEstados): boolean;
  end;

var
  DmEstados: TEstadosDao;

implementation

function TEstadosDao.Alterar(oEstado: TEstados): boolean;
begin
  result := False;
  with DmConexao.Qry, oEstado do
  begin
    Sql.Clear;
    sql.add('UPDATE Estados SET ESTADO = :NOME, SIGLA = :SIGLA, ID_PAIS = :ID_PAIS, ');
    Sql.Add('USER_INSERT = :USER_INSERT, USER_UPDATE = :USER_UPDATE, DATE_INSERT = :DATE_INSERT, DATE_UPDATE = :DATE_UPDATE');
    Sql.Add(' WHERE ID = :ID');
    paramByName('id').AsInteger := oEstado.Id;
    ObjToField(oEstado, DmConexao.Qry);
    ExecSql();
    result := true;
    close;
  end;
end;

constructor TEstadosDao.Create;
begin

end;

function TEstadosDao.Excluir(oEstado: TEstados): boolean;
begin
    result := False;
    with DmConexao.Qry do
    begin
      Sql.Clear;
      Sql.Add('DELETE FROM Estados WHERE ID = :ID');
      paramByName('ID').AsInteger := oEstado.ID;
      ExecSql();
      result := true;
      close;
    end;
end;

procedure TEstadosDao.FieldToObj(var oEstado: TEstados; Qry: TFDQuery);
begin
  with oEstado, Qry do
  begin
    ID := FieldByName('ID').AsInteger;
    Nome := FieldByName('ESTADO').AsString;
    UF := FieldByName('Sigla').AsString;
    DataCad := FieldByName('date_insert').AsDatetime;
    DataUltAlt := FieldByName('date_update').AsDatetime;
    user_insert := FieldByName('User_Insert').AsString;
    user_update := FieldByName('User_Update').AsString;
  end;
end;

destructor TEstadosDao.Free;
begin
end;

function TEstadosDao.inserir(oEstado: TEstados): boolean;
begin
  result := False;
  with DmConexao.Qry, oEstado do
  begin
      Sql.Clear;
      sql.add('INSERT INTO Estados (ESTADO, SIGLA, ID_PAIS, USER_INSERT, USER_UPDATE, DATE_INSERT, DATE_UPDATE)');
      Sql.add(' VALUES (:NOME, :SIGLA, :ID_PAIS, :USER_INSERT, :USER_UPDATE, :DATE_INSERT, :DATE_UPDATE)');
      ObjToField(oEstado, DmConexao.Qry);
      ExecSql();
      result := true;
      Close;
  end;
end;

procedure TEstadosDao.ObjToField(var oEstado: TEstados; Qry: TFDQuery);
begin
  with oEstado, Qry do
  begin
    paramByName('nome').AsString := Nome;
    paramByName('sigla').AsString := UF;
    paramByName('ID_pais').AsInteger:= Pais.Id;
    paramByName('User_Insert').AsString := user_insert;
    paramByName('User_Update').AsString := user_update;
    paramByName('date_insert').AsDatetime := DataCad;
    paramByName('date_update').AsDatetime := DataUltAlt;
  end;
end;

procedure TEstadosDao.Pesquisar(Value: string; Var dset: TClientDataSet);
begin
  with DmConexao.Qry do
  begin
    dset.EmptyDataSet;
    Sql.Clear;

      if Value = '' then
      begin
        Sql.Add('SELECT E.ID, E.ESTADO, E.SIGLA, P.PAIS, E.DATE_INSERT FROM ESTADOS E LEFT JOIN PAISES P ON E.ID_PAIS = P.ID');
      end
      else
      begin
        Sql.Add('SELECT E.ID, E.ESTADO, E.SIGLA, P.PAIS, E.DATE_INSERT FROM ESTADOS E LEFT JOIN PAISES P ON E.ID_PAIS = P.ID WHERE ESTADO LIKE :NOME');
        paramByName('NOME').AsString := '%' + Value + '%';
      end;
      open;
      while not eof do
      begin
        dset.Append;
        dset.FieldByName('id').AsInteger := FieldByName('id').AsInteger;
        dset.FieldByName('ESTADO').AsString := FieldByName('ESTADO').AsString;
        dset.FieldByName('sigla').AsString := FieldByName('sigla').AsString;
        dset.FieldByName('PAIS').AsString := FieldByName('PAIS').AsString;
        dset.FieldByName('DATA_INSERT').AsDateTime := FieldByName('DATE_INSERT').AsDateTime;
        dset.Post;
        next;
      end;

      close;
  end;
end;

function TEstadosDao.Recuperar(var oEstado: TEstados): boolean;
var PaisAux : TPaises;
    DaoPaises : TPaisesDao;
begin
    result := False;
    with DmConexao.Qry do
    begin
      sql.clear;
      PaisAux := TPaises.Create;
      Sql.Add('SELECT * FROM ESTADOS WHERE ID = :ID');
      paramByName('ID').AsInteger := oEstado.ID;
      open;
      FieldtoObj(oEstado, DmConexao.Qry);
      PaisAux.Id := FieldbyName('Id_pais').AsInteger;
      result := true;
      close;

      DaoPaises := TPaisesDao.Create;
      try
        DaoPaises.Recuperar(PaisAux);
        oEstado.Pais.CopiarDados(PaisAux);
      finally
        DaoPaises.Free;
        PaisAux.Free;
      end;
    end;
end;

function TEstadosDao.VerificarExclusao(Value: TEstados): boolean;
begin
   result := False;
   with DmConexao.Qry do
    begin
      sql.clear;
      Sql.Add('SELECT * FROM CIDADES WHERE ID_ESTADO = :ID_ESTADO');
      paramByName('ID_ESTADO').AsInteger := Value.ID;
      open;
      if not IsEmpty then
        result := true;
      close;
    end;
end;

function TEstadosDao.VerificarNome(Value: TEstados): boolean;
begin
   result := False;
   with DmConexao.Qry do
    begin
      sql.clear;
      Sql.Add('SELECT * FROM ESTADOS WHERE ESTADO = :ESTADO and ID_PAIS = :ID_PAIS AND NOT ID = :ID');
      paramByName('ID').AsInteger := Value.ID;
      paramByName('ESTADO').AsString := Value.Nome;
      paramByName('ID_PAIS').AsInteger := Value.Pais.ID;
      open;
      if not IsEmpty then
        result := true;
      close;
    end;
end;

end.
