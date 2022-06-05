unit BrowserDockForm;

interface

uses
  System.SysUtils, System.Classes, BaseDockForm, Winapi.WebView2,
  Winapi.ActiveX, Vcl.Controls, Vcl.Edge, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.OleCtrls, SHDocVw;

type
  TBrowserDockableForm = class(TBaseDockableForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    WebBrowser: TWebBrowser;
    procedure SpeedButton1Click(Sender: TObject);
  public
    class procedure RemoveBrowserDockForm;
    class procedure ShowBrowserDockForm;
    class procedure CreateBrowserDockForm;
  end;

var FormInstance: TBaseDockableForm = nil;

implementation

{$R *.dfm}

{ TBrowserDockableForm }

class procedure TBrowserDockableForm.CreateBrowserDockForm;
begin
  if not Assigned(FormInstance)
    then CreateDockableForm(FormInstance, TBrowserDockableForm);
end;

class procedure TBrowserDockableForm.RemoveBrowserDockForm;
begin
  FreeDockableForm(FormInstance);
end;

class procedure TBrowserDockableForm.ShowBrowserDockForm;
begin
  CreateBrowserDockForm;
  ShowDockableForm(FormInstance);
end;

procedure TBrowserDockableForm.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  WebBrowser.Navigate('https://www.google.com');
  Panel1.Caption := ExtractFileName(ExtractFileName(ParamStr(0)));
end;

end.
