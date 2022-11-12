inherited Cons_Caixas: TCons_Caixas
  Caption = 'Consulta de Caixas'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited GridPesquisa: TDBGrid
      DataSource = ds_Caixas
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CAIXA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MOEDA'
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
        Left = 100
        Top = 7
        OnClick = btn_SelecionarClick
        ExplicitLeft = 100
        ExplicitTop = 7
      end
    end
    inherited btn_Alterar: TButton
      OnClick = btn_AlterarClick
    end
    inherited btn_Pesquisar: TButton
      OnClick = btn_PesquisarClick
    end
  end
  object dset_Caixas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 320
    Top = 248
    object dset_CaixasID: TIntegerField
      FieldName = 'ID'
    end
    object dset_CaixasCAIXA: TStringField
      FieldName = 'CAIXA'
      Size = 50
    end
    object dset_CaixasMOEDA: TStringField
      FieldName = 'MOEDA'
      Size = 3
    end
    object dset_CaixasDATA_INSERT: TDateField
      FieldName = 'DATA_INSERT'
    end
  end
  object ds_Caixas: TDataSource
    DataSet = dset_Caixas
    Left = 392
    Top = 256
  end
end
