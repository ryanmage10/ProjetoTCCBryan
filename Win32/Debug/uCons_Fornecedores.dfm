inherited Cons_Fornecedores: TCons_Fornecedores
  Caption = 'Consulta de Fornecedores'
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
        DataController.DataSource = ds_Fornecedores
        object GridPesquisaDBTableView1ID: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
        end
        object GridPesquisaDBTableView1FORNECEDOR: TcxGridDBColumn
          DataBinding.FieldName = 'FORNECEDOR'
        end
        object GridPesquisaDBTableView1CPFCNPJ: TcxGridDBColumn
          DataBinding.FieldName = 'CPFCNPJ'
        end
        object GridPesquisaDBTableView1DATA_INSERT: TcxGridDBColumn
          DataBinding.FieldName = 'DATA_INSERT'
        end
      end
    end
  end
  object ds_Fornecedores: TDataSource
    DataSet = dset_Fornecedores
    Left = 336
    Top = 264
  end
  object dset_Fornecedores: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 416
    Top = 264
    object dset_FornecedoresID: TIntegerField
      FieldName = 'ID'
    end
    object dset_FornecedoresFORNECEDOR: TStringField
      FieldName = 'FORNECEDOR'
      Size = 30
    end
    object dset_FornecedoresCPFCNPJ: TStringField
      FieldName = 'CPFCNPJ'
    end
    object dset_FornecedoresDATA_INSERT: TDateField
      FieldName = 'DATA_INSERT'
    end
  end
end
