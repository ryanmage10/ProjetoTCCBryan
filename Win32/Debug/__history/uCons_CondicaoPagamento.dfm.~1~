inherited Cons_CondicaoPagamento: TCons_CondicaoPagamento
  Caption = 'Consulta de Condi'#231#245'es de Pagamento'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited GridPesquisa: TDBGrid
      DataSource = ds_CondicaoPagamento
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
  object ds_CondicaoPagamento: TDataSource
    DataSet = dset_CondicaoPagamento
    Left = 288
    Top = 168
  end
  object dset_CondicaoPagamento: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 360
    Top = 168
    object dset_CondicaoPagamentoID: TIntegerField
      FieldName = 'ID'
    end
    object dset_CondicaoPagamentoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object dset_CondicaoPagamentoDATA_INSERT: TDateField
      FieldName = 'DATA_INSERT'
    end
  end
end
