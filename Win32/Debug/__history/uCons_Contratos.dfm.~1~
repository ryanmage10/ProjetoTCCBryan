inherited Cons_Contratos: TCons_Contratos
  Caption = 'Consulta de Contratos'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited GridPesquisa: TDBGrid
      DataSource = ds_Contratos
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGODOC'
          Title.Caption = 'COD. DOC.'
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
          FieldName = 'MOEDA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
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
  object dset_Contratos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 304
    Top = 256
    object dset_ContratosID: TIntegerField
      FieldName = 'ID'
    end
    object dset_ContratosCODIGODOC: TStringField
      FieldName = 'CODIGODOC'
      Size = 10
    end
    object dset_ContratosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
    object dset_ContratosMOEDA: TStringField
      FieldName = 'MOEDA'
      Size = 3
    end
    object dset_ContratosTIPO: TStringField
      FieldName = 'TIPO'
      Size = 15
    end
    object dset_ContratosVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object dset_ContratosDATA_INSERT: TDateField
      FieldName = 'DATA_INSERT'
    end
  end
  object ds_Contratos: TDataSource
    DataSet = dset_Contratos
    Left = 384
    Top = 256
  end
end
