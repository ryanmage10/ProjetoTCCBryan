inherited Cad_Fornecedores: TCad_Fornecedores
  Caption = 'Cadastro de Fornecedores'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    inherited btn_Salvar: TcxButton
      OnClick = btn_SalvarClick
    end
    inherited Rg_TipoPessoa: TcxRadioGroup
      OnClick = Rg_TipoPessoaClick
    end
    inherited btn_Pesquisar: TcxButton
      OnClick = btn_PesquisarClick
    end
    inherited dxLayoutGroup7: TdxLayoutGroup
      ItemIndex = 1
    end
    inherited lbl_RazaoSocial: TdxLayoutItem
      Visible = False
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
