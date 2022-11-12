inherited Cons_Produtos: TCons_Produtos
  Caption = 'Consulta Produtos'
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
        DataController.DataSource = ds_produtos
        object GridPesquisaDBTableView1id: TcxGridDBColumn
          DataBinding.FieldName = 'id'
        end
        object GridPesquisaDBTableView1descricao: TcxGridDBColumn
          DataBinding.FieldName = 'descricao'
        end
        object GridPesquisaDBTableView1codigo: TcxGridDBColumn
          DataBinding.FieldName = 'codigo'
        end
        object GridPesquisaDBTableView1unidade: TcxGridDBColumn
          DataBinding.FieldName = 'unidade'
        end
        object GridPesquisaDBTableView1data_insert: TcxGridDBColumn
          DataBinding.FieldName = 'data_insert'
        end
      end
    end
  end
  object ds_produtos: TDataSource
    DataSet = dset_produtos
    Left = 424
    Top = 152
  end
  object dset_produtos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 424
    Top = 224
    object dset_produtosid: TIntegerField
      FieldName = 'id'
    end
    object dset_produtosdescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
    object dset_produtoscodigo: TStringField
      FieldName = 'codigo'
      Size = 10
    end
    object dset_produtosunidade: TStringField
      FieldName = 'unidade'
      Size = 50
    end
    object dset_produtosdata_insert: TDateTimeField
      FieldName = 'data_insert'
    end
  end
end
