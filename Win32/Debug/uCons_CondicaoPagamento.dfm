inherited Cons_CondicaoPagamento: TCons_CondicaoPagamento
  Caption = 'Consulta de Condi'#231#245'es de Pagamento'
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
        DataController.DataSource = ds_CondicaoPagamento
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
  object ds_CondicaoPagamento: TDataSource
    DataSet = dset_CondicaoPagamento
    Left = 288
    Top = 168
  end
  object dset_CondicaoPagamento: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 360
    Top = 168
    object dset_CondicaoPagamentoID: TIntegerField
      FieldName = 'ID'
    end
    object dset_CondicaoPagamentoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object dset_CondicaoPagamentoDATA_INSERT: TDateField
      FieldName = 'DATA_INSERT'
    end
  end
end
