unit FSi_Carddm;

interface

uses
  SysUtils, Classes, Windows;

  function SocialInsurance_Open(errmsg: PChar): THandle;
  //function SocialInsurance_Open(devtype: PChar; devname: PChar; USlot_No: Integer;
    //SamSlot_No:Integer; ErrorMessage: PChar): THandle;
  function SocialInsurance_Close(hDev: THandle): THandle;
  function SocialInsurance_Read(nTagID:Integer; nSeqID: Integer; buf: PChar; bufsize: Integer; errmsg: PChar):Integer;
type
  Tdm_FSiCard = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm_FSiCard: Tdm_FSiCard;

implementation

{$R *.dfm}
function SocialInsurance_Open(errmsg: PChar): THandle;
type
  TSocialInsurance_Open = function(errmsg: PChar): THandle; stdcall;
var
  Hdl: THandle;
  HdlFun: TSocialInsurance_Open;
  ReHdl: THandle;
  iHdl: Integer;
begin
  result := 1;
  try
    Hdl := LoadLibrary(Pchar('SocialInsurance.dll'));
  except
    result := 1;
    exit;
  end;

  @HdlFun := GetProcAddress(Hdl, 'SocialInsurance_Open');
  if @HdlFun = nil then
  begin
    result := 1;
    Exit;
  end;

  try
    ReHdl := HdlFun(errmsg);
    if ReHdl <> 0 then
      Abort;
  except
    on E: Exception do
    begin
      result := 1;
      exit;
    end;
  end;

  result := ReHdl;
end;

function SocialInsurance_Close(hDev: THandle): THandle;
type
  TSocialInsurance_Close = function(hDev: THandle): THandle; stdcall;
var
  Hdl: THandle;
  HdlFun: TSocialInsurance_Close;
  ReHdl: THandle;
  iHdl: Integer;
begin
  result := 1;
  try
    Hdl := LoadLibrary(Pchar('SocialInsurance.dll'));
  except
    result := 1;
    exit;
  end;

  @HdlFun := GetProcAddress(Hdl, 'SocialInsurance_Close');
  if @HdlFun = nil then
  begin
    result := 1;
    Exit;
  end;

  try
    ReHdl := HdlFun(hDev);
    if ReHdl <> 0 then
      Abort;
  except
    on E: Exception do
    begin
      result := 1;
      exit;
    end;
  end;

  result := ReHdl;
end;


function SocialInsurance_Read(nTagID:Integer; nSeqID: Integer; buf: PChar; bufsize: Integer; errmsg: PChar):Integer;
type
  TSocialInsurance_Read = function(nTagID:Integer; nSeqID: Integer; buf: PChar; bufsize: Integer; errmsg: PChar):Integer;stdcall;

var
  Hdl: THandle;
  HdlFun: TSocialInsurance_Read;
  ReLInt: Integer;
begin
  result := -1;
  try
    Hdl := LoadLibrary(Pchar('SocialInsurance.dll'));
  except
    result := -1;
    exit;
  end;

  @HdlFun := GetProcAddress(Hdl, 'SocialInsurance_Read');
  if @HdlFun = nil then
  begin
    result := -1;
    Exit;
  end;

  try
    ReLInt := HdlFun(nTagID,nSeqID,buf,bufsize,errmsg);
  except
    on E: Exception do
    begin
      result := -1;
      exit;
    end;
  end;

  result := ReLInt;
end;

end.
