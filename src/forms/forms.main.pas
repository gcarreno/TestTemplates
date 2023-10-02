unit Forms.Main;

{$mode objfpc}{$H+}

interface

uses
  Classes
, SysUtils
, Forms
, Controls
, Graphics
, Dialogs, Menus, ActnList, StdActns, ComCtrls, ExtCtrls, StdCtrls, PairSplitter
;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    actFPTemplateProcess: TAction;
    alMain: TActionList;
    actFileExit: TFileExit;
    Button1: TButton;
    memFPTemplateTemplate: TMemo;
    memFPTemplateResult: TMemo;
    mnuFPTemplate: TMenuItem;
    MenuItem2mnuFPTemplateProcess: TMenuItem;
    mnuFile: TMenuItem;
    mnuFileExit: TMenuItem;
    mmMain: TMainMenu;
    panFPTemplateTemplateTitle: TPanel;
    panFPTemplateResultTitle: TPanel;
    psFPTemplate: TPairSplitter;
    psFPTemplateTemplate: TPairSplitterSide;
    psFPTemplateTemplateResult: TPairSplitterSide;
    panFPTemplateButtons: TPanel;
    pcMain: TPageControl;
    tsFPTemplate: TTabSheet;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actFPTemplateProcessExecute(Sender: TObject);
  private
    procedure InitShortcuts;
  public

  end;

var
  frmMain: TfrmMain;

implementation

uses
  LCLType
;

const
  cVersion = {$I version.inc};

{$R *.lfm}

{ TfrmMain }

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Caption:= Format('%s v%s', [ Application.Title, cVersion ]);
  InitShortcuts;
  pcMain.PageIndex:= 0;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  // Just in case.
end;

procedure TfrmMain.InitShortcuts;
begin
{$IFDEF UNIX}
  actFileExit.ShortCut := KeyToShortCut(VK_Q, [ssCtrl]);
{$ENDIF}
{$IFDEF WINDOWS}
  actFileExit.ShortCut := KeyToShortCut(VK_X, [ssAlt]);
{$ENDIF}
end;

procedure TfrmMain.actFPTemplateProcessExecute(Sender: TObject);
begin
  actFPTemplateProcess.Enabled:= False;
  Application.ProcessMessages;

  if pcMain.PageIndex <> 0 then pcMain.PageIndex:= 0;
  { #todo -ogcarreno : Implement the processing of the fptemplate }

  Application.ProcessMessages;
  actFPTemplateProcess.Enabled:= True;
end;

end.

