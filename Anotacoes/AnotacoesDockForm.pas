unit AnotacoesDockForm;

interface

uses
  Windows, SysUtils, Classes, Vcl.Dialogs,
  BaseDockForm, Vcl.Controls, Vcl.ExtCtrls, Vcl.Grids, Data.DB, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask, JvExMask,
  JvToolEdit, JvBaseEdits, JvDBControls, System.Win.Registry;

type
  TAnotacoesDockableForm = class(TBaseDockableForm)
    Memo1: TMemo;
    procedure FormActivate(Sender: TObject);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
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
var
  lReg: TRegistry;
  getInt: integer;
begin
  inherited;
  lReg := TRegistry.Create;
  lReg.RootKey := HKEY_CURRENT_USER;
  lReg.OpenKey(cKey, True);

  if lReg.ValueExists(self.name + '.Text')
    then Memo1.Text := lReg.ReadString(self.name + '.Text');

  lReg.CloseKey;
  lReg.Free;
end;

procedure TAnotacoesDockableForm.Memo1KeyPress(Sender: TObject; var Key: Char);
var
  reg        : TRegistry;
  openResult : Boolean;
begin
  inherited;
  if Key = #13 then begin
    reg := TRegistry.Create(KEY_READ);
    reg.RootKey := HKEY_CURRENT_USER;

    reg.Access := KEY_WRITE;
    openResult := reg.OpenKey(cKey,True);

    if not openResult then begin
      reg.CreateKey(cKey + '.Text');
      ShowMessage('Salvo com sucesso! Será salvo sempre ao dar enter');
    end;

    Reg.WriteString(self.name + '.Text', Memo1.Text);

    reg.CloseKey();
    reg.Free;
  end;
end;

class procedure TAnotacoesDockableForm.RemoveAnotacoesDockForm;
begin
  FreeDockableForm(FormInstance);
end;

end.
