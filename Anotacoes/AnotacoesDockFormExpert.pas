unit AnotacoesDockFormExpert;

interface

uses ToolsAPI, AnotacoesDockForm;

type
  TDockFormExpert = class(TNotifierObject, IOTANotifier, IOTAWizard, IOTAMenuWizard)
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
  RegisterPackageWizard(TDockFormExpert.Create as IOTAMenuWizard);
  TAnotacoesDockableForm.CreateAnotacoesDockForm;
end;

{ TDockFormExpert }

procedure TDockFormExpert.Destroyed;
begin
  TAnotacoesDockableForm.RemoveAnotacoesDockForm;
end;

procedure TDockFormExpert.Execute;
begin
  TAnotacoesDockableForm.ShowAnotacoesDockForm;
end;

function TDockFormExpert.GetIDString: string;
begin
  Result := 'EB.DockingFormExpert';
end;

function TDockFormExpert.GetMenuText: string;
begin
  Result := 'Abrir anotações';
end;

function TDockFormExpert.GetName: string;
begin
  Result := 'Docking Form Expert';
end;

function TDockFormExpert.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;

initialization
finalization
  TAnotacoesDockableForm.RemoveAnotacoesDockForm;

end.
