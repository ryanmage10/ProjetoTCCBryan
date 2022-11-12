inherited Cons_FormaPagamento: TCons_FormaPagamento
  Caption = 'Consulta de Formas de Pagamento'
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
        DataController.DataSource = Ds_FormaPagamento
        object GridPesquisaDBTableView1ID: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
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
  object Dset_FormaPagamento: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 312
    Top = 192
    object Dset_FormaPagamentoID: TIntegerField
      FieldName = 'ID'
    end
    object Dset_FormaPagamentoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object Dset_FormaPagamentoDATA_INSERT: TDateField
      FieldName = 'DATA_INSERT'
    end
  end
  object Ds_FormaPagamento: TDataSource
    DataSet = Dset_FormaPagamento
    Left = 376
    Top = 192
  end
end
