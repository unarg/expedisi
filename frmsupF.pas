unit frmsupF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, MemDS, DBAccess, MyAccess, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid;

type
  TFrsupF = class(TForm)
    DataSource1: TDataSource;
    sup: TMyQuery;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1kodes: TcxGridDBColumn;
    cxGrid1DBTableView1namas: TcxGridDBColumn;
    cxGrid1DBTableView1alamat: TcxGridDBColumn;
    cxGrid1DBTableView1kota: TcxGridDBColumn;
    MyConnection1: TMyConnection;
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

    function getkode:String;
    function getnama:String;
    function getalamat:String;
    function getkota:String;

  end;

var
  FrsupF: TFrsupF;
  //sup : TZQuery;
implementation
uses frmEkspedisiNov;
{$R *.dfm}

procedure TFrsupF.cxGrid1DBTableView1DblClick(Sender: TObject);
begin

  Self.Close;

end;

procedure TFrsupF.cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=13 then
   begin
      Key:=0;
      Self.Close;
   end;
end;

procedure TFrsupF.FormShow(Sender: TObject);
begin
  sup.Active := true;
end;

function TFrsupF.getkode:String;
begin
  result:=DataSource1.DataSet.FieldByName('kodes').AsString;
end;

function TFrsupF.getnama:String;
begin
  result:=DataSource1.DataSet.FieldByName('namas').AsString;
end;

function TFrsupF.getalamat:String;
begin
  result:=DataSource1.DataSet.FieldByName('alamat').AsString;
end;

function TFrsupF.getkota:String;
begin
  result:=DataSource1.DataSet.FieldByName('kota').AsString;
end;


end.
