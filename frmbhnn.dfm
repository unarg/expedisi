object Frbhnn: TFrbhnn
  Left = 0
  Top = 0
  Caption = 'Data Bahan'
  ClientHeight = 488
  ClientWidth = 623
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxPageControl1: TcxPageControl
    Left = 6
    Top = 2
    Width = 609
    Height = 463
    TabOrder = 0
    Properties.ActivePage = cxTabSheet1
    Properties.CustomButtons.Buttons = <>
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Lilian'
    ClientRectBottom = 456
    ClientRectLeft = 3
    ClientRectRight = 602
    ClientRectTop = 27
    object cxTabSheet1: TcxTabSheet
      Caption = 'Main'
      ImageIndex = 0
      ExplicitHeight = 173
      object Label3: TLabel
        Left = 15
        Top = 24
        Width = 24
        Height = 13
        Caption = 'Kode'
        Color = clBtnHighlight
        ParentColor = False
      end
      object Label1: TLabel
        Left = 15
        Top = 51
        Width = 27
        Height = 13
        Caption = 'Nama'
        Color = clBtnHighlight
        ParentColor = False
      end
      object Label2: TLabel
        Left = 15
        Top = 75
        Width = 34
        Height = 13
        Caption = 'Satuan'
        Color = clBtnHighlight
        ParentColor = False
      end
      object Label4: TLabel
        Left = 15
        Top = 105
        Width = 45
        Height = 13
        Caption = 'Perkiraan'
        Color = clBtnHighlight
        ParentColor = False
      end
      object Label5: TLabel
        Left = 15
        Top = 132
        Width = 27
        Height = 13
        Caption = 'Nama'
        Color = clBtnHighlight
        ParentColor = False
      end
      object Label6: TLabel
        Left = 15
        Top = 159
        Width = 38
        Height = 13
        Caption = 'Supplier'
        Color = clBtnHighlight
        ParentColor = False
      end
      object Label7: TLabel
        Left = 15
        Top = 186
        Width = 38
        Height = 13
        Caption = 'Tanggal'
        Color = clBtnHighlight
        ParentColor = False
      end
      object Label8: TLabel
        Left = 15
        Top = 218
        Width = 46
        Height = 13
        Caption = 'Ekspedisi '
        Color = clBtnHighlight
        ParentColor = False
      end
      object Label9: TLabel
        Left = 15
        Top = 248
        Width = 50
        Height = 15
        Caption = 'Invoice Ke'
        Color = clBtnHighlight
        ParentColor = False
      end
      object Label10: TLabel
        Left = 15
        Top = 269
        Width = 36
        Height = 13
        Caption = 'Periode'
        Color = clBtnHighlight
        ParentColor = False
      end
      object Label11: TLabel
        Left = 15
        Top = 298
        Width = 52
        Height = 13
        Caption = 'No.Invoice'
        Color = clBtnHighlight
        ParentColor = False
      end
      object Label12: TLabel
        Left = 15
        Top = 330
        Width = 23
        Height = 13
        Caption = 'Area'
        Color = clBtnHighlight
        ParentColor = False
      end
      object txtkode: TcxTextEdit
        Left = 73
        Top = 21
        Properties.CharCase = ecUpperCase
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'Blue'
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'Blue'
        StyleDisabled.TextColor = clBlack
        StyleFocused.Color = 16642005
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'Blue'
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'Blue'
        TabOrder = 0
        Width = 150
      end
      object txtnama: TcxTextEdit
        Left = 73
        Top = 48
        Properties.CharCase = ecUpperCase
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'Blue'
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'Blue'
        StyleDisabled.TextColor = clBlack
        StyleFocused.Color = 16642005
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'Blue'
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'Blue'
        TabOrder = 1
        Width = 250
      end
      object txtsatuan: TcxTextEdit
        Left = 73
        Top = 75
        Properties.CharCase = ecUpperCase
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'Blue'
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'Blue'
        StyleDisabled.TextColor = clBlack
        StyleFocused.Color = 16642005
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'Blue'
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'Blue'
        TabOrder = 2
        Width = 145
      end
      object txtperkiraan: TcxTextEdit
        Left = 73
        Top = 102
        Properties.CharCase = ecUpperCase
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'Blue'
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'Blue'
        StyleDisabled.TextColor = clBlack
        StyleFocused.Color = 16642005
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'Blue'
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'Blue'
        TabOrder = 3
        Width = 145
      end
      object txtnma: TcxTextEdit
        Left = 73
        Top = 129
        Properties.CharCase = ecUpperCase
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'Blue'
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'Blue'
        StyleDisabled.TextColor = clBlack
        StyleFocused.Color = 16642005
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'Blue'
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'Blue'
        TabOrder = 4
        Width = 249
      end
      object txtKdSupp: TcxTextEdit
        Left = 73
        Top = 156
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'iMaginary'
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'iMaginary'
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'iMaginary'
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'iMaginary'
        TabOrder = 5
        OnExit = txtKdSuppExit
        Width = 134
      end
      object txtNamaSupp: TcxTextEdit
        Left = 213
        Top = 156
        Enabled = False
        Style.LookAndFeel.SkinName = 'iMaginary'
        StyleDisabled.LookAndFeel.SkinName = 'iMaginary'
        StyleFocused.LookAndFeel.SkinName = 'iMaginary'
        StyleHot.LookAndFeel.SkinName = 'iMaginary'
        TabOrder = 6
        Width = 134
      end
      object txtAlamatSupp: TcxTextEdit
        Left = 353
        Top = 156
        Enabled = False
        Style.LookAndFeel.SkinName = 'iMaginary'
        StyleDisabled.LookAndFeel.SkinName = 'iMaginary'
        StyleFocused.LookAndFeel.SkinName = 'iMaginary'
        StyleHot.LookAndFeel.SkinName = 'iMaginary'
        TabOrder = 7
        Width = 134
      end
      object cxDateEdit1: TcxDateEdit
        Left = 73
        Top = 183
        TabOrder = 8
        Width = 134
      end
      object cbEkspedisi: TcxLookupComboBox
        Left = 73
        Top = 215
        Properties.KeyFieldNames = 'EXPEDISI'
        Properties.ListColumns = <
          item
            FieldName = 'EXPEDISI'
          end>
        Properties.ListSource = DataSource1
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'Blue'
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'Blue'
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'Blue'
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'Blue'
        TabOrder = 9
        Width = 134
      end
      object cbInvoiceKe: TcxLookupComboBox
        Left = 71
        Top = 245
        Properties.KeyFieldNames = 'INVOICE_KE'
        Properties.ListColumns = <
          item
            FieldName = 'INVOICE_KE'
          end>
        Properties.ListSource = DataSource4
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'Blue'
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'Blue'
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'Blue'
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'Blue'
        TabOrder = 10
        Width = 134
      end
      object cbBln: TcxLookupComboBox
        Left = 71
        Top = 272
        Properties.KeyFieldNames = 'BLN'
        Properties.ListColumns = <
          item
            FieldName = 'BLN'
          end>
        Properties.ListSource = DataSource3
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'Blue'
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'Blue'
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'Blue'
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'Blue'
        TabOrder = 11
        Width = 134
      end
      object cbThn: TcxComboBox
        Left = 211
        Top = 272
        Properties.Items.Strings = (
          '2014'
          '2015'
          '2016'
          '2017'
          '2018')
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'Blue'
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'Blue'
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'Blue'
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'Blue'
        TabOrder = 12
        Width = 134
      end
      object txtNoInvoice: TcxTextEdit
        Left = 71
        Top = 299
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'Blue'
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'Blue'
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'Blue'
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'Blue'
        TabOrder = 13
        Width = 134
      end
      object cbArea: TcxLookupComboBox
        Left = 71
        Top = 326
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
        Style.LookAndFeel.SkinName = 'Blue'
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'Blue'
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'Blue'
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'Blue'
        TabOrder = 14
        OnExit = cbAreaExit
        Width = 134
      end
      object txtNamaArea: TcxTextEdit
        Left = 211
        Top = 326
        Enabled = False
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'Blue'
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'Blue'
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'Blue'
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'Blue'
        TabOrder = 15
        Width = 134
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = '-'
      ImageIndex = 1
      ExplicitHeight = 173
    end
  end
  object RETAIL: TMyConnection
    Database = 'webgudang'
    Username = 'userfin1'
    Server = '192.168.3.2'
    Connected = True
    Left = 424
    Top = 112
    EncryptedPassword = '8AFF8CFF9AFF8DFF99FF96FF91FFCEFF'
  end
  object MyConnection1: TMyConnection
    Database = 'kmbst'
    Username = 'root'
    Server = '192.168.0.200'
    Connected = True
    Left = 368
    Top = 64
    EncryptedPassword = '8CFF9AFF8DFF89FF9AFF8DFF'
  end
  object DataSource1: TDataSource
    DataSet = eks
    Left = 424
    Top = 64
  end
  object com3: TMyQuery
    Connection = RETAIL
    Left = 472
    Top = 56
  end
  object DataSource3: TDataSource
    DataSet = per
    Left = 560
    Top = 32
  end
  object per: TMyQuery
    Connection = RETAIL
    SQL.Strings = (
      'SELECT DISTINCT BLN '
      'FROM `validasi_expedisi_2017`;')
    Left = 520
    Top = 184
  end
  object invoiceKe: TMyQuery
    Connection = RETAIL
    SQL.Strings = (
      'SELECT DISTINCT INVOICE_KE '
      'FROM `validasi_expedisi_2017`;')
    Left = 520
    Top = 232
  end
  object DataSource4: TDataSource
    DataSet = invoiceKe
    Left = 520
    Top = 64
  end
  object eks: TMyQuery
    Connection = RETAIL
    SQL.Strings = (
      'SELECT DISTINCT EXPEDISI '
      'FROM `validasi_expedisi_2017`;')
    Left = 464
    Top = 112
  end
  object DataSource5: TDataSource
    DataSet = area
    Left = 520
    Top = 112
  end
  object area: TMyQuery
    Connection = RETAIL
    SQL.Strings = (
      'SELECT *'
      'FROM master_area;')
    Left = 520
    Top = 280
  end
  object MyQuery1: TMyQuery
    Connection = RETAIL
    Left = 520
    Top = 336
  end
  object com: TMyQuery
    Connection = MyConnection1
    Left = 432
    Top = 280
  end
  object com2: TMyQuery
    Connection = RETAIL
    Left = 432
    Top = 224
  end
end
