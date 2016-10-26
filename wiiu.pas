unit wiiu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,  ShellAPI,
  Vcl.Imaging.pngimage ;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    ListBox1: TListBox;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Image1: TImage;
    Label5: TLabel;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  gaem:string;
  tick:string;
  virgintick:string;
  tickpchar:pchar;
  tsr : tsearchrec;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
gaem:='0';
 RenameFile('c:\WiiU\install','c:\Wiiu\install1');

WinExec(PAnsiChar('cmd /c md e:\t'), SW_HIDE);
if ListBox1.ItemIndex > -1 then gaem:=ListBox1.Items[ListBox1.ItemIndex];


if RadioButton2.Checked then begin
                             tick:='0';
                             if FindFirst('C:\WiiU\tickets\'+ gaem + '\'+ 'E *',faAnyFile,tsr) = 0 then
                             repeat
                             tick:=(tsr.name);
                             virgintick:=(tsr.name);
                             until FindNext(tsr) <> 0;
                             FindClose(tsr);
                             Delete(tick, 1, 2);

                             end;


if RadioButton1.Checked then begin
                             tick:='0';
                             if FindFirst('C:\WiiU\tickets\'+ gaem + '\'+ 'U *',faAnyFile,tsr) = 0 then
                             repeat
                             tick:=(tsr.name);
                             virgintick:=(tsr.name);
                             until FindNext(tsr) <> 0;
                             FindClose(tsr);

                             Delete(tick, 1, 2);

                             end;
                 if ((tick.Length < 2) and (gaem <> '0') and RadioButton2.Checked) then  ShowMessage('sorry dude,this game only avaliable for USA (yet)');
                 if ((tick.Length < 2) and (gaem <> '0') and RadioButton1.Checked) then  ShowMessage('sorry dude,this game only avaliable for EURope (yet)');
                 if ((tick.Length > 2) and (gaem <> '0')) then begin
                                                               tickpchar:=pchar(tick);



                                                               ShellExecute(Handle, 'open', 'Nusgrabber.exe', pchar(tick), 'C:\WiiU\', sw_shownormal);


                                                               end;


end;

procedure TForm2.Button2Click(Sender: TObject);
begin
CopyFile(pchar('C:\WiiU\tickets\'+gaem+'\'+virgintick+'\title.tik'), pchar('C:\WiiU\'+tick+'\title.tik'), false);
                                                               RenameFile('c:\WiiU\'+tick,'c:\Wiiu\install');


WinExec('EXPLORER /e, '+'"c:\WiiU\"', SW_SHOW);

end;





procedure TForm2.FormCreate(Sender: TObject);
begin



  if FindFirst('C:\WiiU\tickets\' + '*.*',faAnyFile,tsr) = 0 then
    repeat
      ListBox1.Items.Add(tsr.name);
    until FindNext(tsr) <> 0;
  FindClose(tsr);

end;

end.
