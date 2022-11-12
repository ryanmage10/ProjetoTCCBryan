object dmConexao: TdmConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 203
  Width = 240
  object ConnectionConexao: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=masterkey'
      'CharacterSet=UTF8'
      'Port=3050'
      'DriverID=FB')
    TxOptions.AutoStop = False
    LoginPrompt = False
    Transaction = TransactionConexao
    Left = 32
    Top = 32
  end
  object TransactionConexao: TFDTransaction
    Options.AutoStop = False
    Connection = ConnectionConexao
    Left = 144
    Top = 32
  end
  object Qry: TFDQuery
    Connection = ConnectionConexao
    SQL.Strings = (
      'select * from paises')
    Left = 32
    Top = 96
  end
end
