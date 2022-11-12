inherited Cons_Fornecedores: TCons_Fornecedores
  Caption = 'Consulta de Fornecedores'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited GridPesquisa: TDBGrid
      DataSource = ds_Fornecedores
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FORNECEDOR'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CPFCNPJ'
          Title.Caption = 'CPF/CNPJ'
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
      Top = 17
      OnClick = btn_PesquisarClick
      ExplicitTop = 17
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
