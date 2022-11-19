unit uFornecedoresDao;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Data.SqlExpr,
  Datasnap.Provider, Datasnap.DBClient, uDmConexao, uFornecedores, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uPessoas, uCidades, uCidadesDao;

type
  TFornecedoresDao = class(TObject)

  private
    { Private declarations }
    constructor Create;
    destructor free;
    procedure FieldToObj(var oFornecedor: TFornecedores; Qry: TFDQuery);
    procedure ObjToField(var oFornecedor: TFornecedores; Qry: TFDQuery);
  public
    { Public declarations }
    procedure Pesquisar(Value: string; var dset: TClientDataSet);
    function Recuperar(Var oFornecedor: TFornecedores): boolean;
    function inserir(oFornecedor: TFornecedores): boolean;
    function Alterar(oFornecedor: TFornecedores): boolean;
    function Excluir(oFornecedor: TFornecedores): boolean;
    function VerificarCPFCNPJ(Value: TFornecedores): boolean;
    function VerificarExclusao(Value: TFornecedores): boolean;

  end;

var
  FornecedoresDao: TFornecedoresDao;

implementation

function TFornecedoresDao.Alterar(oFornecedor: TFornecedores): boolean;
begin
  result := False;
  with DmConexao.Qry, oFornecedor do
  begin
    Sql.Clear;
    sql.add('UPDATE Fornecedores SET Fornecedor = :Fornecedor, ENDERECO = :ENDERECO, BAIRRO = :BAIRRO, CPFCNPJ = :CPFCNPJ, RGIE = :RGIE, RAZAO_SOCIAL = :RAZAO_SOCIAL, TIPO = :TIPO, ');
    sql.add('NUMERO = :NUMERO, COMPLEMENTO = :COMPLEMENTO, SEXO = :SEXO, ID_CIDADE = :ID_CIDADE, CEP = :CEP, TEL_FIXO = :TEL_FIXO, TEL_CEL = :TEL_CEL, DATA_NASC = :DATA_NASC, ');
    Sql.Add('USER_INSERT = :USER_INSERT, USER_UPDATE = :USER_UPDATE, DATE_INSERT = :DATE_INSERT, DATE_UPDATE = :DATE_UPDATE');
    Sql.Add(' WHERE ID = :ID');

    paramByName('id').AsInteger := oFornecedor.Id;
    ObjToField(oFornecedor, DmConexao.Qry);
    ExecSql();
    result := true;
    close;
  end;
end;

constructor TFornecedoresDao.Create;
begin
   //
end;

function TFornecedoresDao.Excluir(oFornecedor: TFornecedores): boolean;
begin
    result := False;
    with DmConexao.Qry do
    begin
      Sql.Clear;
      Sql.Add('DELETE FROM Fornecedores WHERE ID = :ID');
      paramByName('ID').AsInteger := oFornecedor.ID;
      ExecSql();
      result := true;
      close;
    end;
end;

procedure TFornecedoresDao.FieldToObj(var oFornecedor: TFornecedores; Qry: TFDQuery);
begin
  with oFornecedor, Qry do
  begin
    ID := FieldByName('ID').AsInteger;
    Nome        :=  FieldByName('Fornecedor').AsString;
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

destructor TFornecedoresDao.free;
begin
  //
end;

function TFornecedoresDao.inserir(oFornecedor: TFornecedores): boolean;
begin
  result := False;
  with DmConexao.Qry, oFornecedor do
  begin
      Sql.Clear;
      sql.add('INSERT INTO Fornecedores (Fornecedor, ENDERECO, BAIRRO, NUMERO, COMPLEMENTO, CEP, TEL_FIXO, TEL_CEL, DATA_NASC, ');
      sql.add('SEXO, CPFCNPJ, RGIE, RAZAO_SOCIAL, TIPO, ID_CIDADE, USER_INSERT,USER_UPDATE, DATE_INSERT, DATE_UPDATE)');
      Sql.add(' VALUES (:Fornecedor, :ENDERECO, :BAIRRO, :NUMERO, :COMPLEMENTO, :CEP, :TEL_FIXO, :TEL_CEL, :DATA_NASC, ');
      sql.add(':SEXO, :CPFCNPJ, :RGIE, :RAZAO_SOCIAL, :TIPO, :ID_CIDADE, :USER_INSERT, :USER_UPDATE, :DATE_INSERT, :DATE_UPDATE)');
      ObjToField(oFornecedor, DmConexao.Qry);
      ExecSql();
      result := true;
      Close;
  end;
end;

procedure TFornecedoresDao.ObjToField(var oFornecedor: TFornecedores; Qry: TFDQuery);
begin
  with oFornecedor, Qry do
  begin
    paramByName('Fornecedor').AsString := Nome;
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

procedure TFornecedoresDao.Pesquisar(Value: string; Var dset: TClientDataSet);
begin
  with DmConexao.Qry do
  begin
    dset.EmptyDataSet;
    Sql.Clear;

      if Value = '' then
      begin
        Sql.Add('SELECT ID, Fornecedor, CPFCNPJ, DATE_INSERT FROM Fornecedores');
      end
      else
      begin
        Sql.Add('SELECT ID, Fornecedor, CPFCNPJ, DATE_INSERT FROM Fornecedores WHERE Fornecedor LIKE :NOME');
        paramByName('NOME').AsString := '%' + Value + '%';
      end;
      open;
      while not eof do
      begin
        dset.Append;
        dset.FieldByName('id').AsInteger := FieldByName('id').AsInteger;
        dset.FieldByName('Fornecedor').AsString := FieldByName('Fornecedor').AsString;
        dset.FieldByName('CPFCNPJ').AsString := FieldByName('CPFCNPJ').AsString;
        dset.FieldByName('DATA_INSERT').AsDateTime := FieldByName('DATE_INSERT').AsDateTime;
        dset.Post;
        next;
      end;

      close;
  end;
end;

function TFornecedoresDao.Recuperar(var oFornecedor: TFornecedores): boolean;
var CidadeAux : TCidades;
    CidadesDao: TCidadesDao;
begin
    result := False;
    with DmConexao.Qry do
    begin
      sql.clear;
      CidadeAux := TCidades.Create;
      Sql.Add('SELECT * FROM Fornecedores WHERE ID = :ID');
      paramByName('ID').AsInteger := oFornecedor.ID;
      open;
      FieldtoObj(oFornecedor, DmConexao.Qry);
      CidadeAux.id := FieldbyName('Id_CIDADE').AsInteger;
      result := true;
      close;

      CidadesDao := TCidadesDao.Create;
      try
        CidadesDao.Recuperar(CidadeAux);
        oFornecedor.Cidade.CopiarDados(CidadeAux);
      finally
        CidadesDao.Free;
        CidadeAux.Free;
      end;
    end;
end;

function TFornecedoresDao.VerificarExclusao(Value: TFornecedores): boolean;
begin
   result := False;
   {with DmConexao.Qry do
    begin
      sql.clear;
      Sql.Add('SELECT * FROM ESTADOS WHERE ID_Fornecedor = :ID_Fornecedor');
      paramByName('ID_Fornecedor').AsInteger := Value.id;
      open;
      if not IsEmpty then
        result := true;
      close;
    end;}
end;

function TFornecedoresDao.VerificarCpfCnpj(Value: TFornecedores): boolean;
begin
   result := False;
   with DmConexao.Qry do
    begin
      sql.clear;
      Sql.Add('SELECT * FROM Fornecedores WHERE CpfCnpj = :CpfCnpj AND NOT ID = :ID');
      paramByName('ID').AsInteger := Value.ID;
      paramByName('CpfCnpj').AsString := Value.CpfCnpj;
      open;
      if not IsEmpty then
        result := true;
      close;
    end;
end;

end.
