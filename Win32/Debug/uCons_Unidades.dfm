inherited Cons_Unidades: TCons_Unidades
  Caption = 'Consulta de Unidades'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    inherited btn_Pesquisar: TcxButton
      OnClick = btn_PesquisarClick
    end
    inherited btn_Novo: TcxButton
      OnClick = btn_NovoClick
    end
    inherited btn_Alterar: TcxButton
      OnClick = btn_AlterarClick
    end
    inherited btn_Excluir: TcxButton
      OnClick = btn_ExcluirClick
    end
    inherited btn_Selecionar: TcxButton
      OnClick = btn_SelecionarClick
    end
    inherited GridPesquisa: TcxGrid
      inherited GridPesquisaDBTableView1: TcxGridDBTableView
        DataController.DataSource = ds_Unidade
        object GridPesquisaDBTableView1ID: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
        end
        object GridPesquisaDBTableView1DESCRICAO: TcxGridDBColumn
          DataBinding.FieldName = 'DESCRICAO'
        end
        object GridPesquisaDBTableView1SIGLA: TcxGridDBColumn
          DataBinding.FieldName = 'SIGLA'
        end
        object GridPesquisaDBTableView1DATA_INSERT: TcxGridDBColumn
          DataBinding.FieldName = 'DATA_INSERT'
        end
      end
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
