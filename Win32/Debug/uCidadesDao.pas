unit uCidadesDao;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Data.SqlExpr,
  Datasnap.Provider, Datasnap.DBClient, uDmConexao, uCidadeS, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uEstadosDao, uEstados;

type
  TCidadesDao = class(TObject)

  private
    { Private declarations }

    procedure FieldToObj(var oCidade: TCidades; Qry: TFDQuery);
    procedure ObjToField(var oCidade: TCidades; Qry: TFDQuery);
  public
    { Public declarations }

    constructor Create;
    destructor  Free;

    procedure Pesquisar(Value: string; var dset: TClientDataSet);
    function Recuperar(Var oCidade: TCidadeS): boolean;
    function inserir(oCidade: TCidades): boolean;
    function Alterar(oCidade: TCidades): boolean;
    function Excluir(oCidade: TCidades): boolean;
    function VerificarNome(Value: TCidades): boolean;
    function VerificarExclusao(Value: TCidades): boolean;

  end;

var
  CidadesDao: TCidadesDao;

implementation

function TCidadesDao.Alterar(oCidade: TCidades): boolean;
begin
  with DmConexao.Qry, oCidade do
  begin
    Sql.Clear;
      sql.add('UPDATE CIDADES SET CIDADE = :NOME, DDD = :DDD, COD_IBGE = :COD_IBGE, ID_ESTADO = :ID_ESTADO, ');
      Sql.Add('USER_INSERT = :USER_INSERT, USER_UPDATE = :USER_UPDATE, DATE_INSERT = :DATE_INSERT, DATE_UPDATE = :DATE_UPDATE');
      Sql.Add(' WHERE ID = :ID');
      paramByName('id').AsInteger := oCidade.Id;
      ObjToField(oCidade, DmConexao.Qry);
      ExecSql();
      result := true;
      close;
  end;
end;

constructor TCidadesDao.Create;
begin

end;

function TCidadesDao.Excluir(oCidade: TCidades): boolean;
begin
    with DmConexao.Qry do
    begin
      Sql.Clear;
      Sql.Add('DELETE FROM CIDADES WHERE ID = :ID');
      paramByName('ID').AsInteger := oCidade.ID;
      ExecSql();
      result := true;
      close;
    end;
end;

procedure TCidadesDao.FieldToObj(var oCidade: TCidadeS; Qry: TFDQuery);
begin
  with oCidade, Qry do
  begin
    ID := FieldByName('ID').AsInteger;
    Nome := FieldByName('Cidade').AsString;
    DDD := FieldByName('DDD').AsString;
    CodIbge := FieldByName('Cod_Ibge').AsString;
    DataCad := FieldByName('date_insert').AsDatetime;
    DataUltAlt := FieldByName('date_update').AsDatetime;
    user_insert := FieldByName('User_Insert').AsString;
    user_update := FieldByName('User_Update').AsString;
  end;
end;

destructor TCidadesDao.Free;
begin
end;

function TCidadesDao.inserir(oCidade: TCidades): boolean;
begin
  with DmConexao.Qry, oCidade do
  begin
    Sql.Clear;
      sql.add('INSERT INTO CIDADES (Cidade, DDD, COD_IBGE, ID_ESTADO, USER_INSERT, USER_UPDATE, DATE_INSERT, DATE_UPDATE)');
      Sql.add(' VALUES (:NOME, :DDD, :COD_IBGE, :ID_ESTADO,  :USER_INSERT, :USER_UPDATE, :DATE_INSERT, :DATE_UPDATE)');
      ObjToField(oCidade, DmConexao.Qry);
      ExecSql();
      result := true;
      Close;
  end;
end;

procedure TCidadesDao.ObjToField(var oCidade: TCidadeS; Qry: TFDQuery);
begin
  with oCidade, Qry do
  begin
    paramByName('nome').AsString := Nome;
    paramByName('ID_ESTADO').AsInteger := Estado.Id;
	  paramByName('COD_IBGE').AsString := CodIbge;
	  paramByName('DDD').AsString := DDD;
    paramByName('User_Insert').AsString := user_insert;
    paramByName('User_Update').AsString := user_update;
    paramByName('date_insert').AsDatetime := DataCad;
    paramByName('date_update').AsDatetime := DataUltAlt;
  end;
end;

procedure TCidadesDao.Pesquisar(Value: string; Var dset: TClientDataSet);
begin
  with DmConexao.Qry do
  begin
    dset.EmptyDataSet;
    Sql.Clear;
      if Value = '' then
      begin
        Sql.Add('SELECT C.ID, C.CIDADE, C.DDD, C.COD_IBGE, E.ESTADO, C.DATE_INSERT FROM CIDADES C LEFT JOIN ESTADOS E ON C.ID_ESTADO = E.ID');
      end
      else
      begin
        Sql.Add('SELECT C.ID, C.CIDADE, C.DDD, C.COD_IBGE, E.ESTADO, C.DATE_INSERT FROM CIDADES C LEFT JOIN ESTADOS E ON C.ID_ESTADO = E.ID WHERE C.Cidade LIKE :NOME');
        paramByName('NOME').AsString := '%' + Value + '%';
      end;
      open;
      while not eof do
      begin
        dset.Append;
        dset.FieldByName('id').AsInteger := FieldByName('id').AsInteger;
        dset.FieldByName('Cidade').AsString := FieldByName('Cidade').AsString;
        dset.FieldByName('ESTADO').AsString := FieldByName('ESTADO').AsString;
        dset.FieldByName('DATA_INSERT').AsDateTime := FieldByName('DATE_INSERT').AsDateTime;
        dset.Post;
        next;
      end;
      close;

  end;
end;

function TCidadesDao.Recuperar(var oCidade: TCidadeS): boolean;
var EstadoAux : TEstados;
    EstadosDao : TEstadosDao;
begin
    with DmConexao.Qry do
    begin
      sql.clear;
      EstadoAux := TEstados.Create;
      Sql.Add('SELECT * FROM CIDADES WHERE ID = :ID');
      paramByName('ID').AsInteger := oCidade.ID;
      open;
      FieldtoObj(oCidade, DmConexao.Qry);
      EstadoAux.Id := FieldbyName('Id_ESTADO').AsInteger;
      result := true;
      close;


      EstadosDao := TEstadosDao.Create;
      try
        EstadosDao.Recuperar(EstadoAux);
        oCidade.Estado.CopiarDados(EstadoAux);
      finally
        EstadosDao.Free;
        EstadoAux.Free;
      end;

    end;
end;

function TCidadesDao.VerificarExclusao(Value: TCidades): boolean;
begin
   result := False;
   with DmConexao.Qry do
    begin
      sql.clear;
      Sql.Add('SELECT * FROM EMPRESAS WHERE ID_CIDADE = :ID_CIDADE');
      paramByName('ID_CIDADE').AsInteger := Value.Id;
      open;
      if not IsEmpty then
        result := true;
      close;

      if not result then
      begin
        sql.clear;
        Sql.Add('SELECT * FROM FORNECEDORES WHERE ID_CIDADE = :ID_CIDADE');
        paramByName('ID_CIDADE').AsInteger := Value.Id;
        open;
        if not IsEmpty then
          result := true;
        close;
      end;

      if not result then
      begin
        sql.clear;
        Sql.Add('SELECT * FROM CLIENTES WHERE ID_CIDADE = :ID_CIDADE');
        paramByName('ID_CIDADE').AsInteger := Value.Id;
        open;
        if not IsEmpty then
          result := true;
        close;
      end;

      if not result then
      begin
        sql.clear;
        Sql.Add('SELECT * FROM FUNCIONARIOS WHERE ID_CIDADE = :ID_CIDADE');
        paramByName('ID_CIDADE').AsInteger := Value.Id;
        open;
        if not IsEmpty then
          result := true;
        close;
      end;
    end;
end;

function TCidadesDao.VerificarNome(Value: TCidades): boolean;
begin
   result := False;
   with DmConexao.Qry do
    begin
      sql.clear;
      Sql.Add('SELECT * FROM CIDADES WHERE CIDADE = :CIDADE and ID_ESTADO = :ID_ESTADO AND NOT ID = :ID');
      paramByName('ID').AsInteger := Value.Id;
      paramByName('CIDADE').AsString := Value.Nome;
      paramByName('ID_ESTADO').AsInteger := Value.Estado.Id;
      open;
      if not IsEmpty then
        result := true;
      close;
    end;
end;

end.
