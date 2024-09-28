unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, ExtCtrls,
  StdCtrls, item, itemcat;

type

  { TMainForm }

  TMainForm = class(TForm)
    NextButton: TButton;
    LetterImage: TImage;
    StatusBar: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure OnNext(Sender: TObject);
  private
    m_itemCat: TItemCat;
    m_usable: TItems;

    procedure PickAndDisplay;
  public

  end;

var
  MainForm: TMainForm;

implementation

{$R *.lfm}

{ TMainForm }

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Randomize;
  m_itemCat := TItemCat.Create;
  m_itemCat.Load('database.json');
  m_usable := m_itemCat.GetUsable;

  StatusBar.Panels[0].Text := IntToStr(m_usable.Count) + ' items';
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  m_itemCat.Free;
end;

procedure TMainForm.OnNext(Sender: TObject);
begin
  PickAndDisplay;
end;

procedure TMainForm.PickAndDisplay;
var
  i, n: integer;

begin
  n := m_usable.Count;
  i := Random(n);
  LetterImage.Picture := m_usable[i].Image;
end;

end.

