unit BaseDockForm;

interface

uses Windows, SysUtils, Classes, Vcl.Forms, DockForm;

type
  TBaseDockableFormClass = class of TBaseDockableForm;
  TBaseDockableForm = class(TDockableForm)
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    class procedure ShowDockableForm(Form: TBaseDockableForm);
    class procedure CreateDockableForm(var FormVar: TBaseDockableForm; FormClass: TBaseDockableFormClass);
    class procedure FreeDockableForm(var FormVar: TBaseDockableForm);
  end;

implementation

{$R *.dfm}

uses DeskUtil;

procedure RegisterDockableForm(FormClass: TBaseDockableFormClass;
  var FormVar; const FormName: string);
begin
  if @RegisterFieldAddress <> nil then
    RegisterFieldAddress(FormName, @FormVar);

  RegisterDesktopFormClass(FormClass, FormName, FormName);
end;

procedure UnRegisterDockableForm(var FormVar; const FormName: string);
begin
  if @UnregisterFieldAddress <> nil then
    UnregisterFieldAddress(@FormVar);
end;

{ TIDEDockableForm }

constructor TBaseDockableForm.Create(AOwner: TComponent);
begin
  inherited;
  DeskSection := Name;
  AutoSave := True;
  SaveStateNecessary := True;
end;

destructor TBaseDockableForm.Destroy;
begin
  SaveStateNecessary := True;
  inherited;
end;

class procedure TBaseDockableForm.ShowDockableForm(Form: TBaseDockableForm);
begin
  if not Assigned(Form) then
    Exit;
  if not Form.Floating then
  begin
    Form.ForceShow;
    FocusWindow(Form);
  end
  else
    Form.Show;
end;

class procedure TBaseDockableForm.CreateDockableForm(var FormVar: TBaseDockableForm; FormClass: TBaseDockableFormClass);
begin
  TCustomForm(FormVar) := FormClass.Create(nil);
  RegisterDockableForm(FormClass, FormVar, TCustomForm(FormVar).Name);
end;

class procedure TBaseDockableForm.FreeDockableForm(var FormVar: TBaseDockableForm);
begin
  if Assigned(FormVar) then
  begin
    UnRegisterDockableForm(FormVar, FormVar.Name);
    FreeAndNil(FormVar);
  end;
end;

end.
