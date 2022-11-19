inherited Cons_Compras: TCons_Compras
  Caption = 'Cons_Compras'
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
        DataController.DataSource = ds_Compra
        object GridPesquisaDBTableView1ID: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
        end
        object GridPesquisaDBTableView1SERIE: TcxGridDBColumn
          DataBinding.FieldName = 'SERIE'
        end
        object GridPesquisaDBTableView1NUMERO: TcxGridDBColumn
          DataBinding.FieldName = 'NUMERO'
        end
        object GridPesquisaDBTableView1MODELO: TcxGridDBColumn
          DataBinding.FieldName = 'MODELO'
        end
        object GridPesquisaDBTableView1FORNECEDOR: TcxGridDBColumn
          DataBinding.FieldName = 'FORNECEDOR'
        end
        object GridPesquisaDBTableView1DESCRICAO: TcxGridDBColumn
          DataBinding.FieldName = 'DESCRICAO'
        end
        object GridPesquisaDBTableView1DATA_INSERT: TcxGridDBColumn
          DataBinding.FieldName = 'DATA_INSERT'
        end
      end
    end
  end
  object DSET_COMPRA: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 160
    object DSET_COMPRAID: TIntegerField
      FieldName = 'ID'
    end
    object DSET_COMPRASERIE: TStringField
      FieldName = 'SERIE'
      Size = 10
    end
    object DSET_COMPRANUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object DSET_COMPRAMODELO: TStringField
      FieldName = 'MODELO'
      Size = 5
    end
    object DSET_COMPRAFORNECEDOR: TStringField
      FieldName = 'FORNECEDOR'
      Size = 50
    end
    object DSET_COMPRADESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object DSET_COMPRADATA_INSERT: TDateField
      FieldName = 'DATA_INSERT'
    end
  end
  object ds_Compra: TDataSource
    DataSet = DSET_COMPRA
    Left = 184
    Top = 176
  end
end
