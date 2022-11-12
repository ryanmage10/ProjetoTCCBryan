inherited Cons_Clientes: TCons_Clientes
  Caption = 'Consulta de Clientes'
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
        DataController.DataSource = ds_Clientes
        object GridPesquisaDBTableView1ID: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
        end
        object GridPesquisaDBTableView1CLIENTE: TcxGridDBColumn
          DataBinding.FieldName = 'CLIENTE'
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
  object ds_Clientes: TDataSource
    DataSet = dset_Clientes
    Left = 352
    Top = 272
  end
  object dset_Clientes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 416
    Top = 272
    object dset_ClientesID: TIntegerField
      FieldName = 'ID'
    end
    object dset_ClientesCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 30
    end
    object dset_ClientesCPFCNPJ: TStringField
      FieldName = 'CPFCNPJ'
    end
    object dset_ClientesDATA_INSERT: TDateField
      FieldName = 'DATA_INSERT'
    end
  end
end
