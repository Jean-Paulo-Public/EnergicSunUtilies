unit AnotacoesDockForm;

interface

uses
  Windows, SysUtils, Classes, Vcl.Dialogs,
  BaseDockForm, Vcl.Controls, Vcl.ExtCtrls, Vcl.Grids, Data.DB, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask, JvExMask,
  JvToolEdit, JvBaseEdits, JvDBControls, System.Win.Registry, System.Threading;

type
  TAnotacoesDockableForm = class(TBaseDockableForm)
    Memo1: TMemo;
    procedure FormActivate(Sender: TObject);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
  private
    procedure SaveKey(KeyName, KeyValue: string);
  public
    class procedure RemoveAnotacoesDockForm;
    class procedure ShowAnotacoesDockForm;
    class procedure CreateAnotacoesDockForm;
  end;

implementation

{$R *.dfm}

const cKey = 'SOFTWARE\EnergicSunUtilies\Anotacoes';

var FormInstance: TBaseDockableForm = nil;

{ TAnotacoesDockableForm }

procedure TAnotacoesDockableForm.SaveKey(KeyName, KeyValue: string);
var reg: TRegistry;
begin
  reg := TRegistry.Create(KEY_READ);
  reg.RootKey := HKEY_CURRENT_USER;
  reg.Access := KEY_WRITE;

  if not reg.OpenKey(cKey,True)
    then reg.CreateKey(cKey);

  Reg.WriteString(KeyName, KeyValue);

  reg.CloseKey();
  reg.Free;
end;

class procedure TAnotacoesDockableForm.CreateAnotacoesDockForm;
begin
  if not Assigned(FormInstance)
    then CreateDockableForm(FormInstance, TAnotacoesDockableForm);
end;

class procedure TAnotacoesDockableForm.ShowAnotacoesDockForm;
begin
  CreateAnotacoesDockForm;
  ShowDockableForm(FormInstance);
end;

procedure TAnotacoesDockableForm.FormActivate(Sender: TObject);
  procedure LoadKey(KeyName: string);
  var lReg: TRegistry;
  begin
    lReg := TRegistry.Create;
    lReg.RootKey := HKEY_CURRENT_USER;
    lReg.OpenKey(cKey, True);

    if lReg.ValueExists(KeyName)
      then Memo1.Text := lReg.ReadString(KeyName);

    lReg.CloseKey;
    lReg.Free;
  end;
begin
  LoadKey(self.name + '.Text');
end;

procedure TAnotacoesDockableForm.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
  SaveKey(self.name + '.Text', Memo1.Text + Key);
end;

class procedure TAnotacoesDockableForm.RemoveAnotacoesDockForm;
begin
  FreeDockableForm(FormInstance);
end;

end.
