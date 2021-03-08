object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Ambil Data Expedisi'
  ClientHeight = 331
  ClientWidth = 635
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel1: TcxLabel
    Left = 24
    Top = 72
    Caption = 'Nama Ekspedisi'
  end
  object cxLabel2: TcxLabel
    Left = 24
    Top = 98
    Caption = 'Invoice Ke '
  end
  object cxLabel3: TcxLabel
    Left = 26
    Top = 126
    Caption = 'Periode'
  end
  object cbEkspedisi: TcxLookupComboBox
    Left = 107
    Top = 71
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
    TabOrder = 4
    Width = 134
  end
  object btnProses: TcxButton
    Left = 107
    Top = 208
    Width = 94
    Height = 25
    Caption = 'Proses By Brand'
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'iMaginary'
    TabOrder = 10
    OnClick = btnProsesClick
  end
  object cxLabel4: TcxLabel
    Left = 24
    Top = 49
    Caption = 'Tanggal'
  end
  object cxLabel5: TcxLabel
    Left = 26
    Top = 153
    Caption = 'No. Invoice'
  end
  object txtNoInvoice: TcxTextEdit
    Left = 107
    Top = 152
    Style.LookAndFeel.NativeStyle = False
    Style.LookAndFeel.SkinName = 'Blue'
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 7
    Width = 134
  end
  object cxLabel6: TcxLabel
    Left = 24
    Top = 22
    Caption = 'Supplier'
  end
  object txtKdSupp: TcxTextEdit
    Left = 107
    Top = 21
    Style.LookAndFeel.NativeStyle = False
    Style.LookAndFeel.SkinName = 'iMaginary'
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.SkinName = 'iMaginary'
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.SkinName = 'iMaginary'
    StyleHot.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.SkinName = 'iMaginary'
    TabOrder = 0
    OnExit = txtKdSuppExit
    OnKeyDown = txtKdSuppKeyDown
    Width = 134
  end
  object txtNamaSupp: TcxTextEdit
    Left = 247
    Top = 21
    Enabled = False
    Style.LookAndFeel.SkinName = 'iMaginary'
    StyleDisabled.LookAndFeel.SkinName = 'iMaginary'
    StyleFocused.LookAndFeel.SkinName = 'iMaginary'
    StyleHot.LookAndFeel.SkinName = 'iMaginary'
    TabOrder = 2
    Width = 134
  end
  object dtTgl: TcxDateEdit
    Left = 107
    Top = 45
    Style.LookAndFeel.NativeStyle = False
    Style.LookAndFeel.SkinName = 'Blue'
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 1
    Width = 134
  end
  object txtAlamatSupp: TcxTextEdit
    Left = 387
    Top = 21
    Enabled = False
    Style.LookAndFeel.SkinName = 'iMaginary'
    StyleDisabled.LookAndFeel.SkinName = 'iMaginary'
    StyleFocused.LookAndFeel.SkinName = 'iMaginary'
    StyleHot.LookAndFeel.SkinName = 'iMaginary'
    TabOrder = 3
    Width = 134
  end
  object cbBln: TcxLookupComboBox
    Left = 107
    Top = 125
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
    TabOrder = 6
    Width = 134
  end
  object cbInvoiceKe: TcxLookupComboBox
    Left = 107
    Top = 98
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
    TabOrder = 5
    Width = 134
  end
  object cxLabel7: TcxLabel
    Left = 24
    Top = 180
    Caption = 'Dari Area'
  end
  object cbArea: TcxLookupComboBox
    Left = 107
    Top = 179
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
    TabOrder = 8
    OnExit = cbAreaExit
    Width = 134
  end
  object txtNamaArea: TcxTextEdit
    Left = 247
    Top = 179
    Enabled = False
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
  object btnProsesAllBrand: TcxButton
    Left = 207
    Top = 208
    Width = 102
    Height = 25
    Caption = 'Proses All Brand'
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'iMaginary'
    TabOrder = 11
    OnClick = btnProsesAllBrandClick
  end
  object btnProsesByBrandAWB: TcxButton
    Left = 315
    Top = 208
    Width = 134
    Height = 25
    Caption = 'Proses By Brand + AWB'
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'iMaginary'
    TabOrder = 19
    OnClick = btnProsesByBrandAWBClick
  end
  object btnProsesAllBrandAWB: TcxButton
    Left = 455
    Top = 208
    Width = 134
    Height = 25
    Caption = 'Proses All Brand + AWB'
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'iMaginary'
    TabOrder = 20
    OnClick = btnProsesAllBrandAWBClick
  end
  object cbThn: TcxComboBox
    Left = 247
    Top = 125
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
    TabOrder = 21
    Width = 134
  end
  object btnFrmBahan: TcxButton
    Left = 107
    Top = 256
    Width = 94
    Height = 25
    Caption = 'Frm Bahan'
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'iMaginary'
    TabOrder = 22
    OnClick = btnFrmBahanClick
  end
  object MyConnection1: TMyConnection
    Database = 'kmbs20test'
    Username = 'root'
    Server = 'localhost'
    Connected = True
    Left = 368
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
  object DataSource1: TDataSource
    DataSet = eks
    Left = 424
    Top = 64
  end
  object com: TMyQuery
    Connection = MyConnection1
    Left = 464
    Top = 160
  end
  object DataSource2: TDataSource
    Left = 824
    Top = 24
  end
  object MyQuery1: TMyQuery
    Connection = RETAIL
    Left = 592
    Top = 160
  end
  object per: TMyQuery
    Connection = RETAIL
    SQL.Strings = (
      'SELECT DISTINCT BLN '
      'FROM `validasi_expedisi_2017`;')
    Left = 592
    Top = 16
  end
  object invoiceKe: TMyQuery
    Connection = RETAIL
    SQL.Strings = (
      'SELECT DISTINCT INVOICE_KE '
      'FROM `validasi_expedisi_2017`;')
    Left = 592
    Top = 64
  end
  object DataSource3: TDataSource
    DataSet = per
    Left = 536
    Top = 16
  end
  object DataSource4: TDataSource
    DataSet = invoiceKe
    Left = 520
    Top = 64
  end
  object area: TMyQuery
    Connection = RETAIL
    SQL.Strings = (
      'SELECT *'
      'FROM master_area;')
    Left = 592
    Top = 112
  end
  object DataSource5: TDataSource
    DataSet = area
    Left = 520
    Top = 112
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
  object com2: TMyQuery
    Connection = RETAIL
    Left = 424
    Top = 160
  end
  object com3: TMyQuery
    Connection = RETAIL
    Left = 472
    Top = 56
  end
end
