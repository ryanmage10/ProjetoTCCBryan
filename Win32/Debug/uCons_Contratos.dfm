inherited Cons_Contratos: TCons_Contratos
  Caption = 'Consulta de Contratos'
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
        DataController.DataSource = ds_Contratos
        object GridPesquisaDBTableView1ID: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
        end
        object GridPesquisaDBTableView1CODIGODOC: TcxGridDBColumn
          DataBinding.FieldName = 'CODIGODOC'
          Width = 76
        end
        object GridPesquisaDBTableView1DESCRICAO: TcxGridDBColumn
          DataBinding.FieldName = 'DESCRICAO'
        end
        object GridPesquisaDBTableView1MOEDA: TcxGridDBColumn
          DataBinding.FieldName = 'MOEDA'
          Width = 77
        end
        object GridPesquisaDBTableView1TIPO: TcxGridDBColumn
          DataBinding.FieldName = 'TIPO'
        end
        object GridPesquisaDBTableView1VALOR: TcxGridDBColumn
          DataBinding.FieldName = 'VALOR'
        end
        object GridPesquisaDBTableView1DATA_INSERT: TcxGridDBColumn
          DataBinding.FieldName = 'DATA_INSERT'
        end
      end
    end
  end
  object dset_Contratos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 304
    Top = 256
    object dset_ContratosID: TIntegerField
      FieldName = 'ID'
    end
    object dset_ContratosCODIGODOC: TStringField
      FieldName = 'CODIGODOC'
      Size = 10
    end
    object dset_ContratosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
    object dset_ContratosMOEDA: TStringField
      FieldName = 'MOEDA'
      Size = 3
    end
    object dset_ContratosTIPO: TStringField
      FieldName = 'TIPO'
      Size = 15
    end
    object dset_ContratosVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object dset_ContratosDATA_INSERT: TDateField
      FieldName = 'DATA_INSERT'
    end
  end
  object ds_Contratos: TDataSource
    DataSet = dset_Contratos
    Left = 384
    Top = 256
  end
end
