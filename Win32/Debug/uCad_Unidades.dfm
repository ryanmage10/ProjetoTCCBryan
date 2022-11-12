inherited Cad_Unidades: TCad_Unidades
  Caption = 'Cadastro de Unidades'
  ClientHeight = 149
  ClientWidth = 397
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 413
  ExplicitHeight = 188
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 397
    Height = 149
    ExplicitWidth = 397
    ExplicitHeight = 149
    inherited btn_Salvar: TcxButton
      Left = 231
      Top = 107
      TabOrder = 3
      OnClick = btn_SalvarClick
      ExplicitLeft = 231
      ExplicitTop = 107
    end
    inherited btn_Cancelar: TcxButton
      Left = 312
      Top = 107
      TabOrder = 4
      ExplicitLeft = 312
      ExplicitTop = 107
    end
    inherited Lbl_Alt: TcxLabel
      Top = 126
      ExplicitTop = 126
    end
    inherited lbl_Cad: TcxLabel
      Top = 107
      ExplicitTop = 107
    end
    inherited lbl_DataCad: TcxLabel
      Top = 107
      ExplicitTop = 107
    end
    inherited lbl_DataAlt: TcxLabel
      Top = 126
      ExplicitTop = 126
    end
    object edt_Descricao: TcxTextEdit [7]
      Left = 10
      Top = 75
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 50
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 1
      Width = 296
    end
    object edt_Sigla: TcxTextEdit [8]
      Left = 312
      Top = 75
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 3
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 2
      Width = 75
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
      Control = edt_Descricao
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutGroup6
      AlignHorz = ahRight
      LayoutLookAndFeel = LayoutObrigatorio
      CaptionOptions.Text = 'Sigla*'
      CaptionOptions.Layout = clTop
      Control = edt_Sigla
      ControlOptions.OriginalHeight = 21
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
