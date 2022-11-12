inherited Cad_Produtos: TCad_Produtos
  Caption = 'Cadastro de Produtos'
  ClientHeight = 204
  ClientWidth = 462
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 478
  ExplicitHeight = 243
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 462
    Height = 204
    ExplicitWidth = 462
    ExplicitHeight = 204
    inherited btn_Salvar: TcxButton
      Left = 296
      Top = 162
      TabOrder = 6
      OnClick = btn_SalvarClick
      ExplicitLeft = 296
      ExplicitTop = 162
    end
    inherited btn_Cancelar: TcxButton
      Left = 377
      Top = 162
      TabOrder = 7
      ExplicitLeft = 377
      ExplicitTop = 162
    end
    inherited Lbl_Alt: TcxLabel
      Top = 181
      ExplicitTop = 181
    end
    inherited lbl_Cad: TcxLabel
      Top = 162
      ExplicitTop = 162
    end
    inherited lbl_DataCad: TcxLabel
      Top = 162
      ExplicitTop = 162
    end
    inherited lbl_DataAlt: TcxLabel
      Top = 181
      ExplicitTop = 181
    end
    object edt_unidade: TcxTextEdit [7]
      Left = 10
      Top = 128
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 50
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 3
      Width = 199
    end
    object edt_Descricao: TcxTextEdit [8]
      Left = 10
      Top = 75
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 50
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 1
      Width = 280
    end
    object edt_codigo: TcxTextEdit [9]
      Left = 296
      Top = 75
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 10
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 2
      Width = 156
    end
    object btn_pesquisar: TcxButton [10]
      Left = 215
      Top = 124
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 4
      OnClick = btn_pesquisarClick
    end
    object edt_NCM: TcxMaskEdit [11]
      Left = 296
      Top = 128
      Properties.EditMask = '0000.00.00;1;_'
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 5
      Text = '    .  .  '
      Width = 156
    end
    inherited dxLayoutControl1Group_Root: TdxLayoutGroup
      ItemIndex = 2
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      Index = 3
    end
    object dxLayoutGroup6: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      ItemIndex = 2
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 2
    end
    object dxLayoutGroup7: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutGroup6
      AlignHorz = ahClient
      LayoutLookAndFeel = LayoutObrigatorio
      CaptionOptions.Text = 'Unidade*'
      CaptionOptions.Layout = clTop
      Control = edt_unidade
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 184
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem11: TdxLayoutItem
      Parent = dxLayoutGroup7
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
    object dxLayoutItem12: TdxLayoutItem
      Parent = dxLayoutGroup7
      AlignHorz = ahRight
      LayoutLookAndFeel = LayoutObrigatorio
      CaptionOptions.Text = 'C'#243'digo*'
      CaptionOptions.Layout = clTop
      Control = edt_codigo
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 156
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem13: TdxLayoutItem
      Parent = dxLayoutGroup6
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
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup6
      AlignHorz = ahRight
      LayoutLookAndFeel = LayoutObrigatorio
      CaptionOptions.Text = 'NCM*'
      CaptionOptions.Layout = clTop
      Control = edt_NCM
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 156
      ControlOptions.ShowBorder = False
      Index = 2
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
