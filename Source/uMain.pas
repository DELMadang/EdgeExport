unit uMain;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  Winapi.WebView2,
  Winapi.ActiveX,

  System.SysUtils,
  System.Variants,
  System.Classes,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Edge;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    eURL: TEdit;
    btnExportPNG: TButton;
    btnExportPDF: TButton;
    EdgeBrowser1: TEdgeBrowser;
    procedure btnExportPDFClick(Sender: TObject);
    procedure btnExportPNGClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure eURLKeyPress(Sender: TObject; var Key: Char);
  private
    procedure Navigate(const AURL: string);
  public
  end;

var
  frmMain: TfrmMain;

implementation

uses
  uExportImage;

{$R *.dfm}

procedure TfrmMain.btnExportPDFClick(Sender: TObject);
var
  LPrintSettings: ICoreWebView2PrintSettings;
begin
  LPrintSettings := EdgeBrowser1.CreatePrintSettings;
  if LPrintSettings <> nil then
  begin
    LPrintSettings.Set_ShouldPrintHeaderAndFooter(1);
    EdgeBrowser1.PrintToPDF('c:\temp\test.pdf', LPrintSettings);
  end;
end;

procedure TfrmMain.btnExportPNGClick(Sender: TObject);
begin
  EdgeBrowser1.SaveToImage('D:\temp\edge.png');
  EdgeBrowser1.SaveToImage('D:\temp\edge.jpeg', '{"format":"jpeg", "quality":75, "captureBeyondViewport":true}');
  EdgeBrowser1.SaveToImage('D:\temp\edge.webp', '{"format":"webp", "captureBeyondViewport":true}');
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Navigate('https://www.naver.com');
end;

procedure TfrmMain.eURLKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    Navigate(eURL.Text);
  end;
end;

procedure TfrmMain.Navigate(const AURL: string);
begin
  EdgeBrowser1.Navigate(AURL);
end;

end.

