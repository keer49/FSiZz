program FSi_Card;

uses
  Forms,
  FSi_Cardfrm in 'FSi_Cardfrm.pas' {Form1},
  FSi_Carddm in 'FSi_Carddm.pas' {dm_FSiCard: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Tdm_FSiCard, dm_FSiCard);
  Application.Run;
end.
