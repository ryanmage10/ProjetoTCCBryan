unit uContratosDao;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Data.SqlExpr,
  Datasnap.Provider, Datasnap.DBClient, uDmConexao, uContratos, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uEmpresas, uEmpresasDao,
  uFornecedores, uFornecedoresDao, uClientes, uClientesDao;

type
  TContratosDao = class(TObject)

  private
    { Private declarations }
    constructor Create;
    destructor free;
    procedure FieldToObj(var oContrato: TContratos; Qry: TFDQuery);
    procedure ObjToField(var oContrato: TContratos; Qry: TFDQuery);
  public
    { Public declarations }
    procedure Pesquisar(Value: string; var dset: TClientDataSet);
    function Recuperar(Var oContrato: TContratos): boolean;
    function inserir(oContrato: TContratos): boolean;
    function Alterar(oContrato: TContratos): boolean;
    function Excluir(oContrato: TContratos): boolean;
    function VerificarNome(Value: TContratos): boolean;
    function VerificarExclusao(Value: TContratos): boolean;

  end;

var
  ContratosDao: TContratosDao;

implementation

function TContratosDao.Alterar(oContrato: TContratos): boolean;
begin
  result := False;
  with DmConexao.Qry, oContrato do
  begin
    Sql.Clear;
    sql.add('UPDATE Contratos SET CODIGODOC = :CODIGODOC, DESCRICAO = :DESCRICAO, MOEDA = :MOEDA, ID_EMPRESA = :ID_EMPRESA, ');
    sql.add(' ID_CLIENTE = :ID_CLIENTE, ID_FORNECEDOR = :ID_FORNECEDOR, VALOR = :VALOR, TIPO = :TIPO,');
    Sql.Add('USER_INSERT = :USER_INSERT, USER_UPDATE = :USER_UPDATE, DATE_INSERT = :DATE_INSERT, DATE_UPDATE = :DATE_UPDATE');
    Sql.Add(' WHERE ID = :ID');

    paramByName('id').AsInteger := oContrato.Id;
    ObjToField(oContrato, DmConexao.Qry);
    ExecSql();
    result := true;
    close;
  end;
end;

constructor TContratosDao.Create;
begin
   //
end;

function TContratosDao.Excluir(oContrato: TContratos): boolean;
begin
    result := False;
    with DmConexao.Qry do
    begin
      Sql.Clear;
      Sql.Add('DELETE FROM CONTRATOS WHERE ID = :ID');
      paramByName('ID').AsInteger := oContrato.ID;
      ExecSql();
      result := true;
      close;
    end;
end;

procedure TContratosDao.FieldToObj(var oContrato: TContratos; Qry: TFDQuery);
begin
  with oContrato, Qry do
  begin
    ID := FieldByName('ID').AsInteger;
    CodigoDoc := FieldByName('CODIGODOC').AsString;
    Descricao := FieldByName('DESCRICAO').AsString;
    Moeda := FieldByName('MOEDA').AsString;
    Valor := FieldByName('Valor').AsCurrency;
    Tipo := TTipoContrato(FieldByName('TIPO').AsInteger);
    DataCad := FieldByName('date_insert').AsDatetime;
    DataUltAlt := FieldByName('date_update').AsDatetime;
    user_insert := FieldByName('User_Insert').AsString;
    user_update := FieldByName('User_Update').AsString;
  end;
end;

destructor TContratosDao.free;
begin
  //
end;

function TContratosDao.inserir(oContrato: TContratos): boolean;
begin
  result := False;
  with DmConexao.Qry, oContrato do
  begin
      Sql.Clear;
      sql.add('INSERT INTO Contratos (CODIGODOC, DESCRICAO, MOEDA, ID_EMPRESA, ID_CLIENTE, ID_FORNECEDOR, VALOR, TIPO, USER_INSERT, USER_UPDATE, DATE_INSERT, DATE_UPDATE)');
      Sql.add(' VALUES (:CODIGODOC, :DESCRICAO, :MOEDA, :ID_EMPRESA, :ID_CLIENTE, :ID_FORNECEDOR, :VALOR, :TIPO, :USER_INSERT, :USER_UPDATE, :DATE_INSERT, :DATE_UPDATE)');

      ObjToField(oContrato, DmConexao.Qry);
      ExecSql();
      result := true;
      Close;
  end;
end;

procedure TContratosDao.ObjToField(var oContrato: TContratos; Qry: TFDQuery);
begin
  with oContrato, Qry do
  begin
    parambyName('CODIGODOC').AsString := CodigoDoc;
    paramByName('DESCRICAO').AsString := Descricao;
    paramByName('MOEDA').AsString := Moeda;
    paramByName('Valor').AsCurrency := Valor;
    paramByName('ID_EMPRESA').Asinteger := Empresa.ID;
    paramByName('ID_FORNECEDOR').Asinteger := Fornecedor.ID;
    paramByName('ID_CLIENTE').Asinteger := Cliente.ID;
    paramByName('TIPO').Asinteger := Integer(Tipo);
    paramByName('date_insert').AsDatetime := DataCad;
    paramByName('date_update').AsDatetime := DataUltAlt;
    paramByName('User_Insert').AsString := user_insert;
    paramByName('User_Update').AsString := user_update;
  end;
end;

procedure TContratosDao.Pesquisar(Value: string; Var dset: TClientDataSet);
begin
  with DmConexao.Qry do
  begin
    dset.EmptyDataSet;
    Sql.Clear;

      if Value = '' then
      begin
        Sql.Add('SELECT ID, CODIGODOC, DESCRICAO, MOEDA, VALOR, TIPO, DATE_INSERT FROM Contratos');
      end
      else
      begin
        Sql.Add('SELECT ID, CODIGODOC, DESCRICAO, MOEDA, VALOR, TIPO, DATE_INSERT FROM Contratos WHERE Contrato LIKE :NOME');
        paramByName('NOME').AsString := '%' + Value + '%';
      end;
      open;
      while not eof do
      begin
        dset.Append;
        dset.FieldByName('id').AsInteger := FieldByName('id').AsInteger;
        dset.FieldByName('CODIGODOC').AsString := FieldByName('CODIGODOC').AsString;
        dset.FieldByName('DESCRICAO').AsString := FieldByName('DESCRICAO').AsString;
        dset.FieldByName('MOEDA').AsString := FieldByName('MOEDA').AsString;
        dset.FieldByName('VALOR').AsCurrency := FieldByName('VALOR').AsCurrency;
        if FieldByName('TIPO').AsInteger = 0 then
           dset.FieldByName('tipo').AsString := 'A Receber'
        else
           dset.FieldByName('tipo').AsString := 'A Pagar';

        dset.FieldByName('DATA_INSERT').AsDateTime := FieldByName('DATE_INSERT').AsDateTime;
        dset.Post;
        next;
      end;

      close;
  end;
end;

function TContratosDao.Recuperar(var oContrato: TContratos): boolean;
var EmpresaAux : TEmpresas;
    DaoEmpresas : TEmpresasDao;
    ClienteAux : TClientes;
    DaoClientes : TClientesDao;
    FornecedorAux : TFornecedores;
    DaoFornecedores : TFornecedoresDao;
begin
    result := False;
    with DmConexao.Qry do
    begin
      sql.clear;
      EmpresaAux := TEmpresas.Create;
      ClienteAux := TClientes.Create;
      FornecedorAux := TFornecedores.Create;
      Sql.Add('SELECT * FROM Contratos WHERE ID = :ID');
      paramByName('ID').AsInteger := oContrato.ID;
      open;
      FieldtoObj(oContrato, DmConexao.Qry);
      EmpresaAux.id := FieldByName('id_empresa').AsInteger;
      ClienteAux.id := FieldByName('id_Cliente').AsInteger;
      FornecedorAux.id := FieldByName('id_Fornecedor').AsInteger;
      result := true;
      close;

      DaoEmpresas := TEmpresasDao.Create;
      try
        DaoEmpresas.Recuperar(EmpresaAux);
        oContrato.Empresa.CopiarDados(EmpresaAux);
      finally
        DaoEmpresas.Free;
        EmpresaAux.Free;
      end;

      if ClienteAux.id > 0 then
      begin
        DaoClientes := TClientesDao.Create;
        try
          DaoClientes.Recuperar(ClienteAux);
          oContrato.Cliente.CopiarDados(ClienteAux);
        finally
          DaoClientes.Free;
          ClienteAux.Free;
        end;
      end;

      if FornecedorAux.id > 0 then
      begin
        DaoFornecedores := TFornecedoresDao.Create;
        try
          DaoFornecedores.Recuperar(FornecedorAux);
          oContrato.Fornecedor.CopiarDados(FornecedorAux);
        finally
          DaoFornecedores.Free;
          FornecedorAux.Free;
        end;
      end;
    end;
end;

function TContratosDao.VerificarExclusao(Value: TContratos): boolean;
begin
   result := False;
   {with DmConexao.Qry do
    begin
      sql.clear;
      Sql.Add('SELECT * FROM ESTADOS WHERE ID_Contrato = :ID_Contrato');
      paramByName('ID_Contrato').AsInteger := Value.id;
      open;
      if not IsEmpty then
        result := true;
      close;
    end;}
end;

function TContratosDao.VerificarNome(Value: TContratos): boolean;
begin
   result := False;
   with DmConexao.Qry do
    begin
      sql.clear;
      Sql.Add('SELECT * FROM Contratos WHERE CODIGODOC = :CODIGODOC AND NOT ID = :ID');
      paramByName('ID').AsInteger := Value.ID;
      paramByName('CODIGODOC').AsString := Value.CodigoDoc;
      open;
      if not IsEmpty then
        result := true;
      close;
    end;
end;

end.
