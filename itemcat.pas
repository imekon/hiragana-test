unit itemcat;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, fpjson, jsonparser, LAZUtf8, item;

type

  { TItemCat }

  TItemCat = class
  private
    m_items: TItems;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Load(const filename: string);

    property Items: TItems read m_items;
  end;

implementation

{ TItemCat }

constructor TItemCat.Create;
begin
  m_items := TItems.Create;
end;

destructor TItemCat.Destroy;
var
  item: TItem;

begin
  for item in m_items do
    item.Free;

  m_items.Free;
  inherited Destroy;
end;

procedure TItemCat.Load(const filename: string);
var
  i: integer;
  source: TextFile;
  line, json: string;
  jData: TJSONData;
  jItems: TJSONArray;
  jItem: TJSONObject;
  item: TItem;
  itemName, typeName, itemFilename: string;

begin
  AssignFile(source, filename);
  Reset(source);
  while not eof(source) do
  begin
    ReadLn(source, line);
    json := json + line;
  end;
  CloseFile(source);

  jData := GetJSON(json);
  jItems := jData as TJSONArray;

  for i := 0 to jItems.Count - 1 do
  begin
    jItem := jItems.Items[i] as TJSONObject;
    itemName := jItem.Get('name');
    typeName := jItem.Get('type');
    itemFilename := jItem.Get('image');
    item := TItem.Create(itemName, typeName, itemFilename);
    m_items.Add(item);
  end;
end;

end.

