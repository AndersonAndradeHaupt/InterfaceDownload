unit Download;

interface

uses
  System.Classes, System.Net.HttpClient, Download.interfaces,
  System.Net.URLClient, System.Net.HttpClientComponent;

type
  TDownload = class(TInterfacedObject, iDownload)
  private
    HttpClient: TNetHTTPClient;
    Flink :String;
    Ffilename: string;
  public
    class function New: iDownload;

    constructor Create;
    destructor Destroy; override;
    function Download(): Boolean;
    function Link(aLink :string):iDownload;
    function Filename(aFilename :string):iDownload;

  end;

implementation

constructor TDownload.Create;
begin
  HttpClient := TNetHTTPClient.Create(nil);
end;

destructor TDownload.Destroy;
begin
  HttpClient.Free;
  inherited Destroy;
end;

function TDownload.Download(): Boolean;
var
  HttpResponse: IHTTPResponse;
  FileStream: TFileStream;
begin
  FileStream := TFileStream.Create(Ffilename, fmCreate);
  try
    HttpResponse := HttpClient.Get(Flink, FileStream);
    result := (HttpResponse.StatusCode = 200);
  finally
    FileStream.Free;
  end;
end;

function TDownload.filename(aFilename: string): iDownload;
begin
  result := self;
  Ffilename := aFilename;
end;

function TDownload.link(aLink: string): iDownload;
begin
  result := self;
  Flink := aLink;
end;

class function TDownload.New: iDownload;
begin
  result := self.Create;
end;


end.
