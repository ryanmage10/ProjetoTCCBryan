inherited Cons_Unidades: TCons_Unidades
  Caption = 'Consulta de Unidades'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited GridPesquisa: TDBGrid
      DataSource = ds_Unidade
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 288
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SIGLA'
          Title.Caption = 'Sigla'
          Width = 54
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_INSERT'
          Title.Caption = 'Data Inser'#231#227'o'
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
  object ds_Unidade: TDataSource
    DataSet = dset_Unidade
    Left = 328
    Top = 200
  end
  object dset_Unidade: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 200
    object dset_UnidadeID: TIntegerField
      FieldName = 'ID'
    end
    object dset_UnidadeDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object dset_UnidadeSIGLA: TStringField
      FieldName = 'SIGLA'
      Size = 3
    end
    object dset_UnidadeDATA_INSERT: TDateField
      FieldName = 'DATA_INSERT'
    end
  end
end
