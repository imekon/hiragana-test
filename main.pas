unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, item,
  itemcat;

type

  { TMainForm }

  TMainForm = class(TForm)
    StatusBar: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    m_itemCat: TItemCat;
    m_usable: TItems;
  public

  end;

var
  MainForm: TMainForm;

implementation

{$R *.lfm}

{ TMainForm }

procedure TMainForm.FormCreate(Sender: TObject);
begin
  m_itemCat := TItemCat.Create;
  m_itemCat.Load('database.json');
  m_usable := m_itemCat.GetUsable;

  StatusBar.Panels[0].Text := IntToStr(m_usable.Count) + ' items';
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  m_itemCat.Free;
end;

end.

