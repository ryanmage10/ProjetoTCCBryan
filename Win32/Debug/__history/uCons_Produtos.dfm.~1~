inherited Cons_Produtos: TCons_Produtos
  Caption = 'Consulta Produtos'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited GridPesquisa: TDBGrid
      DataSource = ds_produtos
      Columns = <
        item
          Expanded = False
          FieldName = 'id'
          Title.Caption = 'ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Title.Caption = 'DESCRI'#199#195'O'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'codigo'
          Title.Caption = 'C'#211'DIGO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'unidade'
          Title.Caption = 'UNIDADE'
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
  object ds_produtos: TDataSource
    DataSet = dset_produtos
    Left = 424
    Top = 152
  end
  object dset_produtos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 424
    Top = 224
    object dset_produtosid: TIntegerField
      FieldName = 'id'
    end
    object dset_produtosdescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
    object dset_produtoscodigo: TStringField
      FieldName = 'codigo'
      Size = 10
    end
    object dset_produtosunidade: TStringField
      FieldName = 'unidade'
      Size = 50
    end
    object dset_produtosdata_insert: TDateTimeField
      FieldName = 'data_insert'
    end
  end
end
