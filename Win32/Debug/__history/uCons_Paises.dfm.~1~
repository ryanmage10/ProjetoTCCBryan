inherited Cons_Paises: TCons_Paises
  Caption = 'Consulta Paises'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited GridPesquisa: TDBGrid
      Width = 500
      DataSource = ds_paises
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAIS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SIGLA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_INSERT'
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
  object ds_paises: TDataSource
    DataSet = Dset_Paises
    Left = 408
    Top = 272
  end
  object Dset_Paises: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspPaises'
    Left = 456
    Top = 272
    object Dset_PaisesID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object Dset_PaisesPAIS: TStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 50
    end
    object Dset_PaisesSIGLA: TStringField
      DisplayLabel = 'Sigla'
      FieldName = 'SIGLA'
      Size = 3
    end
    object Dset_PaisesDATA_INSERT: TDateField
      DisplayLabel = 'Data Inser'#231#227'o'
      FieldName = 'DATA_INSERT'
    end
  end
end
