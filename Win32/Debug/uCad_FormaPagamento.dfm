inherited Cad_FormaPagamento: TCad_FormaPagamento
  Caption = 'Cadastro de Formas de Pagamento'
  ClientHeight = 146
  ClientWidth = 379
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 395
  ExplicitHeight = 185
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 379
    Height = 146
    ExplicitWidth = 379
    ExplicitHeight = 146
    inherited btn_Salvar: TcxButton
      Left = 213
      Top = 104
      TabOrder = 2
      OnClick = btn_SalvarClick
      ExplicitLeft = 213
      ExplicitTop = 104
    end
    inherited btn_Cancelar: TcxButton
      Left = 294
      Top = 104
      TabOrder = 3
      ExplicitLeft = 294
      ExplicitTop = 104
    end
    inherited Lbl_Alt: TcxLabel
      Top = 123
      ExplicitTop = 123
    end
    inherited lbl_Cad: TcxLabel
      Top = 104
      ExplicitTop = 104
    end
    inherited lbl_DataCad: TcxLabel
      Top = 104
      ExplicitTop = 104
    end
    inherited lbl_DataAlt: TcxLabel
      Top = 123
      ExplicitTop = 123
    end
    object edt_descricao: TcxTextEdit [7]
      Left = 10
      Top = 75
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 50
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 1
      Width = 359
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      Index = 2
    end
    object dxLayoutGroup6: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = 'New Group'
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup6
      AlignHorz = ahClient
      LayoutLookAndFeel = LayoutObrigatorio
      CaptionOptions.Text = 'Descri'#231#227'o*'
      CaptionOptions.Layout = clTop
      Control = edt_descricao
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
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
