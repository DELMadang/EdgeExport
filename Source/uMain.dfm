object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Edge Export'
  ClientHeight = 579
  ClientWidth = 895
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 895
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitLeft = 232
    ExplicitTop = 224
    ExplicitWidth = 185
    DesignSize = (
      895
      41)
    object eURL: TEdit
      Left = 0
      Top = 8
      Width = 729
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      OnKeyPress = eURLKeyPress
      ExplicitWidth = 940
    end
    object btnExportPNG: TButton
      AlignWithMargins = True
      Left = 816
      Top = 6
      Width = 75
      Height = 29
      Margins.Top = 5
      Margins.Bottom = 5
      Align = alRight
      Caption = 'PNG'
      TabOrder = 1
      OnClick = btnExportPNGClick
      ExplicitLeft = 1128
      ExplicitTop = 8
      ExplicitHeight = 25
    end
    object btnExportPDF: TButton
      AlignWithMargins = True
      Left = 735
      Top = 6
      Width = 75
      Height = 29
      Margins.Top = 5
      Margins.Bottom = 5
      Align = alRight
      Caption = 'PDF'
      TabOrder = 2
      OnClick = btnExportPDFClick
      ExplicitLeft = 1032
      ExplicitTop = 8
      ExplicitHeight = 25
    end
  end
  object EdgeBrowser1: TEdgeBrowser
    Left = 0
    Top = 41
    Width = 895
    Height = 538
    Align = alClient
    TabOrder = 1
    AllowSingleSignOnUsingOSPrimaryAccount = False
    TargetCompatibleBrowserVersion = '117.0.2045.28'
    UserDataFolder = '%LOCALAPPDATA%\bds.exe.WebView2'
    ExplicitLeft = 56
    ExplicitTop = 120
    ExplicitWidth = 100
    ExplicitHeight = 41
  end
end
