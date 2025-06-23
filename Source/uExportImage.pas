unit uExportImage;

interface

uses
  Winapi.WebView2,
  Winapi.ActiveX,

  System.SysUtils,
  System.Classes,

  Vcl.Edge;

type
  TEdgeBrowserHelper = class helper for TEdgeBrowser
  public
    procedure SaveToImage(const AFileName: string; const AParams: string = '{"format":"png", "captureBeyondViewport":true}');
  end;

  TEdgeImageExport = class(TInterfacedObject, ICoreWebView2CallDevToolsProtocolMethodCompletedHandler)
  private
    FFileName: string;
  protected
    function Invoke(errorCode: HResult; returnObjectAsJson: PWideChar): HResult; stdcall;
  public
    constructor Create(const AFileName: string);
  end;

implementation

uses
  System.JSON,
  System.NetEncoding;

{ TEdgeImageExport }

constructor TEdgeImageExport.Create(const AFileName: string);
begin
  FFileName := AFileName;
end;

function TEdgeImageExport.Invoke(
  errorCode: HResult; returnObjectAsJson: PWideChar): HResult;
var
  LJSON: TJSONObject;
  LBase64Data: String;
  LStream: TMemoryStream;
  LBytes: TBytes;
begin
  LJSON := TJSONObject.ParseJSONValue(returnObjectAsJson) as TJSONObject;
  try
    LBase64Data := LJSON.GetValue<string>('data');
    LStream := TMemoryStream.Create;
    try
      LBytes := TNetEncoding.Base64.DecodeStringToBytes(LBase64Data);
      LStream.WriteData(LBytes, Length(LBytes));
      LStream.SaveToFile(FFileName);
    finally
      LStream.Free;
    end;
  finally
    LJSON.Free;
  end;

  Result := errorCode;
end;

{ TEdgeBrowserHelper }

procedure TEdgeBrowserHelper.SaveToImage(const AFileName: string; const AParams: string);
const
  METHOD = 'Page.captureScreenshot';
begin
  DefaultInterface.CallDevToolsProtocolMethod(METHOD, PWideChar(AParams), TEdgeImageExport.Create(AFileName));
end;

end.
