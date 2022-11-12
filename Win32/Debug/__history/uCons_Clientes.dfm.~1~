inherited Cons_Clientes: TCons_Clientes
  Caption = 'Consulta de Clientes'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited GridPesquisa: TDBGrid
      DataSource = ds_Clientes
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLIENTE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CPFCNPJ'
          Title.Caption = 'CPF/CNPJ'
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
  object ds_Clientes: TDataSource
    DataSet = dset_Clientes
    Left = 352
    Top = 272
  end
  object dset_Clientes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 416
    Top = 272
    object dset_ClientesID: TIntegerField
      FieldName = 'ID'
    end
    object dset_ClientesCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 30
    end
    object dset_ClientesCPFCNPJ: TStringField
      FieldName = 'CPFCNPJ'
    end
    object dset_ClientesDATA_INSERT: TDateField
      FieldName = 'DATA_INSERT'
    end
  end
end
