unit frmbhnn;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList, Vcl.Menus,
  Vcl.StdCtrls, Vcl.ComCtrls, Data.DB, MemDS, DBAccess, MyAccess, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, dxBarBuiltInMenu, cxPC, cxContainer, cxTextEdit, System.StrUtils,
  dxCore, cxDateUtils, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxMaskEdit, cxCalendar;

type
  TFrbhnn = class(TForm)
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    txtkode: TcxTextEdit;
    txtnama: TcxTextEdit;
    txtsatuan: TcxTextEdit;
    txtperkiraan: TcxTextEdit;
    txtnma: TcxTextEdit;
    txtKdSupp: TcxTextEdit;
    txtNamaSupp: TcxTextEdit;
    txtAlamatSupp: TcxTextEdit;
    Label6: TLabel;
    Label7: TLabel;
    cxDateEdit1: TcxDateEdit;
    Label8: TLabel;
    cbEkspedisi: TcxLookupComboBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    cbInvoiceKe: TcxLookupComboBox;
    cbBln: TcxLookupComboBox;
    cbThn: TcxComboBox;
    txtNoInvoice: TcxTextEdit;
    cbArea: TcxLookupComboBox;
    txtNamaArea: TcxTextEdit;
    RETAIL: TMyConnection;
    MyConnection1: TMyConnection;
    DataSource1: TDataSource;
    com3: TMyQuery;
    DataSource3: TDataSource;
    per: TMyQuery;
    invoiceKe: TMyQuery;
    DataSource4: TDataSource;
    eks: TMyQuery;
    DataSource5: TDataSource;
    area: TMyQuery;
    MyQuery1: TMyQuery;
    com: TMyQuery;
    com2: TMyQuery;
    procedure Edit2KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtketKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MSaveClick(Sender: TObject);
    procedure Hapus;
    procedure ceck;
    procedure MExitClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure txtKdSuppExit(Sender: TObject);
    procedure cbAreaExit(Sender: TObject);
//    function LeftStr(const AText: AnsiString; const ACount: Integer): AnsiString; overload;
//    function LeftStr(const AText: string; const ACount: Integer): string; overload;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frbhnn: TFrbhnn;
  cek : integer;

implementation
uses frmekspedisi, frmsupf;
{$R *.dfm}

procedure TFrbhnn.cbAreaExit(Sender: TObject);
begin
area.First;
  while not area.eof do
  begin
    if area.FieldByName('kd_area').Value = cbArea.Text then
    begin
      txtNamaArea.Text := area.FieldByName('nama_area').Value;
    end;
    area.Next;
  end;
end;

procedure TFrbhnn.ceck;
var
 month,year,date:Word;
 monthx,yearx:String;
begin

end;


procedure TFrbhnn.MSaveClick(Sender: TObject);
var
  i,r,r1,id :integer;
  kode,periode ,bkt, bkt1, ckode, dkode: string;
  month,year,date:Word;
  monthString:String;
  monthx,yearx:String;
begin
  //DecodeDate(frmenu.DateTimePicker1.date,year,month,date);
  monthx := IntToStr(month);
  yearx := IntToStr(year);
  if Length(monthx)<2 then
  begin
    monthx := '0' + monthx;
  end;

  cek := 0;
  ceck;

  if cek = 0 then
  begin
    MessageBox(handle,'Data tidak boleh kosong!!','Peringatan',MB_OK);
  end

  else
  begin
  end;
end;


procedure TFrbhnn.txtKdSuppExit(Sender: TObject);
var b1 : string;
begin
  if txtKdSupp.text <>'' then
  begin

    b1 := txtKdSupp.text ;
    com.SQL.Clear;
    com.sql.text := 'select KODES, NAMAS, ALAMAT, KOTA from SUP where KODES=:b1';
    com.Params.ParamByName('b1').AsString := b1;
    com.Open;

   if not com.EOF then
      begin
        txtKdSupp.text := com.FieldByName('kodes').AsString;
        txtNamaSupp.text := com.FieldByName('namas').AsString;
        txtAlamatSupp.Text := com.FieldByName('alamat').AsString;
      end
   else
      begin
        frsupF.ShowModal;
       // FrsupF.Show;
        txtKdSupp.text := frsupF.getKode;
        txtNamaSupp.text := frsupF.getNama;
        txtAlamatSupp.Text := frsupf.getalamat;
        FrsupF.Close;
      end;
   end;

  end;

procedure TFrbhnn.txtketKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = 13 then
  begin
    //PageControl1.TabIndex := 1;
  end;
end;

procedure TFrbhnn.Edit2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = 13 then
  begin
   //PageControl1.TabIndex := 0;
  end;
end;

procedure TFrbhnn.MExitClick(Sender: TObject);
begin
  close;
end;

procedure TFrbhnn.FormCreate(Sender: TObject);
begin
 frbhnn.ClientHeight:=470;
end;

procedure TFrbhnn.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if key = VK_RETURN then
  begin
    frbhnn.perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TFrbhnn.FormShow(Sender: TObject);
begin
  eks.Active := True;
  per.Active := True;
  invoiceKe.Active := True;
  area.Active := True;
end;

procedure TFrbhnn.hapus;
begin
 txtkode.text :='+';
 txtnama.text :='';
 txtsatuan.text :='';
 txtperkiraan.text :='';
 txtnma.text :='';

 txtkode.Enabled := True;
 end;




end.
