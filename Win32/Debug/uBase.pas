unit uBase;

interface

uses System.DateUtils;

type
  TBase = class
  private

  protected
    FID: integer;
    FDataCad: TDateTime;
    FDataUltAlt: TDateTime;
    Fuser_insert: string;
    Fuser_update: string;

    function GetID: integer;
    function GetDataCad: TDateTime;
    function GetDataUltAlt: TDateTime;
    function GetUser_Insert: string;
    function GetUser_Update: string;
    procedure SetID(value: integer);
    procedure SetDataCad(value: TDateTime);
    procedure SetDataUltAlt(value: TDateTime);
    procedure setUser_insert(Value: string);
    procedure setUser_Update(Value: string);

  public

    property ID: integer read GetID write SetID;
    property DataCad: TDateTime read GetDataCad write SetDataCad;
    property DataUltAlt: TDateTime read GetDataUltAlt write SetDataUltAlt;
    property User_Insert: string read GetUser_Insert write SetUser_Insert;
    property User_Update: string read GetUser_Update write SetUser_Update;

    constructor Create;
    procedure copiarDados(value: TBase);
    function Clone: TBase;
    procedure LimparDados;
    destructor Free;
  end;

implementation

constructor TBase.Create;
begin
  LimparDados;
end;

procedure TBase.LimparDados;
begin
  FID := 0;
  FDataCad := 0;
  FDataUltAlt := 0;
  FUser_Insert := '';
  FUser_Update := '';
end;

procedure TBase.copiarDados(value: TBase);
begin
  ID := value.ID;
  DataCad := value.DataCad;
  DataUltAlt := value.DataUltAlt;
  User_Insert := Value.User_Insert;
  User_Update := Value.User_Update;
end;

function TBase.Clone: TBase;
begin
  result := TBase.Create;
  result.copiarDados(Self);
end;

function TBase.GetID: integer;
begin
  result := FID;
end;

function TBase.GetUser_Insert: string;
begin
  result := Fuser_insert;
end;

function TBase.GetUser_Update: string;
begin
  result := Fuser_update;
end;

function TBase.GetDataCad: TDateTime;
begin
  result := FDataCad;
end;

function TBase.GetDataUltAlt: TDateTime;
begin
  result := FDataUltAlt;
end;

procedure TBase.SetID(value: integer);
begin
  FID := value;
end;

procedure TBase.setUser_insert(Value: string);
begin
  FUser_Insert := Value;
end;

procedure TBase.setUser_Update(Value: string);
begin
  FUser_Update := Value;
end;

procedure TBase.SetDataCad(value: TDateTime);
begin
  FDataCad := value;
end;

procedure TBase.SetDataUltAlt(value: TDateTime);
begin
  FDataUltAlt := value;
end;

destructor TBase.Free;
begin

end;

end.
