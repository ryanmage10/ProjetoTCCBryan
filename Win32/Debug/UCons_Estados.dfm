inherited Cons_Estados: TCons_Estados
  Caption = 'Consulta Estados'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    inherited btn_Pesquisar: TcxButton
      OnClick = btn_PesquisarClick
    end
    inherited btn_Novo: TcxButton
      OnClick = btn_NovoClick
    end
    inherited btn_Alterar: TcxButton
      OnClick = btn_AlterarClick
    end
    inherited btn_Excluir: TcxButton
      OnClick = btn_ExcluirClick
    end
    inherited btn_Selecionar: TcxButton
      OnClick = btn_SelecionarClick
    end
    inherited GridPesquisa: TcxGrid
      inherited GridPesquisaDBTableView1: TcxGridDBTableView
        DataController.DataSource = ds_Estados
        object GridPesquisaDBTableView1ID: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
        end
        object GridPesquisaDBTableView1ESTADO: TcxGridDBColumn
          DataBinding.FieldName = 'ESTADO'
        end
        object GridPesquisaDBTableView1SIGLA: TcxGridDBColumn
          DataBinding.FieldName = 'SIGLA'
        end
        object GridPesquisaDBTableView1DATA_INSERT: TcxGridDBColumn
          DataBinding.FieldName = 'DATA_INSERT'
        end
        object GridPesquisaDBTableView1PAIS: TcxGridDBColumn
          DataBinding.FieldName = 'PAIS'
        end
      end
    end
  end
  object ds_Estados: TDataSource
    DataSet = Dset_Estados
    Left = 400
    Top = 96
  end
  object Dset_Estados: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspEstados'
    Left = 456
    Top = 96
    object Dset_EstadosID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object Dset_EstadosESTADO: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
      Size = 50
    end
    object Dset_EstadosSIGLA: TStringField
      DisplayLabel = 'Sigla'
      FieldName = 'SIGLA'
      Size = 3
    end
    object Dset_EstadosDATA_INSERT: TDateField
      DisplayLabel = 'Data Inser'#231#227'o'
      FieldName = 'DATA_INSERT'
    end
    object Dset_EstadosPAIS: TStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 50
    end
  end
end
