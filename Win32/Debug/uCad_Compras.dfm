inherited Cad_Compras: TCad_Compras
  Caption = 'Cadastro de Compras'
  ClientHeight = 506
  ClientWidth = 774
  OnCreate = FormCreate
  ExplicitWidth = 790
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 774
    Height = 506
    ExplicitWidth = 774
    ExplicitHeight = 506
    inherited btn_Salvar: TcxButton
      Left = 591
      Top = 739
      TabOrder = 29
      ExplicitLeft = 591
      ExplicitTop = 739
    end
    inherited btn_Cancelar: TcxButton
      Left = 672
      Top = 739
      TabOrder = 30
      ExplicitLeft = 672
      ExplicitTop = 739
    end
    inherited Lbl_Alt: TcxLabel
      Top = 758
      ExplicitTop = 758
    end
    inherited lbl_Cad: TcxLabel
      Top = 739
      ExplicitTop = 739
    end
    inherited lbl_DataCad: TcxLabel
      Top = 739
      ExplicitTop = 739
    end
    inherited lbl_DataAlt: TcxLabel
      Top = 758
      ExplicitTop = 758
    end
    object edt_CodFornecedor: TcxTextEdit [7]
      Left = 237
      Top = 75
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 4
      Width = 60
    end
    object edt_Fornecedor: TcxTextEdit [8]
      Left = 303
      Top = 75
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 5
      Width = 226
    end
    object edt_DataChegada: TcxDateEdit [9]
      Left = 115
      Top = 121
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 8
      Width = 115
    end
    object edt_DataEmissao: TcxDateEdit [10]
      Left = 10
      Top = 121
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 7
      Width = 99
    end
    object edt_Frete: TcxCurrencyEdit [11]
      Left = 236
      Top = 121
      Style.BorderColor = clSkyBlue
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 9
      Width = 82
    end
    object edt_Despesas: TcxCurrencyEdit [12]
      Left = 413
      Top = 121
      Style.BorderColor = clSkyBlue
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 11
      Width = 121
    end
    object edt_Pedagio: TcxCurrencyEdit [13]
      Left = 324
      Top = 121
      Style.BorderColor = clSkyBlue
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 10
      Width = 83
    end
    object btn_PesquisarForn: TcxButton [14]
      Left = 535
      Top = 71
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 6
      OnClick = btn_PesquisarFornClick
    end
    object edt_CodProduto: TcxTextEdit [15]
      Left = 22
      Top = 185
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 12
      Width = 51
    end
    object edt_Produto: TcxTextEdit [16]
      Left = 79
      Top = 185
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 13
      Width = 98
    end
    object edt_UnidProduto: TcxTextEdit [17]
      Left = 183
      Top = 185
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 14
      Width = 54
    end
    object btn_PesquisarProd: TcxButton [18]
      Left = 243
      Top = 181
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 15
    end
    object edt_Qtd: TEdit [19]
      Left = 325
      Top = 186
      Width = 40
      Height = 17
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvSpace
      BorderStyle = bsNone
      TabOrder = 16
    end
    object Edt_Valor: TcxCurrencyEdit [20]
      Left = 372
      Top = 185
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 17
      Width = 68
    end
    object edt_Total: TcxCurrencyEdit [21]
      Left = 446
      Top = 185
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 18
      Width = 78
    end
    object Grid_ItensProduto: TcxGrid [22]
      Left = 22
      Top = 212
      Width = 713
      Height = 200
      TabOrder = 22
      object Grid_ItensProdutoDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.DataSource = DS_ITENS
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
        object Grid_ItensProdutoDBTableView1CODPRODUTO: TcxGridDBColumn
          DataBinding.FieldName = 'CODPRODUTO'
        end
        object Grid_ItensProdutoDBTableView1PRODUTO: TcxGridDBColumn
          DataBinding.FieldName = 'PRODUTO'
        end
        object Grid_ItensProdutoDBTableView1UND: TcxGridDBColumn
          DataBinding.FieldName = 'UND'
        end
        object Grid_ItensProdutoDBTableView1QTD: TcxGridDBColumn
          DataBinding.FieldName = 'QTD'
        end
        object Grid_ItensProdutoDBTableView1PRECO: TcxGridDBColumn
          DataBinding.FieldName = 'PRECO'
        end
        object Grid_ItensProdutoDBTableView1TOTAL: TcxGridDBColumn
          DataBinding.FieldName = 'TOTAL'
        end
        object Grid_ItensProdutoDBTableView1DESC: TcxGridDBColumn
          DataBinding.FieldName = 'DESC'
        end
        object Grid_ItensProdutoDBTableView1CUSTO: TcxGridDBColumn
          DataBinding.FieldName = 'CUSTO'
        end
      end
      object Grid_ItensProdutoLevel1: TcxGridLevel
        GridView = Grid_ItensProdutoDBTableView1
      end
    end
    object edt_TotalLiquido: TcxCurrencyEdit [23]
      Left = 620
      Top = 418
      Properties.ReadOnly = True
      Style.BorderColor = clSkyBlue
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 23
      Width = 115
    end
    object edt_CodCondicaoPag: TcxTextEdit [24]
      Left = 22
      Top = 494
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 24
      Width = 66
    end
    object edt_CondicaoPag: TcxTextEdit [25]
      Left = 94
      Top = 494
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 25
      Width = 259
    end
    object btn_PesquisarCond: TButton [26]
      Left = 359
      Top = 490
      Width = 89
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 26
      OnClick = btn_PesquisarCondClick
    end
    object btn_GerarParcelas: TcxButton [27]
      Left = 454
      Top = 490
      Width = 91
      Height = 25
      Caption = 'Gerar Parcelas'
      TabOrder = 27
    end
    object Grid_Parcelas: TcxGrid [28]
      Left = 22
      Top = 521
      Width = 713
      Height = 200
      TabOrder = 28
      object Grid_ParcelasDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.DataSource = DS_PARCELAS
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
        object Grid_ParcelasDBTableView1NUMPARCELA: TcxGridDBColumn
          DataBinding.FieldName = 'NUMPARCELA'
          Width = 86
        end
        object Grid_ParcelasDBTableView1VENCIMENTO: TcxGridDBColumn
          DataBinding.FieldName = 'VENCIMENTO'
          Width = 84
        end
        object Grid_ParcelasDBTableView1VALOR: TcxGridDBColumn
          DataBinding.FieldName = 'VALOR'
          Width = 86
        end
        object Grid_ParcelasDBTableView1FORMAPGTO: TcxGridDBColumn
          DataBinding.FieldName = 'FORMAPGTO'
        end
      end
      object Grid_ParcelasLevel1: TcxGridLevel
        GridView = Grid_ParcelasDBTableView1
      end
    end
    object edt_Serie: TEdit [29]
      Left = 66
      Top = 76
      Width = 42
      Height = 17
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvSpace
      BorderStyle = bsNone
      NumbersOnly = True
      TabOrder = 2
    end
    object edt_Numero: TEdit [30]
      Left = 116
      Top = 76
      Width = 114
      Height = 19
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvSpace
      BorderStyle = bsNone
      NumbersOnly = True
      TabOrder = 3
    end
    object edt_Modelo: TEdit [31]
      Left = 11
      Top = 76
      Width = 47
      Height = 19
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvSpace
      BorderStyle = bsNone
      NumbersOnly = True
      TabOrder = 1
    end
    object btn_Inserir: TcxButton [32]
      Left = 530
      Top = 181
      Width = 66
      Height = 25
      Caption = 'Inserir'
      TabOrder = 19
    end
    object btn_Alterar: TcxButton [33]
      Left = 602
      Top = 181
      Width = 62
      Height = 25
      Caption = 'Alterar'
      TabOrder = 20
    end
    object btn_Excluir: TcxButton [34]
      Left = 670
      Top = 181
      Width = 63
      Height = 25
      Caption = 'Excluir'
      TabOrder = 21
    end
    inherited dxLayoutControl1Group_Root: TdxLayoutGroup
      ItemIndex = 4
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      ItemIndex = 1
      Index = 5
    end
    object dxLayoutGroup6: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = 'New Group'
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup7: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = 'New Group'
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 2
    end
    object dxLayoutGroup8: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      Index = 3
    end
    object dxLayoutGroup9: TdxLayoutGroup
      Parent = dxLayoutGroup8
      CaptionOptions.Text = 'New Group'
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup10: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      ItemIndex = 1
      Index = 4
    end
    object dxLayoutGroup11: TdxLayoutGroup
      Parent = dxLayoutGroup10
      CaptionOptions.Text = 'New Group'
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem12: TdxLayoutItem
      Parent = dxLayoutGroup6
      LayoutLookAndFeel = LayoutObrigatorio
      CaptionOptions.Text = 'C'#243'd. Forn*'
      CaptionOptions.Layout = clTop
      Control = edt_CodFornecedor
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 60
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem13: TdxLayoutItem
      Parent = dxLayoutGroup6
      LayoutLookAndFeel = LayoutObrigatorio
      CaptionOptions.Text = 'Fornecedor*'
      CaptionOptions.Layout = clTop
      Control = edt_Fornecedor
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 226
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem14: TdxLayoutItem
      Parent = dxLayoutGroup7
      LayoutLookAndFeel = LayoutObrigatorio
      CaptionOptions.Text = 'Data Chegada*'
      CaptionOptions.Layout = clTop
      Control = edt_DataChegada
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 115
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem15: TdxLayoutItem
      Parent = dxLayoutGroup7
      LayoutLookAndFeel = LayoutObrigatorio
      CaptionOptions.Text = 'Data Emiss'#227'o*'
      CaptionOptions.Layout = clTop
      Control = edt_DataEmissao
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 99
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem16: TdxLayoutItem
      Parent = dxLayoutGroup7
      CaptionOptions.Text = 'Frete'
      CaptionOptions.Layout = clTop
      Control = edt_Frete
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 82
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem17: TdxLayoutItem
      Parent = dxLayoutGroup7
      CaptionOptions.Text = 'Outras Despesas'
      CaptionOptions.Layout = clTop
      Control = edt_Despesas
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem18: TdxLayoutItem
      Parent = dxLayoutGroup7
      CaptionOptions.Text = 'P'#233'dagio'
      CaptionOptions.Layout = clTop
      Control = edt_Pedagio
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 83
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem19: TdxLayoutItem
      Parent = dxLayoutGroup6
      Offsets.Top = 15
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = btn_PesquisarForn
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem20: TdxLayoutItem
      Parent = dxLayoutGroup9
      LayoutLookAndFeel = LayoutObrigatorio
      CaptionOptions.Text = 'C'#243'digo*'
      CaptionOptions.Layout = clTop
      Control = edt_CodProduto
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 51
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem21: TdxLayoutItem
      Parent = dxLayoutGroup9
      LayoutLookAndFeel = LayoutObrigatorio
      CaptionOptions.Text = 'Produto*'
      CaptionOptions.Layout = clTop
      Control = edt_Produto
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 98
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem22: TdxLayoutItem
      Parent = dxLayoutGroup9
      LayoutLookAndFeel = LayoutObrigatorio
      CaptionOptions.Text = 'Unidade*'
      CaptionOptions.Layout = clTop
      Control = edt_UnidProduto
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 54
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem23: TdxLayoutItem
      Parent = dxLayoutGroup9
      Offsets.Top = 15
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = btn_PesquisarProd
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem24: TdxLayoutItem
      Parent = dxLayoutGroup9
      LayoutLookAndFeel = LayoutObrigatorio
      CaptionOptions.Text = 'Qtd*'
      CaptionOptions.Layout = clTop
      Control = edt_Qtd
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 40
      Index = 4
    end
    object dxLayoutItem25: TdxLayoutItem
      Parent = dxLayoutGroup9
      LayoutLookAndFeel = LayoutObrigatorio
      CaptionOptions.Text = 'Valor*'
      CaptionOptions.Layout = clTop
      Control = Edt_Valor
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 68
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem26: TdxLayoutItem
      Parent = dxLayoutGroup9
      LayoutLookAndFeel = LayoutObrigatorio
      CaptionOptions.Text = 'Total*'
      CaptionOptions.Layout = clTop
      Control = edt_Total
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 78
      ControlOptions.ShowBorder = False
      Index = 6
    end
    object dxLayoutItem27: TdxLayoutItem
      Parent = dxLayoutGroup8
      Control = Grid_ItensProduto
      ControlOptions.OriginalHeight = 200
      ControlOptions.OriginalWidth = 250
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem28: TdxLayoutItem
      Parent = dxLayoutGroup8
      AlignHorz = ahRight
      CaptionOptions.Text = 'Total L'#237'quido'
      Control = edt_TotalLiquido
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 115
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem29: TdxLayoutItem
      Parent = dxLayoutGroup11
      LayoutLookAndFeel = LayoutObrigatorio
      CaptionOptions.Text = 'C'#243'd. Cond.*'
      CaptionOptions.Layout = clTop
      Control = edt_CodCondicaoPag
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 66
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem30: TdxLayoutItem
      Parent = dxLayoutGroup11
      LayoutLookAndFeel = LayoutObrigatorio
      CaptionOptions.Text = 'Condi'#231#227'o de Pagamento*'
      CaptionOptions.Layout = clTop
      Control = edt_CondicaoPag
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 259
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem31: TdxLayoutItem
      Parent = dxLayoutGroup11
      Offsets.Top = 15
      CaptionOptions.Text = 'Button1'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = btn_PesquisarCond
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 89
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem32: TdxLayoutItem
      Parent = dxLayoutGroup11
      Offsets.Top = 15
      CaptionOptions.Text = 'cxButton3'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = btn_GerarParcelas
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 91
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem33: TdxLayoutItem
      Parent = dxLayoutGroup10
      Control = Grid_Parcelas
      ControlOptions.OriginalHeight = 200
      ControlOptions.OriginalWidth = 250
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup6
      LayoutLookAndFeel = LayoutObrigatorio
      CaptionOptions.Text = 'S'#233'rie*'
      CaptionOptions.Layout = clTop
      Control = edt_Serie
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 42
      Index = 1
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutGroup6
      AlignVert = avClient
      LayoutLookAndFeel = LayoutObrigatorio
      CaptionOptions.Text = 'N'#250'mero'
      CaptionOptions.Layout = clTop
      Control = edt_Numero
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 114
      Index = 2
    end
    object dxLayoutItem11: TdxLayoutItem
      Parent = dxLayoutGroup6
      AlignVert = avClient
      LayoutLookAndFeel = LayoutObrigatorio
      CaptionOptions.Text = 'Modelo*'
      CaptionOptions.Layout = clTop
      Control = edt_Modelo
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 47
      Index = 0
    end
    object dxLayoutItem34: TdxLayoutItem
      Parent = dxLayoutGroup9
      Offsets.Top = 15
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = btn_Inserir
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 66
      ControlOptions.ShowBorder = False
      Index = 7
    end
    object dxLayoutItem35: TdxLayoutItem
      Parent = dxLayoutGroup9
      Offsets.Top = 15
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = btn_Alterar
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 62
      ControlOptions.ShowBorder = False
      Index = 8
    end
    object dxLayoutItem36: TdxLayoutItem
      Parent = dxLayoutGroup9
      Offsets.Top = 15
      CaptionOptions.Text = 'cxButton3'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = btn_Excluir
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 63
      ControlOptions.ShowBorder = False
      Index = 9
    end
  end
  inherited dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList
    inherited LayoutObrigatorio: TdxLayoutCxLookAndFeel
      PixelsPerInch = 96
    end
    inherited LayoutPadrao: TdxLayoutStandardLookAndFeel
      PixelsPerInch = 96
    end
  end
  object DSET_ITENS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 408
    object DSET_ITENSCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
    end
    object DSET_ITENSPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 40
    end
    object DSET_ITENSUND: TStringField
      FieldName = 'UND'
      Size = 5
    end
    object DSET_ITENSQTD: TCurrencyField
      FieldName = 'QTD'
    end
    object DSET_ITENSPRECO: TCurrencyField
      FieldName = 'PRECO'
    end
    object DSET_ITENSTOTAL: TCurrencyField
      FieldName = 'TOTAL'
    end
    object DSET_ITENSDESC: TCurrencyField
      FieldName = 'DESC'
    end
    object DSET_ITENSCUSTO: TCurrencyField
      FieldName = 'CUSTO'
    end
  end
  object DSET_PARCELAS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 504
    object DSET_PARCELASNUMPARCELA: TStringField
      FieldName = 'NUMPARCELA'
      Size = 0
    end
    object DSET_PARCELASVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object DSET_PARCELASVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object DSET_PARCELASFORMAPGTO: TStringField
      FieldName = 'FORMAPGTO'
      Size = 30
    end
  end
  object DS_PARCELAS: TDataSource
    DataSet = DSET_PARCELAS
    Left = 552
  end
  object DS_ITENS: TDataSource
    DataSet = DSET_ITENS
    Left = 448
  end
end