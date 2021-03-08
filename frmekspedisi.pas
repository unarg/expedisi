unit frmekspedisi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, Vcl.Menus, Data.DB, MemDS, DBAccess, MyAccess,
  Vcl.StdCtrls, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxLabel, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxCalendar;

type
  TForm3 = class(TForm)
    MyConnection1: TMyConnection;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cbEkspedisi: TcxLookupComboBox;
    btnProses: TcxButton;
    eks: TMyQuery;
    DataSource1: TDataSource;
    cxLabel4: TcxLabel;
    com: TMyQuery;
    DataSource2: TDataSource;
    cxLabel5: TcxLabel;
    txtNoInvoice: TcxTextEdit;
    cxLabel6: TcxLabel;
    txtKdSupp: TcxTextEdit;
    txtNamaSupp: TcxTextEdit;
    MyQuery1: TMyQuery;
    dtTgl: TcxDateEdit;
    txtAlamatSupp: TcxTextEdit;
    cbBln: TcxLookupComboBox;
    per: TMyQuery;
    cbInvoiceKe: TcxLookupComboBox;
    invoiceKe: TMyQuery;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    cxLabel7: TcxLabel;
    cbArea: TcxLookupComboBox;
    txtNamaArea: TcxTextEdit;
    area: TMyQuery;
    DataSource5: TDataSource;
    btnProsesAllBrand: TcxButton;
    btnProsesByBrandAWB: TcxButton;
    btnProsesAllBrandAWB: TcxButton;
    RETAIL: TMyConnection;
    com2: TMyQuery;
    cbThn: TcxComboBox;
    com3: TMyQuery;
    btnFrmBahan: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure btnProsesClick(Sender: TObject);
    procedure txtKdSuppKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtKdSuppExit(Sender: TObject);
    procedure cbAreaExit(Sender: TObject);
    procedure btnProsesAllBrandClick(Sender: TObject);
    procedure btnProsesByBrandAWBClick(Sender: TObject);
    procedure btnProsesAllBrandAWBClick(Sender: TObject);
    procedure btnFrmBahanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation
uses frmsupF, frmEkspedisiNew;

{$R *.dfm}

procedure TForm3.btnProsesByBrandAWBClick(Sender: TObject);
begin
   //CEK NO.BUKTI
  com.SQL.Clear;
  com.SQL.Text:= 'SELECT * FROM BELI WHERE NO_BUKTI = :NO_BUKTI ';
  com.Params.ParamByName('NO_BUKTI').Value := txtNoInvoice.Text;
  com.Open;
  if com.RecordCount <> 0 then
  begin
    ShowMessage('No Bukti Sudah Ada');
  end
  else
  begin
    ShowMessage('1');
    com.SQL.Clear;
   // com.SQL.Add(' INSERT INTO beli(NO_BUKTI, TGL, PER, KODES, NAMAS, ALAMAT, TOTAL_QTY, USRNM, TG_SMP, FLAG, TOTAL1, NETT1, PPN1, PPN, PPH1, PPH) '
//    com.SQL.Add(' INSERT INTO kmbst.beli(NO_BUKTI,TGL, KODES, NAMAS, ALAMAT, PER, TOTAL_QTY, FLAG, TOTAL1, BRAND, NOTES)'
//                +' SELECT CONCAT(BRAND, ''-'', :NOINVOICE) ,DATE_WH, :KODES, :NAMAS, :ALAMAT, CONCAT(lpad(MONTH(webgudang.validasi_expedisi_2017.DATE_WH),2,''0''),''/'',year(webgudang.validasi_expedisi_2017.DATE_WH)) as per,SUM(BERAT) AS BERAT,:FLAG, SUM(BIAYA) AS BIAYA, '
//                +' IF(BRAND=''B'',''BLG'',IF(BRAND=''D'',''GRD'',IF(BRAND=''E'',''ELV'',IF(BRAND=''G'',''GSH'',IF(BRAND=''J'',''JOP'',IF(BRAND=''P'',''BRN'',IF(BRAND=''R'',''RTL'',IF(BRAND=''T'',''TRS'',''GRY'')))))))) AS BRANDX,  '
//                +' FROM webgudang.validasi_expedisi_2017 '
//                +' WHERE DARIAREA =:DARIAREA'
//                +' AND INVOICE_KE=:INVOICE_KE'
//                +' AND DATE_WH= :DATE_WH'
//                +' GROUP BY BRAND');
    com.SQL.Add(' INSERT INTO kmbst.beli(NO_BUKTI,TGL, KODES, NAMAS, ALAMAT, PER, TOTAL_QTY, FLAG, TOTAL1, BRAND, CURR)'
                +' SELECT CONCAT(BRAND, ''-'', :NOINVOICE) ,DATE_WH, :KODES, :NAMAS, :ALAMAT, CONCAT(lpad(MONTH(webgudang.validasi_expedisi_2017.DATE_WH),2,''0''),''/'',year(webgudang.validasi_expedisi_2017.DATE_WH)) as per,SUM(BERAT) AS BERAT,:FLAG, SUM(BIAYA) AS BIAYA, '
                +' IF(BRAND=''B'',''BLG'',IF(BRAND=''D'',''GRD'',IF(BRAND=''E'',''ELV'',IF(BRAND=''G'',''GSH'',IF(BRAND=''J'',''JOP'',IF(BRAND=''P'',''BRN'',IF(BRAND=''R'',''RTL'',IF(BRAND=''T'',''TRS'',''GRY'')))))))) AS BRANDX, :CURR '
                +' FROM webgudang.validasi_expedisi_2017 '
                +' WHERE DARIAREA =:DARIAREA'
                +' AND INVOICE_KE=:INVOICE_KE'
                +' AND DATE_WH= :DATE_WH'
                +' GROUP BY BRAND');
    com.Params.ParamByName('KODES').Value := txtKdSupp.Text;
    com.Params.ParamByName('NAMAS').Value := txtNamaSupp.Text;
    com.Params.ParamByName('ALAMAT').Value := txtAlamatSupp.Text;
    com.Params.ParamByName('FLAG').Value := 'BN';
    com.Params.ParamByName('CURR').Value := 'IDR';
    //com.Params.ParamByName('USRNM').Value := 'admin';
    com.Params.ParamByName('NOINVOICE').Value := txtNoInvoice.Text;
    com.Params.ParamByName('DARIAREA').Value := cbArea.Text;
    com.Params.ParamByName('INVOICE_KE').Value := cbInvoiceKe.Text;
    com.Params.ParamByName('DATE_WH').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);
    com.ExecSQL;
    ShowMessage('BELI');

    //INSERT BELID
    com.SQL.Clear;
    com.SQL.Add(' INSERT INTO belid(NO_BUKTI, QTY, HARGA1, TOTAL1, FLAG, PER, KODECAB, BRAND, KET, NOAWB )'
              +' SELECT CONCAT(BRAND,''-'',:NOINVOICE), SUM(BERAT) AS BERAT, SUM(BIAYA)/SUM(BERAT) AS HARGA1, SUM(BIAYA) AS BIAYA, :FLAG, '
              +' CONCAT(lpad(MONTH(webgudang.validasi_expedisi_2017.DATE_WH),2,''0''),''/'',year(webgudang.validasi_expedisi_2017.DATE_WH)) as per, '
              +' LEFT(TRIM(penerima),3) as kodecab,IF(BRAND=''B'',''BLG'',IF(BRAND=''D'',''GRD'',IF(BRAND=''E'',''ELV'',IF(BRAND=''G'',''GSH'',IF(BRAND=''J'',''JOP'',IF(BRAND=''P'',''BRN'',IF(BRAND=''R'',''RTL'',IF(BRAND=''T'',''TRS'',''GRY'')))))))) AS BRANDX,'
              +' PENERIMA, NOAWB FROM webgudang.validasi_expedisi_2017   '
              +' WHERE DARIAREA =:DARIAREA'
              +' AND INVOICE_KE=:INVOICE_KE'
              +' AND DATE_WH= :DATE_WH'
              +' GROUP BY BRAND,PENERIMA,NOAWB;');

    com.Params.ParamByName('NOINVOICE').Value := txtNoInvoice.Text;
    com.Params.ParamByName('FLAG').Value := 'BN';
    com.Params.ParamByName('DARIAREA').Value := cbArea.Text;
    com.Params.ParamByName('INVOICE_KE').Value := cbInvoiceKe.Text;
    com.Params.ParamByName('DATE_WH').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);
    com.ExecSQL;
    ShowMessage('BELID');

    com.SQL.Clear;
    com.SQL.Add(' UPDATE belid, beli SET belid.ID = beli.NO_ID '
              +' WHERE beli.NO_BUKTI = belid.NO_BUKTI ');
    com.ExecSQL;
    ShowMessage('UPDATE ID');

    com.SQL.Clear;
    com.SQL.Add(' UPDATE belid, cabang SET belid.NAMACAB = cabang.NAMACAB '
              +' WHERE belid.KODECAB = cabang.KODECAB');
    com.ExecSQL;
    ShowMessage('UPDATE NAMACAB');

    com.SQL.Clear;
    com.SQL.Add(' UPDATE belid, cabang SET belid.KD_BHN = cabang.EXPE , belid.NA_BHN = cabang.EXPENM '
              +' WHERE belid.KODECAB = cabang.KODECAB AND belid.BRAND = cabang.BRAND  ');
    com.ExecSQL;
    ShowMessage('UPDATE KD & NM BAHAN');

//    com.SQL.Clear;
//    com.SQL.Add(' UPDATE belid, account SET BELID.NA_BHN = account.NAMA WHERE belid.KD_BHN = account.ACNO '
//              +' AND BELID.KD_BHN <> '''' ');
//    com.ExecSQL;
//    ShowMessage('UPDATE ACCOUNT');

  //UPDATE REC
    com.SQL.Clear;
    com.SQL.Add(' UPDATE belid, (SELECT belid.NO_ID, belid.NO_BUKTI, IF(@BUKTI=NO_BUKTI, @REC:=@REC+1, @REC:=1) AS REC, '
            +' @BUKTI:=NO_BUKTI FROM BELID JOIN (SELECT @REC:=0,@BUKTI:='''') AS AA ON 1=1 )AS BB SET belid.REC=BB.REC '
            +' WHERE belid.NO_ID=BB.NO_ID ');
    com.ExecSQL;
    ShowMessage('UPDATE REC');

    //UPDATE KODE BAHAN YG KOSONG
    com.SQL.Clear;
    com.SQL.Add(' UPDATE kmbst.belid SET KD_BHN = ''.'' WHERE KD_BHN = '''' ');
    com.ExecSQL;
    ShowMessage('UPDATE KODE BAHAN = KOSONG');




  end;


end;

procedure TForm3.btnFrmBahanClick(Sender: TObject);
begin
  frEkspedisiNew.Show;
end;

procedure TForm3.btnProsesAllBrandAWBClick(Sender: TObject);
begin
  //CEK NO.BUKTI
  com.SQL.Clear;
  com.SQL.Text:= 'SELECT * FROM BELI WHERE NO_BUKTI = :NO_BUKTI ';
  com.Params.ParamByName('NO_BUKTI').Value := txtNoInvoice.Text;
  com.Open;
  if com.RecordCount <> 0 then
  begin
    ShowMessage('No Bukti Sudah Ada');
  end
  else
  begin
    ShowMessage('1');

    //CEK DATA
//    com2.SQL.Clear;
//    com2.SQL.text:= ' SELECT * from validasi_expedisi_2017 WHERE DARIAREA = :DARIAREA AND INVOICE_KE = :INVOICE_KE AND DATE_WH = :DATE_WH ';
//    com2.Params.ParamByName('DARIAREA').Value := cbArea.Text;
//    com2.Params.ParamByName('INVOICE_KE').Value := cbInvoiceKe.Text;
//    com2.Params.ParamByName('DATE_WH').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);
//    com2.Open;

    com2.SQL.Clear;
//    com2.SQL.Text := ' SELECT * ,SUM(BERAT) AS TOTAL, IF(BRAND=''B'',''BLG'',IF(BRAND=''D'',''GRD'',IF(BRAND=''E'',''ELV'',IF(BRAND=''G'',''GSH'',IF(BRAND=''J'',''JOP'',IF(BRAND=''P'',''BRN'','
//                    +' IF(BRAND=''R'',''RTL'',IF(BRAND=''T'',''TRS'',''GRY'')))))))) AS BRANDX, LEFT(TRIM(penerima),3) as kodecab '
//                    +' FROM webgudang.validasi_expedisi_2017 '
//                    +' WHERE DARIAREA = :DARIAREA '
//                    +' AND INVOICE_KE = :INVOICE_KE '
//                    +' AND DATE_WH = :DATE_WH '
//                    +' AND BLN = :BLN '
//                    +' AND THN = :THN ';

    com2.SQL.Text := ' SELECT CONCAT(lpad(MONTH(EX.DATE_WH),2,''0''),''/'',year(EX.DATE_WH)) as per ,SUM(EX.QTY) AS TOTAL_QTY, SUM(EX.TOTAL) AS TOTAL1 '
                    +' FROM( SELECT * , SUM(BERAT) AS QTY, SUM(BIAYA) AS TOTAL, SUM(BIAYA)/SUM(BERAT) AS HARGA1, '
                    +' IF(BRAND=''B'',''BLG'',IF(BRAND=''D'',''GRD'',IF(BRAND=''E'',''ELV'',IF(BRAND=''G'',''GSH'',IF(BRAND=''J'',''JOP'',IF(BRAND=''P'',''BRN'',IF(BRAND=''R'','
                    +' ''RTL'',IF(BRAND=''T'',''TRS'',''GRY'')))))))) AS BRANDX, LEFT(TRIM(penerima),3) as kodecab '
                    +' FROM webgudang.validasi_expedisi_2017 '
                    +' WHERE DARIAREA = :DARIAREA AND INVOICE_KE = :INVOICE_KE  AND DATE_WH = :DATE_WH AND BLN = :BLN AND THN = :THN '
                    +' GROUP BY BRAND, PENERIMA, NOAWB ) AS EX' ;

    com2.Params.ParamByName('DARIAREA').Value := cbArea.Text;
    com2.Params.ParamByName('INVOICE_KE').Value := cbInvoiceKe.Text;
    com2.Params.ParamByName('DATE_WH').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);
    com2.Params.ParamByName('BLN').Value := cbBln.Text;
    com2.Params.ParamByName('THN').Value := cbThn.Text;
    com2.Open;

    ShowMessage('2');

    if com2.RecordCount > 0 then
    begin
     { ------ 17 APRIL 2018 ------
      com.SQL.Clear;
   // com.SQL.Add(' INSERT INTO beli(NO_BUKTI, TGL, PER, KODES, NAMAS, ALAMAT, TOTAL_QTY, USRNM, TG_SMP, FLAG, TOTAL1, NETT1, PPN1, PPN, PPH1, PPH) '
//    com.SQL.Add(' INSERT INTO kmbst.beli(NO_BUKTI,TGL, KODES, NAMAS, ALAMAT, PER, TOTAL_QTY, FLAG, TOTAL1, BRAND, NOTES)'
//                +' SELECT CONCAT(BRAND, ''-'', :NOINVOICE) ,DATE_WH, :KODES, :NAMAS, :ALAMAT, CONCAT(lpad(MONTH(webgudang.validasi_expedisi_2017.DATE_WH),2,''0''),''/'',year(webgudang.validasi_expedisi_2017.DATE_WH)) as per,SUM(BERAT) AS BERAT,:FLAG, SUM(BIAYA) AS BIAYA, '
//                +' IF(BRAND=''B'',''BLG'',IF(BRAND=''D'',''GRD'',IF(BRAND=''E'',''ELV'',IF(BRAND=''G'',''GSH'',IF(BRAND=''J'',''JOP'',IF(BRAND=''P'',''BRN'',IF(BRAND=''R'',''RTL'',IF(BRAND=''T'',''TRS'',''GRY'')))))))) AS BRANDX, :NOTES '
//                +' FROM webgudang.validasi_expedisi_2017 '
//                +' WHERE DARIAREA =:DARIAREA'
//                +' AND INVOICE_KE=:INVOICE_KE'
//                +' AND DATE_WH= :DATE_WH'
//                +' GROUP BY BRAND');
      com.SQL.Add(' INSERT INTO kmbst.beli(NO_BUKTI, TGL, KODES, NAMAS, ALAMAT, PER, TOTAL_QTY, FLAG, TOTAL1,CURR)'
              +' SELECT :NOINVOICE ,DATE_WH, :KODES, :NAMAS, :ALAMAT,'
              +' CONCAT(lpad(MONTH(webgudang.validasi_expedisi_2017.DATE_WH),2,''0''),''/'',year(webgudang.validasi_expedisi_2017.DATE_WH)) as per, '
              +' SUM(BERAT) AS BERAT, :FLAG , SUM(BIAYA) AS BIAYA, :CURR  '
              +' FROM webgudang.validasi_expedisi_2017 '
              +' WHERE DARIAREA = :DARIAREA '
              +' AND INVOICE_KE = :INVOICE_KE '
              +' AND DATE_WH = :DATE_WH ');
      }
      com.SQL.Clear;
      com.SQL.Add(' INSERT INTO beli(NO_BUKTI, TGL, KODES, NAMAS, ALAMAT, PER, TOTAL_QTY, FLAG, TOTAL1, CURR) VALUES ('
                +' :NO_BUKTI, :TGL, :KODES, :NAMAS, :ALAMAT, :PER, '
                +' :TOTAL_QTY, :FLAG, :TOTAL1, :CURR ) ');

      com.Params.ParamByName('NO_BUKTI').Value := txtNoInvoice.Text;
      com.Params.ParamByName('TGL').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);
      com.Params.ParamByName('KODES').Value := TRIM(txtKdSupp.Text);
      com.Params.ParamByName('NAMAS').Value := TRIM(txtNamaSupp.Text);
      com.Params.ParamByName('ALAMAT').Value := TRIM(txtAlamatSupp.Text);
      com.Params.ParamByName('PER').Value := com2.FieldByName('PER').Value;
      //com.Params.ParamByName('DATE_WH').Value := com2.FieldByName('DATE_WH').Value;
      com.Params.ParamByName('TOTAL_QTY').Value := com2.FieldByName('TOTAL_QTY').Value;
      com.Params.ParamByName('FLAG').Value := 'BN';
      com.Params.ParamByName('TOTAL1').Value := com2.FieldByName('TOTAL1').Value;
      com.Params.ParamByName('CURR').Value := 'IDR';


//
//      com.Params.ParamByName('KODES').Value := txtKdSupp.Text;
//      com.Params.ParamByName('NAMAS').Value := txtNamaSupp.Text;
//      com.Params.ParamByName('ALAMAT').Value := txtAlamatSupp.Text;
//      com.Params.ParamByName('FLAG').Value := 'BN';
//      com.Params.ParamByName('CURR').Value := 'IDR';
//      //com.Params.ParamByName('USRNM').Value := 'admin';
//      com.Params.ParamByName('NOINVOICE').Value := txtNoInvoice.Text;
//      com.Params.ParamByName('DARIAREA').Value := cbArea.Text;
//      com.Params.ParamByName('INVOICE_KE').Value := cbInvoiceKe.Text;
//      com.Params.ParamByName('DATE_WH').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);
      com.ExecSQL;
      ShowMessage('BELI');

//      com.SQL.Clear;
//      com.SQL.Add(' INSERT INTO belid(NO_BUKTI, QTY, HARGA1, TOTAL1, FLAG, PER, KODECAB, BRAND, KET, NOAWB )'
//              +' SELECT :NOINVOICE, SUM(BERAT) AS BERAT, SUM(BIAYA)/SUM(BERAT) AS HARGA1, SUM(BIAYA) AS BIAYA, :FLAG, '
//              +' CONCAT(lpad(MONTH(webgudang.validasi_expedisi_2017.DATE_WH),2,''0''),''/'',year(webgudang.validasi_expedisi_2017.DATE_WH)) as per, '
//              +' LEFT(TRIM(penerima),3) as kodecab,IF(BRAND=''B'',''BLG'',IF(BRAND=''D'',''GRD'',IF(BRAND=''E'',''ELV'',IF(BRAND=''G'',''GSH'',IF(BRAND=''J'',''JOP'',IF(BRAND=''P'',''BRN'',IF(BRAND=''R'',''RTL'',IF(BRAND=''T'',''TRS'',''GRY'')))))))) AS BRANDX,'
//              +' PENERIMA, NOAWB FROM webgudang.validasi_expedisi_2017   '
//              +' WHERE DARIAREA = :DARIAREA'
//              +' AND INVOICE_KE = :INVOICE_KE'
//              +' AND DATE_WH = :DATE_WH'
//              +' GROUP BY BRAND, PENERIMA, NOAWB ');

      com3.SQL.Clear;
      com3.SQL.Text := ' SELECT *, CONCAT(lpad(MONTH(DATE_WH),2,''0''),''/'',year(DATE_WH)) as PER, SUM(BERAT) AS QTY, SUM(BIAYA) AS TOTAL1, SUM(BIAYA)/SUM(BERAT) AS HARGA1, '
                    +' IF(BRAND=''B'',''BLG'',IF(BRAND=''D'',''GRD'',IF(BRAND=''E'',''ELV'',IF(BRAND=''G'',''GSH'',IF(BRAND=''J'',''JOP'',IF(BRAND=''P'',''BRN'',IF(BRAND=''R'','
                    +' ''RTL'',IF(BRAND=''T'',''TRS'',''GRY'')))))))) AS BRANDX, LEFT(TRIM(penerima),3) as kodecab '
                    +' FROM webgudang.validasi_expedisi_2017 '
                    +' WHERE DARIAREA = :DARIAREA AND INVOICE_KE = :INVOICE_KE  AND DATE_WH = :DATE_WH AND BLN = :BLN AND THN = :THN '
                    +' GROUP BY BRAND, PENERIMA, NOAWB ';

      com3.Params.ParamByName('DARIAREA').Value := cbArea.Text;
      com3.Params.ParamByName('INVOICE_KE').Value := cbInvoiceKe.Text;
      com3.Params.ParamByName('DATE_WH').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);
      com3.Params.ParamByName('BLN').Value := cbBln.Text;
      com3.Params.ParamByName('THN').Value := cbThn.Text;
      com3.Open;
      ShowMessage('3');

      com.SQL.Clear;
      com.SQL.Add(' INSERT INTO belid(NO_BUKTI, QTY, HARGA1, TOTAL1, FLAG, PER, KODECAB, BRAND, KET, NOAWB) VALUES (:NO_BUKTI, :QTY, :HARGA1, :TOTAL1, :FLAG, :PER, :KODECAB, :BRAND, :KET, :NOAWB ) ');

      com.Params.ParamByName('NO_BUKTI').Value := txtNoInvoice.Text;
      com.Params.ParamByName('QTY').Value := com3.FieldByName('QTY').Value;
      com.Params.ParamByName('HARGA1').Value :=com3.FieldByName('HARGA1').Value;
      com.Params.ParamByName('TOTAL1').Value := com3.FieldByName('TOTAL1').Value;
      com.Params.ParamByName('FLAG').Value := 'BN';
      com.Params.ParamByName('PER').Value := com3.FieldByName('per').Value;
      com.Params.ParamByName('KODECAB').Value := com3.FieldByName('KODECAB').Value;
      com.Params.ParamByName('BRAND').Value := com3.FieldByName('BRANDX').Value;
      com.Params.ParamByName('KET').Value := com3.FieldByName('PENERIMA').Value;
      com.Params.ParamByName('NOAWB').Value := com3.FieldByName('NOAWB').Value;

//      com.Params.ParamByName('NOINVOICE').Value := txtNoInvoice.Text;
//      com.Params.ParamByName('FLAG').Value := 'BN';
//      com.Params.ParamByName('DARIAREA').Value := cbArea.Text;
//      com.Params.ParamByName('INVOICE_KE').Value := cbInvoiceKe.Text;
//      com.Params.ParamByName('DATE_WH').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);
      com.ExecSQL;
      ShowMessage('BELID');

      com.SQL.Clear;
      com.SQL.Add(' UPDATE belid, beli SET belid.ID = beli.NO_ID '
              +' WHERE beli.NO_BUKTI = belid.NO_BUKTI ');
      com.ExecSQL;
      ShowMessage('UPDATE ID');

      com.SQL.Clear;
      com.SQL.Add(' UPDATE belid, cabang SET belid.NAMACAB = cabang.NAMACAB '
              +' WHERE belid.KODECAB = cabang.KODECAB');
      com.ExecSQL;
      ShowMessage('UPDATE NAMACAB');

      com.SQL.Clear;
      com.SQL.Add(' UPDATE belid, cabang SET belid.KD_BHN = cabang.EXPE , belid.NA_BHN = cabang.EXPENM '
              +' WHERE belid.KODECAB = cabang.KODECAB AND belid.BRAND = cabang.BRAND  ');
      com.ExecSQL;
      ShowMessage('UPDATE KD & NM BAHAN');

//    com.SQL.Clear;
//    com.SQL.Add(' UPDATE belid, account SET BELID.NA_BHN = account.NAMA WHERE belid.KD_BHN = account.ACNO '
//              +' AND BELID.KD_BHN <> '''' ');
//    com.ExecSQL;
//    ShowMessage('UPDATE ACCOUNT');

    //UPDATE REC
      com.SQL.Clear;
      com.SQL.Add(' UPDATE belid, (SELECT belid.NO_ID, belid.NO_BUKTI, IF(@BUKTI=NO_BUKTI, @REC:=@REC+1, @REC:=1) AS REC, '
            +' @BUKTI:=NO_BUKTI FROM BELID JOIN (SELECT @REC:=0,@BUKTI:='''') AS AA ON 1=1 )AS BB SET belid.REC=BB.REC '
            +' WHERE belid.NO_ID=BB.NO_ID ');
      com.ExecSQL;
      ShowMessage('UPDATE REC');

      //UPDATE KODE BAHAN YG KOSONG
      com.SQL.Clear;
      com.SQL.Add(' UPDATE kmbst.belid SET KD_BHN = ''.'' WHERE KD_BHN = '''' ');
      com.ExecSQL;
      ShowMessage('UPDATE KODE BAHAN = KOSONG');

      ShowMessage('Save Data Success');

    end
    else
    begin
      ShowMessage('Data kosong');
    end;


  end;
end;

procedure TForm3.btnProsesAllBrandClick(Sender: TObject);
begin
  ShowMessage('1');
    com.SQL.Clear;
   // com.SQL.Add(' INSERT INTO beli(NO_BUKTI, TGL, PER, KODES, NAMAS, ALAMAT, TOTAL_QTY, USRNM, TG_SMP, FLAG, TOTAL1, NETT1, PPN1, PPN, PPH1, PPH) '
//    com.SQL.Add(' INSERT INTO kmbst.beli(NO_BUKTI,TGL, KODES, NAMAS, ALAMAT, PER, TOTAL_QTY, FLAG, TOTAL1, BRAND, NOTES)'
//                +' SELECT CONCAT(BRAND, ''-'', :NOINVOICE) ,DATE_WH, :KODES, :NAMAS, :ALAMAT, CONCAT(lpad(MONTH(webgudang.validasi_expedisi_2017.DATE_WH),2,''0''),''/'',year(webgudang.validasi_expedisi_2017.DATE_WH)) as per,SUM(BERAT) AS BERAT,:FLAG, SUM(BIAYA) AS BIAYA, '
//                +' IF(BRAND=''B'',''BLG'',IF(BRAND=''D'',''GRD'',IF(BRAND=''E'',''ELV'',IF(BRAND=''G'',''GSH'',IF(BRAND=''J'',''JOP'',IF(BRAND=''P'',''BRN'',IF(BRAND=''R'',''RTL'',IF(BRAND=''T'',''TRS'',''GRY'')))))))) AS BRANDX, :NOTES '
//                +' FROM webgudang.validasi_expedisi_2017 '
//                +' WHERE DARIAREA =:DARIAREA'
//                +' AND INVOICE_KE=:INVOICE_KE'
//                +' AND DATE_WH= :DATE_WH'
//                +' GROUP BY BRAND');
    com.SQL.Add(' INSERT INTO kmbst.beli(NO_BUKTI, TGL, KODES, NAMAS, ALAMAT, PER, TOTAL_QTY, FLAG, TOTAL1,CURR)'
              +' SELECT :NOINVOICE ,DATE_WH, :KODES, :NAMAS, :ALAMAT,'
              +' CONCAT(lpad(MONTH(webgudang.validasi_expedisi_2017.DATE_WH),2,''0''),''/'',year(webgudang.validasi_expedisi_2017.DATE_WH)) as per, '
              +' SUM(BERAT) AS BERAT, :FLAG , SUM(BIAYA) AS BIAYA, :CURR  '
              +' FROM webgudang.validasi_expedisi_2017 '
              +' WHERE DARIAREA = :DARIAREA '
              +' AND INVOICE_KE = :INVOICE_KE '
              +' AND DATE_WH = :DATE_WH ');
    com.Params.ParamByName('KODES').Value := txtKdSupp.Text;
    com.Params.ParamByName('NAMAS').Value := txtNamaSupp.Text;
    com.Params.ParamByName('ALAMAT').Value := txtAlamatSupp.Text;
    com.Params.ParamByName('FLAG').Value := 'BN';
    com.Params.ParamByName('CURR').Value := 'IDR';
    //com.Params.ParamByName('USRNM').Value := 'admin';
    com.Params.ParamByName('NOINVOICE').Value := txtNoInvoice.Text;
    com.Params.ParamByName('DARIAREA').Value := cbArea.Text;
    com.Params.ParamByName('INVOICE_KE').Value := cbInvoiceKe.Text;
    com.Params.ParamByName('DATE_WH').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);
    com.ExecSQL;
    ShowMessage('BELI');

    com.SQL.Clear;
    com.SQL.Add(' INSERT INTO belid(NO_BUKTI, QTY, HARGA1, TOTAL1, FLAG, PER, KODECAB, BRAND, KET )'
              +' SELECT :NOINVOICE, SUM(BERAT) AS BERAT, SUM(BIAYA)/SUM(BERAT) AS HARGA1, SUM(BIAYA) AS BIAYA, :FLAG, '
              +' CONCAT(lpad(MONTH(webgudang.validasi_expedisi_2017.DATE_WH),2,''0''),''/'',year(webgudang.validasi_expedisi_2017.DATE_WH)) as per, '
              +' LEFT(TRIM(penerima),3) as kodecab,IF(BRAND=''B'',''BLG'',IF(BRAND=''D'',''GRD'',IF(BRAND=''E'',''ELV'',IF(BRAND=''G'',''GSH'',IF(BRAND=''J'',''JOP'',IF(BRAND=''P'',''BRN'',IF(BRAND=''R'',''RTL'',IF(BRAND=''T'',''TRS'',''GRY'')))))))) AS BRANDX,'
              +' PENERIMA FROM webgudang.validasi_expedisi_2017   '
              +' WHERE DARIAREA = :DARIAREA'
              +' AND INVOICE_KE = :INVOICE_KE'
              +' AND DATE_WH = :DATE_WH'
              +' GROUP BY BRAND,PENERIMA ');
    com.Params.ParamByName('NOINVOICE').Value := txtNoInvoice.Text;
    com.Params.ParamByName('FLAG').Value := 'BN';
    com.Params.ParamByName('DARIAREA').Value := cbArea.Text;
    com.Params.ParamByName('INVOICE_KE').Value := cbInvoiceKe.Text;
    com.Params.ParamByName('DATE_WH').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);
    com.ExecSQL;
    ShowMessage('BELID');

    com.SQL.Clear;
    com.SQL.Add(' UPDATE belid, beli SET belid.ID = beli.NO_ID '
              +' WHERE beli.NO_BUKTI = belid.NO_BUKTI ');
    com.ExecSQL;
    ShowMessage('UPDATE ID');

    com.SQL.Clear;
    com.SQL.Add(' UPDATE belid, cabang SET belid.NAMACAB = cabang.NAMACAB '
              +' WHERE belid.KODECAB = cabang.KODECAB');
    com.ExecSQL;
    ShowMessage('UPDATE NAMACAB');

    com.SQL.Clear;
    com.SQL.Add(' UPDATE belid, cabang SET belid.KD_BHN = cabang.EXPE , belid.NA_BHN = cabang.EXPENM '
              +' WHERE belid.KODECAB = cabang.KODECAB AND belid.BRAND = cabang.BRAND  ');
    com.ExecSQL;
    ShowMessage('UPDATE KD & NM BAHAN');

//    com.SQL.Clear;
//    com.SQL.Add(' UPDATE belid, account SET BELID.NA_BHN = account.NAMA WHERE belid.KD_BHN = account.ACNO '
//              +' AND BELID.KD_BHN <> '''' ');
//    com.ExecSQL;
//    ShowMessage('UPDATE ACCOUNT');

  //UPDATE REC
    com.SQL.Clear;
    com.SQL.Add(' UPDATE belid, (SELECT belid.NO_ID, belid.NO_BUKTI, IF(@BUKTI=NO_BUKTI, @REC:=@REC+1, @REC:=1) AS REC, '
            +' @BUKTI:=NO_BUKTI FROM BELID JOIN (SELECT @REC:=0,@BUKTI:='''') AS AA ON 1=1 )AS BB SET belid.REC=BB.REC '
            +' WHERE belid.NO_ID=BB.NO_ID ');
    com.ExecSQL;
    ShowMessage('UPDATE REC');

    //UPDATE KODE BAHAN YG KOSONG
    com.SQL.Clear;
    com.SQL.Add(' UPDATE kmbst.belid SET KD_BHN = ''.'' WHERE KD_BHN = '''' ');
    com.ExecSQL;
    ShowMessage('UPDATE KODE BAHAN = KOSONG');

end;

procedure TForm3.btnProsesClick(Sender: TObject);
begin
//  com.SQL.Clear;
//  com.SQL.Add(' INSERT INTO kmbst.expedisi (BRAND, DARIAREA, BLN, THN, NOAWB, EXPEDISI, INVOICE_KE, PENGIRIM, PENERIMA, '
//              +' KOLI, BERAT, MODA, BIAYA, KETERANGAN, TGL_KIRIM, '
//              +' TGL_TERIMA, LEAD_TIME, QTY_S, QTY_B, QTY_A, QTY_O, V_WH, V_ACC, USER_WH, USER_ACC, DATE_WH, DATE_ACC, '
//              +' NOINVOICE) '
//              +' SELECT BRAND, DARIAREA, BLN, THN, NOAWB, EXPEDISI, INVOICE_KE, PENGIRIM, PENERIMA, KOLI, BERAT, MODA, '
//              +' BIAYA, KETERANGAN, TGL_KIRIM, TGL_TERIMA, LEAD_TIME, '
//              +' QTY_S, QTY_B, QTY_A, QTY_O, V_WH, V_ACC, USER_WH, USER_ACC, DATE_WH, DATE_ACC, NOINVOICE '
//              +' FROM webgudang.validasi_expedisi_2017 '
//              +' WHERE webgudang.validasi_expedisi_2017.EXPEDISI = :EXPEDISI '
//              +' AND webgudang.validasi_expedisi_2017.INVOICE_KE = :INVOICEKE '
//              +' AND webgudang.validasi_expedisi_2017.NOINVOICE = :NOINVOICE');
//  com.Params.ParamByName('EXPEDISI').Value := cbEkspedisi.Text;
//  com.Params.ParamByName('INVOICEKE').Value := txtInvoiceKe.Text;
//  com.Params.ParamByName('NOINVOICE').Value := txtNoInvoice.Text;
//  com.ExecSQL;
//  ShowMessage('A');

  //CEK NO.BUKTI
//  com.SQL.Clear;
//  com.SQL.Text:= 'SELECT * FROM BELI WHERE NO_BUKTI = :NO_BUKTI ';
//  com.Params.ParamByName('NO_BUKTI').Value := txtNoInvoice.Text;
//  com.Open;
//  if com.RecordCount <> 0 then
//  begin
//    ShowMessage('No Bukti Sudah Ada');
//  end
//  else
//  begin
//
//  //INSERT beli
//    com.SQL.Clear;
////  com.SQL.Add(' INSERT INTO beli(NO_BUKTI, TGL, PER, KODES, NAMAS, ALAMAT, TOTAL_QTY, USRNM, TG_SMP, FLAG, TOTAL1, NETT1, PPN1, PPN, PPH1, PPH) '
////              +' SELECT NOINVOICE, DATE_WH, CONCAT(lpad(MONTH(webgudang.validasi_expedisi_2017.DATE_WH),2,''0''),''/'',year(webgudang.validasi_expedisi_2017.DATE_WH)) as per ,'
////              +' :KODES, :NAMAS, :ALAMAT, SUM(BERAT) AS TOTAL_QTY, ''admin'', NOW(), :FLAG, '
////              +' SUM(BIAYA) AS TOTAL1, SUM(BIAYA) + (1/100 * SUM(BIAYA)) - (2/100* SUM(BIAYA)) AS NETT1, 1/100 AS PPN1, '
////              +' 1/100 * SUM(BIAYA) AS PPN, 2/100 AS PPH1, 2/100 * SUM(BIAYA) AS PPH '
////              +' FROM webgudang.validasi_expedisi_2017 '
////              +' WHERE NOINVOICE = :NOINVOICE');
//  //TANPA PPN & PPH
//    com.SQL.Add(' INSERT INTO beli(NO_BUKTI, TGL, PER, KODES, NAMAS, ALAMAT, TOTAL_QTY, USRNM, TG_SMP, FLAG, TOTAL1) '
//            +' SELECT NOINVOICE, DATE_WH, CONCAT(lpad(MONTH(webgudang.validasi_expedisi_2017.DATE_WH),2,''0''),''/'',year(webgudang.validasi_expedisi_2017.DATE_WH)) as per , :KODES, :NAMAS, :ALAMAT,  '
//            +' SUM(BERAT) AS TOTAL_QTY, ''admin'', NOW(), :FLAG, SUM(BIAYA) AS TOTAL1 '
//            +' FROM webgudang.validasi_expedisi_2017 '
//            +' WHERE NOINVOICE = :NOINVOICE');
//    com.Params.ParamByName('KODES').Value := txtKdSupp.Text;
//    com.Params.ParamByName('NAMAS').Value := txtNamaSupp.Text;
//    com.Params.ParamByName('ALAMAT').Value := txtAlamatSupp.Text;
//    com.Params.ParamByName('FLAG').Value := 'BN';
//    com.Params.ParamByName('NOINVOICE').Value := txtNoInvoice.Text;
//    com.ExecSQL;
//    ShowMessage('BELI');
//
//  //INSERT BELID
//    com.SQL.Clear;
//    com.SQL.Add(' INSERT INTO belid(NO_BUKTI, QTY, HARGA1, TOTAL1, FLAG, PER, KODECAB, BRAND, KET )'
//              +' SELECT NOINVOICE, BERAT, BIAYA/BERAT, BIAYA, :FLAG, CONCAT(lpad(MONTH(webgudang.validasi_expedisi_2017.DATE_WH),2,''0''),''/'',year(webgudang.validasi_expedisi_2017.DATE_WH)) as per,'
//              +' LEFT(TRIM(penerima),3) as kodecab,'
//              +' IF(BRAND=''B'',''BLG'',IF(BRAND=''D'',''GRD'',IF(BRAND=''E'',''ELV'',IF(BRAND=''G'',''GSH'',IF(BRAND=''J'',''JOP'',IF(BRAND=''P'',''BRN'',IF(BRAND=''R'',''RTL'',IF(BRAND=''T'',''TRS'',''GRY'')))))))) AS BRANDX,'
//              +' CONCAT(PENGIRIM,'' --- '',PENERIMA) FROM webgudang.validasi_expedisi_2017   '
//              +' WHERE NOINVOICE = :NOINVOICE');
//    com.Params.ParamByName('NOINVOICE').Value := txtNoInvoice.Text;
//    com.Params.ParamByName('FLAG').Value := 'BN';
//    com.ExecSQL;
//    ShowMessage('BELID');
//
//  //
//    com.SQL.Clear;
//    com.SQL.Add(' UPDATE belid, beli SET belid.ID = beli.NO_ID '
//              +' WHERE beli.NO_BUKTI = belid.NO_BUKTI AND beli.NO_BUKTI = :NO_BUKTI');
//    com.Params.ParamByName('NO_BUKTI').Value := txtNoInvoice.Text;
//    com.ExecSQL;
//    ShowMessage('UPDATE ID');
//
//    com.SQL.Clear;
//    com.SQL.Add(' UPDATE belid, cabang SET belid.NAMACAB = cabang.NAMACAB '
//              +' WHERE belid.KODECAB = cabang.KODECAB AND belid.NO_BUKTI = :NO_BUKTI');
//    com.Params.ParamByName('NO_BUKTI').Value := txtNoInvoice.Text;
//    com.ExecSQL;
//    ShowMessage('UPDATE NAMACAB');
//
//    com.SQL.Clear;
//    com.SQL.Add(' UPDATE belid, cabang SET belid.KD_BHN = cabang.EXPE '
//              +' WHERE belid.KODECAB = cabang.KODECAB AND belid.BRAND = cabang.BRAND  '
//              +' AND belid.NO_BUKTI = :NO_BUKTI');
//    com.Params.ParamByName('NO_BUKTI').Value := txtNoInvoice.Text;
//    com.ExecSQL;
//    ShowMessage('UPDATE KD_BHN');
//
//    com.SQL.Clear;
//    com.SQL.Add(' UPDATE belid, account SET BELID.NA_BHN = account.NAMA WHERE belid.KD_BHN = account.ACNO '
//              +' AND BELID.KD_BHN <> '''' AND belid.NO_BUKTI = :NO_BUKTI');
//    com.Params.ParamByName('NO_BUKTI').Value := txtNoInvoice.Text;
//    com.ExecSQL;
//    ShowMessage('UPDATE ACCOUNT');
//
//  //UPDATE REC
//    com.SQL.Clear;
//    com.SQL.Add(' UPDATE belid, (SELECT belid.NO_ID, belid.NO_BUKTI, IF(@BUKTI=NO_BUKTI, @REC:=@REC+1, @REC:=1) AS REC, '
//            +' @BUKTI:=NO_BUKTI FROM BELID JOIN (SELECT @REC:=0,@BUKTI:='''') AS AA ON 1=1 )AS BB SET belid.REC=BB.REC '
//            +' WHERE belid.NO_ID=BB.NO_ID AND BELID.NO_BUKTI=:NO_BUKTI ');
//    com.Params.ParamByName('NO_BUKTI').Value := txtNoInvoice.Text;
//    com.ExecSQL;
//    ShowMessage('UPDATE REC');
//
//  end;
//

  //-----------------------------------------------------------------------------
  //---------------------------2

  //CEK NO.BUKTI
  com.SQL.Clear;
  com.SQL.Text:= 'SELECT * FROM BELI WHERE NO_BUKTI = :NO_BUKTI ';
  com.Params.ParamByName('NO_BUKTI').Value := txtNoInvoice.Text;
  com.Open;
  if com.RecordCount <> 0 then
  begin
    ShowMessage('No Bukti Sudah Ada');
  end
  else
  begin
    ShowMessage('1');
    com.SQL.Clear;
   // com.SQL.Add(' INSERT INTO beli(NO_BUKTI, TGL, PER, KODES, NAMAS, ALAMAT, TOTAL_QTY, USRNM, TG_SMP, FLAG, TOTAL1, NETT1, PPN1, PPN, PPH1, PPH) '
//    com.SQL.Add(' INSERT INTO kmbst.beli(NO_BUKTI,TGL, KODES, NAMAS, ALAMAT, PER, TOTAL_QTY, FLAG, TOTAL1, BRAND, NOTES)'
//                +' SELECT CONCAT(BRAND, ''-'', :NOINVOICE) ,DATE_WH, :KODES, :NAMAS, :ALAMAT, CONCAT(lpad(MONTH(webgudang.validasi_expedisi_2017.DATE_WH),2,''0''),''/'',year(webgudang.validasi_expedisi_2017.DATE_WH)) as per,SUM(BERAT) AS BERAT,:FLAG, SUM(BIAYA) AS BIAYA, '
//                +' IF(BRAND=''B'',''BLG'',IF(BRAND=''D'',''GRD'',IF(BRAND=''E'',''ELV'',IF(BRAND=''G'',''GSH'',IF(BRAND=''J'',''JOP'',IF(BRAND=''P'',''BRN'',IF(BRAND=''R'',''RTL'',IF(BRAND=''T'',''TRS'',''GRY'')))))))) AS BRANDX, :NOTES '
//                +' FROM webgudang.validasi_expedisi_2017 '
//                +' WHERE DARIAREA =:DARIAREA'
//                +' AND INVOICE_KE=:INVOICE_KE'
//                +' AND DATE_WH= :DATE_WH'
//                +' GROUP BY BRAND');
    com.SQL.Add(' INSERT INTO kmbst.beli(NO_BUKTI,TGL, KODES, NAMAS, ALAMAT, PER, TOTAL_QTY, FLAG, TOTAL1, BRAND, CURR)'
                +' SELECT CONCAT(BRAND, ''-'', :NOINVOICE) ,DATE_WH, :KODES, :NAMAS, :ALAMAT, CONCAT(lpad(MONTH(webgudang.validasi_expedisi_2017.DATE_WH),2,''0''),''/'',year(webgudang.validasi_expedisi_2017.DATE_WH)) as per,SUM(BERAT) AS BERAT,:FLAG, SUM(BIAYA) AS BIAYA, '
                +' IF(BRAND=''B'',''BLG'',IF(BRAND=''D'',''GRD'',IF(BRAND=''E'',''ELV'',IF(BRAND=''G'',''GSH'',IF(BRAND=''J'',''JOP'',IF(BRAND=''P'',''BRN'',IF(BRAND=''R'',''RTL'',IF(BRAND=''T'',''TRS'',''GRY'')))))))) AS BRANDX, :CURR '
                +' FROM webgudang.validasi_expedisi_2017 '
                +' WHERE DARIAREA =:DARIAREA'
                +' AND INVOICE_KE=:INVOICE_KE'
                +' AND DATE_WH= :DATE_WH'
                +' GROUP BY BRAND');
    com.Params.ParamByName('KODES').Value := txtKdSupp.Text;
    com.Params.ParamByName('NAMAS').Value := txtNamaSupp.Text;
    com.Params.ParamByName('ALAMAT').Value := txtAlamatSupp.Text;
    com.Params.ParamByName('FLAG').Value := 'BN';
    com.Params.ParamByName('CURR').Value := 'IDR';
    //com.Params.ParamByName('USRNM').Value := 'admin';
    com.Params.ParamByName('NOINVOICE').Value := txtNoInvoice.Text;
    com.Params.ParamByName('DARIAREA').Value := cbArea.Text;
    com.Params.ParamByName('INVOICE_KE').Value := cbInvoiceKe.Text;
    com.Params.ParamByName('DATE_WH').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);
    com.ExecSQL;
    ShowMessage('BELI');

    //INSERT BELID
    com.SQL.Clear;
//    com.SQL.Add(' INSERT INTO kmbst.belid(NO_BUKTI, QTY, HARGA1, TOTAL1, FLAG, PER, KODECAB, BRAND, KET, NOAWB ) '
//              +' SELECT CONCAT(BRAND,'-',:NOINVOICE), SUM(BERAT) AS QTY, SUM(BIAYA)/SUM(BERAT) AS HARGA1, SUM(BIAYA) AS TOTAL1, :FLAG,  '
//              +' CONCAT(lpad(MONTH(webgudang.validasi_expedisi_2017.DATE_WH),2,''0''),''/'',year(webgudang.validasi_expedisi_2017.DATE_WH)) as per, LEFT(TRIM(penerima),3) as kodecab,  '
//              +' IF(BRAND=''B'',''BLG'',IF(BRAND=''D'',''GRD'',IF(BRAND=''E'',''ELV'',IF(BRAND=''G'',''GSH'',IF(BRAND=''J'',''JOP'',IF(BRAND=''P'',''BRN'',IF(BRAND=''R'',''RTL'',IF(BRAND=''T'',''TRS'',''GRY'')))))))) AS BRANDX,  '
//              +' CONCAT(PENGIRIM,' --- ',PENERIMA, ' --- ',KETERANGAN ) AS KET, NOAWB '
//              +' FROM webgudang.validasi_expedisi_2017 '
//              +' WHERE DARIAREA =:DARIAREA'
//              +' AND INVOICE_KE=:INVOICE_KE'
//              +' AND DATE_WH= :DATE_WH'
//              +' GROUP BY BRAND,LEFT(TRIM(penerima),3),KETERANGAN;');

    com.SQL.Add(' INSERT INTO belid(NO_BUKTI, QTY, HARGA1, TOTAL1, FLAG, PER, KODECAB, BRAND, KET )'
              +' SELECT CONCAT(BRAND,''-'',:NOINVOICE), SUM(BERAT) AS BERAT, SUM(BIAYA)/SUM(BERAT) AS HARGA1, SUM(BIAYA) AS BIAYA, :FLAG, '
              +' CONCAT(lpad(MONTH(webgudang.validasi_expedisi_2017.DATE_WH),2,''0''),''/'',year(webgudang.validasi_expedisi_2017.DATE_WH)) as per, '
              +' LEFT(TRIM(penerima),3) as kodecab,IF(BRAND=''B'',''BLG'',IF(BRAND=''D'',''GRD'',IF(BRAND=''E'',''ELV'',IF(BRAND=''G'',''GSH'',IF(BRAND=''J'',''JOP'',IF(BRAND=''P'',''BRN'',IF(BRAND=''R'',''RTL'',IF(BRAND=''T'',''TRS'',''GRY'')))))))) AS BRANDX,'
              +' PENERIMA FROM webgudang.validasi_expedisi_2017   '
              +' WHERE DARIAREA =:DARIAREA'
              +' AND INVOICE_KE=:INVOICE_KE'
              +' AND DATE_WH= :DATE_WH'
              +' GROUP BY BRAND,PENERIMA,KETERANGAN;');

//    com.SQL.Add(' INSERT INTO belid(NO_BUKTI, QTY, HARGA1, TOTAL1, FLAG, PER, KODECAB,  KET )'
//              +' SELECT CONCAT(BRAND,''-'',:NOINVOICE), SUM(BERAT) AS BERAT, SUM(BIAYA)/SUM(BERAT) AS HARGA1, SUM(BIAYA) AS BIAYA, :FLAG, '
//              +' CONCAT(lpad(MONTH(webgudang.validasi_expedisi_2017.DATE_WH),2,''0''),''/'',year(webgudang.validasi_expedisi_2017.DATE_WH)) as per, '
//              +' LEFT(TRIM(penerima),3) as kodecab,'
//              +' CONCAT(PENGIRIM,'' --- '',PENERIMA, '' --- '',KETERANGAN ) AS KET FROM webgudang.validasi_expedisi_2017   '
//              +' WHERE DARIAREA =:DARIAREA'
//              +' AND INVOICE_KE=:INVOICE_KE'
//              +' AND DATE_WH= :DATE_WH'
//              +' GROUP BY BRAND,LEFT(TRIM(penerima),3),KETERANGAN');


    com.Params.ParamByName('NOINVOICE').Value := txtNoInvoice.Text;
    com.Params.ParamByName('FLAG').Value := 'BN';
    com.Params.ParamByName('DARIAREA').Value := cbArea.Text;
    com.Params.ParamByName('INVOICE_KE').Value := cbInvoiceKe.Text;
    com.Params.ParamByName('DATE_WH').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);
    com.ExecSQL;
    ShowMessage('BELID');

    com.SQL.Clear;
    com.SQL.Add(' UPDATE belid, beli SET belid.ID = beli.NO_ID '
              +' WHERE beli.NO_BUKTI = belid.NO_BUKTI ');
    com.ExecSQL;
    ShowMessage('UPDATE ID');

    com.SQL.Clear;
    com.SQL.Add(' UPDATE belid, cabang SET belid.NAMACAB = cabang.NAMACAB '
              +' WHERE belid.KODECAB = cabang.KODECAB');
    com.ExecSQL;
    ShowMessage('UPDATE NAMACAB');

    com.SQL.Clear;
    com.SQL.Add(' UPDATE belid, cabang SET belid.KD_BHN = cabang.EXPE , belid.NA_BHN = cabang.EXPENM '
              +' WHERE belid.KODECAB = cabang.KODECAB AND belid.BRAND = cabang.BRAND  ');
    com.ExecSQL;
    ShowMessage('UPDATE KD & NM BAHAN');

//    com.SQL.Clear;
//    com.SQL.Add(' UPDATE belid, account SET BELID.NA_BHN = account.NAMA WHERE belid.KD_BHN = account.ACNO '
//              +' AND BELID.KD_BHN <> '''' ');
//    com.ExecSQL;
//    ShowMessage('UPDATE ACCOUNT');

  //UPDATE REC
    com.SQL.Clear;
    com.SQL.Add(' UPDATE belid, (SELECT belid.NO_ID, belid.NO_BUKTI, IF(@BUKTI=NO_BUKTI, @REC:=@REC+1, @REC:=1) AS REC, '
            +' @BUKTI:=NO_BUKTI FROM BELID JOIN (SELECT @REC:=0,@BUKTI:='''') AS AA ON 1=1 )AS BB SET belid.REC=BB.REC '
            +' WHERE belid.NO_ID=BB.NO_ID ');
    com.ExecSQL;
    ShowMessage('UPDATE REC');

    //UPDATE KODE BAHAN YG KOSONG
    com.SQL.Clear;
    com.SQL.Add(' UPDATE kmbst.belid SET KD_BHN = ''.'' WHERE KD_BHN = '''' ');
    com.ExecSQL;
    ShowMessage('UPDATE KODE BAHAN = KOSONG');




  end;



end;

procedure TForm3.cbAreaExit(Sender: TObject);
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

procedure TForm3.FormShow(Sender: TObject);
begin
  Form3.KeyPreview := True;
  eks.Active := True;
  per.Active := True;
  invoiceKe.Active := True;
  area.Active := True;
end;

procedure TForm3.txtKdSuppExit(Sender: TObject);
var b1 : string;
begin
  if txtKdSupp.text <>'' then
  begin
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
end;

procedure TForm3.txtKdSuppKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if (Key = 13) and txtKdSupp.Text <>'' then
//  begin
//    ShowMessage('A');
//  end;

end;

end.
