object FrsupF: TFrsupF
  Left = 0
  Top = 0
  Caption = 'Supplier'
  ClientHeight = 318
  ClientWidth = 852
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 852
    Height = 318
    Align = alClient
    TabOrder = 0
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'MoneyTwins'
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnDblClick = cxGrid1DBTableView1DblClick
      OnKeyDown = cxGrid1DBTableView1KeyDown
      Navigator.Buttons.ConfirmDelete = True
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      FindPanel.DisplayMode = fpdmAlways
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      OptionsView.GroupFooters = gfVisibleWhenExpanded
      OptionsView.Indicator = True
      object cxGrid1DBTableView1kodes: TcxGridDBColumn
        Caption = 'Kode'
        DataBinding.FieldName = 'kodes'
        Width = 120
      end
      object cxGrid1DBTableView1namas: TcxGridDBColumn
        Caption = 'Nama'
        DataBinding.FieldName = 'namas'
        Width = 300
      end
      object cxGrid1DBTableView1alamat: TcxGridDBColumn
        Caption = 'Alamat'
        DataBinding.FieldName = 'alamat'
        Width = 250
      end
      object cxGrid1DBTableView1kota: TcxGridDBColumn
        Caption = 'Kota'
        DataBinding.FieldName = 'kota'
        Width = 120
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object DataSource1: TDataSource
    DataSet = sup
    Left = 152
    Top = 144
  end
  object sup: TMyQuery
    Connection = MyConnection1
    SQL.Strings = (
      'select kodes,namas,alamat,kota from sup')
    Left = 88
    Top = 144
  end
  object MyConnection1: TMyConnection
    Database = 'kmbs20test'
    Username = 'root'
    Server = 'localhost'
    Connected = True
    Left = 408
    Top = 136
  end
end
