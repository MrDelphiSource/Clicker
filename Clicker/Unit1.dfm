object Form1: TForm1
  AlignWithMargins = True
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Clicker '
  ClientHeight = 179
  ClientWidth = 321
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 14
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 68
    Height = 14
    Caption = 'Time (sec.)'
  end
  object Label2: TLabel
    Left = 24
    Top = 59
    Width = 77
    Height = 14
    Caption = 'Coordinates'
  end
  object Label3: TLabel
    Left = 122
    Top = 62
    Width = 17
    Height = 14
    Caption = 'X: '
  end
  object Label4: TLabel
    Left = 218
    Top = 62
    Width = 15
    Height = 14
    Caption = 'Y: '
  end
  object Edit1: TEdit
    Left = 140
    Top = 59
    Width = 59
    Height = 22
    ReadOnly = True
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 236
    Top = 59
    Width = 59
    Height = 22
    ReadOnly = True
    TabOrder = 2
  end
  object Button1: TButton
    Left = 24
    Top = 87
    Width = 271
    Height = 25
    Caption = 'Create a record'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 24
    Top = 146
    Width = 271
    Height = 25
    Caption = 'Start'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Edit3: TEdit
    Left = 98
    Top = 13
    Width = 121
    Height = 22
    MaxLength = 5
    TabOrder = 0
    Text = '3'
    OnChange = Edit3Change
    OnKeyPress = Edit3KeyPress
  end
  object CheckBox1: TCheckBox
    Left = 24
    Top = 123
    Width = 97
    Height = 17
    Caption = 'Double click'
    TabOrder = 5
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 10
    OnTimer = Timer1Timer
    Left = 280
    Top = 16
  end
  object Timer2: TTimer
    Enabled = False
    OnTimer = Timer2Timer
    Left = 240
    Top = 16
  end
end
