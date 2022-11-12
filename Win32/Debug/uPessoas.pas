unit uPessoas;
interface

uses uBase, uCidades, System.DateUtils;

type
  TSexo = (TpIndefinido = -1, TpMasculino = 0, TpFeminino = 1);

  TTipoPessoa = (TpIndef = -1, TpFisica = 0, TpJuridica = 1);

  TPessoas = class(TBase)
  private

  protected
    Fnome: string;
    Fendereco:      string;
    Fbairro:        string;
    Fnumero:        string;
    FComplemento:   string;
    FCep:           string;
    Fcidade:        TCidades;
    FTelFixo:       string;
    FTelCel:        string;
    FDtNasc:        TDate;
    FSexo:          TSexo;
    FcpfCNPJ:       string;
    FRGIE:          string;
    FRazaoSocial:   string;
    FTipo:          TTipoPessoa;

    function GetNome: string;
    function GetEndereco: string;
    function GetBairro: string;
    function Getnumero: string;
    function GetComplemento: string;
    function GetCep: string;
    function Getcidade: TCidades;
    function GetTelFixo: string;
    function GetTelCel: string;
    function getDtNasc: TDate;
    function getSexo: TSexo;
    function getCPFCNPJ: string;
    function getRGIE: string;
    function getRazaoSocial: string;
    function getTipo: TTipoPessoa;

    procedure SetNome(value: string);
    procedure Setendereco(value: string);
    procedure Setbairro(value: string);
    procedure Setnumero(value: string);
    procedure SetComplemento(value: string);
    procedure SetCep(value: string);
    procedure Setcidade(value: TCidades);
    procedure SetTelFixo(value: string);
    procedure SetTelCel(value: string);
    procedure setDtNasc(Value: TDate);
    procedure setSexo(Value: TSexo);
    procedure setCPFCNPJ(Value: string);
    procedure setRGIE(Value: string);
    procedure setRazaoSocial(Value: string);
    procedure setTipo(Value: TTipoPessoa);

  public
    property Nome: string read GetNome write SetNome;
    property endereco: string read Getendereco write Setendereco;
    property bairro: string read Getbairro write Setbairro;
    property numero: string read Getnumero write Setnumero;
    property complemento: string read GetComplemento write SetComplemento;
    property Cep: string read GetCep write SetCep;
    property cidade: TCidades read Getcidade write Setcidade;
    property TelFixo: string read GetTelFixo write SetTelFixo;
    property TelCel: string read GetTelCel write SetTelCel;
    property DtNasc: TDate read GetDtNasc write setDtNasc;
    property Sexo: TSexo read GetSexo write setSexo;
    property CPFCNPJ: string read GetCPFCNPJ write setCPFCNPJ;
    property RGIE: string read GetRGIE write setRGIE;
    property RazaoSocial: string read GetRazaoSocial write setRazaoSocial;
    property Tipo: TTipoPessoa read GetTipo write setTipo;

    constructor Create;
    procedure copiarDados(value: TPessoas);
    function Clone: TPessoas;
    procedure LimparDados;
    destructor Free;
  end;

implementation

constructor TPessoas.Create;
begin
  inherited;
  FCidade := TCidades.Create;
  LimparDados;
end;

procedure TPessoas.LimparDados;
begin
    inherited LimparDados;
    Fnome := '';
    Fendereco := '';
    Fbairro := '';
    Fnumero := '';
    FComplemento := '';
    FCep := '';
    Fcidade.LimparDados;
    FTelFixo := '';
    FTelCel := '';
    FDtNasc := Today;
    FSexo   := TSexo.TpIndefinido;
    FcpfCnpj    := '';
    FRGIE     := '';
    FRazaoSocial := '';
    FTipo   := TTipoPessoa.TpIndef;
end;

procedure TPessoas.copiarDados(value: TPessoas);
begin
    inherited copiarDados(Value);
    Fnome := Value.Nome;
    Fendereco := Value.Endereco;
    Fbairro := Value.bairro;
    Fnumero := Value.numero;
    FComplemento := Value.Complemento;
    FCep := Value.Cep;
    Fcidade.CopiarDados(Value.cidade);
    FTelFixo := Value.TelFixo;
    FTelCel := Value.TelCel;
    FDtNasc := Value.DtNasc;
    FSexo   := Value.Sexo;
    FcpfCNPJ    := Value.CPFCNPJ;
    FRGIE     := Value.RGIE;
    FRazaoSocial := Value.RazaoSocial;
    FTipo   := Value.Tipo;
end;

function TPessoas.Clone: TPessoas;
begin
  Result := TPessoas.Create;
  result.CopiarDados(Self);
end;

function TPessoas.GetBairro: string;
begin
  result := FBairro;
end;

function TPessoas.GetCep: string;
begin
  result := FCep;
end;

function TPessoas.Getcidade: TCidades;
begin
  result := FCidade;
end;

function TPessoas.GetComplemento: string;
begin
  result := FComplemento;
end;

function TPessoas.GetNome: string;
begin
  result := FNome;
end;

function TPessoas.Getnumero: string;
begin
  result := FNumero;
end;

function TPessoas.GetTelCel: string;
begin
  result := FTelCel;
end;

function TPessoas.GetTelFixo: string;
begin
  result := FTelFixo;
end;

function TPessoas.getTipo: TTipoPessoa;
begin
  result := FTipo;
end;

function TPessoas.GetEndereco: string;
begin
  result := FEndereco;
end;

procedure TPessoas.Setbairro(value: string);
begin
  FBairro := Value;
end;

procedure TPessoas.SetCep(value: string);
begin
  FCep := Value;
end;

procedure TPessoas.Setcidade(value: TCidades);
begin
   FCidade.copiarDados(Value);
end;

procedure TPessoas.SetComplemento(value: string);
begin
   FComplemento := Value;
end;

procedure TPessoas.SetNome(value: string);
begin
   FNome := Value;
end;

procedure TPessoas.Setnumero(value: string);
begin
   FNumero := Value;
end;

procedure TPessoas.SetTelCel(value: string);
begin
   FTelCel := Value;
end;

procedure TPessoas.SetTelFixo(value: string);
begin
   FTelFixo := Value;
end;

procedure TPessoas.setTipo(Value: TTipoPessoa);
begin
   FTipo := Value;
end;

procedure TPessoas.Setendereco(value: string);
begin
   FEndereco := Value;
end;

procedure TPessoas.setRazaoSocial(Value: string);
begin
  FRazaoSocial := Value;
end;

function TPessoas.getRazaoSocial: string;
begin
  result := FRazaoSocial;
end;

procedure TPessoas.setDtNasc(Value: TDate);
begin
  FDtNasc := Value;
end;

procedure TPessoas.setSexo(Value: TSexo);
begin
  FSexo := Value;
end;

procedure TPessoas.setCPFCNPJ(Value: string);
begin
  FCPFCNPJ := Value;
end;

procedure TPessoas.setRGIE(Value: string);
begin
  FRGIE := Value;
end;

function TPessoas.getDtNasc: TDate;
begin
  result := FDtNasc;
end;

function TPessoas.getSexo: TSexo;
begin
  result := FSexo;
end;

function TPessoas.getCPFCNPJ: string;
begin
   result := FCPFCNPJ;
end;

function TPessoas.getRGIE: string;
begin
   result := FRGIE
end;

destructor TPessoas.Free;
begin
   FCidade.Free;
end;

end.
