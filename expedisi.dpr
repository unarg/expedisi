program expedisi;

uses
  Vcl.Forms,
  frmsupF in 'frmsupF.pas' {FrsupF},
  frmEkspedisiNov in 'frmEkspedisiNov.pas' {FrEkspedisiNov};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrEkspedisiNov, FrEkspedisiNov);
  Application.CreateForm(TFrsupF, FrsupF);
  Application.Run;
end.
