object FrEkspedisiNov: TFrEkspedisiNov
  Left = 0
  Top = 0
  Caption = 'Ambil Data Ekspedisi'
  ClientHeight = 315
  ClientWidth = 617
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 0
    Width = 617
    Height = 315
    Align = alClient
    Color = clSkyBlue
    ParentBackground = False
    ParentColor = False
    TabOrder = 0
    Properties.ActivePage = cxTabSheet1
    Properties.CustomButtons.Buttons = <>
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'LiquidSky'
    ClientRectBottom = 311
    ClientRectLeft = 4
    ClientRectRight = 613
    ClientRectTop = 27
    object cxTabSheet1: TcxTabSheet
      Caption = 'Main'
      Color = clSkyBlue
      ImageIndex = 0
      ParentColor = False
      object Label6: TLabel
        Left = 23
        Top = 63
        Width = 38
        Height = 13
        Caption = 'Supplier'
        Color = clBtnHighlight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label8: TLabel
        Left = 23
        Top = 119
        Width = 46
        Height = 13
        Caption = 'Ekspedisi '
        Color = clBtnHighlight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label9: TLabel
        Left = 23
        Top = 143
        Width = 50
        Height = 13
        Caption = 'Invoice Ke'
        Color = clBtnHighlight
        ParentColor = False
      end
      object Label10: TLabel
        Left = 23
        Top = 88
        Width = 36
        Height = 13
        Caption = 'Periode'
        Color = clBtnHighlight
        ParentColor = False
      end
      object Label12: TLabel
        Left = 23
        Top = 200
        Width = 23
        Height = 13
        Caption = 'Area'
        Color = clBtnHighlight
        ParentColor = False
      end
      object Label2: TLabel
        Left = 25
        Top = 173
        Width = 26
        Height = 13
        Caption = 'Moda'
        Color = clBtnHighlight
        ParentColor = False
      end
      object Label3: TLabel
        Left = 23
        Top = 227
        Width = 55
        Height = 13
        Caption = 'No. Invoice'
        Color = clBtnHighlight
        ParentColor = False
      end
      object txtKdSupp: TcxTextEdit
        Left = 83
        Top = 60
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'MoneyTwins'
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'MoneyTwins'
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'MoneyTwins'
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'MoneyTwins'
        TabOrder = 0
        OnExit = txtKdSuppExit
        Width = 134
      end
      object txtNamaSupp: TcxTextEdit
        Left = 221
        Top = 60
        Enabled = False
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'MoneyTwins'
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'MoneyTwins'
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'MoneyTwins'
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'MoneyTwins'
        TabOrder = 1
        Width = 134
      end
      object txtAlamatSupp: TcxTextEdit
        Left = 361
        Top = 60
        Enabled = False
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'MoneyTwins'
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'MoneyTwins'
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'MoneyTwins'
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'MoneyTwins'
        TabOrder = 2
        Width = 134
      end
      object cbEkspedisi: TcxLookupComboBox
        Left = 83
        Top = 116
        Properties.KeyFieldNames = 'EXPEDISI'
        Properties.ListColumns = <
          item
            FieldName = 'EXPEDISI'
          end>
        Properties.ListSource = DataSource1
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'MoneyTwins'
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'MoneyTwins'
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'MoneyTwins'
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'MoneyTwins'
        TabOrder = 5
        Width = 134
      end
      object cbArea: TcxLookupComboBox
        Left = 83
        Top = 197
        Properties.KeyFieldNames = 'kd_area'
        Properties.ListColumns = <
          item
            FieldName = 'kd_area'
          end
          item
            FieldName = 'nama_area'
          end>
        Properties.ListSource = DataSource5
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'MoneyTwins'
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'MoneyTwins'
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'MoneyTwins'
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'MoneyTwins'
        TabOrder = 8
        OnExit = cbAreaExit
        Width = 134
      end
      object txtNamaArea: TcxTextEdit
        Left = 223
        Top = 197
        Enabled = False
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'MoneyTwins'
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'MoneyTwins'
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'MoneyTwins'
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'MoneyTwins'
        TabOrder = 9
        Width = 134
      end
      object cbModa: TcxComboBox
        Left = 83
        Top = 170
        Properties.Items.Strings = (
          'ALL'
          'DARAT'
          'UDARA')
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'MoneyTwins'
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'MoneyTwins'
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'MoneyTwins'
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'MoneyTwins'
        TabOrder = 7
        Width = 134
      end
      object btnProsesAmbilData: TcxButton
        Left = 83
        Top = 251
        Width = 134
        Height = 30
        Caption = 'Proses'
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'MoneyTwins'
        TabOrder = 11
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnProsesAmbilDataClick
      end
      object txtInvoice: TcxTextEdit
        Left = 83
        Top = 224
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'MoneyTwins'
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'MoneyTwins'
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'MoneyTwins'
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'MoneyTwins'
        TabOrder = 10
        Width = 134
      end
      object cxAmbilDatabyInvoice: TcxRadioButton
        Left = 195
        Top = 24
        Width = 160
        Height = 17
        Caption = 'Ambil Data by Invoice'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 12
        OnClick = cxAmbilDatabyInvoiceClick
        LookAndFeel.NativeStyle = True
        LookAndFeel.SkinName = 'MoneyTwins'
      end
      object cxAmbilData: TcxRadioButton
        Left = 89
        Top = 24
        Width = 80
        Height = 17
        Caption = 'Ambil Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 13
        OnClick = cxAmbilDataClick
        LookAndFeel.NativeStyle = True
        LookAndFeel.SkinName = 'MoneyTwins'
      end
      object cbBln: TcxComboBox
        Left = 83
        Top = 87
        Properties.Items.Strings = (
          '01'
          '02'
          '03'
          '04'
          '05'
          '06'
          '07'
          '08'
          '09'
          '10'
          '11'
          '12')
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'MoneyTwins'
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'MoneyTwins'
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'MoneyTwins'
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'MoneyTwins'
        TabOrder = 3
        TextHint = 'Bulan'
        Width = 54
      end
      object txtThn: TcxTextEdit
        Left = 143
        Top = 87
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'MoneyTwins'
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'MoneyTwins'
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'MoneyTwins'
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'MoneyTwins'
        TabOrder = 4
        TextHint = 'Tahun'
        OnExit = txtThnExit
        Width = 72
      end
      object txtInvoiceKe: TcxTextEdit
        Left = 83
        Top = 143
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'MoneyTwins'
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'MoneyTwins'
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'MoneyTwins'
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'MoneyTwins'
        TabOrder = 6
        OnExit = txtThnExit
        Width = 134
      end
      object txtBukti: TcxTextEdit
        Left = 43
        Top = 328
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'MoneyTwins'
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'MoneyTwins'
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'MoneyTwins'
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'MoneyTwins'
        TabOrder = 14
        Visible = False
        Width = 134
      end
    end
  end
  object RETAIL: TMyConnection
    Database = 'webgudang'
    Username = 'userfin1'
    Server = '192.168.3.2'
    Connected = True
    Left = 512
    Top = 120
    EncryptedPassword = '8AFF8CFF9AFF8DFF99FF96FF91FFCEFF'
  end
  object MyConnection1: TMyConnection
    Database = 'kmbs20'
    Username = 'root'
    Server = '192.168.0.111'
    Connected = True
    Left = 408
    Top = 192
    EncryptedPassword = '93FFCEFFCDFFC9FFCDFF97FF9BFF'
  end
  object DataSource1: TDataSource
    DataSet = eks
    Left = 624
    Top = 200
  end
  object com3: TMyQuery
    Connection = MyConnection1
    Left = 512
    Top = 48
  end
  object DataSource3: TDataSource
    DataSet = r1
    Left = 624
    Top = 32
  end
  object invoiceKe: TMyQuery
    Connection = RETAIL
    SQL.Strings = (
      'SELECT DISTINCT INVOICE_KE '
      'FROM `validasi_expedisi_2017`;')
    Left = 736
    Top = 248
  end
  object DataSource4: TDataSource
    DataSet = invoiceKe
    Left = 624
    Top = 88
  end
  object eks: TMyQuery
    Connection = RETAIL
    SQL.Strings = (
      'SELECT DISTINCT EXPEDISI FROM validasi_expedisi_2020;')
    Left = 560
    Top = 88
  end
  object DataSource5: TDataSource
    DataSet = area
    Left = 624
    Top = 144
  end
  object area: TMyQuery
    Connection = RETAIL
    SQL.Strings = (
      'SELECT * FROM master_area;')
    Left = 568
    Top = 232
  end
  object MyQuery1: TMyQuery
    Connection = RETAIL
    Left = 536
    Top = 312
  end
  object com: TMyQuery
    Connection = MyConnection1
    Left = 568
    Top = 184
  end
  object com2: TMyQuery
    Connection = MyConnection1
    Left = 704
    Top = 248
  end
  object sup: TMyQuery
    Connection = MyConnection2
    Left = 232
    Top = 320
  end
  object MyConnection2: TMyConnection
    Database = 'kmbs20'
    Username = 'root'
    Server = '192.168.0.111'
    Connected = True
    Left = 504
    Top = 192
    EncryptedPassword = '93FFCEFFCDFFC9FFCDFF97FF9BFF'
  end
  object DataSource6: TDataSource
    DataSet = moda
    Left = 424
    Top = 128
  end
  object moda: TMyQuery
    Connection = RETAIL
    SQL.Strings = (
      'SELECT DISTINCT EXPEDISI '
      'FROM `validasi_expedisi_2017`;'
      ''
      ''
      'SELECT DISTINCT MODA, IF MODA = '#39'0'#39', '#39'ALL'#39
      'FROM `validasi_expedisi_2017`;')
    Left = 512
    Top = 240
  end
  object c1: TMyQuery
    Connection = MyConnection2
    Left = 672
    Top = 32
  end
  object DataSourceC1: TDataSource
    DataSet = c1
    Left = 728
    Top = 32
  end
  object DataSourceR1: TDataSource
    DataSet = r1
    Left = 728
    Top = 88
  end
  object r1: TMyQuery
    Connection = RETAIL
    Left = 672
    Top = 88
  end
  object c2: TMyQuery
    Connection = MyConnection2
    Left = 672
    Top = 144
  end
  object DataSourceC2: TDataSource
    DataSet = c2
    Left = 728
    Top = 144
  end
  object DataSourceC3: TDataSource
    DataSet = c3
    Left = 728
    Top = 200
  end
  object c3: TMyQuery
    Connection = MyConnection2
    Left = 672
    Top = 200
  end
  object com4: TMyQuery
    Connection = MyConnection1
    Left = 672
    Top = 248
  end
  object MainMenu1: TMainMenu
    Left = 560
    Top = 32
    object Refresh1: TMenuItem
      Caption = 'Refresh'
      OnClick = Refresh1Click
    end
    object E1: TMenuItem
      Caption = 'Exit'
      OnClick = E1Click
    end
  end
end
