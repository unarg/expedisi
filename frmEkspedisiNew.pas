unit frmEkspedisiNew;

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
  cxDBLookupComboBox, cxMaskEdit, cxCalendar, cxButtons;

type
  TFrEkspedisiNew = class(TForm)
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    txtKdSupp: TcxTextEdit;
    txtNamaSupp: TcxTextEdit;
    txtAlamatSupp: TcxTextEdit;
    Label6: TLabel;
    Label7: TLabel;
    dtTgl: TcxDateEdit;
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
    cbBrand: TcxLookupComboBox;
    Label1: TLabel;
    DataSource2: TDataSource;
    brand: TMyQuery;
    txtNamaBrand: TcxTextEdit;
    btnProsesAllBrandAWB: TcxButton;
    btnProses: TcxButton;
    btnProsesAllBrand: TcxButton;
    btnProsesByBrandAWB: TcxButton;
    Label2: TLabel;
    cbModa: TcxComboBox;
    txtNamaXBrand: TcxTextEdit;
    sup: TMyQuery;
    MyConnection2: TMyConnection;
    DataSource6: TDataSource;
    moda: TMyQuery;
    procedure Edit2KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtketKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MSaveClick(Sender: TObject);
    procedure ceck;
    procedure MExitClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure txtKdSuppExit(Sender: TObject);
    procedure cbAreaExit(Sender: TObject);
    procedure cbBrandExit(Sender: TObject);
    procedure btnProsesAllBrandAWBClick(Sender: TObject);
    procedure Hapus;
    procedure btnProsesByBrandAWBClick(Sender: TObject);
//    function LeftStr(const AText: AnsiString; const ACount: Integer): AnsiString; overload;
//    function LeftStr(const AText: string; const ACount: Integer): string; overload;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrEkspedisiNew: TFrEkspedisiNew;
  cek : integer;

implementation
uses frmekspedisi, frmsupf;
{$R *.dfm}

procedure TFrEkspedisiNew.btnProsesAllBrandAWBClick(Sender: TObject);
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
    if cbBrand.Text = '' then
    begin
      //ShowMessage('1');
      com2.SQL.Clear;
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
    end
    else
    begin
      ShowMessage('2');
      com2.SQL.Clear;
      com2.SQL.Text := ' SELECT CONCAT(lpad(MONTH(EX.DATE_WH),2,''0''),''/'',year(EX.DATE_WH)) as per ,SUM(EX.QTY) AS TOTAL_QTY, SUM(EX.TOTAL) AS TOTAL1 '
                    +' FROM( SELECT * , SUM(BERAT) AS QTY, SUM(BIAYA) AS TOTAL, SUM(BIAYA)/SUM(BERAT) AS HARGA1, '
                    +' IF(BRAND=''B'',''BLG'',IF(BRAND=''D'',''GRD'',IF(BRAND=''E'',''ELV'',IF(BRAND=''G'',''GSH'',IF(BRAND=''J'',''JOP'',IF(BRAND=''P'',''BRN'',IF(BRAND=''R'','
                    +' ''RTL'',IF(BRAND=''T'',''TRS'',''GRY'')))))))) AS BRANDX, LEFT(TRIM(penerima),3) as kodecab '
                    +' FROM webgudang.validasi_expedisi_2017 '
                    +' WHERE DARIAREA = :DARIAREA AND INVOICE_KE = :INVOICE_KE  AND DATE_WH = :DATE_WH AND BLN = :BLN AND THN = :THN AND BRAND = :BRAND '
                    +' GROUP BY BRAND, PENERIMA, NOAWB ) AS EX' ;

      com2.Params.ParamByName('DARIAREA').Value := cbArea.Text;
      com2.Params.ParamByName('INVOICE_KE').Value := cbInvoiceKe.Text;
      com2.Params.ParamByName('DATE_WH').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);
      com2.Params.ParamByName('BLN').Value := cbBln.Text;
      com2.Params.ParamByName('THN').Value := cbThn.Text;
      com2.Params.ParamByName('BRAND').Value := cbBrand.Text;
      com2.Open;
    end;



   // ShowMessage('2');

    if com2.RecordCount > 0 then
    begin
      com.SQL.Clear;
      com.SQL.Add(' INSERT INTO beli(NO_BUKTI, TGL, KODES, NAMAS, ALAMAT, PER, TOTAL_QTY, FLAG, TOTAL1, CURR, PPN1, PPH1) VALUES ('
                +' :NO_BUKTI, :TGL, :KODES, :NAMAS, :ALAMAT, :PER, '
                +' :TOTAL_QTY, :FLAG, :TOTAL1, :CURR, :PPN1, :PPH1 ) ');

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
      com.Params.ParamByName('PPN1').Value := '1.00';
      com.Params.ParamByName('PPH1').Value := '2.00';
      com.ExecSQL;

      if cbBrand.Text = '' then
      begin
        com3.SQL.Text := ' SELECT NOINVOICE, SUM(BERAT) AS QTY,SUM(BIAYA)/SUM(BERAT) AS HARGA1,SUM(BIAYA) AS TOTAL1, '
                    +' CONCAT(lpad(MONTH(DATE_WH),2,''0''),''/'',year(DATE_WH)) as PER, LEFT(TRIM(PENERIMA),3) as kodecab , '
                    +' IF(BRAND=''B'',''BLG'',IF(BRAND=''D'',''GRD'',IF(BRAND=''E'',''ELV'',IF(BRAND=''G'',''GSH'',IF(BRAND=''J'',''JOP'',IF(BRAND=''P'',''BRN'',IF(BRAND=''R'',''RTL'', '
                    +' IF(BRAND=''T'',''TRS'',''GRY'')))))))) AS BRANDX,PENGIRIM, PENERIMA, NOAWB '
                    +' FROM webgudang.validasi_expedisi_2017 '
                    +' WHERE DARIAREA = :DARIAREA AND INVOICE_KE = :INVOICE_KE AND DATE_WH = :DATE_WH AND BLN = :BLN AND THN = :THN '
                    +' GROUP BY BRAND, PENERIMA, NOAWB ';

        com3.Params.ParamByName('DARIAREA').Value := cbArea.Text;
        com3.Params.ParamByName('INVOICE_KE').Value := cbInvoiceKe.Text;
        com3.Params.ParamByName('DATE_WH').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);
        com3.Params.ParamByName('BLN').Value := cbBln.Text;
        com3.Params.ParamByName('THN').Value := cbThn.Text;
        com3.Open;
      // ShowMessage('3');

      end
      else
      begin
        com3.SQL.Text := ' SELECT NOINVOICE, SUM(BERAT) AS QTY,SUM(BIAYA)/SUM(BERAT) AS HARGA1,SUM(BIAYA) AS TOTAL1, '
                    +' CONCAT(lpad(MONTH(DATE_WH),2,''0''),''/'',year(DATE_WH)) as PER, LEFT(TRIM(PENERIMA),3) as kodecab , '
                    +' IF(BRAND=''B'',''BLG'',IF(BRAND=''D'',''GRD'',IF(BRAND=''E'',''ELV'',IF(BRAND=''G'',''GSH'',IF(BRAND=''J'',''JOP'',IF(BRAND=''P'',''BRN'',IF(BRAND=''R'',''RTL'', '
                    +' IF(BRAND=''T'',''TRS'',''GRY'')))))))) AS BRANDX,PENGIRIM, PENERIMA, NOAWB '
                    +' FROM webgudang.validasi_expedisi_2017 '
                    +' WHERE DARIAREA = :DARIAREA AND INVOICE_KE = :INVOICE_KE AND DATE_WH = :DATE_WH AND BLN = :BLN AND THN = :THN AND BRAND = :BRAND '
                    +' GROUP BY BRAND, PENERIMA, NOAWB ';

        com3.Params.ParamByName('DARIAREA').Value := cbArea.Text;
        com3.Params.ParamByName('INVOICE_KE').Value := cbInvoiceKe.Text;
        com3.Params.ParamByName('DATE_WH').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);
        com3.Params.ParamByName('BLN').Value := cbBln.Text;
        com3.Params.ParamByName('THN').Value := cbThn.Text;
        com3.Params.ParamByName('BRAND').Value := cbBrand.Text;
        com3.Open;

      end;


      com3.First;
      while NOT com3.Eof do
      begin
        com.SQL.Clear;
        com.SQL.Add(' INSERT INTO belid(NO_BUKTI, QTY, HARGA1, TOTAL1, FLAG, PER, KODECAB, BRAND, KET, NOAWB, PENGIRIM, PENERIMA) VALUES '
                  +' (:NO_BUKTI, :QTY, :HARGA1, :TOTAL1, :FLAG, :PER, :KODECAB, :BRAND, :KET, :NOAWB, :PENGIRIM, :PENERIMA ) ');

        com.Params.ParamByName('NO_BUKTI').Value := txtNoInvoice.Text;
        com.Params.ParamByName('QTY').Value := com3.FieldByName('QTY').Value;
        com.Params.ParamByName('HARGA1').Value :=com3.FieldByName('HARGA1').Value;
        com.Params.ParamByName('TOTAL1').Value := com3.FieldByName('TOTAL1').Value;
        com.Params.ParamByName('FLAG').Value := 'BN';
        com.Params.ParamByName('PER').Value := com3.FieldByName('PER').Value;
        com.Params.ParamByName('KODECAB').Value := com3.FieldByName('KODECAB').Value;
        com.Params.ParamByName('BRAND').Value := com3.FieldByName('BRANDX').Value;
        com.Params.ParamByName('KET').Value := com3.FieldByName('PENERIMA').Value;
        com.Params.ParamByName('NOAWB').Value := com3.FieldByName('NOAWB').Value;
        com.Params.ParamByName('PENGIRIM').Value := com3.FieldByName('PENGIRIM').Value;
        com.Params.ParamByName('PENERIMA').Value := com3.FieldByName('PENERIMA').Value;
        com.ExecSQL;

        com3.Next;

      end;



      com.SQL.Clear;
      com.SQL.Add(' UPDATE belid, beli SET belid.ID = beli.NO_ID '
              +' WHERE beli.NO_BUKTI = belid.NO_BUKTI AND beli.NO_BUKTI = :NO_BUKTI ');
      com.Params.ParamByName('NO_BUKTI').Value := txtNoInvoice.Text;
      com.ExecSQL;
     // ShowMessage('UPDATE ID');

      com.SQL.Clear;
      com.SQL.Add(' UPDATE belid, cabang SET belid.NAMACAB = cabang.NAMACAB '
              +' WHERE belid.KODECAB = cabang.KODECAB AND BELID.NO_BUKTI = :NO_BUKTI');
      com.Params.ParamByName('NO_BUKTI').Value := txtNoInvoice.Text;
      com.ExecSQL;
     // ShowMessage('UPDATE NAMACAB');

      com.SQL.Clear;
      com.SQL.Add(' UPDATE belid, cabang SET belid.KD_BHN = cabang.EXPE , belid.NA_BHN = cabang.EXPENM '
              +' WHERE belid.KODECAB = cabang.KODECAB AND belid.BRAND = cabang.BRAND AND BELID.NO_BUKTI = :NO_BUKTI  ');
      com.Params.ParamByName('NO_BUKTI').Value := txtNoInvoice.Text;
      com.ExecSQL;
     // ShowMessage('UPDATE KD & NM BAHAN');

//    com.SQL.Clear;
//    com.SQL.Add(' UPDATE belid, account SET BELID.NA_BHN = account.NAMA WHERE belid.KD_BHN = account.ACNO '
//              +' AND BELID.KD_BHN <> '''' ');
//    com.ExecSQL;
//    ShowMessage('UPDATE ACCOUNT');

    //UPDATE REC
      com.SQL.Clear;
      com.SQL.Add(' UPDATE belid, (SELECT belid.NO_ID, belid.NO_BUKTI, IF(@BUKTI=NO_BUKTI, @REC:=@REC+1, @REC:=1) AS REC, '
            +' @BUKTI:=NO_BUKTI FROM BELID JOIN (SELECT @REC:=0,@BUKTI:='''') AS AA ON 1=1 )AS BB SET belid.REC=BB.REC '
            +' WHERE belid.NO_ID=BB.NO_ID AND belid.NO_BUKTI = :NO_BUKTI ');
            com.Params.ParamByName('NO_BUKTI').Value := txtNoInvoice.Text;
      com.ExecSQL;
     // ShowMessage('UPDATE REC');

      //UPDATE KODE BAHAN YG KOSONG
      com.SQL.Clear;
      com.SQL.Add(' UPDATE belid SET KD_BHN = ''.'' WHERE KD_BHN = '''' AND NO_BUKTI = :NO_BUKTI ');
      com.Params.ParamByName('NO_BUKTI').Value := txtNoInvoice.Text;
      com.ExecSQL;
     // ShowMessage('UPDATE KODE BAHAN = KOSONG');

      ShowMessage('Save Data Success');

    end
    else
    begin
      ShowMessage('Data kosong');
    end;


  end;
end;

procedure TFrEkspedisiNew.btnProsesByBrandAWBClick(Sender: TObject);
var
  noinvoice : String;
begin
  cek := 0;
  ceck;
 // ShowMessage(DateToStr(dtTgl.Date));

  if cek = 0 then
  begin
    MessageBox(handle,'Data tidak boleh kosong!!','Peringatan',MB_OK);
  end
  else
  begin
   //CEK NO.BUKTI

    if cbBrand.Text = '' then
    begin
        com2.SQL.Clear;
        com2.SQL.Text := ' SELECT DISTINCT NOINVOICE as NOINVOICE FROM validasi_expedisi_2017 '
                        +' WHERE EXPEDISI = :EXPEDISI AND BLN = :BLN AND  THN = :THN AND INVOICE_KE = :INVOICE_KE '
                        +' AND MODA = :MODA AND DARIAREA = :DARIAREA AND NOINVOICE <> '''' ';
        com2.Params.ParamByName('EXPEDISI').Value := cbEkspedisi.Text;
        com2.Params.ParamByName('BLN').Value := cbBln.Text;
        com2.Params.ParamByName('THN').Value := cbThn.Text;
        com2.Params.ParamByName('INVOICE_KE').Value := cbInvoiceKe.Text;
        com2.Params.ParamByName('MODA').Value := cbModa.Text;
        com2.Params.ParamByName('DARIAREA').Value := cbArea.Text;
        //com2.Params.ParamByName('DATE_WH').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);

        com2.Open;

        if com2.RecordCount > 0 then
        begin
          com2.First;
          while not com2.Eof do
          begin
            com.SQL.Clear;
            com.SQL.Text := ' SELECT * FROM beli WHERE PER1=:PER1 AND INVOICEKE=:INVOICEKE AND DARIAREA=:DARIAREA'
                          +' AND(NO_BUKTI = CONCAT(''BLG-'',:INVOICEKE,''-'',:THN,:BLN,''-'',:NO_BUKTI) '
                          +' OR NO_BUKTI = CONCAT(''BRN-'',:INVOICEKE,''-'',:THN,:BLN,''-'',:NO_BUKTI)'
                          +' OR NO_BUKTI = CONCAT(''ELV-'',:INVOICEKE,''-'',:THN,:BLN,''-'',:NO_BUKTI)'
                          +' OR NO_BUKTI = CONCAT(''GRD-'',:INVOICEKE,''-'',:THN,:BLN,''-'',:NO_BUKTI)'
                          +' OR NO_BUKTI = CONCAT(''GRY-'',:INVOICEKE,''-'',:THN,:BLN,''-'',:NO_BUKTI)'
                          +' OR NO_BUKTI = CONCAT(''GSH-'',:INVOICEKE,''-'',:THN,:BLN,''-'',:NO_BUKTI)'
                          +' OR NO_BUKTI = CONCAT(''JOP-'',:INVOICEKE,''-'',:THN,:BLN,''-'',:NO_BUKTI)'
                          +' OR NO_BUKTI = CONCAT(''RTL-'',:INVOICEKE,''-'',:THN,:BLN,''-'',:NO_BUKTI)'
                          +' OR NO_BUKTI = CONCAT(''TRS-'',:INVOICEKE,''-'',:THN,:BLN,''-'',:NO_BUKTI))';
            //com.Params.ParamByName('NO_BUKTI').Value := txtNoInvoice.Text;
            com.Params.ParamByName('NO_BUKTI').Value := com2.FieldByName('NOINVOICE').AsString;
            com.Params.ParamByName('PER1').Value := cbBln.Text + '/' + cbThn.Text;
            com.Params.ParamByName('INVOICEKE').Value := cbInvoiceKe.Text;
            com.Params.ParamByName('DARIAREA').Value := cbArea.Text;
            com.Params.ParamByName('THN').Value := cbThn.Text;
            com.Params.ParamByName('BLN').Value := cbBln.Text;

            com.Open;
          end;

          if com.RecordCount > 0 then
          begin

          end;


        end;

    end
    else
    begin
      com.SQL.Clear;
      com.SQL.Text := ' SELECT * FROM beli WHERE NO_BUKTI = TRIM(CONCAT(:BRAND,''-'',:NO_BUKTI))';
      com.Params.ParamByName('BRAND').Value := txtNamaXBrand.Text;
      com.Params.ParamByName('NO_BUKTI').Value := txtNoInvoice.Text;
      com.Open;
      ShowMessage('B');
      //ShowMessage (IntToStr(com.RecordCount));
    end;

    if com.RecordCount <> 0 then
    begin
      ShowMessage('No Bukti Sudah Ada');
    end
    else
    begin
      if cbBrand.Text = '' then
      begin
//        com2.SQL.Clear;
//        com2.SQL.Text := ' SELECT CONCAT(lpad(MONTH(:DATE_WH),2,''0''),''/'',year(:DATE_WH)) as per ,SUM(EX.QTY) AS TOTAL_QTY, SUM(EX.TOTAL) AS TOTAL1, '
//                        +' EX.BLN AS BLN, EX.THN AS THN, EX.BRANDX AS BRANDX, EX.NOINVOICE AS NOINVOICE  '
//                        +' FROM( SELECT * , SUM(BERAT) AS QTY, SUM(BIAYA) AS TOTAL, SUM(BIAYA)/SUM(BERAT) AS HARGA1, '
//                        +' IF(BRAND=''B'',''BLG'',IF(BRAND=''D'',''GRD'',IF(BRAND=''E'',''ELV'',IF(BRAND=''G'',''GSH'',IF(BRAND=''J'',''JOP'',IF(BRAND=''P'',''BRN'',IF(BRAND=''R'',  '
//                        +' ''RTL'',IF(BRAND=''T'',''TRS'',''GRY'')))))))) AS BRANDX, LEFT(TRIM(penerima),3) as kodecab '
//                        +' FROM webgudang.validasi_expedisi_2017  '
//                        +' WHERE EXPEDISI = :EXPEDISI AND BLN = :BLN AND THN=:THN AND INVOICE_KE = :INVOICE_KE AND MODA= :MODA AND DARIAREA= :DARIAREA AND DATE_WH = :DATE_WH  '
//                        +' GROUP BY BRAND, PENERIMA, NOAWB ) AS EX '
//                        +' GROUP BY EX.BRANDX' ;
//        com2.Params.ParamByName('EXPEDISI').Value := cbEkspedisi.Text;
//        com2.Params.ParamByName('BLN').Value := cbBln.Text;
//        com2.Params.ParamByName('THN').Value := cbThn.Text;
//        com2.Params.ParamByName('INVOICE_KE').Value := cbInvoiceKe.Text;
//        com2.Params.ParamByName('MODA').Value := cbModa.Text;
//        com2.Params.ParamByName('DARIAREA').Value := cbArea.Text;
//        com2.Params.ParamByName('DATE_WH').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);
//
//        com2.Open;
//        //ShowMessage('1');

        com2.SQL.Clear;
        com2.SQL.Text := ' SELECT CONCAT(lpad(MONTH(:DATE_WH),2,''0''),''/'',year(:DATE_WH)) as per ,SUM(EX.QTY) AS TOTAL_QTY, SUM(EX.TOTAL) AS TOTAL1, '
                        +' EX.BLN AS BLN, EX.THN AS THN, EX.BRANDX AS BRANDX, EX.NOINVOICE AS NOINVOICE  '
                        +' FROM( SELECT * , SUM(BERAT) AS QTY, SUM(BIAYA) AS TOTAL, SUM(BIAYA)/SUM(BERAT) AS HARGA1, '
                        +' IF(BRAND=''B'',''BLG'',IF(BRAND=''D'',''GRD'',IF(BRAND=''E'',''ELV'',IF(BRAND=''G'',''GSH'',IF(BRAND=''J'',''JOP'',IF(BRAND=''P'',''BRN'',IF(BRAND=''R'',  '
                        +' ''RTL'',IF(BRAND=''T'',''TRS'',''GRY'')))))))) AS BRANDX, LEFT(TRIM(penerima),3) as kodecab '
                        +' FROM webgudang.validasi_expedisi_2017  '
                        +' WHERE EXPEDISI = :EXPEDISI AND BLN = :BLN AND THN=:THN AND INVOICE_KE = :INVOICE_KE AND MODA= :MODA AND DARIAREA= :DARIAREA AND NOINVOICE <> ''''   '
                        +' GROUP BY BRAND, PENERIMA, NOAWB ) AS EX '
                        +' GROUP BY EX.BRANDX' ;
        com2.Params.ParamByName('EXPEDISI').Value := cbEkspedisi.Text;
        com2.Params.ParamByName('BLN').Value := cbBln.Text;
        com2.Params.ParamByName('THN').Value := cbThn.Text;
        com2.Params.ParamByName('INVOICE_KE').Value := cbInvoiceKe.Text;
        com2.Params.ParamByName('MODA').Value := cbModa.Text;
        com2.Params.ParamByName('DARIAREA').Value := cbArea.Text;
        com2.Params.ParamByName('DATE_WH').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);

        com2.Open;
        ShowMessage('1');

      end
      else
      begin
//        com2.SQL.Clear;
//        com2.SQL.Text := ' SELECT CONCAT(lpad(MONTH(:DATE_WH),2,''0''),''/'',year(:DATE_WH)) as per ,SUM(EX.QTY) AS TOTAL_QTY, SUM(EX.TOTAL) AS TOTAL1, '
//                        +' EX.BLN AS BLN, EX.THN AS THN, EX.BRANDX AS BRANDX, EX.NOINVOICE AS NOINVOICE '
//                        +' FROM( SELECT * , SUM(BERAT) AS QTY, SUM(BIAYA) AS TOTAL, SUM(BIAYA)/SUM(BERAT) AS HARGA1, '
//                        +' IF(BRAND=''B'',''BLG'',IF(BRAND=''D'',''GRD'',IF(BRAND=''E'',''ELV'',IF(BRAND=''G'',''GSH'',IF(BRAND=''J'',''JOP'',IF(BRAND=''P'',''BRN'',IF(BRAND=''R'',  '
//                        +' ''RTL'',IF(BRAND=''T'',''TRS'',''GRY'')))))))) AS BRANDX, LEFT(TRIM(penerima),3) as kodecab '
//                        +' FROM webgudang.validasi_expedisi_2017  '
//                        +' WHERE EXPEDISI = :EXPEDISI AND BLN = :BLN AND THN=:THN AND INVOICE_KE = :INVOICE_KE AND MODA= :MODA AND DARIAREA= :DARIAREA AND BRAND = :BRAND AND DATE_WH = :DATE_WH '
//                        +' GROUP BY BRAND, PENERIMA, NOAWB ) AS EX '
//                        +' GROUP BY EX.BRANDX' ;
//        com2.Params.ParamByName('EXPEDISI').Value := cbEkspedisi.Text;
//        com2.Params.ParamByName('BLN').Value := cbBln.Text;
//        com2.Params.ParamByName('THN').Value := cbThn.Text;
//        com2.Params.ParamByName('INVOICE_KE').Value := cbInvoiceKe.Text;
//        com2.Params.ParamByName('MODA').Value := cbModa.Text;
//        com2.Params.ParamByName('DARIAREA').Value := cbArea.Text;
//        com2.Params.ParamByName('BRAND').Value := cbBrand.Text;
//        com2.Params.ParamByName('DATE_WH').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);
//
//        com2.Open;
//        //ShowMessage('2');

        com2.SQL.Clear;
        com2.SQL.Text := ' SELECT CONCAT(lpad(MONTH(:DATE_WH),2,''0''),''/'',year(:DATE_WH)) as per ,SUM(EX.QTY) AS TOTAL_QTY, SUM(EX.TOTAL) AS TOTAL1, '
                        +' EX.BLN AS BLN, EX.THN AS THN, EX.BRANDX AS BRANDX, EX.NOINVOICE AS NOINVOICE '
                        +' FROM( SELECT * , SUM(BERAT) AS QTY, SUM(BIAYA) AS TOTAL, SUM(BIAYA)/SUM(BERAT) AS HARGA1, '
                        +' IF(BRAND=''B'',''BLG'',IF(BRAND=''D'',''GRD'',IF(BRAND=''E'',''ELV'',IF(BRAND=''G'',''GSH'',IF(BRAND=''J'',''JOP'',IF(BRAND=''P'',''BRN'',IF(BRAND=''R'',  '
                        +' ''RTL'',IF(BRAND=''T'',''TRS'',''GRY'')))))))) AS BRANDX, LEFT(TRIM(penerima),3) as kodecab '
                        +' FROM webgudang.validasi_expedisi_2017  '
                        +' WHERE EXPEDISI = :EXPEDISI AND BLN = :BLN AND THN=:THN AND INVOICE_KE = :INVOICE_KE AND MODA= :MODA AND DARIAREA= :DARIAREA AND BRAND = :BRAND AND NOINVOICE <> ''''  '
                        +' GROUP BY BRAND, PENERIMA, NOAWB ) AS EX '
                        +' GROUP BY EX.BRANDX' ;
        com2.Params.ParamByName('EXPEDISI').Value := cbEkspedisi.Text;
        com2.Params.ParamByName('BLN').Value := cbBln.Text;
        com2.Params.ParamByName('THN').Value := cbThn.Text;
        com2.Params.ParamByName('INVOICE_KE').Value := cbInvoiceKe.Text;
        com2.Params.ParamByName('MODA').Value := cbModa.Text;
        com2.Params.ParamByName('DARIAREA').Value := cbArea.Text;
        com2.Params.ParamByName('BRAND').Value := cbBrand.Text;
        com2.Params.ParamByName('DATE_WH').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);

        com2.Open;
        ShowMessage('2');

      end;

     // ShowMessage('2');

      if com2.RecordCount > 0 then
      begin
        com2.First;
        while not com2.Eof do
        begin
          com.SQL.Clear;
          com.SQL.Add(' INSERT INTO beli(NO_BUKTI, TGL, KODES, NAMAS, ALAMAT, PER, TOTAL_QTY, FLAG, TOTAL1, CURR, PER1, INVOICEKE, DARIAREA) VALUES ('
                +' :NO_BUKTI, :TGL, :KODES, :NAMAS, :ALAMAT, :PER, '
                +' :TOTAL_QTY, :FLAG, :TOTAL1, :CURR, :PER1, :INVOICEKE, :DARIAREA ) ');

          //com.Params.ParamByName('NO_BUKTI').Value := txtNoInvoice.Text;
          com.Params.ParamByName('NO_BUKTI').Value := com2.FieldByName('BRANDX').Value+ '-'  + cbInvoiceKe.Text + '-' + RightStr(cbThn.Text,2) + cbBln.Text + '-'+ com2.FieldByName('NOINVOICE').Value ;
          //com.Params.ParamByName('NO_BUKTI').Value := com2.FieldByName('BRANDX').Value + '-' + txtNoInvoice.Text ;
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
          com.Params.ParamByName('PER1').Value := com2.FieldByName('BLN').Value + '/' + com2.FieldByName('THN').Value;
          com.Params.ParamByName('INVOICEKE').Value := cbInvoiceKe.Text;
          com.Params.ParamByName('DARIAREA').Value := cbArea.Text;
//          com.Params.ParamByName('PPN1').Value := '1.00';
//          com.Params.ParamByName('PPH1').Value := '2.00';
          com.ExecSQL;
          ShowMessage('BELI');
          Com2.Next;
        end;

        if cbBrand.Text = '' then
        begin
//        com3.SQL.Clear;
//        com3.SQL.Text := ' SELECT NOINVOICE, SUM(BERAT) AS QTY,SUM(BIAYA)/SUM(BERAT) AS HARGA1,SUM(BIAYA) AS TOTAL1, BLN, '
//                        +' CONCAT(lpad(MONTH(:DATE_WH),2,''0''),''/'',year(:DATE_WH)) as PER, LEFT(TRIM(PENERIMA),3) as kodecab , '
//                        +' IF(BRAND=''B'',''BLG'',IF(BRAND=''D'',''GRD'',IF(BRAND=''E'',''ELV'',IF(BRAND=''G'',''GSH'',IF(BRAND=''J'',''JOP'',IF(BRAND=''P'',''BRN'',IF(BRAND=''R'',''RTL'',   '
//                        +' IF(BRAND=''T'',''TRS'',''GRY'')))))))) AS BRANDX, PENGIRIM, PENERIMA, NOAWB  '
//                        +' FROM webgudang.validasi_expedisi_2017 '
//                        +' WHERE EXPEDISI = :EXPEDISI AND BLN = :BLN AND THN=:THN AND INVOICE_KE = :INVOICE_KE AND MODA= :MODA AND DARIAREA= :DARIAREA AND DATE_WH= :DATE_WH '
//                        +' GROUP BY BRAND, PENERIMA, NOAWB ';
//
//        com3.Params.ParamByName('EXPEDISI').Value := cbEkspedisi.Text;
//        com3.Params.ParamByName('BLN').Value := cbBln.Text;
//        com3.Params.ParamByName('THN').Value := cbThn.Text;
//        com3.Params.ParamByName('INVOICE_KE').Value := cbInvoiceKe.Text;
//        com3.Params.ParamByName('MODA').Value := cbModa.Text;
//        com3.Params.ParamByName('DARIAREA').Value := cbArea.Text;
//        com3.Params.ParamByName('DATE_WH').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);
//
//        com3.Open;
//        //ShowMessage('3');

        com3.SQL.Clear;
        com3.SQL.Text := ' SELECT NOINVOICE, SUM(BERAT) AS QTY,SUM(BIAYA)/SUM(BERAT) AS HARGA1,SUM(BIAYA) AS TOTAL1, BLN, '
                        +' CONCAT(lpad(MONTH(:DATE_WH),2,''0''),''/'',year(:DATE_WH)) as PER, LEFT(TRIM(PENERIMA),3) as kodecab , '
                        +' IF(BRAND=''B'',''BLG'',IF(BRAND=''D'',''GRD'',IF(BRAND=''E'',''ELV'',IF(BRAND=''G'',''GSH'',IF(BRAND=''J'',''JOP'',IF(BRAND=''P'',''BRN'',IF(BRAND=''R'',''RTL'',   '
                        +' IF(BRAND=''T'',''TRS'',''GRY'')))))))) AS BRANDX, PENGIRIM, PENERIMA, NOAWB  '
                        +' FROM webgudang.validasi_expedisi_2017 '
                        +' WHERE EXPEDISI = :EXPEDISI AND BLN = :BLN AND THN=:THN AND INVOICE_KE = :INVOICE_KE AND MODA= :MODA AND DARIAREA= :DARIAREA AND NOINVOICE <> '''' '
                        +' GROUP BY BRAND, PENERIMA, NOAWB ';

        com3.Params.ParamByName('EXPEDISI').Value := cbEkspedisi.Text;
        com3.Params.ParamByName('BLN').Value := cbBln.Text;
        com3.Params.ParamByName('THN').Value := cbThn.Text;
        com3.Params.ParamByName('INVOICE_KE').Value := cbInvoiceKe.Text;
        com3.Params.ParamByName('MODA').Value := cbModa.Text;
        com3.Params.ParamByName('DARIAREA').Value := cbArea.Text;
        com3.Params.ParamByName('DATE_WH').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);

        com3.Open;
        ShowMessage('3');

        end
        else
        begin
//        com3.SQL.Clear;
//        com3.SQL.Text := ' SELECT NOINVOICE, SUM(BERAT) AS QTY,SUM(BIAYA)/SUM(BERAT) AS HARGA1,SUM(BIAYA) AS TOTAL1, BLN, '
//                        +' CONCAT(lpad(MONTH(:DATE_WH),2,''0''),''/'',year(:DATE_WH)) as PER, LEFT(TRIM(PENERIMA),3) as kodecab , '
//                        +' IF(BRAND=''B'',''BLG'',IF(BRAND=''D'',''GRD'',IF(BRAND=''E'',''ELV'',IF(BRAND=''G'',''GSH'',IF(BRAND=''J'',''JOP'',IF(BRAND=''P'',''BRN'',IF(BRAND=''R'',''RTL'',   '
//                        +' IF(BRAND=''T'',''TRS'',''GRY'')))))))) AS BRANDX, PENGIRIM, PENERIMA, NOAWB  '
//                        +' FROM webgudang.validasi_expedisi_2017 '
//                        +' WHERE EXPEDISI = :EXPEDISI AND BLN = :BLN AND THN=:THN AND INVOICE_KE = :INVOICE_KE AND MODA= :MODA AND DARIAREA= :DARIAREA AND BRAND = :BRAND AND DATE_WH = :DATE_WH'
//                        +' GROUP BY BRAND, PENERIMA, NOAWB ';
//
//        com3.Params.ParamByName('EXPEDISI').Value := cbEkspedisi.Text;
//        com3.Params.ParamByName('BLN').Value := cbBln.Text;
//        com3.Params.ParamByName('THN').Value := cbThn.Text;
//        com3.Params.ParamByName('INVOICE_KE').Value := cbInvoiceKe.Text;
//        com3.Params.ParamByName('MODA').Value := cbModa.Text;
//        com3.Params.ParamByName('DARIAREA').Value := cbArea.Text;
//        com3.Params.ParamByName('BRAND').Value := cbBrand.Text;
//        com3.Params.ParamByName('DATE_WH').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);
//
//        com3.Open;
//        //ShowMessage('4');

        com3.SQL.Clear;
        com3.SQL.Text := ' SELECT NOINVOICE, SUM(BERAT) AS QTY,SUM(BIAYA)/SUM(BERAT) AS HARGA1,SUM(BIAYA) AS TOTAL1, BLN, '
                        +' CONCAT(lpad(MONTH(:DATE_WH),2,''0''),''/'',year(:DATE_WH)) as PER, LEFT(TRIM(PENERIMA),3) as kodecab , '
                        +' IF(BRAND=''B'',''BLG'',IF(BRAND=''D'',''GRD'',IF(BRAND=''E'',''ELV'',IF(BRAND=''G'',''GSH'',IF(BRAND=''J'',''JOP'',IF(BRAND=''P'',''BRN'',IF(BRAND=''R'',''RTL'',   '
                        +' IF(BRAND=''T'',''TRS'',''GRY'')))))))) AS BRANDX, PENGIRIM, PENERIMA, NOAWB  '
                        +' FROM webgudang.validasi_expedisi_2017 '
                        +' WHERE EXPEDISI = :EXPEDISI AND BLN = :BLN AND THN=:THN AND INVOICE_KE = :INVOICE_KE AND MODA= :MODA AND DARIAREA= :DARIAREA AND BRAND = :BRAND AND NOINVOICE <> '''' '
                        +' GROUP BY BRAND, PENERIMA, NOAWB ';

        com3.Params.ParamByName('EXPEDISI').Value := cbEkspedisi.Text;
        com3.Params.ParamByName('BLN').Value := cbBln.Text;
        com3.Params.ParamByName('THN').Value := cbThn.Text;
        com3.Params.ParamByName('INVOICE_KE').Value := cbInvoiceKe.Text;
        com3.Params.ParamByName('MODA').Value := cbModa.Text;
        com3.Params.ParamByName('DARIAREA').Value := cbArea.Text;
        com3.Params.ParamByName('BRAND').Value := cbBrand.Text;
        com3.Params.ParamByName('DATE_WH').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);

        com3.Open;
        ShowMessage('4');

        end;

      //ShowMessage('3');

        com3.First;
        while NOT com3.Eof do
        begin
        com.SQL.Clear;
        com.SQL.Add(' INSERT INTO belid(NO_BUKTI, QTY, HARGA1, TOTAL1, FLAG, PER, KODECAB, BRAND, KET, NOAWB, PENGIRIM, PENERIMA, PPND, PPHD) VALUES '
                  +' (:NO_BUKTI, :QTY, :HARGA1, :TOTAL1, :FLAG, :PER, :KODECAB, :BRAND, :KET, :NOAWB, :PENGIRIM, :PENERIMA, :PPND, :PPHD ) ');

        //com.Params.ParamByName('NO_BUKTI').Value := txtNoInvoice.Text;
        //com.Params.ParamByName('NO_BUKTI').Value := com3.FieldByName('BRANDX').Value + '-' + com3.FieldByName('BLN').Value + '-' + com3.FieldByName('NOINVOICE').Value;
        //com.Params.ParamByName('NO_BUKTI').Value := com3.FieldByName('BRANDX').Value + '-' + com3.FieldByName('NOINVOICE').Value;
        com.Params.ParamByName('NO_BUKTI').Value := com2.FieldByName('BRANDX').Value+ '-'  + cbInvoiceKe.Text + '-' + RightStr(cbThn.Text,2) + cbBln.Text + '-'+ com2.FieldByName('NOINVOICE').Value ;
            //com.Params.ParamByName('NO_BUKTI').Value := com3.FieldByName('BRANDX').Value + '-' + txtNoInvoice.Text ;
        com.Params.ParamByName('QTY').Value := com3.FieldByName('QTY').Value;
        com.Params.ParamByName('HARGA1').Value :=com3.FieldByName('HARGA1').Value;
        com.Params.ParamByName('TOTAL1').Value := com3.FieldByName('TOTAL1').Value;
        com.Params.ParamByName('FLAG').Value := 'BN';
        com.Params.ParamByName('PER').Value := com3.FieldByName('PER').Value;
        com.Params.ParamByName('KODECAB').Value := com3.FieldByName('KODECAB').Value;
        com.Params.ParamByName('BRAND').Value := com3.FieldByName('BRANDX').Value;
        com.Params.ParamByName('KET').Value := com3.FieldByName('PENERIMA').Value;
        com.Params.ParamByName('NOAWB').Value := com3.FieldByName('NOAWB').Value;
        com.Params.ParamByName('PENGIRIM').Value := com3.FieldByName('PENGIRIM').Value;
        com.Params.ParamByName('PENERIMA').Value := com3.FieldByName('PENERIMA').Value;
        com.Params.ParamByName('PPND').Value := '1.00';
        com.Params.ParamByName('PPHD').Value := '2.00';
        com.ExecSQL;
        ShowMessage('BELID');
         ShowMessage('5');
        com3.Next;

        end;


//      com.SQL.Clear;
//      com.SQL.Add(' UPDATE belid, beli SET belid.ID = beli.NO_ID '
//                +' WHERE beli.NO_BUKTI = belid.NO_BUKTI '
//                +' AND beli.KODES = :KODES AND beli.TGL = :TGL') ;
//      com.Params.ParamByName('KODES').Value := txtKdSupp.Text;
//      com.Params.ParamByName('TGL').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);
//      com.ExecSQL;
//      //ShowMessage('UPDATE ID');
//
//      com.SQL.Clear;
//      com.SQL.Add(' UPDATE BELI, BELID, CABANG SET BELID.NAMACAB = CABANG.NAMACAB'
//                +' WHERE BELI.NO_BUKTI = BELID.NO_BUKTI AND BELID.KODECAB = CABANG.KODECAB'
//                +' AND BELI.TGL = :TGL AND BELI.KODES = :KODES ');
//      com.Params.ParamByName('KODES').Value := txtKdSupp.Text;
//      com.Params.ParamByName('TGL').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);
//      com.ExecSQL;
//      //ShowMessage('UPDATE NAMA CABANG');
//
//      com.SQL.Clear;
//      com.SQL.Add(' UPDATE beli, belid, cabang SET belid.KD_BHN = cabang.EXPE, belid.NA_BHN = cabang.EXPENM '
//              +' WHERE beli.NO_BUKTI = belid.NO_BUKTI AND BELID.KODECAB = CABANG.KODECAB '
//              +' AND belid.BRAND = cabang.BRAND'
//              +' AND BELI.TGL = :TGL AND BELI.KODES = :KODES');
//      com.Params.ParamByName('KODES').Value := txtKdSupp.Text;
//      com.Params.ParamByName('TGL').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);
//      com.ExecSQL;
//      //ShowMessage('UPDATE KD & NM BAHAN');
//
//  //UPDATE REC
//      com.SQL.Clear;
//      com.SQL.Add(' UPDATE beli, belid, (SELECT belid.NO_ID, belid.NO_BUKTI, IF(@BUKTI=NO_BUKTI, @REC:=@REC+1, @REC:=1) AS REC, '
//              +' @BUKTI:=NO_BUKTI FROM BELID JOIN (SELECT @REC:=0,@BUKTI:='''') AS AA ON 1=1 )AS BB SET belid.REC=BB.REC '
//              +' WHERE belid.NO_ID=BB.NO_ID AND BELI.NO_BUKTI = BELID.NO_BUKTI AND BELI.TGL = :TGL AND BELI.KODES = :KODES ');
//      com.Params.ParamByName('KODES').Value := txtKdSupp.Text;
//      com.Params.ParamByName('TGL').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);
//      com.ExecSQL;
//      //ShowMessage('UPDATE REC');
//
//    //UPDATE KODE BAHAN YG KOSONG
//      com.SQL.Clear;
//      com.SQL.Add(' UPDATE beli, belid SET KD_BHN = ''.'' '
//                +' WHERE beli.NO_BUKTI = BELID.NO_BUKTI AND BELI.TGL = :TGL '
//                +' AND BELI.KODES = :KODES AND BELID.KD_BHN = '''' ');
//      com.Params.ParamByName('KODES').Value := txtKdSupp.Text;
//      com.Params.ParamByName('TGL').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);
//      com.ExecSQL;
//      //ShowMessage('UPDATE KODE BAHAN = KOSONG');

      {----------------------- BARU --------------------------}

      com.SQL.Clear;
      com.SQL.Add('  UPDATE belid, beli SET belid.ID = beli.NO_ID '
                  +' WHERE beli.NO_BUKTI = belid.NO_BUKTI '
                  +' AND beli.KODES = :KODES AND beli.TGL = :TGL '
                  +' AND beli.PER1 = :PER1 AND beli.INVOICEKE = :INVOICEKE '
                  +' AND beli.DARIAREA = :DARIAREA ') ;
      com.Params.ParamByName('KODES').Value := txtKdSupp.Text;
      com.Params.ParamByName('TGL').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);
      com.Params.ParamByName('PER1').Value := cbBln.Text + '/' + cbThn.Text;
      com.Params.ParamByName('DARIAREA').Value := cbArea.Text;
      com.Params.ParamByName('INVOICEKE').Value := cbInvoiceKe.Text;
      com.ExecSQL;
      ShowMessage('UPDATE ID');

      com.SQL.Clear;
      com.SQL.Add(' UPDATE BELI, BELID, CABANG SET BELID.NAMACAB = CABANG.NAMACAB '
                +' WHERE BELI.NO_BUKTI = BELID.NO_BUKTI AND BELID.KODECAB = CABANG.KODECAB '
                +' AND beli.KODES = :KODES AND beli.TGL = :TGL '
                +' AND beli.PER1 = :PER1 AND beli.INVOICEKE = :INVOICEKE '
                +' AND beli.DARIAREA = :DARIAREA ');
      com.Params.ParamByName('KODES').Value := txtKdSupp.Text;
      com.Params.ParamByName('TGL').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);
      com.Params.ParamByName('PER1').Value := cbBln.Text + '/' + cbThn.Text;
      com.Params.ParamByName('DARIAREA').Value := cbArea.Text;
      com.Params.ParamByName('INVOICEKE').Value := cbInvoiceKe.Text;
      com.ExecSQL;
      ShowMessage('UPDATE NAMA CABANG');

      com.SQL.Clear;
      com.SQL.Add(' UPDATE beli, belid, cabang SET belid.KD_BHN = cabang.EXPE, belid.NA_BHN = cabang.EXPENM '
                +' WHERE beli.NO_BUKTI = belid.NO_BUKTI AND BELID.KODECAB = CABANG.KODECAB AND belid.BRAND = cabang.BRAND '
                +' AND beli.KODES = :KODES AND beli.TGL = :TGL '
                +' AND beli.PER1 = :PER1 AND beli.INVOICEKE = :INVOICEKE '
                +' AND beli.DARIAREA = :DARIAREA ');
      com.Params.ParamByName('KODES').Value := txtKdSupp.Text;
      com.Params.ParamByName('TGL').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);
      com.Params.ParamByName('PER1').Value := cbBln.Text + '/' + cbThn.Text;
      com.Params.ParamByName('DARIAREA').Value := cbArea.Text;
      com.Params.ParamByName('INVOICEKE').Value := cbInvoiceKe.Text;
      com.ExecSQL;
      ShowMessage('UPDATE KD & NM BAHAN');

  //UPDATE REC
      com.SQL.Clear;
      com.SQL.Add(' UPDATE beli, belid, (SELECT belid.NO_ID, belid.NO_BUKTI, IF(@BUKTI=NO_BUKTI, @REC:=@REC+1, @REC:=1) AS REC, '
                +' @BUKTI:=NO_BUKTI FROM BELID JOIN (SELECT @REC:=0,@BUKTI:='''') AS AA ON 1=1 )AS BB SET belid.REC=BB.REC '
                +' WHERE belid.NO_ID=BB.NO_ID AND BELI.NO_BUKTI = BELID.NO_BUKTI '
                +' AND beli.KODES = :KODES AND beli.TGL = :TGL '
                +' AND beli.PER1 = :PER1 AND beli.INVOICEKE = :INVOICEKE '
                +' AND beli.DARIAREA = :DARIAREA ');
      com.Params.ParamByName('KODES').Value := txtKdSupp.Text;
      com.Params.ParamByName('TGL').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);
      com.Params.ParamByName('PER1').Value := cbBln.Text + '/' + cbThn.Text;
      com.Params.ParamByName('DARIAREA').Value := cbArea.Text;
      com.Params.ParamByName('INVOICEKE').Value := cbInvoiceKe.Text;
      com.ExecSQL;
      ShowMessage('UPDATE REC');

    //UPDATE KODE BAHAN YG KOSONG
      com.SQL.Clear;
      com.SQL.Add(' UPDATE beli, belid SET KD_BHN = ''.'' '
                +' WHERE beli.NO_BUKTI = BELID.NO_BUKTI '
                +' AND BELID.KD_BHN = '''' AND beli.KODES = :KODES AND beli.TGL = :TGL '
                +' AND beli.PER1 = :PER1 AND beli.INVOICEKE = :INVOICEKE '
                +' AND beli.DARIAREA = :DARIAREA ');
      com.Params.ParamByName('KODES').Value := txtKdSupp.Text;
      com.Params.ParamByName('TGL').Value := FormatDateTime('yyyy-mm-dd',dtTgl.Date);
      com.Params.ParamByName('PER1').Value := cbBln.Text + '/' + cbThn.Text;
      com.Params.ParamByName('DARIAREA').Value := cbArea.Text;
      com.Params.ParamByName('INVOICEKE').Value := cbInvoiceKe.Text;
      com.ExecSQL;
      ShowMessage('UPDATE KODE BAHAN = KOSONG');




      ShowMessage('Save Data Success');
      Hapus;

      end
      else
      begin
      ShowMessage('Data kosong');
      end;
    end;
  end;
end;

procedure TFrEkspedisiNew.cbAreaExit(Sender: TObject);
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

procedure TFrEkspedisiNew.ceck;
var
 month,year,date:Word;
 monthx, yearx, monthz, yearz, tgl :String;
begin
  //tgl = DateToStr(dtTgl.Date);

  if txtKdSupp.Text = '' then
  begin
    txtKdSupp.SetFocus;
  end
  else if DateToStr(dtTgl.Date) = '00/00/0000' then
  begin
    dtTgl.SetFocus;
  end
  else if cbEkspedisi.Text = '' then
  begin
    cbEkspedisi.SetFocus;
  end
  else if cbInvoiceKe.Text = '' then
  begin
    cbInvoiceKe.SetFocus;
  end
  else if cbBln.Text = ''  then
  begin
    cbBln.SetFocus;
  end
  else if cbThn.Text = '' then
  begin
    cbThn.SetFocus;
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

procedure TFrEkspedisiNew.Hapus;
begin
 // dtTgl.date:=00/00/0000;

  cbBrand.Text := '';
  txtNamaBrand.Text := '';
  txtNoInvoice.Text := '';

  //dtTgl.Date := '';
 // cbEkspedisi.Text := '';
  cbInvoiceKe.Text := '';
 // cbBln.Text := '';
 //cbThn.Text := '';
 // cbArea.Text := '';
 // txtNamaArea.Text := '';
 // cbModa.Text := '';
end;


procedure TFrEkspedisiNew.cbBrandExit(Sender: TObject);
begin
  brand.First;
  while not brand.eof do
  begin
    if brand.FieldByName('KODE').Value = cbBrand.Text then
    begin
      txtNamaBrand.Text := brand.FieldByName('NAMA').Value;
      txtNamaXBrand.Text := brand.FieldByName('NAMAX').Value;
    end;
    brand.Next;
  end;
end;

procedure TFrEkspedisiNew.MSaveClick(Sender: TObject);
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


procedure TFrEkspedisiNew.txtKdSuppExit(Sender: TObject);
var b1 : string;
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

procedure TFrEkspedisiNew.txtketKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = 13 then
  begin
    //PageControl1.TabIndex := 1;
  end;
end;

procedure TFrEkspedisiNew.Edit2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = 13 then
  begin
   //PageControl1.TabIndex := 0;
  end;
end;

procedure TFrEkspedisiNew.MExitClick(Sender: TObject);
begin
  close;
end;

procedure TFrEkspedisiNew.FormCreate(Sender: TObject);
begin
 frEkspedisiNew.ClientHeight:=376;
end;

procedure TFrEkspedisiNew.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if key = VK_RETURN then
  begin
    frEkspedisiNew.perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TFrEkspedisiNew.FormShow(Sender: TObject);
begin
  eks.Active := True;
  per.Active := True;
  invoiceKe.Active := True;
  area.Active := True;
  brand.Active := True;

  txtKdSupp.SetFocus;
end;

end.
