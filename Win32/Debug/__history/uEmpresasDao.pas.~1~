unit uEmpresasDao;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Data.SqlExpr,
  Datasnap.Provider, Datasnap.DBClient, uDmConexao, uEmpresas, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uPessoas, uCidades, uCidadesDao;

type
  TEmpresasDao = class(TObject)

  private
    { Private declarations }
    constructor Create;
    destructor free;
    procedure FieldToObj(var oEmpresa: TEmpresas; Qry: TFDQuery);
    procedure ObjToField(var oEmpresa: TEmpresas; Qry: TFDQuery);
  public
    { Public declarations }
    procedure Pesquisar(Value: string; var dset: TClientDataSet);
    function Recuperar(Var oEmpresa: TEmpresas): boolean;
    function inserir(oEmpresa: TEmpresas): boolean;
    function Alterar(oEmpresa: TEmpresas): boolean;
    function Excluir(oEmpresa: TEmpresas): boolean;
    function VerificarCPFCNPJ(Value: TEmpresas): boolean;
    function VerificarExclusao(Value: TEmpresas): boolean;

  end;

var
  EmpresasDao: TEmpresasDao;

implementation

function TEmpresasDao.Alterar(oEmpresa: TEmpresas): boolean;
begin
  result := False;
  with DmConexao.Qry, oEmpresa do
  begin
    Sql.Clear;
    sql.add('UPDATE Empresas SET EMPRESA = :EMPRESA, ENDERECO = :ENDERECO, BAIRRO = :BAIRRO, CPFCNPJ = :CPFCNPJ, RGIE = :RGIE, RAZAO_SOCIAL = :RAZAO_SOCIAL, TIPO = :TIPO, ');
    sql.add('NUMERO = :NUMERO, COMPLEMENTO = :COMPLEMENTO, SEXO = :SEXO, ID_CIDADE = :ID_CIDADE, CEP = :CEP, TEL_FIXO = :TEL_FIXO, TEL_CEL = :TEL_CEL, DATA_NASC = :DATA_NASC, ');
    Sql.Add('USER_INSERT = :USER_INSERT, USER_UPDATE = :USER_UPDATE, DATE_INSERT = :DATE_INSERT, DATE_UPDATE = :DATE_UPDATE');
    Sql.Add(' WHERE ID = :ID');

    paramByName('id').AsInteger := oEmpresa.Id;
    ObjToField(oEmpresa, DmConexao.Qry);
    ExecSql();
    result := true;
    close;
  end;
end;

constructor TEmpresasDao.Create;
begin
   //
end;

function TEmpresasDao.Excluir(oEmpresa: TEmpresas): boolean;
begin
    result := False;
    with DmConexao.Qry do
    begin
      Sql.Clear;
      Sql.Add('DELETE FROM Empresas WHERE ID = :ID');
      paramByName('ID').AsInteger := oEmpresa.ID;
      ExecSql();
      result := true;
      close;
    end;
end;

procedure TEmpresasDao.FieldToObj(var oEmpresa: TEmpresas; Qry: TFDQuery);
begin
  with oEmpresa, Qry do
  begin
    ID := FieldByName('ID').AsInteger;
    Nome        :=  FieldByName('EMPRESA').AsString;
    Endereco    :=  FieldByName('ENDERECO').AsString;
    Bairro      :=  FieldByName('BAIRRO').AsString;
    Numero      :=  FieldByName('NUMERO').AsString;
    Complemento :=  FieldByName('COMPLEMENTO').AsString;
    Cep         :=  FieldByName('CEP').AsString;
    TelFixo     :=  FieldByName('TEL_FIXO').AsString;
    TelCel      :=  FieldByName('TEL_CEL').AsString;
    DtNasc      :=  FieldByName('DATA_NASC').AsDateTime;
    Sexo        :=  TSexo(FieldByName('SEXO').AsInteger);
    CpfCnpj     :=  FieldByName('CPFCNPJ').AsString;
    RgIe        :=  FieldByName('RGIE').AsString;
    RazaoSocial :=  FieldByName('RAZAO_SOCIAL').AsString;
    Tipo        :=  TTipoPessoa(FieldByName('TIPO').AsInteger);
    DataCad := FieldByName('date_insert').AsDatetime;
    DataUltAlt := FieldByName('date_update').AsDatetime;
    user_insert := FieldByName('User_Insert').AsString;
    user_update := FieldByName('User_Update').AsString;
  end;
end;

destructor TEmpresasDao.free;
begin
  //
end;

function TEmpresasDao.inserir(oEmpresa: TEmpresas): boolean;
begin
  result := False;
  with DmConexao.Qry, oEmpresa do
  begin
      Sql.Clear;
      sql.add('INSERT INTO Empresas (EMPRESA, ENDERECO, BAIRRO, NUMERO, COMPLEMENTO, CEP, TEL_FIXO, TEL_CEL, DATA_NASC, ');
      sql.add('SEXO, CPFCNPJ, RGIE, RAZAO_SOCIAL, TIPO, ID_CIDADE, USER_INSERT,USER_UPDATE, DATE_INSERT, DATE_UPDATE)');
      Sql.add(' VALUES (:EMPRESA, :ENDERECO, :BAIRRO, :NUMERO, :COMPLEMENTO, :CEP, :TEL_FIXO, :TEL_CEL, :DATA_NASC, ');
      sql.add(':SEXO, :CPFCNPJ, :RGIE, :RAZAO_SOCIAL, :TIPO, :ID_CIDADE, :USER_INSERT, :USER_UPDATE, :DATE_INSERT, :DATE_UPDATE)');
      ObjToField(oEmpresa, DmConexao.Qry);
      ExecSql();
      result := true;
      Close;
  end;
end;

procedure TEmpresasDao.ObjToField(var oEmpresa: TEmpresas; Qry: TFDQuery);
begin
  with oEmpresa, Qry do
  begin
    paramByName('EMPRESA').AsString := Nome;
    paramByName('ENDERECO').AsString := Endereco;
    paramByName('BAIRRO').AsString := Bairro;
    paramByName('NUMERO').AsString := Numero;
    paramByName('COMPLEMENTO').AsString := Complemento;
    paramByName('CEP').AsString := Cep;
    paramByName('TEL_FIXO').AsString := TelFixo;
    paramByName('TEL_CEL').AsString := TelCel;
    paramByName('DATA_NASC').AsDateTime := DtNasc;
    paramByName('SEXO').AsInteger := Integer(Sexo);
    paramByName('CPFCNPJ').AsString := CpfCnpj;
    paramByName('RGIE').AsString := RgIe;
    paramByName('RAZAO_SOCIAL').AsString := RazaoSocial;
    paramByName('TIPO').AsInteger := Integer(Tipo);
    paramByName('ID_CIDADE').AsInteger := cidade.id;
    paramByName('date_insert').AsDatetime := DataCad;
    paramByName('date_update').AsDatetime := DataUltAlt;
    paramByName('User_Insert').AsString := user_insert;
    paramByName('User_Update').AsString := user_update;
  end;
end;

procedure TEmpresasDao.Pesquisar(Value: string; Var dset: TClientDataSet);
begin
  with DmConexao.Qry do
  begin
    dset.EmptyDataSet;
    Sql.Clear;

      if Value = '' then
      begin
        Sql.Add('SELECT ID, Empresa, CPFCNPJ, DATE_INSERT FROM Empresas');
      end
      else
      begin
        Sql.Add('SELECT ID, Empresa, CPFCNPJ, DATE_INSERT FROM Empresas WHERE Empresa LIKE :NOME');
        paramByName('NOME').AsString := '%' + Value + '%';
      end;
      open;
      while not eof do
      begin
        dset.Append;
        dset.FieldByName('id').AsInteger := FieldByName('id').AsInteger;
        dset.FieldByName('Empresa').AsString := FieldByName('Empresa').AsString;
        dset.FieldByName('CPFCNPJ').AsString := FieldByName('CPFCNPJ').AsString;
        dset.FieldByName('DATA_INSERT').AsDateTime := FieldByName('DATE_INSERT').AsDateTime;
        dset.Post;
        next;
      end;

      close;
  end;
end;

function TEmpresasDao.Recuperar(var oEmpresa: TEmpresas): boolean;
var CidadeAux : TCidades;
    CidadesDao: TCidadesDao;
begin
    result := False;
    with DmConexao.Qry do
    begin
      sql.clear;
      CidadeAux := TCidades.Create;
      Sql.Add('SELECT * FROM Empresas WHERE ID = :ID');
      paramByName('ID').AsInteger := oEmpresa.ID;
      open;
      FieldtoObj(oEmpresa, DmConexao.Qry);
      CidadeAux.id := FieldbyName('Id_CIDADE').AsInteger;
      result := true;
      close;

      CidadesDao := TCidadesDao.Create;
      try
        CidadesDao.Recuperar(CidadeAux);
        oEmpresa.Cidade.CopiarDados(CidadeAux);
      finally
        CidadesDao.Free;
        CidadeAux.Free;
      end;
    end;
end;

function TEmpresasDao.VerificarExclusao(Value: TEmpresas): boolean;
begin
   result := False;
   with DmConexao.Qry do
    begin
      sql.clear;
      Sql.Add('SELECT * FROM FUNCIONARIOS WHERE ID_EMPRESA = :ID_EMPRESA');
      paramByName('ID_EMPRESA').AsInteger := Value.Id;
      open;
      if not IsEmpty then
        result := true;
      close;
    end;
end;

function TEmpresasDao.VerificarCpfCnpj(Value: TEmpresas): boolean;
begin
   result := False;
   with DmConexao.Qry do
    begin
      sql.clear;
      Sql.Add('SELECT * FROM Empresas WHERE CpfCnpj = :CpfCnpj AND NOT ID = :ID');
      paramByName('ID').AsInteger := Value.ID;
      paramByName('CpfCnpj').AsString := Value.CpfCnpj;
      open;
      if not IsEmpty then
        result := true;
      close;
    end;
end;

end.
