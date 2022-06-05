inherited BrowserDockableForm: TBrowserDockableForm
  Caption = 'Browser'
  ClientHeight = 351
  ClientWidth = 748
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 748
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    BevelWidth = 3
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 667
      Top = 6
      Width = 75
      Height = 29
      Align = alRight
      Caption = 'GO'
      OnClick = SpeedButton1Click
    end
  end
  object WebBrowser: TWebBrowser
    Left = 0
    Top = 41
    Width = 748
    Height = 310
    Align = alClient
    TabOrder = 1
    ControlData = {
      4C0000004F4D00000A2000000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
end
