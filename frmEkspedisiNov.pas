unit frmEkspedisiNov;

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
  cxDBLookupComboBox, cxMaskEdit, cxCalendar, cxButtons, cxRadioGroup;

type
  TFrEkspedisiNov = class(TForm)
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    txtKdSupp: TcxTextEdit;
    txtNamaSupp: TcxTextEdit;
    txtAlamatSupp: TcxTextEdit;
    Label6: TLabel;
    Label8: TLabel;
    cbEkspedisi: TcxLookupComboBox;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    cbArea: TcxLookupComboBox;
    txtNamaArea: TcxTextEdit;
    RETAIL: TMyConnection;
    MyConnection1: TMyConnection;
    DataSource1: TDataSource;
    com3: TMyQuery;
    DataSource3: TDataSource;
    invoiceKe: TMyQuery;
    DataSource4: TDataSource;
    eks: TMyQuery;
    DataSource5: TDataSource;
    area: TMyQuery;
    MyQuery1: TMyQuery;
    com: TMyQuery;
    com2: TMyQuery;
    Label2: TLabel;
    cbModa: TcxComboBox;
    sup: TMyQuery;
    MyConnection2: TMyConnection;
    DataSource6: TDataSource;
    moda: TMyQuery;
    btnProsesAmbilData: TcxButton;
    c1: TMyQuery;
    DataSourceC1: TDataSource;
    DataSourceR1: TDataSource;
    r1: TMyQuery;
    c2: TMyQuery;
    DataSourceC2: TDataSource;
    DataSourceC3: TDataSource;
    c3: TMyQuery;
    com4: TMyQuery;
    MainMenu1: TMainMenu;
    Refresh1: TMenuItem;
    txtInvoice: TcxTextEdit;
    Label3: TLabel;
    cxAmbilDatabyInvoice: TcxRadioButton;
    cxAmbilData: TcxRadioButton;
    E1: TMenuItem;
    cbBln: TcxComboBox;
    txtThn: TcxTextEdit;
    txtInvoiceKe: TcxTextEdit;
    txtBukti: TcxTextEdit;
    procedure Edit2KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtketKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MSaveClick(Sender: TObject);
    procedure ceck;
    procedure ceck2;
    procedure MExitClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure txtKdSuppExit(Sender: TObject);
    procedure cbAreaExit(Sender: TObject);
    procedure Hapus;
    procedure btnProsesAmbilDataClick(Sender: TObject);

    procedure Refresh1Click(Sender: TObject);
    procedure cxAmbilDatabyInvoiceClick(Sender: TObject);
    procedure cxAmbilDataClick(Sender: TObject);
    procedure ambilDataByFile;
    procedure ambilDataByInvoice;
    procedure E1Click(Sender: TObject);
    procedure Refresh;
    procedure txtThnExit(Sender: TObject);
//    function LeftStr(const AText: AnsiString; const ACount: Integer): AnsiString; overload;
//    function LeftStr(const AText: string; const ACount: Integer): string; overload;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrEkspedisiNov: TFrEkspedisiNov;
  cek : integer;

implementation
uses frmsupf;
{$R *.dfm}

procedure TFrEkspedisiNov.ambilDataByFile;
var
  noinvoice, brand, kd_area, nobukti, per : string;

  i,r,r1,id, koli :integer;
  kode,periode ,bkt, bkt1, grp, year: string;
  harga: Double;
  month,date:Word;
  monthString:String;
begin
  cek := 0;
  ceck;

  com2.Connection.Connected := False;
  com2.Connection := RETAIL;
  com2.Connection.Connected := True;

  com3.Connection.Connected := False;
  com3.Connection := RETAIL;
  com3.Connection.Connected := True;

  year := trim(txtThn.Text);

  if cek = 0 then
  begin
    MessageBox(handle,'Data tidak boleh kosong!!','Peringatan',MB_OK);
  end
  else
  begin

 //   ShowMessage(year);
//        com2.SQL.Text := ' SELECT CONCAT(lpad(MONTH(DATE_WH),2,''0''),''/'',year(DATE_WH)) as per, CONCAT(BLN,''/'',THN) as per1 ,SUM(EX.QTY) AS TOTAL_QTY, SUM(EX.TOTAL) AS TOTAL1, '
//                        +' EX.BLN AS BLN, EX.THN AS THN, EX.BRANDX AS BRANDX, EX.BRAND AS BRAND, EX.NOINVOICE AS NOINVOICE, EX.INVOICE_KE AS INVOICEKE, '
//                        +' EX.DARIAREA AS DARIAREA , EX.DATE_WH AS DATE_WH, EX.MODA AS MODA '
//                        +' FROM( SELECT * , SUM(BERAT) AS QTY, SUM(BIAYA) AS TOTAL, SUM(BIAYA)/SUM(IF(BERAT = 0,1,BERAT)) AS HARGA1,  '
//                        +' IF(BRAND=''B'',''BLG'',IF(BRAND=''D'',''GRD'',IF(BRAND=''E'',''ELV'',IF(BRAND=''G'',''GSH'',IF(BRAND=''J'',''JOP'',IF(BRAND=''P'',''BRN'',IF(BRAND=''R'',  '
//                        +' ''RTL'',IF(BRAND=''T'',''TRS'',IF(BRAND=''C'',''RCL'',''GRY''))))))))) AS BRANDX, LEFT(TRIM(penerima),3) as kodecab '

          com2.SQL.Text :=' SELECT CONCAT(lpad(MONTH(DATE_WH),2,''0''),''/'',year(DATE_WH)) as per, CONCAT(BLN,''/'',THN) as per1 ,SUM(EX.QTY) AS TOTAL_QTY, SUM(EX.TOTAL) AS TOTAL1, '
                        +' EX.BLN AS BLN, EX.THN AS THN, EX.BRANDX AS BRANDX, EX.BRAND AS BRAND, EX.NOINVOICE AS NOINVOICE, EX.INVOICE_KE AS INVOICEKE,'
                        +' EX.DARIAREA AS DARIAREA , EX.DATE_WH AS DATE_WH '
                        +' FROM( SELECT * , SUM(BERAT) AS QTY, SUM(BIAYA) AS TOTAL, SUM(BIAYA)/SUM(IF(BERAT = 0,1,BERAT)) AS HARGA1, '
                        +' IF(BRAND=''B'',''BLG'',IF(BRAND=''D'',''GRD'',IF(BRAND=''E'',''ELV'',IF(BRAND=''G'',''GSH'',IF(BRAND=''J'',''JOP'',IF(BRAND=''P'',''BRN'',IF(BRAND=''R'', '
                        +' ''RTL'',IF(BRAND=''T'',''TRS'',IF(BRAND=''C'',''RCL'',IF(BRAND=''N'',''OND'', IF(BRAND=''I'',''GID'',''GRY''))))))))))) AS BRANDX, LEFT(TRIM(penerima),3) as kodecab '
                        +' FROM webgudang.validasi_expedisi_'+year+' '
                        +' WHERE EXPEDISI = :EXPEDISI AND BLN = :BLN AND THN= :THN AND INVOICE_KE = :INVOICE_KE AND MODA= :MODA AND DARIAREA= :DARIAREA AND NOINVOICE <> '''' '
                        +' GROUP BY BRAND, PENERIMA, NOAWB, INVOICE_KE ) AS EX '
                        +' GROUP BY EX.BRAND, EX.NOINVOICE, EX.INVOICE_KE ';

        com2.Params.ParamByName('EXPEDISI').Value := cbEkspedisi.Text;
        com2.Params.ParamByName('BLN').Value := cbBln.Text;
        com2.Params.ParamByName('THN').Value := txtThn.Text;
        com2.Params.ParamByName('INVOICE_KE').Value := txtInvoiceKe.Text;
        //com2.Params.ParamByName('MODA').Value := cbModa.Text;
        com2.Params.ParamByName('DARIAREA').Value := cbArea.Text;
        //com2.Params.ParamByName('DATE_WH').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);
        if cbModa.Text = 'ALL' then
        begin
          com2.Params.ParamByName('MODA').Value := 0;
        end
        else if cbModa.Text = 'DARAT' then
        begin
          com2.Params.ParamByName('MODA').Value := 1;
        end
        else if cbModa.Text = 'UDARA' then
        begin
          com2.Params.ParamByName('MODA').Value := 2;
        end;

        com2.Open;
//        ShowMessage('1');
//        ShowMessage(IntToStr(com2.RecordCount));

        if com2.RecordCount > 0 then
        begin
          // ShowMessage('2');
          com2.First;
          while not com2.Eof do
          begin
            com4.SQL.Clear;
            com4.SQL.Text := ' SELECT * FROM BELI WHERE NOINVOICE = :NOINVOICE AND INVOICEKE = :INVOICEKE '
                            +' AND DARIAREA = :DARIAREA AND BRAND = :BRAND AND PER1 = :PER  ';
            com4.Params.ParamByName('NOINVOICE').Value := com2.FieldByName('NOINVOICE').Value;
            com4.Params.ParamByName('INVOICEKE').Value := com2.FieldByName('INVOICEKE').Value;
            com4.Params.ParamByName('DARIAREA').Value := com2.FieldByName('DARIAREA').Value;
            com4.Params.ParamByName('BRAND').Value := com2.FieldByName('BRANDX').Value;
            com4.Params.ParamByName('PER').Value := cbBln.Text + '/' + txtThn.Text;

            com4.Open;
            if com4.RecordCount > 0 then
            begin
              ShowMessage('NO.INVOICE: ' + com2.FieldByName('NOINVOICE').Value  + ' BRAND : ' + com2.FieldByName('BRANDX').Value +  ' SUDAH ADA');
             // ShowMessage('A');
            end
            else
            begin
              brand := com2.FieldByName('BRAND').Value;
              kd_area := com2.FieldByName('DARIAREA').Value;
              per := com2.FieldByName('PER').Value ;

              kode := brand + RightStr(kd_area,3) +  RightStr(per,2) + LeftStr(per,2);

              c3.SQL.Clear;
              c3.sql.Text := ' SELECT RIGHT(TRIM(MAX(NO_BUKTI)),5) as NO_BUKTI FROM BELI '
                            +' WHERE SUBSTRING(NO_BUKTI,1,8) = :kd ';
              c3.Params.ParamByName('kd').AsString := kode;
              c3.Open;
              bkt :=  c3.FieldByName('no_bukti').AsString;

              if bkt = '' then
              begin
                r1 := 0 ;
              end
              else
              begin
                r1 := c3.FieldByName('no_bukti').AsInteger;
              end;

              r1 := r1 + 1;
              bkt1 := FormatFloat('00000', r1);
              nobukti := kode+'-'+ bkt1;
              txtBukti.Text := nobukti;


              com.SQL.Clear;
              com.SQL.Add(' INSERT INTO beli(NO_BUKTI, TGL, KODES, NAMAS, ALAMAT, PER, PER1, TOTAL_QTY, FLAG, TOTAL1, CURR,'
                        +'  INVOICEKE, DARIAREA, NAMAAREA, NOINVOICE, BRAND) VALUES ('
                        +' :NO_BUKTI, :TGL, :KODES, :NAMAS, :ALAMAT, :PER, :PER1, '
                        +' :TOTAL_QTY, :FLAG, :TOTAL1, :CURR,  :INVOICEKE, :DARIAREA, :NAMAAREA, :NOINVOICE, :BRAND  ) ');

              com.Params.ParamByName('NO_BUKTI').Value := nobukti; ;
              com.Params.ParamByName('TGL').Value := FormatDateTime('yyyy-mm-dd',com2.FieldByName('DATE_WH').Value);
              com.Params.ParamByName('KODES').Value := TRIM(txtKdSupp.Text);
              com.Params.ParamByName('NAMAS').Value := TRIM(txtNamaSupp.Text);
              com.Params.ParamByName('ALAMAT').Value := TRIM(txtAlamatSupp.Text);
              com.Params.ParamByName('PER').Value := com2.FieldByName('PER').Value;
              com.Params.ParamByName('PER1').Value := com2.FieldByName('PER1').Value;
              com.Params.ParamByName('TOTAL_QTY').Value := com2.FieldByName('TOTAL_QTY').Value;
              com.Params.ParamByName('FLAG').Value := 'BN';
              com.Params.ParamByName('TOTAL1').Value := com2.FieldByName('TOTAL1').Value;
              com.Params.ParamByName('CURR').Value := 'IDR';
              com.Params.ParamByName('INVOICEKE').Value := txtInvoiceKe.Text;
              com.Params.ParamByName('DARIAREA').Value := cbArea.Text;
              com.Params.ParamByName('NAMAAREA').Value := txtNamaArea.Text;
              com.Params.ParamByName('NOINVOICE').Value := com2.FieldByName('NOINVOICE').Value;
              com.Params.ParamByName('BRAND').Value := com2.FieldByName('BRANDX').Value;
              com.ExecSQL;
              //ShowMessage('BELI');
              koli := com2.FieldByName('TOTAL_QTY').Value;

              if koli = 0 then
              begin
                com3.SQL.Clear;
//              com3.SQL.Text := ' SELECT NOINVOICE, SUM(BERAT) AS QTY,SUM(BIAYA)/SUM(BERAT) AS HARGA1,SUM(BIAYA) AS TOTAL1, BLN, '
//                        +' CONCAT(lpad(MONTH(DATE_WH),2,''0''),''/'',year(DATE_WH)) as per, CONCAT(BLN,''/'',THN) as per1, '
//                        +' LEFT(TRIM(PENERIMA),3) as kodecab , BRAND, '
//                        +' IF(BRAND=''B'',''BLG'',IF(BRAND=''D'',''GRD'',IF(BRAND=''E'',''ELV'',IF(BRAND=''G'',''GSH'',IF(BRAND=''J'',''JOP'',IF(BRAND=''P'',''BRN'',IF(BRAND=''R'',''RTL'',   '
//                        +' IF(BRAND=''T'',''TRS'',''GRY'')))))))) AS BRANDX, PENGIRIM, PENERIMA, NOAWB  '
//                        +' FROM webgudang.validasi_expedisi_2018 '
//                        +' WHERE EXPEDISI = :EXPEDISI AND BLN = :BLN AND THN=:THN AND INVOICE_KE = :INVOICE_KE AND MODA= :MODA AND DARIAREA= :DARIAREA AND BRAND=:BRAND AND NOINVOICE = :NOINVOICE '
//                        +' GROUP BY BRAND, PENERIMA, NOAWB ';

                com3.SQL.Text := ' SELECT NOINVOICE, 1 AS QTY, SUM(KOLI) AS BERAT, KETERANGAN AS KET, SUM(BIAYA)/1 AS HARGA1, SUM(BIAYA) AS TOTAL1, BLN, '
                            +' CONCAT(lpad(MONTH(DATE_WH),2,''0''),''/'',year(DATE_WH)) as per, CONCAT(BLN,''/'',THN) as per1, '
                            +' LEFT(TRIM(PENERIMA),3) as kodecab , BRAND, '
                            +' IF(BRAND=''B'',''BLG'',IF(BRAND=''D'',''GRD'',IF(BRAND=''E'',''ELV'',IF(BRAND=''G'',''GSH'',IF(BRAND=''J'',''JOP'',IF(BRAND=''P'',''BRN'',IF(BRAND=''R'',''RTL'', '
                            +' IF(BRAND=''T'',''TRS'', IF(BRAND=''C'',''RCL'',IF(BRAND=''N'',''OND'', IF(BRAND=''I'',''GID'',''GRY''))))))))))) AS BRANDX, PENGIRIM, PENERIMA, NOAWB, MODA '
                            +' FROM webgudang.validasi_expedisi_'+year+' '
                            +' WHERE EXPEDISI = :EXPEDISI AND BLN = :BLN AND THN = :THN AND INVOICE_KE = :INVOICE_KE AND DARIAREA= :DARIAREA '
                            +' AND BRAND = :BRAND AND NOINVOICE = :NOINVOICE '
                            +' GROUP BY BRAND, PENERIMA, NOAWB '
                            +' ORDER BY NOAWB ASC ' ;

                com3.Params.ParamByName('EXPEDISI').Value := cbEkspedisi.Text;
                com3.Params.ParamByName('BLN').Value := cbBln.Text;
                com3.Params.ParamByName('THN').Value := txtThn.Text;
                com3.Params.ParamByName('INVOICE_KE').Value := txtInvoiceKe.Text;
                com3.Params.ParamByName('DARIAREA').Value := cbArea.Text;
                com3.Params.ParamByName('BRAND').Value := com2.FieldByName('BRAND').Value;
                com3.Params.ParamByName('NOINVOICE').Value := com2.FieldByName('NOINVOICE').Value;
                //com3.Params.ParamByName('DATE_WH').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);

                com3.Open;
                //ShowMessage('3');

              end
              else
              begin
                com3.SQL.Clear;
//              com3.SQL.Text := ' SELECT NOINVOICE, SUM(BERAT) AS QTY,SUM(BIAYA)/SUM(BERAT) AS HARGA1,SUM(BIAYA) AS TOTAL1, BLN, '
//                        +' CONCAT(lpad(MONTH(DATE_WH),2,''0''),''/'',year(DATE_WH)) as per, CONCAT(BLN,''/'',THN) as per1, '
//                        +' LEFT(TRIM(PENERIMA),3) as kodecab , BRAND, '
//                        +' IF(BRAND=''B'',''BLG'',IF(BRAND=''D'',''GRD'',IF(BRAND=''E'',''ELV'',IF(BRAND=''G'',''GSH'',IF(BRAND=''J'',''JOP'',IF(BRAND=''P'',''BRN'',IF(BRAND=''R'',''RTL'',   '
//                        +' IF(BRAND=''T'',''TRS'',''GRY'')))))))) AS BRANDX, PENGIRIM, PENERIMA, NOAWB  '
//                        +' FROM webgudang.validasi_expedisi_2018 '
//                        +' WHERE EXPEDISI = :EXPEDISI AND BLN = :BLN AND THN=:THN AND INVOICE_KE = :INVOICE_KE AND MODA= :MODA AND DARIAREA= :DARIAREA AND BRAND=:BRAND AND NOINVOICE = :NOINVOICE '
//                        +' GROUP BY BRAND, PENERIMA, NOAWB ';

                com3.SQL.Text := ' SELECT NOINVOICE, SUM(BERAT) AS QTY, SUM(KOLI) AS BERAT, KETERANGAN AS KET, SUM(BIAYA)/SUM(IF(BERAT = 0,1,BERAT)) AS HARGA1,SUM(BIAYA) AS TOTAL1, BLN, '
                            +' CONCAT(lpad(MONTH(DATE_WH),2,''0''),''/'',year(DATE_WH)) as per, CONCAT(BLN,''/'',THN) as per1, '
                            +' LEFT(TRIM(PENERIMA),3) as kodecab , BRAND, '
                            +' IF(BRAND=''B'',''BLG'',IF(BRAND=''D'',''GRD'',IF(BRAND=''E'',''ELV'',IF(BRAND=''G'',''GSH'',IF(BRAND=''J'',''JOP'',IF(BRAND=''P'',''BRN'',IF(BRAND=''R'',''RTL'', '
                            +' IF(BRAND=''T'',''TRS'', IF(BRAND=''C'',''RCL'',IF(BRAND=''N'',''OND'', IF(BRAND=''I'',''GID'',''GRY''))))))))))) AS BRANDX, PENGIRIM, PENERIMA, NOAWB, MODA '
                            +' FROM webgudang.validasi_expedisi_'+year+' '
                            +' WHERE EXPEDISI = :EXPEDISI AND BLN = :BLN AND THN = :THN AND INVOICE_KE = :INVOICE_KE AND DARIAREA= :DARIAREA '
                            +' AND BRAND = :BRAND AND NOINVOICE = :NOINVOICE '
                            +' GROUP BY BRAND, PENERIMA, NOAWB '
                            +' ORDER BY NOAWB ASC ' ;

                com3.Params.ParamByName('EXPEDISI').Value := cbEkspedisi.Text;
                com3.Params.ParamByName('BLN').Value := cbBln.Text;
                com3.Params.ParamByName('THN').Value := txtThn.Text;
                com3.Params.ParamByName('INVOICE_KE').Value := txtInvoiceKe.Text;
                com3.Params.ParamByName('DARIAREA').Value := cbArea.Text;
                com3.Params.ParamByName('BRAND').Value := com2.FieldByName('BRAND').Value;
                com3.Params.ParamByName('NOINVOICE').Value := com2.FieldByName('NOINVOICE').Value;
                //com3.Params.ParamByName('DATE_WH').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);

                com3.Open;
                //ShowMessage('3');

              end;

              com3.First;
              while NOT com3.Eof do
              begin
                com.SQL.Clear;
//                com.SQL.Add(' INSERT INTO belid(NO_BUKTI, QTY, HARGA1, TOTAL1, FLAG, PER,  KODECAB, BRAND, KET, '
//                          +' NOAWB, PENGIRIM, PENERIMA, PPND, PPHD) VALUES '
//                          +' (:NO_BUKTI, :QTY, :HARGA1, :TOTAL1, :FLAG, :PER, :KODECAB, :BRAND, :KET, '
//                          +' :NOAWB, :PENGIRIM, :PENERIMA, :PPND, :PPHD ) ');

                com.SQL.Add(' INSERT INTO belid(NO_BUKTI, QTY, HARGA1, TOTAL1, FLAG, PER,  KODECAB, BRAND, KET, '
                          +' NOAWB, PENGIRIM, PENERIMA, PPND, MODA) VALUES '
                          +' (:NO_BUKTI, :QTY, :HARGA1, :TOTAL1, :FLAG, :PER, :KODECAB, :BRAND, CONCAT(:KET,'' '', :PENGIRIM,''  '', :PENERIMA), '
                          +' :NOAWB, :PENGIRIM, :PENERIMA, :PPND, :MODA) ');

                //com.Params.ParamByName('NO_BUKTI').Value := com2.FieldByName('BRANDX').Value+ '-'  + txtInvoiceKe.Text + '-' + RightStr(txtThn.Text,2) + cbBln.Text + '-'+ com2.FieldByName('NOINVOICE').Value ;
                com.Params.ParamByName('NO_BUKTI').Value := txtBukti.Text;
                com.Params.ParamByName('QTY').Value := com3.FieldByName('QTY').Value;
                com.Params.ParamByName('HARGA1').Value :=com3.FieldByName('HARGA1').Value;
                com.Params.ParamByName('TOTAL1').Value := com3.FieldByName('TOTAL1').Value;
                com.Params.ParamByName('FLAG').Value := 'BN';
                com.Params.ParamByName('PER').Value := com3.FieldByName('PER').Value;
                com.Params.ParamByName('KODECAB').Value := com3.FieldByName('KODECAB').Value;
                com.Params.ParamByName('BRAND').Value := com3.FieldByName('BRANDX').Value;
                com.Params.ParamByName('KET').Value := FloatToStr(com3.FieldByName('BERAT').Value) + ' PKGS ' + '  ' + com3.FieldByName('KET').Value;
                com.Params.ParamByName('NOAWB').Value := com3.FieldByName('NOAWB').Value;
                com.Params.ParamByName('PENGIRIM').Value := com3.FieldByName('PENGIRIM').Value;
                com.Params.ParamByName('PENERIMA').Value := com3.FieldByName('PENERIMA').Value;
                com.Params.ParamByName('PPND').Value := '1.00';

                if com3.FieldByName('MODA').Value = '1'  then
                begin
                  com.Params.ParamByName('MODA').Value := 'DARAT';
                end
                else if com3.FieldByName('MODA').Value = '2' then
                begin
                  com.Params.ParamByName('MODA').Value := 'UDARA';
                end
                else
                begin
                  com.Params.ParamByName('MODA').Value := 'ALL';
                end;

                com.ExecSQL;
                //ShowMessage('BELID');
                //ShowMessage('5');
                com3.Next;

              end;

           // ShowMessage(com2.FieldByName('NOINVOICE').Value);
                com.SQL.Clear;
                com.SQL.Add(' UPDATE BELID, BELI SET BELID.ID = BELI.NO_ID '
                            +' WHERE BELI.NO_BUKTI = BELID.NO_BUKTI AND BELI.PER = :PER '
                            +' AND BELI.NOINVOICE = :NOINVOICE AND BELI.DARIAREA = :DARIAREA  '
                            +' AND BELI.INVOICEKE = :INVOICEKE  ');
                com.Params.ParamByName('PER').Value := com2.FieldByName('PER').Value;
                com.Params.ParamByName('DARIAREA').Value := com2.FieldByName('DARIAREA').Value;
                com.Params.ParamByName('NOINVOICE').Value := com2.FieldByName('NOINVOICE').Value;
                com.Params.ParamByName('INVOICEKE').Value := com2.FieldByName('INVOICEKE').Value;
                com.ExecSQL;

                //ShowMessage('UPDATE ID');

                com.SQL.Clear;
                com.SQL.Add(' UPDATE BELI, BELID, CABANG SET BELID.NAMACAB = CABANG.NAMACAB '
                          +' WHERE BELI.NO_BUKTI = BELID.NO_BUKTI AND BELID.KODECAB = CABANG.KODECAB '
                          +' AND beli.PER = :PER AND beli.INVOICEKE = :INVOICEKE AND BELI.NOINVOICE = :NOINVOICE '
                          +' AND beli.DARIAREA = :DARIAREA ');
                com.Params.ParamByName('PER').Value := com2.FieldByName('PER').Value;
                com.Params.ParamByName('DARIAREA').Value := com2.FieldByName('DARIAREA').Value;
                com.Params.ParamByName('NOINVOICE').Value := com2.FieldByName('NOINVOICE').Value;
                com.Params.ParamByName('INVOICEKE').Value := com2.FieldByName('INVOICEKE').Value;
                com.ExecSQL;
                //ShowMessage('UPDATE NAMA CABANG');

                com.SQL.Clear;
                com.SQL.Add(' UPDATE beli, belid, cabang SET belid.KD_BHN = cabang.EXPE, belid.NA_BHN = cabang.EXPENM '
                          +' WHERE beli.NO_BUKTI = belid.NO_BUKTI AND BELID.KODECAB = CABANG.KODECAB AND belid.BRAND = cabang.BRAND '
                          +' AND beli.PER = :PER AND beli.INVOICEKE = :INVOICEKE AND BELI.NOINVOICE = :NOINVOICE '
                          +' AND beli.DARIAREA = :DARIAREA ');
                com.Params.ParamByName('PER').Value := com2.FieldByName('PER').Value;
                com.Params.ParamByName('DARIAREA').Value := com2.FieldByName('DARIAREA').Value;
                com.Params.ParamByName('NOINVOICE').Value := com2.FieldByName('NOINVOICE').Value;
                com.Params.ParamByName('INVOICEKE').Value := com2.FieldByName('INVOICEKE').Value;
                com.ExecSQL;
                //ShowMessage('UPDATE KD & NM BAHAN');

                //UPDATE REC
                com.SQL.Clear;
                com.SQL.Add(' UPDATE beli, belid, (SELECT belid.NO_ID, belid.NO_BUKTI, IF(@BUKTI=NO_BUKTI, @REC:=@REC+1, @REC:=1) AS REC, '
                          +' @BUKTI:=NO_BUKTI FROM BELID JOIN (SELECT @REC:=0,@BUKTI:='''') AS AA ON 1=1 )AS BB SET belid.REC=BB.REC '
                          +' WHERE belid.NO_ID=BB.NO_ID AND BELI.NO_BUKTI = BELID.NO_BUKTI '
                          +' AND beli.PER = :PER AND beli.INVOICEKE = :INVOICEKE AND BELI.NOINVOICE = :NOINVOICE '
                          +' AND beli.DARIAREA = :DARIAREA ');
                com.Params.ParamByName('PER').Value := com2.FieldByName('PER').Value;
                com.Params.ParamByName('DARIAREA').Value := com2.FieldByName('DARIAREA').Value;
                com.Params.ParamByName('NOINVOICE').Value := com2.FieldByName('NOINVOICE').Value;
                com.Params.ParamByName('INVOICEKE').Value := com2.FieldByName('INVOICEKE').Value;
                com.ExecSQL;
                //ShowMessage('UPDATE REC');

                //UPDATE KODE BAHAN YG KOSONG
                com.SQL.Clear;
                com.SQL.Add(' UPDATE beli, belid SET KD_BHN = ''.'' '
                          +' WHERE beli.NO_BUKTI = BELID.NO_BUKTI '
                          +' AND BELID.KD_BHN = '''' AND beli.PER = :PER AND beli.INVOICEKE = :INVOICEKE AND BELI.NOINVOICE = :NOINVOICE '
                          +' AND beli.DARIAREA = :DARIAREA ');
                com.Params.ParamByName('PER').Value := com2.FieldByName('PER').Value;
                com.Params.ParamByName('DARIAREA').Value := com2.FieldByName('DARIAREA').Value;
                com.Params.ParamByName('NOINVOICE').Value := com2.FieldByName('NOINVOICE').Value;
                com.Params.ParamByName('INVOICEKE').Value := com2.FieldByName('INVOICEKE').Value;
                com.ExecSQL;
                //ShowMessage('UPDATE KODE BAHAN = KOSONG');

            end;

            Com2.Next;

          end;

            ShowMessage('Save Data Success');
            Hapus;

        end
        else
        begin
          //SHOWMESSAGE JIKA DATA DENGAN FILTER TSB TIDAK ADA
          ShowMessage('Data dengan filter tsb tidak dikenali!');
        end;

  end;
end;

procedure TFrEkspedisiNov.ambilDataByInvoice;
var
  noinvoice, brand, kd_area, nobukti, per : string;

  i,r,r1,id, koli :integer;
  kode,periode ,bkt, bkt1, grp, year: string;
  harga: Double;
  month,date:Word;
  monthString:String;
begin
  cek := 0;
  ceck2;

//  com2.Connection.Connected := False;
//  com2.Connection := MyConnection1;
//  com2.Connection.Connected := True;
//
//  com3.Connection.Connected := False;
//  com3.Connection := MyConnection1;
//  com3.Connection.Connected := True;
//
//
//  if cek = 0 then
//  begin
//    MessageBox(handle,'Data tidak boleh kosong!!','Peringatan',MB_OK);
//  end
//  else
//  begin
//    //CEK TABEL TAMPUNGAN, SUDAH DIAMBIL ATAU BELUM
//
//    //CEK TABEL BELI, NO.INVOICE SUDAH ADA / BLM
//
//    //SELECT VALIDASI EXPEDISI SESUAI DENGAN FILTER
//
//    //INSERT KE TABEL BELI
//
//    //INSERT KE TABEL BELID
//
//   // ShowMessage(year);
//        com2.SQL.Text := ' SELECT CONCAT(lpad(MONTH(DATE_WH),2,''0''),''/'',year(DATE_WH)) as per, CONCAT(BLN,''/'',THN) as per1 ,SUM(EX.QTY) AS TOTAL_QTY, SUM(EX.TOTAL) AS TOTAL1, '
//                        +' EX.BLN AS BLN, EX.THN AS THN, EX.BRANDX AS BRANDX, EX.BRAND AS BRAND, EX.NOINVOICE AS NOINVOICE, EX.INVOICE_KE AS INVOICEKE, '
//                        +' EX.DARIAREA AS DARIAREA , EX.DATE_WH AS DATE_WH, NAMAAREA '
//                        +' FROM( SELECT * , SUM(BERAT) AS QTY, SUM(BIAYA) AS TOTAL, SUM(BIAYA)/SUM(IF(BERAT = 0,1,BERAT)) AS HARGA1,  '
//                        +' IF(BRAND=''B'',''BLG'',IF(BRAND=''D'',''GRD'',IF(BRAND=''E'',''ELV'',IF(BRAND=''G'',''GSH'',IF(BRAND=''J'',''JOP'',IF(BRAND=''P'',''BRN'',IF(BRAND=''R'',  '
//                        +' ''RTL'',IF(BRAND=''T'',''TRS'',IF(BRAND=''C'',''RCL'',''GRY''))))))))) AS BRANDX, LEFT(TRIM(penerima),3) as kodecab '
//                        +' FROM validasi_expedisi '
//                        +' WHERE EXPEDISI = :EXPEDISI AND NOINVOICE = :NOINVOICE '
//                        +' GROUP BY BRAND, PENERIMA, NOAWB ) AS EX '
//                        +' GROUP BY EX.BRAND, EX.NOINVOICE ';
//
//        com2.Params.ParamByName('EXPEDISI').Value := cbEkspedisi.Text;
//        com2.Params.ParamByName('NOINVOICE').Value := TRIM(txtInvoice.Text);
//
//        com2.Open;
//       // ShowMessage('1');
//       // ShowMessage(IntToStr(com2.RecordCount));
//
//        if com2.RecordCount > 0 then
//        begin
//         // ShowMessage('2');
//          com2.First;
//          while not com2.Eof do
//          begin
//            com4.SQL.Clear;
//            com4.SQL.Text := ' SELECT * FROM BELI WHERE NOINVOICE = :NOINVOICE';
//            com4.Params.ParamByName('NOINVOICE').Value := com2.FieldByName('NOINVOICE').Value;
//
//            com4.Open;
//            if com4.RecordCount > 0 then
//            begin
//              ShowMessage('NO.INVOICE SUDAH ADA');
//              //ShowMessage('A');
//            end
//            else
//            begin
//              brand := com2.FieldByName('BRAND').Value;
//              kd_area := com2.FieldByName('DARIAREA').Value;
//              per := com2.FieldByName('PER').Value ;
//
//              kode := brand + RightStr(kd_area,3) +  RightStr(per,2) + LeftStr(per,2);
//
//              c3.SQL.Clear;
//              c3.sql.Text := ' SELECT RIGHT(TRIM(MAX(NO_BUKTI)),5) as NO_BUKTI FROM BELI '
//                            +' WHERE SUBSTRING(NO_BUKTI,1,8) = :kd ';
//              c3.Params.ParamByName('kd').AsString := kode;
//              c3.Open;
//              bkt :=  c3.FieldByName('no_bukti').AsString;
//
//              if bkt = '' then
//              begin
//                r1 := 0 ;
//              end
//              else
//              begin
//                r1 := c3.FieldByName('no_bukti').AsInteger;
//              end;
//
//              r1 := r1 + 1;
//              bkt1 := FormatFloat('00000', r1);
//              nobukti := kode+'-'+ bkt1;
//              txtBukti.Text := nobukti;
//
//
//              com.SQL.Clear;
////              com.SQL.Add(' INSERT INTO beli(NO_BUKTI, TGL, KODES, NAMAS, ALAMAT, PER, PER1, TOTAL_QTY, FLAG, TOTAL1, CURR,'
////                        +'  INVOICEKE, DARIAREA, NAMAAREA, NOINVOICE, BRAND) VALUES ('
////                        +' :NO_BUKTI, :TGL, :KODES, :NAMAS, :ALAMAT, :PER, :PER1, '
////                        +' :TOTAL_QTY, :FLAG, :TOTAL1, :CURR,  :INVOICEKE, :DARIAREA, :NAMAAREA, :NOINVOICE, :BRAND  ) ');
//
//              com.SQL.Add(' INSERT INTO beli(NO_BUKTI, TGL, KODES, NAMAS, ALAMAT, PER, PER1, TOTAL_QTY, FLAG, TOTAL1, CURR,'
//                        +'  INVOICEKE, DARIAREA, NOINVOICE, BRAND, NAMAAREA) VALUES ('
//                        +' :NO_BUKTI, :TGL, :KODES, :NAMAS, :ALAMAT, :PER, :PER1, '
//                        +' :TOTAL_QTY, :FLAG, :TOTAL1, :CURR,  :INVOICEKE, :DARIAREA, :NOINVOICE, :BRAND, :NAMAAREA  ) ');
//
//              com.Params.ParamByName('NO_BUKTI').Value := nobukti;
//              com.Params.ParamByName('TGL').Value := FormatDateTime('yyyy-mm-dd',com2.FieldByName('DATE_WH').Value);
//              com.Params.ParamByName('KODES').Value := TRIM(txtKdSupp.Text);
//              com.Params.ParamByName('NAMAS').Value := TRIM(txtNamaSupp.Text);
//              com.Params.ParamByName('ALAMAT').Value := TRIM(txtAlamatSupp.Text);
//              com.Params.ParamByName('PER').Value := com2.FieldByName('PER').Value;
//              com.Params.ParamByName('PER1').Value := com2.FieldByName('PER1').Value;
//              com.Params.ParamByName('TOTAL_QTY').Value := com2.FieldByName('TOTAL_QTY').Value;
//              com.Params.ParamByName('FLAG').Value := 'BN';
//              com.Params.ParamByName('TOTAL1').Value := com2.FieldByName('TOTAL1').Value;
//              com.Params.ParamByName('CURR').Value := 'IDR';
//              com.Params.ParamByName('INVOICEKE').Value := com2.FieldByName('INVOICEKE').Value;
//              com.Params.ParamByName('DARIAREA').Value := com2.FieldByName('DARIAREA').Value;
//              com.Params.ParamByName('NOINVOICE').Value := com2.FieldByName('NOINVOICE').Value;
//              com.Params.ParamByName('BRAND').Value := com2.FieldByName('BRANDX').Value;
//              com.Params.ParamByName('NAMAAREA').Value := com2.FieldByName('NAMAAREA').Value;
//
//              com.ExecSQL;
//              //ShowMessage('BELI');
//              koli := com2.FieldByName('TOTAL_QTY').Value;
//
//              if koli = 0 then
//              begin
//                com3.SQL.Clear;
//
//                com3.SQL.Text := ' SELECT NOINVOICE, 1 AS QTY, SUM(KOLI) AS BERAT, KETERANGAN AS KET, SUM(BIAYA)/1 AS HARGA1, SUM(BIAYA) AS TOTAL1, BLN, '
//                            +' CONCAT(lpad(MONTH(DATE_WH),2,''0''),''/'',year(DATE_WH)) as per, CONCAT(BLN,''/'',THN) as per1, '
//                            +' LEFT(TRIM(PENERIMA),3) as kodecab , BRAND, '
//                            +' IF(BRAND=''B'',''BLG'',IF(BRAND=''D'',''GRD'',IF(BRAND=''E'',''ELV'',IF(BRAND=''G'',''GSH'',IF(BRAND=''J'',''JOP'',IF(BRAND=''P'',''BRN'',IF(BRAND=''R'',''RTL'', '
//                            +' IF(BRAND=''T'',''TRS'',''GRY'')))))))) AS BRANDX, PENGIRIM, PENERIMA, NOAWB, MODA '
//                            +' FROM validasi_expedisi '
//                            +' WHERE EXPEDISI = :EXPEDISI AND NOINVOICE = :NOINVOICE '
//                            +' GROUP BY BRAND, PENERIMA, NOAWB '
//                            +' ORDER BY NOAWB ASC ' ;
//
//                com3.Params.ParamByName('EXPEDISI').Value := cbEkspedisi.Text;
//                com3.Params.ParamByName('NOINVOICE').Value := com2.FieldByName('NOINVOICE').Value;
//                //com3.Params.ParamByName('DATE_WH').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);
//
//                com3.Open;
//               // ShowMessage('3');
//
//              end
//              else
//              begin
//                com3.SQL.Clear;
////              com3.SQL.Text := ' SELECT NOINVOICE, SUM(BERAT) AS QTY,SUM(BIAYA)/SUM(BERAT) AS HARGA1,SUM(BIAYA) AS TOTAL1, BLN, '
////                        +' CONCAT(lpad(MONTH(DATE_WH),2,''0''),''/'',year(DATE_WH)) as per, CONCAT(BLN,''/'',THN) as per1, '
////                        +' LEFT(TRIM(PENERIMA),3) as kodecab , BRAND, '
////                        +' IF(BRAND=''B'',''BLG'',IF(BRAND=''D'',''GRD'',IF(BRAND=''E'',''ELV'',IF(BRAND=''G'',''GSH'',IF(BRAND=''J'',''JOP'',IF(BRAND=''P'',''BRN'',IF(BRAND=''R'',''RTL'',   '
////                        +' IF(BRAND=''T'',''TRS'',''GRY'')))))))) AS BRANDX, PENGIRIM, PENERIMA, NOAWB  '
////                        +' FROM webgudang.validasi_expedisi_2018 '
////                        +' WHERE EXPEDISI = :EXPEDISI AND BLN = :BLN AND THN=:THN AND INVOICE_KE = :INVOICE_KE AND MODA= :MODA AND DARIAREA= :DARIAREA AND BRAND=:BRAND AND NOINVOICE = :NOINVOICE '
////                        +' GROUP BY BRAND, PENERIMA, NOAWB ';
//
//                com3.SQL.Text := ' SELECT NOINVOICE, SUM(BERAT) AS QTY, SUM(KOLI) AS BERAT, KETERANGAN AS KET, SUM(BIAYA)/SUM(IF(BERAT = 0,1,BERAT)) AS HARGA1,SUM(BIAYA) AS TOTAL1, BLN, '
//                            +' CONCAT(lpad(MONTH(DATE_WH),2,''0''),''/'',year(DATE_WH)) as per, CONCAT(BLN,''/'',THN) as per1, '
//                            +' LEFT(TRIM(PENERIMA),3) as kodecab , BRAND, '
//                            +' IF(BRAND=''B'',''BLG'',IF(BRAND=''D'',''GRD'',IF(BRAND=''E'',''ELV'',IF(BRAND=''G'',''GSH'',IF(BRAND=''J'',''JOP'',IF(BRAND=''P'',''BRN'',IF(BRAND=''R'',''RTL'', '
//                            +' IF(BRAND=''T'',''TRS'',''GRY'')))))))) AS BRANDX, PENGIRIM, PENERIMA, NOAWB, MODA '
//                            +' FROM validasi_expedisi '
//                            +' WHERE EXPEDISI = :EXPEDISI AND NOINVOICE = :NOINVOICE '
//                            +' GROUP BY BRAND, PENERIMA, NOAWB '
//                            +' ORDER BY NOAWB ASC ' ;
//
//                com3.Params.ParamByName('EXPEDISI').Value := cbEkspedisi.Text;
//                com3.Params.ParamByName('NOINVOICE').Value := com2.FieldByName('NOINVOICE').Value;
//                //com3.Params.ParamByName('DATE_WH').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);
//
//                com3.Open;
//               // ShowMessage('3');
//
//              end;
//
//              com3.First;
//              while NOT com3.Eof do
//              begin
//                com.SQL.Clear;
//                com.SQL.Add(' INSERT INTO belid(NO_BUKTI, QTY, HARGA1, TOTAL1, FLAG, PER,  KODECAB, BRAND, KET, '
//                          +' NOAWB, PENGIRIM, PENERIMA, PPND, PPHD, MODA) VALUES '
//                          +' (:NO_BUKTI, :QTY, :HARGA1, :TOTAL1, :FLAG, :PER, :KODECAB, :BRAND, :KET, '
//                          +' :NOAWB, :PENGIRIM, :PENERIMA, :PPND, :PPHD, :MODA ) ');
//
//                //com.Params.ParamByName('NO_BUKTI').Value := com2.FieldByName('BRANDX').Value+ '-'  + txtInvoiceKe.Text + '-' + RightStr(txtThn.Text,2) + cbBln.Text + '-'+ com2.FieldByName('NOINVOICE').Value ;
//                com.Params.ParamByName('NO_BUKTI').Value := txtBukti.Text;
//                com.Params.ParamByName('QTY').Value := com3.FieldByName('QTY').Value;
//                com.Params.ParamByName('HARGA1').Value :=com3.FieldByName('HARGA1').Value;
//                com.Params.ParamByName('TOTAL1').Value := com3.FieldByName('TOTAL1').Value;
//                com.Params.ParamByName('FLAG').Value := 'BN';
//                com.Params.ParamByName('PER').Value := com3.FieldByName('PER').Value;
//                com.Params.ParamByName('KODECAB').Value := com3.FieldByName('KODECAB').Value;
//                com.Params.ParamByName('BRAND').Value := com3.FieldByName('BRANDX').Value;
//                com.Params.ParamByName('KET').Value := FloatToStr(com3.FieldByName('BERAT').Value) + ' PKGS ' + '  ' + com3.FieldByName('KET').Value;
//                com.Params.ParamByName('NOAWB').Value := com3.FieldByName('NOAWB').Value;
//                com.Params.ParamByName('PENGIRIM').Value := com3.FieldByName('PENGIRIM').Value;
//                com.Params.ParamByName('PENERIMA').Value := com3.FieldByName('PENERIMA').Value;
//                com.Params.ParamByName('PPND').Value := '1.00';
//                com.Params.ParamByName('PPHD').Value := '2.00';
//                com.Params.ParamByName('MODA').Value := com3.FieldByName('MODA').Value;
//                com.ExecSQL;
//                //ShowMessage('BELID');
//                //ShowMessage('5');
//                com3.Next;
//
//              end;
//
//           // ShowMessage(com2.FieldByName('NOINVOICE').Value);
//                ShowMessage('PER' + com2.FieldByName('PER').Value);
//                ShowMessage('DARIAREA' + com2.FieldByName('DARIAREA').Value);
//                ShowMessage('NOINVOICE' + com2.FieldByName('NOINVOICE').Value);
//                ShowMessage('INVOICEKE' + com2.FieldByName('INVOICEKE').Value);
//
//                com.SQL.Clear;
//                com.SQL.Add(' UPDATE BELID, BELI SET BELID.ID = BELI.NO_ID '
//                            +' WHERE BELI.NO_BUKTI = BELID.NO_BUKTI AND BELI.PER = :PER '
//                            +' AND BELI.NOINVOICE = :NOINVOICE AND BELI.DARIAREA = :DARIAREA  '
//                            +' AND BELI.INVOICEKE = :INVOICEKE  ');
//                com.Params.ParamByName('PER').Value := com2.FieldByName('PER').Value;
//                com.Params.ParamByName('DARIAREA').Value := com2.FieldByName('DARIAREA').Value;
//                com.Params.ParamByName('NOINVOICE').Value := com2.FieldByName('NOINVOICE').Value;
//                com.Params.ParamByName('INVOICEKE').Value := com2.FieldByName('INVOICEKE').Value;
//                com.ExecSQL;
//
//                ShowMessage('UPDATE ID');
//
//                com.SQL.Clear;
//                com.SQL.Add(' UPDATE BELI, BELID, CABANG SET BELID.NAMACAB = CABANG.NAMACAB '
//                          +' WHERE BELI.NO_BUKTI = BELID.NO_BUKTI AND BELID.KODECAB = CABANG.KODECAB '
//                          +' AND beli.PER = :PER AND beli.INVOICEKE = :INVOICEKE AND BELI.NOINVOICE = :NOINVOICE '
//                          +' AND beli.DARIAREA = :DARIAREA ');
//                com.Params.ParamByName('PER').Value := com2.FieldByName('PER').Value;
//                com.Params.ParamByName('DARIAREA').Value := com2.FieldByName('DARIAREA').Value;
//                com.Params.ParamByName('NOINVOICE').Value := com2.FieldByName('NOINVOICE').Value;
//                com.Params.ParamByName('INVOICEKE').Value := com2.FieldByName('INVOICEKE').Value;
//                com.ExecSQL;
//                ShowMessage('UPDATE NAMA CABANG');
//
//                com.SQL.Clear;
//                com.SQL.Add(' UPDATE beli, belid, cabang SET belid.KD_BHN = cabang.EXPE, belid.NA_BHN = cabang.EXPENM '
//                          +' WHERE beli.NO_BUKTI = belid.NO_BUKTI AND BELID.KODECAB = CABANG.KODECAB AND belid.BRAND = cabang.BRAND '
//                          +' AND beli.PER = :PER AND beli.INVOICEKE = :INVOICEKE AND BELI.NOINVOICE = :NOINVOICE '
//                          +' AND beli.DARIAREA = :DARIAREA ');
//                com.Params.ParamByName('PER').Value := com2.FieldByName('PER').Value;
//                com.Params.ParamByName('DARIAREA').Value := com2.FieldByName('DARIAREA').Value;
//                com.Params.ParamByName('NOINVOICE').Value := com2.FieldByName('NOINVOICE').Value;
//                com.Params.ParamByName('INVOICEKE').Value := com2.FieldByName('INVOICEKE').Value;
//                com.ExecSQL;
//                ShowMessage('UPDATE KD & NM BAHAN');
//
//                //UPDATE REC
//                com.SQL.Clear;
//                com.SQL.Add(' UPDATE beli, belid, (SELECT belid.NO_ID, belid.NO_BUKTI, IF(@BUKTI=NO_BUKTI, @REC:=@REC+1, @REC:=1) AS REC, '
//                          +' @BUKTI:=NO_BUKTI FROM BELID JOIN (SELECT @REC:=0,@BUKTI:='''') AS AA ON 1=1 )AS BB SET belid.REC=BB.REC '
//                          +' WHERE belid.NO_ID=BB.NO_ID AND BELI.NO_BUKTI = BELID.NO_BUKTI '
//                          +' AND beli.PER = :PER AND beli.INVOICEKE = :INVOICEKE AND BELI.NOINVOICE = :NOINVOICE '
//                          +' AND beli.DARIAREA = :DARIAREA ');
//                com.Params.ParamByName('PER').Value := com2.FieldByName('PER').Value;
//                com.Params.ParamByName('DARIAREA').Value := com2.FieldByName('DARIAREA').Value;
//                com.Params.ParamByName('NOINVOICE').Value := com2.FieldByName('NOINVOICE').Value;
//                com.Params.ParamByName('INVOICEKE').Value := com2.FieldByName('INVOICEKE').Value;
//                com.ExecSQL;
//                ShowMessage('UPDATE REC');
//
//                //UPDATE KODE BAHAN YG KOSONG
//                com.SQL.Clear;
//                com.SQL.Add(' UPDATE beli, belid SET KD_BHN = ''.'' '
//                          +' WHERE beli.NO_BUKTI = BELID.NO_BUKTI '
//                          +' AND BELID.KD_BHN = '''' AND beli.PER = :PER AND beli.INVOICEKE = :INVOICEKE AND BELI.NOINVOICE = :NOINVOICE '
//                          +' AND beli.DARIAREA = :DARIAREA ');
//                com.Params.ParamByName('PER').Value := com2.FieldByName('PER').Value;
//                com.Params.ParamByName('DARIAREA').Value := com2.FieldByName('DARIAREA').Value;
//                com.Params.ParamByName('NOINVOICE').Value := com2.FieldByName('NOINVOICE').Value;
//                com.Params.ParamByName('INVOICEKE').Value := com2.FieldByName('INVOICEKE').Value;
//                com.ExecSQL;
//                ShowMessage('UPDATE KODE BAHAN = KOSONG');
//
//            end;
//
//            Com2.Next;
//
//          end;
//
//            ShowMessage('Save Data Success');
//            Hapus;
//
//        end;

        //--------------------------------------------------------- PERIODE TAHUN -----------------------------------//

  com2.Connection.Connected := False;
  com2.Connection := RETAIL;
  com2.Connection.Connected := True;

  com3.Connection.Connected := False;
  com3.Connection := RETAIL;
  com3.Connection.Connected := True;

  year := TRIM(txtThn.Text);

  if cek = 0 then
  begin
    MessageBox(handle,'Data tidak boleh kosong!!','Peringatan',MB_OK);
  end
  else
  begin
    //CEK TABEL TAMPUNGAN, SUDAH DIAMBIL ATAU BELUM

    //CEK TABEL BELI, NO.INVOICE SUDAH ADA / BLM

    //SELECT VALIDASI EXPEDISI SESUAI DENGAN FILTER

    //INSERT KE TABEL BELI

    //INSERT KE TABEL BELID

   // ShowMessage(year);
        com2.SQL.Text := ' SELECT CONCAT(lpad(MONTH(DATE_WH),2,''0''),''/'',year(DATE_WH)) as per, CONCAT(BLN,''/'',THN) as per1 ,SUM(EX.QTY) AS TOTAL_QTY, SUM(EX.TOTAL) AS TOTAL1, '
                        +' EX.BLN AS BLN, EX.THN AS THN, EX.BRANDX AS BRANDX, EX.BRAND AS BRAND, EX.NOINVOICE AS NOINVOICE, EX.INVOICE_KE AS INVOICEKE, '
                        +' EX.DARIAREA AS DARIAREA , EX.DATE_WH AS DATE_WH, EX.nama_area as NAMAAREA '
                        +' FROM( SELECT * , SUM(BERAT) AS QTY, SUM(BIAYA) AS TOTAL, SUM(BIAYA)/SUM(IF(BERAT = 0,1,BERAT)) AS HARGA1,  '
                        +' IF(BRAND=''B'',''BLG'',IF(BRAND=''D'',''GRD'',IF(BRAND=''E'',''ELV'',IF(BRAND=''G'',''GSH'',IF(BRAND=''J'',''JOP'',IF(BRAND=''P'',''BRN'',IF(BRAND=''R'',  '
                        +' ''RTL'',IF(BRAND=''T'',''TRS'',IF(BRAND=''C'',''RCL'',IF(BRAND=''N'',''OND'', IF(BRAND=''I'',''GID'',''GRY''))))))))))) AS BRANDX, LEFT(TRIM(penerima),3) as kodecab '
                        +' FROM validasi_expedisi_'+year+', master_area '
                        +' WHERE validasi_expedisi_'+year+'.DARIAREA = master_area.kd_area '
                        +' AND EXPEDISI = :EXPEDISI AND NOINVOICE = :NOINVOICE '
                        +' GROUP BY BRAND, PENERIMA, NOAWB, INVOICE_KE ) AS EX '
                        +' GROUP BY EX.BRAND, EX.NOINVOICE, EX.INVOICE_KE ';

        com2.Params.ParamByName('EXPEDISI').Value := cbEkspedisi.Text;
        com2.Params.ParamByName('NOINVOICE').Value := TRIM(txtInvoice.Text);

        com2.Open;
        // ShowMessage('1');
        // ShowMessage(IntToStr(com2.RecordCount));

        if com2.RecordCount > 0 then
        begin
          // ShowMessage('2');
          com2.First;
          while not com2.Eof do
          begin
//
            com4.SQL.Clear;
            com4.SQL.Text := ' SELECT * FROM BELI WHERE NOINVOICE = :NOINVOICE AND INVOICEKE = :INVOICEKE '
                            +' AND DARIAREA = :DARIAREA AND BRAND = :BRAND AND PER1 = :PER  ';
            com4.Params.ParamByName('NOINVOICE').Value := com2.FieldByName('NOINVOICE').Value;
            com4.Params.ParamByName('INVOICEKE').Value := com2.FieldByName('INVOICEKE').Value;
            com4.Params.ParamByName('DARIAREA').Value := com2.FieldByName('DARIAREA').Value;
            com4.Params.ParamByName('BRAND').Value := com2.FieldByName('BRANDX').Value;
            com4.Params.ParamByName('PER').Value := com2.FieldByName('BLN').Value + '/' + com2.FieldByName('THN').Value;

            com4.Open;
            if com4.RecordCount > 0 then
            begin
              //ShowMessage('NO.INVOICE: ' + com2.FieldByName('NOINVOICE').Value  + ' SUDAH ADA');
              ShowMessage('NO.INVOICE: ' + com2.FieldByName('NOINVOICE').Value  + ' BRAND : ' + com2.FieldByName('BRANDX').Value +  ' SUDAH ADA');
              //ShowMessage('A');
            end
            else
            begin
              brand := com2.FieldByName('BRAND').Value;
              kd_area := com2.FieldByName('DARIAREA').Value;
              per := com2.FieldByName('PER').Value ;

              kode := brand + RightStr(kd_area,3) +  RightStr(per,2) + LeftStr(per,2);

              c3.SQL.Clear;
              c3.sql.Text := ' SELECT RIGHT(TRIM(MAX(NO_BUKTI)),5) as NO_BUKTI FROM BELI '
                            +' WHERE SUBSTRING(NO_BUKTI,1,8) = :kd ';
              c3.Params.ParamByName('kd').AsString := kode;
              c3.Open;
              bkt :=  c3.FieldByName('no_bukti').AsString;

              if bkt = '' then
              begin
                r1 := 0 ;
              end
              else
              begin
                r1 := c3.FieldByName('no_bukti').AsInteger;
              end;

              r1 := r1 + 1;
              bkt1 := FormatFloat('00000', r1);
              nobukti := kode+'-'+ bkt1;
              txtBukti.Text := nobukti;


              com.SQL.Clear;
//              com.SQL.Add(' INSERT INTO beli(NO_BUKTI, TGL, KODES, NAMAS, ALAMAT, PER, PER1, TOTAL_QTY, FLAG, TOTAL1, CURR,'
//                        +'  INVOICEKE, DARIAREA, NAMAAREA, NOINVOICE, BRAND) VALUES ('
//                        +' :NO_BUKTI, :TGL, :KODES, :NAMAS, :ALAMAT, :PER, :PER1, '
//                        +' :TOTAL_QTY, :FLAG, :TOTAL1, :CURR,  :INVOICEKE, :DARIAREA, :NAMAAREA, :NOINVOICE, :BRAND  ) ');

              com.SQL.Add(' INSERT INTO beli(NO_BUKTI, TGL, KODES, NAMAS, ALAMAT, PER, PER1, TOTAL_QTY, FLAG, TOTAL1, CURR,'
                        +'  INVOICEKE, DARIAREA, NOINVOICE, BRAND, NAMAAREA) VALUES ('
                        +' :NO_BUKTI, :TGL, :KODES, :NAMAS, :ALAMAT, :PER, :PER1, '
                        +' :TOTAL_QTY, :FLAG, :TOTAL1, :CURR,  :INVOICEKE, :DARIAREA, :NOINVOICE, :BRAND, :NAMAAREA  ) ');

              com.Params.ParamByName('NO_BUKTI').Value := nobukti;
              com.Params.ParamByName('TGL').Value := FormatDateTime('yyyy-mm-dd',com2.FieldByName('DATE_WH').Value);
              com.Params.ParamByName('KODES').Value := TRIM(txtKdSupp.Text);
              com.Params.ParamByName('NAMAS').Value := TRIM(txtNamaSupp.Text);
              com.Params.ParamByName('ALAMAT').Value := TRIM(txtAlamatSupp.Text);
              com.Params.ParamByName('PER').Value := com2.FieldByName('PER').Value;
              com.Params.ParamByName('PER1').Value := com2.FieldByName('PER1').Value;
              com.Params.ParamByName('TOTAL_QTY').Value := com2.FieldByName('TOTAL_QTY').Value;
              com.Params.ParamByName('FLAG').Value := 'BN';
              com.Params.ParamByName('TOTAL1').Value := com2.FieldByName('TOTAL1').Value;
              com.Params.ParamByName('CURR').Value := 'IDR';
              com.Params.ParamByName('INVOICEKE').Value := com2.FieldByName('INVOICEKE').Value;
              com.Params.ParamByName('DARIAREA').Value := com2.FieldByName('DARIAREA').Value;
              com.Params.ParamByName('NOINVOICE').Value := com2.FieldByName('NOINVOICE').Value;
              com.Params.ParamByName('BRAND').Value := com2.FieldByName('BRANDX').Value;
              com.Params.ParamByName('NAMAAREA').Value := com2.FieldByName('NAMAAREA').Value;

              com.ExecSQL;
              // ShowMessage('BELI');
              koli := com2.FieldByName('TOTAL_QTY').Value;

              if koli = 0 then
              begin
//                com3.SQL.Clear;
//                com3.SQL.Text := ' SELECT NOINVOICE, 1 AS QTY, SUM(KOLI) AS BERAT, KETERANGAN AS KET, SUM(BIAYA)/1 AS HARGA1, SUM(BIAYA) AS TOTAL1, BLN, '
//                                +' CONCAT(lpad(MONTH(DATE_WH),2,''0''),''/'',year(DATE_WH)) as per, CONCAT(BLN,''/'',THN) as per1, '
//                                +' LEFT(TRIM(PENERIMA),3) as kodecab , BRAND, '
//                                +' IF(BRAND=''B'',''BLG'',IF(BRAND=''D'',''GRD'',IF(BRAND=''E'',''ELV'',IF(BRAND=''G'',''GSH'',IF(BRAND=''J'',''JOP'',IF(BRAND=''P'',''BRN'',IF(BRAND=''R'',''RTL'', '
//                                +' IF(BRAND=''T'',''TRS'',IF(BRAND=''C'',''RCL'',IF(BRAND=''N'',''OND'', IF(BRAND=''I'',''GID'',''GRY''))))))))))) AS BRANDX, PENGIRIM, PENERIMA, NOAWB '
//                                +' FROM webgudang.validasi_expedisi_'+year+' '
//                                +' WHERE EXPEDISI = :EXPEDISI AND BLN = :BLN AND THN = :THN AND INVOICE_KE = :INVOICE_KE AND MODA= :MODA AND DARIAREA= :DARIAREA '
//                                +' AND BRAND = :BRAND AND NOINVOICE = :NOINVOICE '
//                                +' GROUP BY BRAND, PENERIMA, NOAWB '
//                                +' ORDER BY NOAWB ASC ';
//
//                com3.Params.ParamByName('EXPEDISI').Value := cbEkspedisi.Text;
//                com3.Params.ParamByName('BLN').Value := com2.FieldByName('BLN').Value;
//                com3.Params.ParamByName('THN').Value := com2.FieldByName('THN').Value;
//                com3.Params.ParamByName('INVOICE_KE').Value := com2.FieldByName('INVOICEKE').Value;
//                com3.Params.ParamByName('MODA').Value := com2.FieldByName('MODA').Value;
//                com3.Params.ParamByName('DARIAREA').Value := com2.FieldByName('DARIAREA').Value;
//                com3.Params.ParamByName('BRAND').Value := com2.FieldByName('BRAND').Value;
//                com3.Params.ParamByName('NOINVOICE').Value := com2.FieldByName('NOINVOICE').Value;
//                //com3.Params.ParamByName('DATE_WH').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);

                  //TANPA MODA
                  com3.SQL.Clear;
                  com3.SQL.Text := ' SELECT NOINVOICE, 1 AS QTY, SUM(KOLI) AS BERAT, KETERANGAN AS KET, SUM(BIAYA)/1 AS HARGA1, SUM(BIAYA) AS TOTAL1, BLN, '
                                  +' CONCAT(lpad(MONTH(DATE_WH),2,''0''),''/'',year(DATE_WH)) as per, CONCAT(BLN,''/'',THN) as per1, '
                                  +' LEFT(TRIM(PENERIMA),3) as kodecab , BRAND, '
                                  +' IF(BRAND=''B'',''BLG'',IF(BRAND=''D'',''GRD'',IF(BRAND=''E'',''ELV'',IF(BRAND=''G'',''GSH'',IF(BRAND=''J'',''JOP'',IF(BRAND=''P'',''BRN'',IF(BRAND=''R'',''RTL'', '
                                  +' IF(BRAND=''T'',''TRS'',IF(BRAND=''C'',''RCL'',IF(BRAND=''N'',''OND'', IF(BRAND=''I'',''GID'',''GRY''))))))))))) AS BRANDX, PENGIRIM, PENERIMA, NOAWB, MODA '
                                  +' FROM webgudang.validasi_expedisi_'+year+' '
                                  +' WHERE EXPEDISI = :EXPEDISI AND BLN = :BLN AND THN = :THN AND INVOICE_KE = :INVOICE_KE AND DARIAREA= :DARIAREA '
                                  +' AND BRAND = :BRAND AND NOINVOICE = :NOINVOICE '
                                  +' GROUP BY BRAND, PENERIMA, NOAWB '
                                  +' ORDER BY NOAWB ASC ';

                  com3.Params.ParamByName('EXPEDISI').Value := cbEkspedisi.Text;
                  com3.Params.ParamByName('BLN').Value := com2.FieldByName('BLN').Value;
                  com3.Params.ParamByName('THN').Value := com2.FieldByName('THN').Value;
                  com3.Params.ParamByName('INVOICE_KE').Value := com2.FieldByName('INVOICEKE').Value;
                  com3.Params.ParamByName('DARIAREA').Value := com2.FieldByName('DARIAREA').Value;
                  com3.Params.ParamByName('BRAND').Value := com2.FieldByName('BRAND').Value;
                  com3.Params.ParamByName('NOINVOICE').Value := com2.FieldByName('NOINVOICE').Value;


                com3.Open;
                //ShowMessage('3');

              end
              else
              begin
//                com3.SQL.Clear;
//
//                com3.SQL.Text := ' SELECT NOINVOICE, SUM(BERAT) AS QTY, SUM(KOLI) AS BERAT, KETERANGAN AS KET, SUM(BIAYA)/SUM(IF(BERAT = 0,1,BERAT)) AS HARGA1,SUM(BIAYA) AS TOTAL1, BLN, '
//                                +' CONCAT(lpad(MONTH(DATE_WH),2,''0''),''/'',year(DATE_WH)) as per, CONCAT(BLN,''/'',THN) as per1, '
//                                +' LEFT(TRIM(PENERIMA),3) as kodecab , BRAND, '
//                                +' IF(BRAND=''B'',''BLG'',IF(BRAND=''D'',''GRD'',IF(BRAND=''E'',''ELV'',IF(BRAND=''G'',''GSH'',IF(BRAND=''J'',''JOP'',IF(BRAND=''P'',''BRN'',IF(BRAND=''R'',''RTL'', '
//                                +' IF(BRAND=''T'',''TRS'',IF(BRAND=''C'',''RCL'',IF(BRAND=''N'',''OND'', IF(BRAND=''I'',''GID'',''GRY''))))))))))) AS BRANDX, PENGIRIM, PENERIMA, NOAWB '
//                                +' FROM webgudang.validasi_expedisi_'+year+' '
//                                +' WHERE EXPEDISI = :EXPEDISI AND BLN = :BLN AND THN = :THN AND INVOICE_KE = :INVOICE_KE AND MODA= :MODA AND DARIAREA= :DARIAREA '
//                                +' AND BRAND = :BRAND AND NOINVOICE = :NOINVOICE '
//                                +' GROUP BY BRAND, PENERIMA, NOAWB '
//                                +' ORDER BY NOAWB ASC ' ;
//
//                com3.Params.ParamByName('EXPEDISI').Value := cbEkspedisi.Text;
//                com3.Params.ParamByName('BLN').Value := com2.FieldByName('BLN').Value;
//                com3.Params.ParamByName('THN').Value := com2.FieldByName('THN').Value;
//                com3.Params.ParamByName('INVOICE_KE').Value := com2.FieldByName('INVOICEKE').Value;
//                com3.Params.ParamByName('MODA').Value := com2.FieldByName('MODA').Value;
//                com3.Params.ParamByName('DARIAREA').Value := com2.FieldByName('DARIAREA').Value;
//                com3.Params.ParamByName('BRAND').Value := com2.FieldByName('BRAND').Value;
//                com3.Params.ParamByName('NOINVOICE').Value := com2.FieldByName('NOINVOICE').Value;
//                //com3.Params.ParamByName('DATE_WH').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);

                  //TANPA MODA
                  com3.SQL.Clear;

                  com3.SQL.Text := ' SELECT NOINVOICE, SUM(BERAT) AS QTY, SUM(KOLI) AS BERAT, KETERANGAN AS KET, SUM(BIAYA)/SUM(IF(BERAT = 0,1,BERAT)) AS HARGA1,SUM(BIAYA) AS TOTAL1, BLN, '
                                  +' CONCAT(lpad(MONTH(DATE_WH),2,''0''),''/'',year(DATE_WH)) as per, CONCAT(BLN,''/'',THN) as per1, '
                                  +' LEFT(TRIM(PENERIMA),3) as kodecab , BRAND, '
                                  +' IF(BRAND=''B'',''BLG'',IF(BRAND=''D'',''GRD'',IF(BRAND=''E'',''ELV'',IF(BRAND=''G'',''GSH'',IF(BRAND=''J'',''JOP'',IF(BRAND=''P'',''BRN'',IF(BRAND=''R'',''RTL'', '
                                  +' IF(BRAND=''T'',''TRS'',IF(BRAND=''C'',''RCL'',IF(BRAND=''N'',''OND'', IF(BRAND=''I'',''GID'',''GRY''))))))))))) AS BRANDX, PENGIRIM, PENERIMA, NOAWB, MODA '
                                  +' FROM webgudang.validasi_expedisi_'+year+' '
                                  +' WHERE EXPEDISI = :EXPEDISI AND BLN = :BLN AND THN = :THN AND INVOICE_KE = :INVOICE_KE AND DARIAREA= :DARIAREA '
                                  +' AND BRAND = :BRAND AND NOINVOICE = :NOINVOICE '
                                  +' GROUP BY BRAND, PENERIMA, NOAWB '
                                  +' ORDER BY NOAWB ASC ' ;

                  com3.Params.ParamByName('EXPEDISI').Value := cbEkspedisi.Text;
                  com3.Params.ParamByName('BLN').Value := com2.FieldByName('BLN').Value;
                  com3.Params.ParamByName('THN').Value := com2.FieldByName('THN').Value;
                  com3.Params.ParamByName('INVOICE_KE').Value := com2.FieldByName('INVOICEKE').Value;
                  com3.Params.ParamByName('DARIAREA').Value := com2.FieldByName('DARIAREA').Value;
                  com3.Params.ParamByName('BRAND').Value := com2.FieldByName('BRAND').Value;
                  com3.Params.ParamByName('NOINVOICE').Value := com2.FieldByName('NOINVOICE').Value;
                  //com3.Params.ParamByName('DATE_WH').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);


                com3.Open;
                //ShowMessage('3');

              end;

              com3.First;
              while NOT com3.Eof do
              begin
                com.SQL.Clear;
//                com.SQL.Add(' INSERT INTO belid(NO_BUKTI, QTY, HARGA1, TOTAL1, FLAG, PER,  KODECAB, BRAND, KET, '
//                          +' NOAWB, PENGIRIM, PENERIMA, PPND, PPHD, MODA) VALUES '
//                          +' (:NO_BUKTI, :QTY, :HARGA1, :TOTAL1, :FLAG, :PER, :KODECAB, :BRAND, :KET, '
//                          +' :NOAWB, :PENGIRIM, :PENERIMA, :PPND, :PPHD, :MODA ) ');
                com.SQL.Add(' INSERT INTO belid(NO_BUKTI, QTY, HARGA1, TOTAL1, FLAG, PER,  KODECAB, BRAND, KET, '
                          +' NOAWB, PENGIRIM, PENERIMA, PPND, MODA) VALUES '
                          +' (:NO_BUKTI, :QTY, :HARGA1, :TOTAL1, :FLAG, :PER, :KODECAB, :BRAND, CONCAT(:KET,'' '', :PENGIRIM,''  '', :PENERIMA), '
                          +' :NOAWB, :PENGIRIM, :PENERIMA, :PPND, :MODA ) ');

                //com.Params.ParamByName('NO_BUKTI').Value := com2.FieldByName('BRANDX').Value+ '-'  + txtInvoiceKe.Text + '-' + RightStr(txtThn.Text,2) + cbBln.Text + '-'+ com2.FieldByName('NOINVOICE').Value ;
                com.Params.ParamByName('NO_BUKTI').Value := txtBukti.Text;
                com.Params.ParamByName('QTY').Value := com3.FieldByName('QTY').Value;
                com.Params.ParamByName('HARGA1').Value :=com3.FieldByName('HARGA1').Value;
                com.Params.ParamByName('TOTAL1').Value := com3.FieldByName('TOTAL1').Value;
                com.Params.ParamByName('FLAG').Value := 'BN';
                com.Params.ParamByName('PER').Value := com3.FieldByName('PER').Value;
                com.Params.ParamByName('KODECAB').Value := com3.FieldByName('KODECAB').Value;
                com.Params.ParamByName('BRAND').Value := com3.FieldByName('BRANDX').Value;
                com.Params.ParamByName('KET').Value := FloatToStr(com3.FieldByName('BERAT').Value) + ' PKGS ' + '  ' + com3.FieldByName('KET').Value;
                com.Params.ParamByName('NOAWB').Value := com3.FieldByName('NOAWB').Value;
                com.Params.ParamByName('PENGIRIM').Value := com3.FieldByName('PENGIRIM').Value;
                com.Params.ParamByName('PENERIMA').Value := com3.FieldByName('PENERIMA').Value;
                com.Params.ParamByName('PPND').Value := '1.00';
                //com.Params.ParamByName('PPHD').Value := '2.00';

                if com3.FieldByName('MODA').Value = '1'  then
                begin
                  com.Params.ParamByName('MODA').Value := 'DARAT';
                end
                else if com3.FieldByName('MODA').Value = '2' then
                begin
                  com.Params.ParamByName('MODA').Value := 'UDARA';
                end
                else
                begin
                  com.Params.ParamByName('MODA').Value := 'ALL';
                end;

                com.ExecSQL;
                //ShowMessage('BELID');
                // ShowMessage('5');
                com3.Next;

              end;

           // ShowMessage(com2.FieldByName('NOINVOICE').Value);
//                ShowMessage('PER' + com2.FieldByName('PER').Value);
//                ShowMessage('DARIAREA' + com2.FieldByName('DARIAREA').Value);
//                ShowMessage('NOINVOICE' + com2.FieldByName('NOINVOICE').Value);
//                ShowMessage('INVOICEKE' + com2.FieldByName('INVOICEKE').Value);

                com.SQL.Clear;
                com.SQL.Add(' UPDATE BELID, BELI SET BELID.ID = BELI.NO_ID '
                            +' WHERE BELI.NO_BUKTI = BELID.NO_BUKTI AND BELI.PER = :PER '
                            +' AND BELI.NOINVOICE = :NOINVOICE AND BELI.DARIAREA = :DARIAREA  '
                            +' AND BELI.INVOICEKE = :INVOICEKE  ');
                com.Params.ParamByName('PER').Value := com2.FieldByName('PER').Value;
                com.Params.ParamByName('DARIAREA').Value := com2.FieldByName('DARIAREA').Value;
                com.Params.ParamByName('NOINVOICE').Value := com2.FieldByName('NOINVOICE').Value;
                com.Params.ParamByName('INVOICEKE').Value := com2.FieldByName('INVOICEKE').Value;
                com.ExecSQL;

                // ShowMessage('UPDATE ID');

                com.SQL.Clear;
                com.SQL.Add(' UPDATE BELI, BELID, CABANG SET BELID.NAMACAB = CABANG.NAMACAB '
                          +' WHERE BELI.NO_BUKTI = BELID.NO_BUKTI AND BELID.KODECAB = CABANG.KODECAB '
                          +' AND beli.PER = :PER AND beli.INVOICEKE = :INVOICEKE AND BELI.NOINVOICE = :NOINVOICE '
                          +' AND beli.DARIAREA = :DARIAREA ');
                com.Params.ParamByName('PER').Value := com2.FieldByName('PER').Value;
                com.Params.ParamByName('DARIAREA').Value := com2.FieldByName('DARIAREA').Value;
                com.Params.ParamByName('NOINVOICE').Value := com2.FieldByName('NOINVOICE').Value;
                com.Params.ParamByName('INVOICEKE').Value := com2.FieldByName('INVOICEKE').Value;
                com.ExecSQL;
                // ShowMessage('UPDATE NAMA CABANG');

                com.SQL.Clear;
                com.SQL.Add(' UPDATE beli, belid, cabang SET belid.KD_BHN = cabang.EXPE, belid.NA_BHN = cabang.EXPENM '
                          +' WHERE beli.NO_BUKTI = belid.NO_BUKTI AND BELID.KODECAB = CABANG.KODECAB AND belid.BRAND = cabang.BRAND '
                          +' AND beli.PER = :PER AND beli.INVOICEKE = :INVOICEKE AND BELI.NOINVOICE = :NOINVOICE '
                          +' AND beli.DARIAREA = :DARIAREA ');
                com.Params.ParamByName('PER').Value := com2.FieldByName('PER').Value;
                com.Params.ParamByName('DARIAREA').Value := com2.FieldByName('DARIAREA').Value;
                com.Params.ParamByName('NOINVOICE').Value := com2.FieldByName('NOINVOICE').Value;
                com.Params.ParamByName('INVOICEKE').Value := com2.FieldByName('INVOICEKE').Value;
                com.ExecSQL;
                // ShowMessage('UPDATE KD & NM BAHAN');

                //UPDATE REC
                com.SQL.Clear;
                com.SQL.Add(' UPDATE beli, belid, (SELECT belid.NO_ID, belid.NO_BUKTI, IF(@BUKTI=NO_BUKTI, @REC:=@REC+1, @REC:=1) AS REC, '
                          +' @BUKTI:=NO_BUKTI FROM BELID JOIN (SELECT @REC:=0,@BUKTI:='''') AS AA ON 1=1 )AS BB SET belid.REC=BB.REC '
                          +' WHERE belid.NO_ID=BB.NO_ID AND BELI.NO_BUKTI = BELID.NO_BUKTI '
                          +' AND beli.PER = :PER AND beli.INVOICEKE = :INVOICEKE AND BELI.NOINVOICE = :NOINVOICE '
                          +' AND beli.DARIAREA = :DARIAREA ');
                com.Params.ParamByName('PER').Value := com2.FieldByName('PER').Value;
                com.Params.ParamByName('DARIAREA').Value := com2.FieldByName('DARIAREA').Value;
                com.Params.ParamByName('NOINVOICE').Value := com2.FieldByName('NOINVOICE').Value;
                com.Params.ParamByName('INVOICEKE').Value := com2.FieldByName('INVOICEKE').Value;
                com.ExecSQL;
                // ShowMessage('UPDATE REC');

                //UPDATE KODE BAHAN YG KOSONG
                com.SQL.Clear;
                com.SQL.Add(' UPDATE beli, belid SET KD_BHN = ''.'' '
                          +' WHERE beli.NO_BUKTI = BELID.NO_BUKTI '
                          +' AND BELID.KD_BHN = '''' AND beli.PER = :PER AND beli.INVOICEKE = :INVOICEKE AND BELI.NOINVOICE = :NOINVOICE '
                          +' AND beli.DARIAREA = :DARIAREA ');
                com.Params.ParamByName('PER').Value := com2.FieldByName('PER').Value;
                com.Params.ParamByName('DARIAREA').Value := com2.FieldByName('DARIAREA').Value;
                com.Params.ParamByName('NOINVOICE').Value := com2.FieldByName('NOINVOICE').Value;
                com.Params.ParamByName('INVOICEKE').Value := com2.FieldByName('INVOICEKE').Value;
                com.ExecSQL;
                // ShowMessage('UPDATE KODE BAHAN = KOSONG');

            end;

            // ShowMessage('Next');
            Com2.Next;

          end;

            ShowMessage('Save Data Success');

            Hapus;

        end
        else
        begin
          ShowMessage('No Invoice Tidak Dikenali');
        end;

  end;

end;


procedure TFrEkspedisiNov.Refresh1Click(Sender: TObject);
begin
  Refresh;
end;

procedure TFrEkspedisiNov.Refresh;
begin
  cxAmbilData.Checked := False;
  cxAmbilDatabyInvoice.Checked := False;
  //Hapus;

  txtKdSupp.Enabled := False;
  txtKdSupp.Text := '';
  txtNamaSupp.Enabled := False;
  txtNamaSupp.Text := '';
  cbEkspedisi.Enabled := False;
  cbEkspedisi.Text := '';
  cbBln.Enabled := False;
  cbBln.Text := '';
  txtThn.Enabled := False;
  txtThn.Text := '';
  txtInvoiceKe.Enabled := False;
  txtInvoiceKe.Text := '';
  cbModa.Enabled := False;
  cbModa.Text := '';
  cbArea.Enabled := False;
  cbArea.Text := '';
  txtInvoice.Visible := False;
  Label3.Visible := False;

end;

procedure TFrEkspedisiNov.btnProsesAmbilDataClick(Sender: TObject);
begin
  if cxAmbilData.Checked = True  then
  begin
    ambilDataByFile;
  end
  else if cxAmbilDatabyInvoice.Checked = True then
  begin
    ambilDataByInvoice;
  end;

end;

procedure TFrEkspedisiNov.cbAreaExit(Sender: TObject);
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

  btnProsesAmbilData.SetFocus;
end;

procedure TFrEkspedisiNov.ceck;
var
 month,year,date:Word;
 monthx, yearx, monthz, yearz, tgl :String;
begin
  //tgl = DateToStr(dtTgl.Date);

  if txtKdSupp.Text = '' then
  begin
    txtKdSupp.SetFocus;
  end
//  else if DateToStr(dtTgl.Date) = '00/00/0000' then
//  begin
//    dtTgl.SetFocus;
//  end
  else if cbEkspedisi.Text = '' then
  begin
    cbEkspedisi.SetFocus;
  end
  else if txtInvoiceKe.Text = '' then
  begin
    txtInvoiceKe.SetFocus;
  end
  else if cbBln.Text = ''  then
  begin
    cbBln.SetFocus;
  end
  else if txtThn.Text = '' then
  begin
    txtThn.SetFocus;
  end
  else if cbArea.Text = '' then
  begin
    cbArea.SetFocus;
  end
  else if cbModa.Text = '' then
  begin
    cbModa.SetFocus;
  end
//  else if txtNoInvoice.Text = '' then
//  begin
//    txtNoInvoice.SetFocus;
//  end
  else
  begin
    cek := 1;
  end;

end;

procedure TFrEkspedisiNov.Hapus;
begin
  txtInvoice.Text := '';
  txtInvoiceKe.Text := '';
  txtBukti.Text := '';

 // cbEkspedisi.Text := '';
 // cbBln.Text := '';
 //cbThn.Text := '';
 // cbArea.Text := '';
 // txtNamaArea.Text := '';
 // cbModa.Text := '';

end;


procedure TFrEkspedisiNov.MSaveClick(Sender: TObject);
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




procedure TFrEkspedisiNov.txtKdSuppExit(Sender: TObject);
var
  b1 : string;
begin
  if txtKdSupp.text <>'' then
  begin
    b1 := txtKdSupp.text ;
    sup.SQL.Clear;
    sup.sql.text := 'select KODES, NAMAS, ALAMAT, KOTA from SUP where KODES = :b1';
    sup.Params.ParamByName('b1').AsString := b1;
    sup.Open;

   if not com.EOF then
      begin
        txtKdSupp.text := sup.FieldByName('kodes').AsString;
        txtNamaSupp.text := sup.FieldByName('namas').AsString;
        txtAlamatSupp.Text := sup.FieldByName('alamat').AsString;
      end
   else
      begin
        frsupF.ShowModal;
        txtKdSupp.text := frsupF.getKode;
        txtNamaSupp.text := frsupF.getNama;
        txtAlamatSupp.Text := frsupf.getalamat;
        FrsupF.Close;
      end;
   end;

end;

procedure TFrEkspedisiNov.txtketKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = 13 then
  begin
    //PageControl1.TabIndex := 1;
  end;
end;

procedure TFrEkspedisiNov.txtThnExit(Sender: TObject);
var
  year : string;
begin
  if txtThn.Text = '' then
  begin
    ShowMessage('Tahun harus diisi');
  end
  else
  begin
    year := Trim(txtThn.Text);
    eks.SQL.Clear;
    eks.SQL.Text := ' SELECT DISTINCT EXPEDISI AS EXPEDISI FROM webgudang.validasi_expedisi_'+year+' ';
    eks.Open;
  end;


end;

procedure TFrEkspedisiNov.E1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrEkspedisiNov.Edit2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = 13 then
  begin
   //PageControl1.TabIndex := 0;
  end;
end;

procedure TFrEkspedisiNov.MExitClick(Sender: TObject);
begin
  close;
end;

procedure TFrEkspedisiNov.FormCreate(Sender: TObject);
begin
 FrEkspedisiNov.ClientHeight:=376;
end;

procedure TFrEkspedisiNov.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if key = VK_RETURN then
  begin
    FrEkspedisiNov.perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TFrEkspedisiNov.FormShow(Sender: TObject);
begin
  eks.Active := True;
  //per.Active := True;
//  invoiceKe.Active := True;
  area.Active := True;
//  brand.Active := True;

  txtKdSupp.SetFocus;
  txtKdSupp.Enabled := False;
  txtNamaSupp.Enabled := False;
  cbEkspedisi.Enabled := False;
  cbBln.Enabled := False;
  txtThn.Enabled := False;
  txtInvoiceKe.Enabled := False;
  cbModa.Enabled := False;
  cbArea.Enabled := False;
  txtInvoice.Visible := False;
  Label3.Visible := False;

end;

procedure TFrEkspedisiNov.ceck2;
var
 month,year,date:Word;
 monthx, yearx, monthz, yearz, tgl :String;
begin
  //tgl = DateToStr(dtTgl.Date);

  if txtKdSupp.Text = '' then
  begin
    txtKdSupp.SetFocus;
  end
  else if cbEkspedisi.Text = '' then
  begin
    cbEkspedisi.SetFocus;
  end
  else if txtInvoice.Text = '' then
  begin
    txtInvoice.SetFocus;
  end
  else
  begin
    cek := 1;
  end;

end;

procedure TFrEkspedisiNov.cxAmbilDataClick(Sender: TObject);
begin
  if cxAmbilData.Checked = True then
  begin
    txtKdSupp.Enabled := True;
    cbEkspedisi.Enabled := True;
    cbEkspedisi.Text := '';
    cbBln.Enabled := True;
    cbBln.Text := '';
    txtThn.Enabled := True;
    txtThn.Text := '';
    txtInvoiceKe.Enabled := True;
    txtInvoiceKe.Text := '';
    cbArea.Enabled := True;
    cbArea.Text := '';
    txtNamaArea.Text := '';
    cbModa.Enabled := True;
    cbModa.Text := '';
    label3.Visible := False;
    txtInvoice.Visible := False;
    txtKdSupp.SetFocus;
  end;

end;

procedure TFrEkspedisiNov.cxAmbilDatabyInvoiceClick(Sender: TObject);
begin
  if cxAmbilDatabyInvoice.Checked = True then
  begin
    txtKdSupp.Enabled := True;
    cbEkspedisi.Enabled := True;
    cbEkspedisi.Text := '';
    cbBln.Enabled := False;
    cbBln.Text := '';
    txtThn.Enabled := True;
    txtThn.Text := '';
    txtInvoiceKe.Enabled := False;
    txtInvoiceKe.Text := '';
    cbArea.Enabled := False;
    cbArea.Text := '';
    cbModa.Enabled := False;
    cbModa.Text := '';
    label3.Visible := True;
    txtInvoice.Visible := True;
    txtInvoice.Text := '';
    txtNamaArea.Text := '';
    txtKdSupp.SetFocus;

  end;
end;

end.
