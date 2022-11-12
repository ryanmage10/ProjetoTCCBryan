inherited Cons_Funcionarios: TCons_Funcionarios
  Caption = 'Consulta Funcionarios'
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
        DataController.DataSource = ds_Funcionarios
        object GridPesquisaDBTableView1ID: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
        end
        object GridPesquisaDBTableView1FUNCIONARIO: TcxGridDBColumn
          DataBinding.FieldName = 'FUNCIONARIO'
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
  object ds_Funcionarios: TDataSource
    DataSet = dset_Funcionarios
    Left = 408
    Top = 264
  end
  object dset_Funcionarios: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 328
    Top = 264
    object dset_FuncionariosID: TIntegerField
      FieldName = 'ID'
    end
    object dset_FuncionariosFUNCIONARIO: TStringField
      FieldName = 'FUNCIONARIO'
      Size = 50
    end
    object dset_FuncionariosCPFCNPJ: TStringField
      FieldName = 'CPFCNPJ'
      Size = 18
    end
    object dset_FuncionariosDATA_INSERT: TDateTimeField
      FieldName = 'DATA_INSERT'
    end
  end
end
