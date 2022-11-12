inherited Cons_FormaPagamento: TCons_FormaPagamento
  Caption = 'Consulta de Formas de Pagamento'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited GridPesquisa: TDBGrid
      DataSource = Ds_FormaPagamento
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'DESCRI'#199#195'O'
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
  object Dset_FormaPagamento: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 312
    Top = 192
    object Dset_FormaPagamentoID: TIntegerField
      FieldName = 'ID'
    end
    object Dset_FormaPagamentoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object Dset_FormaPagamentoDATA_INSERT: TDateField
      FieldName = 'DATA_INSERT'
    end
  end
  object Ds_FormaPagamento: TDataSource
    DataSet = Dset_FormaPagamento
    Left = 376
    Top = 192
  end
end
