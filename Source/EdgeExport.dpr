program EdgeExport;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  uExportImage in 'uExportImage.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
