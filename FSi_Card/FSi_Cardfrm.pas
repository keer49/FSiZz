unit FSi_Cardfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FSi_Carddm;

type
  TForm1 = class(TForm)
    btnOpen: TButton;
    btnClose: TButton;
    btnRead: TButton;
    Memo1: TMemo;
    procedure btnOpenClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnReadClick(Sender: TObject);
  private
    { Private declarations }
    hDev:THandle;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnOpenClick(Sender: TObject);
var
  errmsg: PChar;
  eMsg:PChar;

begin
  try
    hDev:=SocialInsurance_Open(errmsg);
    if( hDev = 0 )  then
    begin
      MessageDlg(errmsg+'打开佛山社保卡成功!',mtError,[mbOK],0);
    end else
      MessageDlg(errmsg+'打开佛山社保卡失败!',mtError,[mbOK],0);
  finally
    SocialInsurance_Close(hDev);
  end;
end;


procedure TForm1.btnCloseClick(Sender: TObject);
begin
  SocialInsurance_Close(hDev);
end;

procedure TForm1.btnReadClick(Sender: TObject);
var
  ref:integer;
  nTagID,nSeqID: Integer;
  buf,errmsg:PChar;
begin
  nTagID := 7;
  nSeqID := 1;
  buf[32] := '0';
  errmsg[512] := '0';
  ref:=SocialInsurance_Read(nTagID, nSeqID, buf, 32, errmsg);
  Memo1.Text:=IntToStr(ref)+'errmsg:'+errmsg;
end;

end.

