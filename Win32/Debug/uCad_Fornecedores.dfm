inherited Cad_Fornecedores: TCad_Fornecedores
  Caption = 'Cadastro de Fornecedores'
  ClientHeight = 447
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitTop = -53
  ExplicitHeight = 486
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Height = 447
    inherited btn_Salvar: TcxButton
      Top = 405
      TabOrder = 20
      OnClick = btn_SalvarClick
      ExplicitTop = 405
    end
    inherited btn_Cancelar: TcxButton
      Top = 405
      TabOrder = 21
      ExplicitTop = 405
    end
    inherited Lbl_Alt: TcxLabel
      Top = 424
      ExplicitTop = 424
    end
    inherited lbl_Cad: TcxLabel
      Top = 405
      ExplicitTop = 405
    end
    inherited lbl_DataCad: TcxLabel
      Top = 405
      ExplicitTop = 405
    end
    inherited lbl_DataAlt: TcxLabel
      Top = 424
      ExplicitTop = 424
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
    inherited dxLayoutGroup7: TdxLayoutGroup
      ItemIndex = 1
    end
    inherited dxLayoutGroup12: TdxLayoutGroup
      Index = 6
    end
    inherited lbl_RazaoSocial: TdxLayoutItem
      Visible = False
    end
    object dxLayoutGroup4: TdxLayoutGroup
      Parent = dxLayoutGroup6
      CaptionOptions.Text = 'New Group'
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 5
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
      Control = btn_PesquisarCondicao
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
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
