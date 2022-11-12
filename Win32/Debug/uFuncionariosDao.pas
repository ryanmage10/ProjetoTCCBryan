unit uFuncionariosDao;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Data.SqlExpr,
  Datasnap.Provider, Datasnap.DBClient, uDmConexao, uFuncionarios, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uPessoas, uCidades, uCidadesDao, uEmpresas, uEmpresasDao;

type
  TFuncionariosDao = class(TObject)

  private
    { Private declarations }
    constructor Create;
    destructor free;
    procedure FieldToObj(var oFuncionario: TFuncionarios; Qry: TFDQuery);
    procedure ObjToField(var oFuncionario: TFuncionarios; Qry: TFDQuery);
  public
    { Public declarations }
    procedure Pesquisar(Value: string; var dset: TClientDataSet);
    function Recuperar(Var oFuncionario: TFuncionarios): boolean;
    function inserir(oFuncionario: TFuncionarios): boolean;
    function Alterar(oFuncionario: TFuncionarios): boolean;
    function Excluir(oFuncionario: TFuncionarios): boolean;
    function VerificarCPFCNPJ(Value: TFuncionarios): boolean;
    function VerificarExclusao(Value: TFuncionarios): boolean;

  end;

var
  FuncionariosDao: TFuncionariosDao;

implementation

function TFuncionariosDao.Alterar(oFuncionario: TFuncionarios): boolean;
begin
  result := False;
  with DmConexao.Qry, oFuncionario do
  begin
    Sql.Clear;
    sql.add('UPDATE FUNCIONARIOS SET Funcionario = :Funcionario, ENDERECO = :ENDERECO, BAIRRO = :BAIRRO, CPFCNPJ = :CPFCNPJ, RGIE = :RGIE, RAZAO_SOCIAL = :RAZAO_SOCIAL, TIPO = :TIPO, ');
    sql.add('NUMERO = :NUMERO, COMPLEMENTO = :COMPLEMENTO, SEXO = :SEXO, ID_EMPRESA = :ID_EMPRESA, SALARIO = :SALARIO, ID_CIDADE = :ID_CIDADE, CEP = :CEP, TEL_FIXO = :TEL_FIXO, TEL_CEL = :TEL_CEL, DATA_NASC = :DATA_NASC, ');
    Sql.Add('USER_INSERT = :USER_INSERT, USER_UPDATE = :USER_UPDATE, DATE_INSERT = :DATE_INSERT, DATE_UPDATE = :DATE_UPDATE');
    Sql.Add(' WHERE ID = :ID');

    paramByName('id').AsInteger := oFuncionario.Id;
    ObjToField(oFuncionario, DmConexao.Qry);
    ExecSql();
    result := true;
    close;
  end;
end;

constructor TFuncionariosDao.Create;
begin
   //
end;

function TFuncionariosDao.Excluir(oFuncionario: TFuncionarios): boolean;
begin
    result := False;
    with DmConexao.Qry do
    begin
      Sql.Clear;
      Sql.Add('DELETE FROM FUNCIONARIOS WHERE ID = :ID');
      paramByName('ID').AsInteger := oFuncionario.ID;
      ExecSql();
      result := true;
      close;
    end;
end;

procedure TFuncionariosDao.FieldToObj(var oFuncionario: TFuncionarios; Qry: TFDQuery);
begin
  with oFuncionario, Qry do
  begin
    ID := FieldByName('ID').AsInteger;
    Nome        :=  FieldByName('FUNCIONARIO').AsString;
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
    Salario     :=  FieldByName('SALARIO').AsCurrency;
    DataCad := FieldByName('date_insert').AsDatetime;
    DataUltAlt := FieldByName('date_update').AsDatetime;
    user_insert := FieldByName('User_Insert').AsString;
    user_update := FieldByName('User_Update').AsString;
  end;
end;

destructor TFuncionariosDao.free;
begin
  //
end;

function TFuncionariosDao.inserir(oFuncionario: TFuncionarios): boolean;
begin
  result := False;
  with DmConexao.Qry, oFuncionario do
  begin
      Sql.Clear;
      sql.add('INSERT INTO FUNCIONARIOS (FUNCIONARIO, ENDERECO, BAIRRO, NUMERO, COMPLEMENTO, CEP, TEL_FIXO, TEL_CEL, DATA_NASC, ');
      sql.add('SEXO, CPFCNPJ, RGIE, RAZAO_SOCIAL, TIPO, ID_EMPRESA, SALARIO, ID_CIDADE, USER_INSERT,USER_UPDATE, DATE_INSERT, DATE_UPDATE)');
      Sql.add(' VALUES (:FUNCIONARIO, :ENDERECO, :BAIRRO, :NUMERO, :COMPLEMENTO, :CEP, :TEL_FIXO, :TEL_CEL, :DATA_NASC, ');
      sql.add(':SEXO, :CPFCNPJ, :RGIE, :RAZAO_SOCIAL, :TIPO, :ID_EMPRESA, :SALARIO, :ID_CIDADE, :USER_INSERT, :USER_UPDATE, :DATE_INSERT, :DATE_UPDATE)');
      ObjToField(oFuncionario, DmConexao.Qry);
      ExecSql();
      result := true;
      Close;
  end;
end;

procedure TFuncionariosDao.ObjToField(var oFuncionario: TFuncionarios; Qry: TFDQuery);
begin
  with oFuncionario, Qry do
  begin
    paramByName('FUNCIONARIO').AsString := Nome;
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
    paramByName('ID_EMPRESA').AsInteger := empresa.id;
    paramByName('SALARIO').AsCurrency := salario;
    paramByName('date_insert').AsDatetime := DataCad;
    paramByName('date_update').AsDatetime := DataUltAlt;
    paramByName('User_Insert').AsString := user_insert;
    paramByName('User_Update').AsString := user_update;
  end;
end;

procedure TFuncionariosDao.Pesquisar(Value: string; Var dset: TClientDataSet);
begin
  with DmConexao.Qry do
  begin
    dset.EmptyDataSet;
    Sql.Clear;

      if Value = '' then
      begin
        Sql.Add('SELECT ID, FUNCIONARIO, CPFCNPJ, DATE_INSERT FROM Funcionarios');
      end
      else
      begin
        Sql.Add('SELECT ID, FUNCIONARIO, CPFCNPJ, DATE_INSERT FROM Funcionarios WHERE Funcionario LIKE :NOME');
        paramByName('NOME').AsString := '%' + Value + '%';
      end;
      open;
      while not eof do
      begin
        dset.Append;
        dset.FieldByName('id').AsInteger := FieldByName('id').AsInteger;
        dset.FieldByName('Funcionario').AsString := FieldByName('Funcionario').AsString;
        dset.FieldByName('CPFCNPJ').AsString := FieldByName('CPFCNPJ').AsString;
        dset.FieldByName('DATA_INSERT').AsDateTime := FieldByName('DATE_INSERT').AsDateTime;
        dset.Post;
        next;
      end;

      close;
  end;
end;

function TFuncionariosDao.Recuperar(var oFuncionario: TFuncionarios): boolean;
var CidadeAux : TCidades;
    CidadesDao: TCidadesDao;
    EmpresaAux: TEmpresas;
    EmpresasDao: TEmpresasDao;
begin
    result := False;
    with DmConexao.Qry do
    begin
      sql.clear;
      CidadeAux := TCidades.Create;
      EmpresaAux := TEmpresas.Create;
      Sql.Add('SELECT * FROM FUNCIONARIOS WHERE ID = :ID');
      paramByName('ID').AsInteger := oFuncionario.ID;
      open;
      FieldtoObj(oFuncionario, DmConexao.Qry);
      CidadeAux.id := FieldbyName('Id_CIDADE').AsInteger;
      EmpresaAux.Id := FieldbyName('Id_Empresa').AsInteger;
      result := true;
      close;

      CidadesDao := TCidadesDao.Create;
      try
        CidadesDao.Recuperar(CidadeAux);
        oFuncionario.Cidade.CopiarDados(CidadeAux);
      finally
        CidadesDao.Free;
        CidadeAux.Free;
      end;

      EmpresasDao := TEmpresasDao.Create;
      try
        EmpresasDao.Recuperar(EmpresaAux);
        oFuncionario.Empresa.CopiarDados(EmpresaAux);
      finally
        EmpresasDao.Free;
        EmpresaAux.Free;
      end;
    end;
end;

function TFuncionariosDao.VerificarExclusao(Value: TFuncionarios): boolean;
begin
   result := False;
   {with DmConexao.Qry do
    begin
      sql.clear;
      Sql.Add('SELECT * FROM ESTADOS WHERE ID_Funcionario = :ID_Funcionario');
      paramByName('ID_Funcionario').AsInteger := Value.id;
      open;
      if not IsEmpty then
        result := true;
      close;
    end;}
end;

function TFuncionariosDao.VerificarCpfCnpj(Value: TFuncionarios): boolean;
begin
   result := False;
   with DmConexao.Qry do
    begin
      sql.clear;
      Sql.Add('SELECT * FROM FUNCIONARIOS WHERE CpfCnpj = :CpfCnpj AND NOT ID = :ID');
      paramByName('ID').AsInteger := Value.ID;
      paramByName('CpfCnpj').AsString := Value.CpfCnpj;
      open;
      if not IsEmpty then
        result := true;
      close;
    end;
end;

end.
