unit uCaixasDao;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Data.SqlExpr,
  Datasnap.Provider, Datasnap.DBClient, uDmConexao, uCaixas, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uEmpresas, uEmpresasDao;

type
  TCaixasDao = class(TObject)

  private
    { Private declarations }
    constructor Create;
    destructor free;
    procedure FieldToObj(var oCaixa: TCaixas; Qry: TFDQuery);
    procedure ObjToField(var oCaixa: TCaixas; Qry: TFDQuery);
  public
    { Public declarations }
    procedure Pesquisar(Value: string; var dset: TClientDataSet);
    function Recuperar(Var oCaixa: TCaixas): boolean;
    function inserir(oCaixa: TCaixas): boolean;
    function Alterar(oCaixa: TCaixas): boolean;
    function Excluir(oCaixa: TCaixas): boolean;
    function VerificarNome(Value: TCaixas): boolean;
    function VerificarExclusao(Value: TCaixas): boolean;

  end;

var
  CaixasDao: TCaixasDao;

implementation

function TCaixasDao.Alterar(oCaixa: TCaixas): boolean;
begin
  result := False;
  with DmConexao.Qry, oCaixa do
  begin
    Sql.Clear;
    sql.add('UPDATE Caixas SET CAIXA = :NOME, MOEDA = :MOEDA, ID_EMPRESA = :ID_EMPRESA, ');
    Sql.Add('USER_INSERT = :USER_INSERT, USER_UPDATE = :USER_UPDATE, DATE_INSERT = :DATE_INSERT, DATE_UPDATE = :DATE_UPDATE');
    Sql.Add(' WHERE ID = :ID');

    paramByName('id').AsInteger := oCaixa.Id;
    ObjToField(oCaixa, DmConexao.Qry);
    ExecSql();
    result := true;
    close;
  end;
end;

constructor TCaixasDao.Create;
begin
   //
end;

function TCaixasDao.Excluir(oCaixa: TCaixas): boolean;
begin
    result := False;
    with DmConexao.Qry do
    begin
      Sql.Clear;
      Sql.Add('DELETE FROM Caixas WHERE ID = :ID');
      paramByName('ID').AsInteger := oCaixa.ID;
      ExecSql();
      result := true;
      close;
    end;
end;

procedure TCaixasDao.FieldToObj(var oCaixa: TCaixas; Qry: TFDQuery);
begin
  with oCaixa, Qry do
  begin
    ID := FieldByName('ID').AsInteger;
    Nome := FieldByName('Caixa').AsString;
    Moeda := FieldByName('MOEDA').AsString;
    DataCad := FieldByName('date_insert').AsDatetime;
    DataUltAlt := FieldByName('date_update').AsDatetime;
    user_insert := FieldByName('User_Insert').AsString;
    user_update := FieldByName('User_Update').AsString;
  end;
end;

destructor TCaixasDao.free;
begin
  //
end;

function TCaixasDao.inserir(oCaixa: TCaixas): boolean;
begin
  result := False;
  with DmConexao.Qry, oCaixa do
  begin
      Sql.Clear;
      sql.add('INSERT INTO Caixas (Caixa, MOEDA, ID_EMPRESA, USER_INSERT,USER_UPDATE, DATE_INSERT, DATE_UPDATE)');
      Sql.add(' VALUES (:NOME, :MOEDA, :ID_EMPRESA, :USER_INSERT, :USER_UPDATE, :DATE_INSERT, :DATE_UPDATE)');

      ObjToField(oCaixa, DmConexao.Qry);
      ExecSql();
      result := true;
      Close;
  end;
end;

procedure TCaixasDao.ObjToField(var oCaixa: TCaixas; Qry: TFDQuery);
begin
  with oCaixa, Qry do
  begin
    paramByName('nome').AsString := Nome;
    paramByName('MOEDA').AsString := Moeda;
    paramByName('ID_EMPRESA').Asinteger := Empresa.ID;
    paramByName('date_insert').AsDatetime := DataCad;
    paramByName('date_update').AsDatetime := DataUltAlt;
    paramByName('User_Insert').AsString := user_insert;
    paramByName('User_Update').AsString := user_update;
  end;
end;

procedure TCaixasDao.Pesquisar(Value: string; Var dset: TClientDataSet);
begin
  with DmConexao.Qry do
  begin
    dset.EmptyDataSet;
    Sql.Clear;

      if Value = '' then
      begin
        Sql.Add('SELECT ID, Caixa, MOEDA, DATE_INSERT FROM Caixas');
      end
      else
      begin
        Sql.Add('SELECT ID, Caixa, MOEDA, DATE_INSERT FROM Caixas WHERE Caixa LIKE :NOME');
        paramByName('NOME').AsString := '%' + Value + '%';
      end;
      open;
      while not eof do
      begin
        dset.Append;
        dset.FieldByName('id').AsInteger := FieldByName('id').AsInteger;
        dset.FieldByName('Caixa').AsString := FieldByName('Caixa').AsString;
        dset.FieldByName('MOEDA').AsString := FieldByName('MOEDA').AsString;
        dset.FieldByName('DATA_INSERT').AsDateTime := FieldByName('DATE_INSERT').AsDateTime;
        dset.Post;
        next;
      end;

      close;
  end;
end;

function TCaixasDao.Recuperar(var oCaixa: TCaixas): boolean;
var EmpresaAux : TEmpresas;
    DaoEmpresas : TEmpresasDao;
begin
    result := False;
    with DmConexao.Qry do
    begin
      sql.clear;
      EmpresaAux := TEmpresas.Create;
      Sql.Add('SELECT * FROM Caixas WHERE ID = :ID');
      paramByName('ID').AsInteger := oCaixa.ID;
      open;
      FieldtoObj(oCaixa, DmConexao.Qry);
      EmpresaAux.id := FieldByName('id_empresa').AsInteger;
      result := true;
      close;

      DaoEmpresas := TEmpresasDao.Create;
      try
        DaoEmpresas.Recuperar(EmpresaAux);
        oCaixa.Empresa.CopiarDados(EmpresaAux);
      finally
        DaoEmpresas.Free;
        EmpresaAux.Free;
      end;
    end;
end;

function TCaixasDao.VerificarExclusao(Value: TCaixas): boolean;
begin
   result := False;
   {with DmConexao.Qry do
    begin
      sql.clear;
      Sql.Add('SELECT * FROM ESTADOS WHERE ID_Caixa = :ID_Caixa');
      paramByName('ID_Caixa').AsInteger := Value.id;
      open;
      if not IsEmpty then
        result := true;
      close;
    end;}
end;

function TCaixasDao.VerificarNome(Value: TCaixas): boolean;
begin
   result := False;
   with DmConexao.Qry do
    begin
      sql.clear;
      Sql.Add('SELECT * FROM Caixas WHERE Caixa = :Caixa AND MOEDA = :MOEDA AND NOT ID = :ID');
      paramByName('ID').AsInteger := Value.ID;
      paramByName('MOEDA').AsString := Value.Moeda;
      paramByName('Caixa').AsString := Value.Nome;
      open;
      if not IsEmpty then
        result := true;
      close;
    end;
end;

end.
