unit uDmConexao;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.SqlExpr, Data.DbxSqlite,
  Data.DBXTrace, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
   System.IniFiles, Vcl.Forms;

type
  TdmConexao = class(TDataModule)
    ConnectionConexao: TFDConnection;
    TransactionConexao: TFDTransaction;
    Qry: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmConexao: TdmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmConexao.DataModuleCreate(Sender: TObject);
var
  iniFile: TIniFile;
  localArquivo: string;
begin
  localArquivo := ExtractFilePath(Application.ExeName) + 'GT.INI';

  if (not FileExists(localArquivo)) then
  begin
    raise Exception.Create('Arquivo de configuração não encontrado!' + #13 + localArquivo);
  end;

  iniFile := TIniFile.Create(localArquivo);
  ConnectionConexao.Params.database := iniFile.ReadString('db', 'dbName', '');
  ConnectionConexao.Connected := True;

  iniFile.Free;
end;
end.
