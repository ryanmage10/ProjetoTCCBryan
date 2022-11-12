inherited Cons_Funcionarios: TCons_Funcionarios
  Caption = 'Consulta Funcionarios'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited GridPesquisa: TDBGrid
      DataSource = ds_Funcionarios
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FUNCIONARIO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CPFCNPJ'
          Title.Caption = 'CPF'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_INSERT'
          Title.Caption = 'DATA INSER'#199#195'O'
          Visible = True
        end>
    end
    inherited Panel2: TPanel
      inherited btn_Novo: TButton
        OnClick = btn_NovoClick
      end
      inherited btn_Excluir: TButton
        OnClick = btn_ExcluirClick
      end
      inherited btn_Selecionar: TButton
        OnClick = btn_SelecionarClick
      end
    end
    inherited btn_Alterar: TButton
      OnClick = btn_AlterarClick
    end
    inherited btn_Pesquisar: TButton
      OnClick = btn_PesquisarClick
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
