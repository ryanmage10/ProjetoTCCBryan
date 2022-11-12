inherited Cons_Empresas: TCons_Empresas
  Caption = 'Consulta de Empresas'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited GridPesquisa: TDBGrid
      Top = 49
      DataSource = ds_Empresas
      Columns = <
        item
          Expanded = False
          FieldName = 'id'
          Title.Caption = 'ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Empresa'
          Title.Caption = 'EMPRESA'
          Width = 187
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cpfcnpj'
          Title.Caption = 'CNPJ'
          Width = 144
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'data_insert'
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
