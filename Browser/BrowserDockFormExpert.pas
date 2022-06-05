unit BrowserDockFormExpert;

interface

uses ToolsAPI, BrowserDockForm;

type
  TBrowserDockFormExpert = class(TNotifierObject, IOTANotifier, IOTAWizard, IOTAMenuWizard)
  public
    procedure Execute;
    function GetIDString: string;
    function GetMenuText: string;
    function GetName: string;
    function GetState: TWizardState;
    procedure Destroyed;
  end;

  procedure Register;

implementation

procedure Register;
begin
  RegisterPackageWizard(TBrowserDockFormExpert.Create as IOTAMenuWizard);
  TBrowserDockableForm.CreateBrowserDockForm;
end;

{ TDockFormExpert }

procedure TBrowserDockFormExpert.Destroyed;
begin
  TBrowserDockableForm.RemoveBrowserDockForm;
end;

procedure TBrowserDockFormExpert.Execute;
begin
  TBrowserDockableForm.ShowBrowserDockForm;
end;

function TBrowserDockFormExpert.GetIDString: string;
begin
  Result := 'EB.BrowserFormExpert';
end;

function TBrowserDockFormExpert.GetMenuText: string;
begin
  Result := 'Abrir Browser';
end;

function TBrowserDockFormExpert.GetName: string;
begin
  Result := 'Browser Form Expert';
end;

function TBrowserDockFormExpert.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;

initialization
finalization
  TBrowserDockableForm.RemoveBrowserDockForm;

end.
