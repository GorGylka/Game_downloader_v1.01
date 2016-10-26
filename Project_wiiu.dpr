program Project_wiiu;

uses
  Vcl.Forms,
  wiiu in 'C:\Users\User\Documents\RAD Studio\Projects\wiiu.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
