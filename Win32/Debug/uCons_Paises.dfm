inherited Cons_Paises: TCons_Paises
  Caption = 'Consulta Paises'
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
        DataController.DataSource = ds_paises
        object GridPesquisaDBTableView1ID: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
        end
        object GridPesquisaDBTableView1PAIS: TcxGridDBColumn
          DataBinding.FieldName = 'PAIS'
        end
        object GridPesquisaDBTableView1SIGLA: TcxGridDBColumn
          DataBinding.FieldName = 'SIGLA'
        end
        object GridPesquisaDBTableView1DATA_INSERT: TcxGridDBColumn
          DataBinding.FieldName = 'DATA_INSERT'
        end
      end
    end
  end
  object ds_paises: TDataSource
    DataSet = Dset_Paises
    Left = 408
    Top = 272
  end
  object Dset_Paises: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspPaises'
    Left = 456
    Top = 272
    object Dset_PaisesID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object Dset_PaisesPAIS: TStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 50
    end
    object Dset_PaisesSIGLA: TStringField
      DisplayLabel = 'Sigla'
      FieldName = 'SIGLA'
      Size = 3
    end
    object Dset_PaisesDATA_INSERT: TDateField
      DisplayLabel = 'Data Inser'#231#227'o'
      FieldName = 'DATA_INSERT'
    end
  end
end
