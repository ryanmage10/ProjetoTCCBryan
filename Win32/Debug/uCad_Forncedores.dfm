inherited Cad_Fornecedores: TCad_Fornecedores
  Caption = 'Cadastro de Fornecedores'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Rg_TipoPessoa: TRadioGroup
      ItemIndex = 0
    end
    inherited btn_Pesquisar: TButton
      OnClick = btn_PesquisarClick
    end
  end
end
