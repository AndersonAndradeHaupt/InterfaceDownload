program Demo_dowload;

uses
  Vcl.Forms,
  UDowload in 'UDowload.pas' {Form1},
  Download.interfaces in 'Interface\Download.interfaces.pas',
  Download in 'Interface\Download.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.