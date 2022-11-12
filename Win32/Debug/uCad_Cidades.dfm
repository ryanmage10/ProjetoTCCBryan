inherited Cad_Cidades: TCad_Cidades
  Caption = 'Cad_Cidades'
  ClientHeight = 198
  ClientWidth = 433
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 449
  ExplicitHeight = 237
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 433
    Height = 198
    ExplicitWidth = 433
    ExplicitHeight = 198
    inherited btn_Salvar: TcxButton
      Left = 267
      Top = 156
      TabOrder = 6
      OnClick = btn_SalvarClick
      ExplicitLeft = 267
      ExplicitTop = 156
    end
    inherited btn_Cancelar: TcxButton
      Left = 348
      Top = 156
      TabOrder = 7
      ExplicitLeft = 348
      ExplicitTop = 156
    end
    inherited Lbl_Alt: TcxLabel
      Top = 175
      ExplicitTop = 175
    end
    inherited lbl_Cad: TcxLabel
      Top = 156
      ExplicitTop = 156
    end
    inherited lbl_DataCad: TcxLabel
      Top = 156
      ExplicitTop = 156
    end
    inherited lbl_DataAlt: TcxLabel
      Top = 175
      ExplicitTop = 175
    end
    object edt_Cidade: TcxTextEdit [7]
      Left = 10
      Top = 75
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 50
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 1
      Width = 262
    end
    object Edt_DDD: TcxTextEdit [8]
      Left = 278
      Top = 75
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 5
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 2
      Width = 64
    end
    object edt_CodIbge: TcxTextEdit [9]
      Left = 348
      Top = 75
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 6
      Style.BorderColor = clSkyBlue
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 3
      Width = 75
    end
    object edt_estado: TcxTextEdit [10]
      Left = 10
      Top = 125
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 50
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 4
      Width = 332
    end
    object btn_pesquisar: TcxButton [11]
      Left = 348
      Top = 121
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 5
      OnClick = btn_pesquisarClick
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      ItemIndex = 1
      Index = 2
    end
    object dxLayoutGroup6: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      ItemIndex = 1
      ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup7: TdxLayoutGroup
      Parent = dxLayoutGroup6
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup8: TdxLayoutGroup
      Parent = dxLayoutGroup6
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      ItemIndex = 1
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup7
      AlignHorz = ahClient
      LayoutLookAndFeel = LayoutObrigatorio
      CaptionOptions.Text = 'Cidade*'
      CaptionOptions.Layout = clTop
      Control = edt_Cidade
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 295
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutGroup7
      AlignHorz = ahRight
      LayoutLookAndFeel = LayoutObrigatorio
      CaptionOptions.Text = 'DDD*'
      CaptionOptions.Layout = clTop
      Control = Edt_DDD
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 64
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem11: TdxLayoutItem
      Parent = dxLayoutGroup7
      AlignHorz = ahRight
      CaptionOptions.Text = 'C'#243'd. IBGE'
      CaptionOptions.Layout = clTop
      Control = edt_CodIbge
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem12: TdxLayoutItem
      Parent = dxLayoutGroup8
      AlignHorz = ahClient
      LayoutLookAndFeel = LayoutObrigatorio
      CaptionOptions.Text = 'Estado*'
      CaptionOptions.Layout = clTop
      Control = edt_estado
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 365
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem13: TdxLayoutItem
      Parent = dxLayoutGroup8
      AlignHorz = ahRight
      Offsets.Top = 15
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btn_pesquisar
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
