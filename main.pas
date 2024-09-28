unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, itemcat;

type

  { TMainForm }

  TMainForm = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    m_itemCat: TItemCat;
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
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  m_itemCat.Free;
end;

end.

