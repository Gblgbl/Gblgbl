program Sdiapp;

uses
  Forms,
  Unlock in 'Unlock.PAS' {SDIAppForm},
  ABOUT in 'ABOUT.PAS' {AboutBox},
  DBs in 'DBs.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TSDIAppForm, SDIAppForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TForm1, Form1);
  Application.Run;

end.

