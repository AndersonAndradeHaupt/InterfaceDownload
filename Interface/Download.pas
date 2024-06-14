unit Download;

interface

uses
  System.Classes, System.Net.HttpClient, Download.interfaces,
  System.Net.URLClient, System.Net.HttpClientComponent;

type
  TDownload = class(TInterfacedObject, iDownload)
  private
    HttpClient: TNetHTTPClient;
  public
    class function New: iDownload;

    constructor Create;
    destructor Destroy; override;
    function Download(const URL, FileName: string): Boolean;
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

function TDownload.Download(const URL, FileName: string): Boolean;
var
  HttpResponse: IHTTPResponse;
  FileStream: TFileStream;
begin
  FileStream := TFileStream.Create(FileName, fmCreate);
  try
    HttpResponse := HttpClient.Get(URL, FileStream);
    result := (HttpResponse.StatusCode = 200);
  finally
    FileStream.Free;
  end;
end;

class function TDownload.New: iDownload;
begin
  result := self.Create;
end;

end.