inherited Cons_Empresas: TCons_Empresas
  Caption = 'Consulta de Empresas'
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
        DataController.DataSource = ds_Empresas
        object GridPesquisaDBTableView1id: TcxGridDBColumn
          DataBinding.FieldName = 'id'
        end
        object GridPesquisaDBTableView1Empresa: TcxGridDBColumn
          DataBinding.FieldName = 'Empresa'
        end
        object GridPesquisaDBTableView1cpfcnpj: TcxGridDBColumn
          DataBinding.FieldName = 'cpfcnpj'
        end
        object GridPesquisaDBTableView1data_insert: TcxGridDBColumn
          DataBinding.FieldName = 'data_insert'
        end
      end
    end
  end
  object dset_Empresas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 320
    Top = 272
    object dset_Empresasid: TIntegerField
      FieldName = 'id'
    end
    object dset_EmpresasEmpresa: TStringField
      FieldName = 'Empresa'
    end
    object dset_Empresascpfcnpj: TStringField
      FieldName = 'cpfcnpj'
    end
    object dset_Empresasdata_insert: TDateField
      FieldName = 'data_insert'
    end
  end
  object ds_Empresas: TDataSource
    DataSet = dset_Empresas
    Left = 432
    Top = 272
  end
end
