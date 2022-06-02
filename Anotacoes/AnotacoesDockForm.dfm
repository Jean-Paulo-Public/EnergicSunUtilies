inherited AnotacoesDockableForm: TAnotacoesDockableForm
  Left = 323
  Top = 229
  Caption = 'Anota'#231#245'es'
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 393
    Height = 231
    Align = alClient
    TabOrder = 0
    OnKeyPress = Memo1KeyPress
  end
end
