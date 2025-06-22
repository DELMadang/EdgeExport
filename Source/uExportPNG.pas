unit uExportPNG;

interface

uses
  Winapi.WebView2,
  Winapi.ActiveX;

type
  TCoreWebView2CallDevToolsProtocolMethodCompletedHandler = class
    (TInterfacedObject, ICoreWebView2CallDevToolsProtocolMethodCompletedHandler)
  private
    function Invoke(errorCode: HResult; returnObjectAsJson: PWideChar): HResult; stdcall;
  end;

implementation

uses
  System.JSON,
  System.NetEncoding;

{ TCoreWebView2CallDevToolsProtocolMethodCompletedHandler }

function TCoreWebView2CallDevToolsProtocolMethodCompletedHandler.Invoke(
  errorCode: HResult; returnObjectAsJson: PWideChar): HResult;
var
  LJSON: TJSONObject;
  LBase64Data: String;
  LStream: TMemoryStream;
  LBytes: TArray;
begin
  LJSON := TJSONObject.ParseJSONValue(returnObjectAsJson) as TJSONObject;
  try
    LBase64Data := JSON.GetValue('data');
    LStream := TMemoryStream.Create;
    try
      LBytes := TNetEncoding.Base64.DecodeStringToBytes(LBase64Data);
      LStream.WriteData(Bytes, Length(Bytes));
      LStream.SaveToFile('c:\temp\test.png');
    finally
      LStream.Free;
    end;
  finally
    LJSON.Free;
  end;

  Result := errorCode;
end;

end.
