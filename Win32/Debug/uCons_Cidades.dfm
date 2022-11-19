inherited Cons_Cidades: TCons_Cidades
  Caption = 'Cons_Cidades'
  ClientHeight = 349
  ClientWidth = 532
  OnCreate = FormCreate
  ExplicitWidth = 548
  ExplicitHeight = 388
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 532
    Height = 349
    ExplicitWidth = 532
    ExplicitHeight = 349
    inherited Edt_Pesquisa: TcxTextEdit
      ExplicitWidth = 431
      Width = 431
    end
    inherited btn_Pesquisar: TcxButton
      Left = 447
      OnClick = btn_PesquisarClick
      ExplicitLeft = 447
    end
    inherited btn_Novo: TcxButton
      Left = 204
      Top = 314
      TabOrder = 3
      OnClick = btn_NovoClick
      ExplicitLeft = 204
      ExplicitTop = 314
    end
    inherited btn_Alterar: TcxButton
      Left = 285
      Top = 314
      TabOrder = 4
      OnClick = btn_AlterarClick
      ExplicitLeft = 285
      ExplicitTop = 314
    end
    inherited btn_Excluir: TcxButton
      Left = 366
      Top = 314
      TabOrder = 5
      OnClick = btn_ExcluirClick
      ExplicitLeft = 366
      ExplicitTop = 314
    end
    inherited btn_Sair: TcxButton
      Left = 447
      Top = 314
      TabOrder = 6
      ExplicitLeft = 447
      ExplicitTop = 314
    end
    inherited btn_Selecionar: TcxButton
      Left = 123
      Top = 314
      TabOrder = 2
      OnClick = btn_SelecionarClick
      ExplicitLeft = 123
      ExplicitTop = 314
    end
    inherited GridPesquisa: TcxGrid
      Width = 512
      Height = 253
      TabOrder = 7
      ExplicitWidth = 512
      ExplicitHeight = 253
      inherited GridPesquisaDBTableView1: TcxGridDBTableView
        DataController.DataSource = ds_Cidades
        object GridPesquisaDBTableView1ID: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
        end
        object GridPesquisaDBTableView1CIDADE: TcxGridDBColumn
          DataBinding.FieldName = 'CIDADE'
        end
        object GridPesquisaDBTableView1ESTADO: TcxGridDBColumn
          DataBinding.FieldName = 'ESTADO'
        end
        object GridPesquisaDBTableView1DATA_INSERT: TcxGridDBColumn
          DataBinding.FieldName = 'DATA_INSERT'
        end
      end
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      Index = 1
    end
    inherited dxLayoutItem1: TdxLayoutItem
      Index = 2
    end
  end
  object ds_Cidades: TDataSource
    DataSet = dset_Cidades
    Left = 408
    Top = 80
  end
  object dset_Cidades: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspCidades'
    Left = 464
    Top = 80
    object dset_CidadesID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object dset_CidadesCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Size = 50
    end
    object dset_CidadesESTADO: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
      Size = 50
    end
    object dset_CidadesDATA_INSERT: TDateField
      DisplayLabel = 'Data Inser'#231#227'o'
      FieldName = 'DATA_INSERT'
    end
  end
end
