inherited Cad_Clientes: TCad_Clientes
  Caption = 'Cadastro de Clientes'
  ClientHeight = 446
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitHeight = 485
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Height = 446
    ExplicitHeight = 446
    inherited btn_Salvar: TcxButton
      Top = 404
      TabOrder = 20
      OnClick = btn_SalvarClick
      ExplicitTop = 404
    end
    inherited btn_Cancelar: TcxButton
      Top = 404
      TabOrder = 21
      ExplicitTop = 404
    end
    inherited Lbl_Alt: TcxLabel
      Top = 423
      ExplicitTop = 423
    end
    inherited lbl_Cad: TcxLabel
      Top = 404
      ExplicitTop = 404
    end
    inherited lbl_DataCad: TcxLabel
      Top = 404
      ExplicitTop = 404
    end
    inherited lbl_DataAlt: TcxLabel
      Top = 423
      ExplicitTop = 423
    end
    inherited edt_Cep: TcxMaskEdit
      Properties.CharCase = ecUpperCase
    end
    inherited Rg_TipoPessoa: TcxRadioGroup
      OnClick = Rg_TipoPessoaClick
    end
    inherited btn_Pesquisar: TcxButton
      OnClick = btn_PesquisarClick
    end
    inherited edt_Tel_Fixo: TcxMaskEdit
      Top = 376
      TabOrder = 18
      ExplicitTop = 376
    end
    inherited edt_Tel_Cel: TcxMaskEdit
      Top = 376
      TabOrder = 19
      ExplicitTop = 376
    end
    object edt_Condicao: TcxTextEdit [24]
      Left = 10
      Top = 330
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 16
      Width = 415
    end
    object btn_PesquisarCondicao: TcxButton [25]
      Left = 431
      Top = 326
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 17
      OnClick = btn_PesquisarCondicaoClick
    end
    inherited dxLayoutGroup12: TdxLayoutGroup
      Index = 6
    end
    inherited lbl_RazaoSocial: TdxLayoutItem
      Visible = False
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup4
      AlignHorz = ahClient
      LayoutLookAndFeel = LayoutObrigatorio
      CaptionOptions.Text = 'Condi'#231#227'o de Pagamento*'
      CaptionOptions.Layout = clTop
      Control = edt_Condicao
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutGroup4
      Offsets.Top = 15
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clTop
      Control = btn_PesquisarCondicao
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup4: TdxLayoutGroup
      Parent = dxLayoutGroup6
      CaptionOptions.Text = 'New Group'
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 5
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
end
