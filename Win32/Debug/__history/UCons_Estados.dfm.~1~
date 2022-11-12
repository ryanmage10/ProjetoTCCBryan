inherited Cons_Estados: TCons_Estados
  Caption = 'Consulta Estados'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited GridPesquisa: TDBGrid
      Left = 4
      DataSource = ds_Estados
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTADO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SIGLA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAIS'
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
      Top = 341
      OnClick = btn_AlterarClick
      ExplicitTop = 341
    end
    inherited btn_Pesquisar: TButton
      OnClick = btn_PesquisarClick
    end
  end
  object ds_Estados: TDataSource
    DataSet = Dset_Estados
    Left = 400
    Top = 96
  end
  object Dset_Estados: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspEstados'
    Left = 456
    Top = 96
    object Dset_EstadosID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object Dset_EstadosESTADO: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
      Size = 50
    end
    object Dset_EstadosSIGLA: TStringField
      DisplayLabel = 'Sigla'
      FieldName = 'SIGLA'
      Size = 3
    end
    object Dset_EstadosDATA_INSERT: TDateField
      DisplayLabel = 'Data Inser'#231#227'o'
      FieldName = 'DATA_INSERT'
    end
    object Dset_EstadosPAIS: TStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 50
    end
  end
end
