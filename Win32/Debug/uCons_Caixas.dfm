inherited Cons_Caixas: TCons_Caixas
  Caption = 'Consulta de Caixas'
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
        DataController.DataSource = ds_Caixas
        object GridPesquisaDBTableView1ID: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
        end
        object GridPesquisaDBTableView1CAIXA: TcxGridDBColumn
          DataBinding.FieldName = 'CAIXA'
        end
        object GridPesquisaDBTableView1MOEDA: TcxGridDBColumn
          DataBinding.FieldName = 'MOEDA'
        end
        object GridPesquisaDBTableView1DATA_INSERT: TcxGridDBColumn
          DataBinding.FieldName = 'DATA_INSERT'
        end
      end
    end
  end
  object dset_Caixas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 192
    object dset_CaixasID: TIntegerField
      FieldName = 'ID'
    end
    object dset_CaixasCAIXA: TStringField
      FieldName = 'CAIXA'
      Size = 50
    end
    object dset_CaixasMOEDA: TStringField
      FieldName = 'MOEDA'
      Size = 3
    end
    object dset_CaixasDATA_INSERT: TDateField
      FieldName = 'DATA_INSERT'
    end
  end
  object ds_Caixas: TDataSource
    DataSet = dset_Caixas
    Left = 448
    Top = 192
  end
end
