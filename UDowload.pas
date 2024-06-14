unit UDowload;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,Download, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}



procedure TForm1.Button1Click(Sender: TObject);
var
  aLink,aFilename :string;
begin
  aLink := 'https://nstzd5w9xdrpsoad.public.blob.vercel-storage.com/Logistica-Axmtx7Lkhziu9AtxrVjTtmPEnfS86g.jpg';
  aFilename := ExtractFilePath(ParamStr(0)) + 'teste.jpg';

  if TDownload.New.Download(aLink,aFilename) then
    Image1.Picture.LoadFromFile(aFilename);
end;

end.
