unit Download.interfaces;

interface

uses
  System.SysUtils;

type
  iDownload = Interface
  ['{D4E0525A-D8CB-4277-B8D0-F7A2518AC0E3}']
  function Download():Boolean;
  function link(aLink :string):iDownload;
  function filename(aFilename :string):iDownload;
end;

implementation

end.
