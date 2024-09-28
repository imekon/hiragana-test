unit item;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Graphics, fgl;

type

  { TItem }

  TItem = class
  private
    m_name: string;
    m_type: string;
    m_filename: string;
    m_image: TPicture;
    m_x, m_y, m_width, m_height, m_columns, m_rows: integer;
  public
    constructor Create(const name, typeName, filename: string);
    constructor Create(const name, typeName, filename: string; x, y, w, h, c, r: integer);
    destructor Destroy; override;
    property Name: string read m_name;
    property TypeName: string read m_type;
    property Filename: string read m_filename;
    property Image: TPicture read m_image;
  end;

  TItems = specialize TFPGList<TItem>;

implementation

{ TItem }

constructor TItem.Create(const name, typeName, filename: string);
begin
  m_name := name;
  m_type := typeName;
  m_filename := filename;
  m_image := TPicture.Create;
  m_image.LoadFromFile('resources/' + m_filename);
  m_x := -1;
  m_y := -1;
  m_width := -1;
  m_height := -1;
  m_columns := -1;
  m_rows := -1;
end;

constructor TItem.Create(const name, typeName, filename: string; x, y, w, h, c,
  r: integer);
begin
  m_name := name;
  m_type := typeName;
  m_filename := filename;
  m_image := TPicture.Create;
  m_image.LoadFromFile('resources/' + m_filename);
  m_x := x;
  m_y := y;
  m_width := w;
  m_height := h;
  m_columns := c;
  m_rows := r;
end;

destructor TItem.Destroy;
begin
  m_image.Free;
  inherited Destroy;
end;

end.

