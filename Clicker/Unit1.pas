unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin, Vcl.ExtCtrls, Vcl.Clipbrd, System.Math;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Timer1: TTimer;
    Timer2: TTimer;
    Edit3: TEdit;
    CheckBox1: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3Change(Sender: TObject);



  private
    { Private declarations }
  public
    { Public declarations }
   MouseX, MouseY : Integer;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.FormCreate(Sender: TObject);
begin
  MouseX := -1;
  MouseY := -1;
  Button2.Tag := 0;
  Edit3.Text := ('5');
  CheckBox1.Checked := False;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 Button2.Enabled := False;
 Edit1.Clear;
 Edit2.Clear;
 Application.ProcessMessages;
 Timer1.Enabled := True;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
 var
  A : TPoint;
begin
  GetCursorPos(A);
  Edit1.Text := IntToStr(A.X);
  Edit2.Text := IntToStr(A.Y);
  if
   GetAsyncKeystate(VK_LBUTTON) shr 31 = 1
  then
   begin
      MouseX := StrToInt(Edit1.Text);
      MouseY := StrToInt(Edit2.Text);
      Timer1.Enabled := False;
      Button2.Enabled := True;
   end
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
 SetCursorPos(MouseX,MouseY);

 if
   CheckBox1.Checked = True
 then
  begin
   mouse_event(MOUSEEVENTF_LEFTDOWN,MouseX,MouseY,0,0);
   mouse_event(MOUSEEVENTF_LEFTUP,MouseX,MouseY,0,0);
   //Sleep(250);
   mouse_event(MOUSEEVENTF_LEFTDOWN,MouseX,MouseY,0,0);
   mouse_event(MOUSEEVENTF_LEFTUP,MouseX,MouseY,0,0);
  end
 else
  begin
   mouse_event(MOUSEEVENTF_LEFTDOWN,MouseX,MouseY,0,0);
   mouse_event(MOUSEEVENTF_LEFTUP,MouseX,MouseY,0,0);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
 var
  ITime : Integer;
begin
 if
  Button2.Tag = 0
 then
  begin
   if
    Edit3.Text = EmptyStr
   then
    begin
     Winapi.Windows.MessageBox(Handle, PChar('Enter only numeric values in the range from 3 to 36000!'), PChar(Form1.Caption + ' - wrong enter value!'), MB_ICONWARNING + MB_OK);
     Edit3.SetFocus;
     Exit;
    end;

   if
    (MouseX = -1) or (MouseY = -1)
   then
    begin
     Winapi.Windows.MessageBox(Handle, PChar('Create a coordinate record first!'), PChar(Form1.Caption + ' - wrong coordinates!'), MB_ICONWARNING + MB_OK);
     Button1.SetFocus;
     Exit;
    end;
   CheckBox1.Enabled := False;
   Edit3.Enabled := False;
   Button1.Enabled := False;
   ITime := StrToInt(Edit3.Text) * 1000;
   Timer2.Interval := ITime;
   Button2.Tag := 1;
   Button2.Caption := ('Stop');
   Timer2.Enabled := True;
   Exit;
  end;

 if
  Button2.Tag = 1
 then
  begin
   Timer2.Enabled := False;
   Edit3.Enabled := True;
   CheckBox1.Enabled := True;
   Button1.Enabled := True;
   Button2.Tag := 0;
   Button2.Caption := ('Start');
   Exit;
  end;

end;



procedure TForm1.Edit3Change(Sender: TObject);
var
  i : Integer;
begin
 if
  Edit3.Text <> EmptyStr
 then
  begin
    if not (TryStrToInt(Edit3.Text, i)) then
    begin
     Clipboard.Clear;
     Winapi.Windows.MessageBox(Handle, PChar('Enter only numeric values in the range from 3 to 36000!'), PChar(Form1.Caption + ' - wrong enter value!'), MB_ICONWARNING + MB_OK);
     Edit3.Text := '3';
     Edit3.SelStart := Length(Edit3.Text);
     Edit3.SetFocus;
     Exit;
    end
    else
    begin
      if not (InRange(StrToInt(Edit3.Text), 3, 36000)) then
      begin
       Clipboard.Clear;
       Winapi.Windows.MessageBox(Handle, PChar('Enter only numeric values in the range from 3 to 36000!'), PChar(Form1.Caption + ' - wrong enter value!'), MB_ICONWARNING + MB_OK);
       Edit3.Text := '3';
       Edit3.SelStart := Length(Edit3.Text);
       Edit3.SetFocus;
       Exit;
      end
    end;
  end;
end;

procedure TForm1.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
 if (not(Key in ['0'..'9',#8])) then Key := #0;
end;

end.
