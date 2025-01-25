unit FormMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  IdBaseComponent, IdComponent, IdCustomTCPServer, IdCustomHTTPServer, IdHTTPServer, Vcl.Samples.Spin, IdContext, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Buttons,
  Data.DB, Datasnap.DBClient, ActiveX, Midas, MidasLib, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls, Vcl.Menus;

type
  TFrmMain = class(TForm)
    WebServer              : TIdHTTPServer;
    SBar                   : TStatusBar;
    LblServer              : TLabel;
    IptServer              : TLabel;
    LblPort                : TLabel;
    LblIP                  : TLabel;
    LblMethod              : TLabel;
    LblURI                 : TLabel;
    EdPort                 : TSpinEdit;
    SbStartStop            : TSpeedButton;
    GpHeader               : TGridPanel;
    GpContent              : TGridPanel;
    GpConnDetails          : TGridPanel;
    GpConnInfo             : TGridPanel;
    GpData                 : TGridPanel;
    GridConn               : TDBGrid;
    GbConn                 : TGroupBox;
    GbConnDetails          : TGroupBox;
    GbHeaders              : TGroupBox;
    GbQS                   : TGroupBox;
    GbForm                 : TGroupBox;
    GbPost                 : TGroupBox;
    GbResponse             : TGroupBox;
    DBEdIP                 : TDBEdit;
    DBEdMethod             : TDBEdit;
    DBEdURI                : TDBEdit;
    DBMemoHeaders          : TDBMemo;
    DBMemoQS               : TDBMemo;
    DBMemoForm             : TDBMemo;
    DBMemoPOST             : TDBMemo;
    Ds                     : TDataSource;
    Cds                    : TClientDataSet;
    CdsTimestamp           : TStringField;
    CdsRemoteIP            : TStringField;
    CdsMethod              : TStringField;
    CdsURI                 : TStringField;
    CdsHeaders             : TWideMemoField;
    CdsQS                  : TWideMemoField;
    CdsForm                : TWideMemoField;
    CdsPost                : TWideMemoField;
    CdsResponse            : TWideMemoField;
    CdsContentType         : TIntegerField;
    MemoRes                : TMemo;
    CbResType              : TComboBox;
    PmConnActions          : TPopupMenu;
    PmActionKeepCurrRecord : TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure WebServerListenException(AThread: TIdListenerThread; AException: Exception);
    procedure WebServerAfterBind(Sender: TObject);
    procedure WebServerCommandOther(AContext: TIdContext; ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
    procedure WebServerParseAuthentication(AContext: TIdContext; const AAuthType, AAuthData: string; var VUsername, VPassword: string; var VHandled: Boolean);
    procedure EdPortChange(Sender: TObject);
    procedure SbStartStopClick(Sender: TObject);
    procedure CdsAfterScroll(DataSet: TDataSet);
    procedure PmConnActionsPopup(Sender: TObject);
    procedure PmActionKeepCurrRecordClick(Sender: TObject);
  private
    procedure SetServerStatus(const AStatus: String; const AColor: TColor = clWindowText; const AHint: String = '');
    function  ReadStringFromStream(Stream: TStream): string;
  end;

var
  FrmMain: TFrmMain;

implementation

uses
  System.StrUtils;

{$R *.dfm}

procedure TFrmMain.CdsAfterScroll(DataSet: TDataSet);
begin
  if DataSet.RecordCount = 0 then Exit;

  MemoRes.Lines.Text  := DataSet.Fields[8].AsString;
  CbResType.Items.BeginUpdate;
  CbResType.ItemIndex := IfThen((DataSet.Fields[9].AsInteger in [0,1,2]),DataSet.Fields[9].AsString,'0').ToInteger();
  CbResType.Items.EndUpdate;
end;

procedure TFrmMain.EdPortChange(Sender: TObject);
begin
  WebServer.DefaultPort := EdPort.Value;
end;

procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if WebServer.Active then WebServer.Active := False;

  Action := caFree;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  WebServer.DefaultPort := EdPort.Value;
  SBar.SimpleText       := 'Iniciado em: ' + DateTimeToStr(Now);

  Cds.CreateDataSet; // Tem que ser feito um EmptyDataSet; obrigatóriamente!
end;

procedure TFrmMain.PmActionKeepCurrRecordClick(Sender: TObject);
begin
  PmActionKeepCurrRecord.Default := not PmActionKeepCurrRecord.Default;
end;

procedure TFrmMain.PmConnActionsPopup(Sender: TObject);
begin
  if Cds.IsEmpty then Abort;  
end;

function TFrmMain.ReadStringFromStream(Stream: TStream): string;
var
  StreamReader: TStreamReader;
begin
  if Assigned(Stream) then begin  
    StreamReader := TStreamReader.Create(Stream, TEncoding.ANSI);

    try
      Result := StreamReader.ReadToEnd;
    finally
      FreeAndNil(StreamReader);
    end;
  end else Result := EmptyStr;
end;

procedure TFrmMain.SbStartStopClick(Sender: TObject);
begin
  Cds.EmptyDataSet;

  WebServer.Active    := not WebServer.Active;
  SbStartStop.Caption := IfThen(WebServer.Active,'Parar','Iniciar');

  if not WebServer.Active then SetServerStatus('PARADO',clBlue);
end;

procedure TFrmMain.SetServerStatus(const AStatus: String; const AColor: TColor; const AHint: String);
begin
  IptServer.Caption    := AStatus.Trim;
  IptServer.Font.Color := AColor;

  IptServer.Hint       := AHint.Trim;
  IptServer.ShowHint   := not AHint.IsEmpty;

  EdPort.Enabled       := (AColor <> clGreen);
  SbStartStop.Caption  := IfThen(EdPort.Enabled,'Iniciar','Parar');
end;

procedure TFrmMain.WebServerAfterBind(Sender: TObject);
begin
  SetServerStatus('INICIADO',clGreen);
end;

procedure TFrmMain.WebServerCommandOther(AContext: TIdContext; ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
var
  LBookmark: TBookmark;
begin
  try
    if PmActionKeepCurrRecord.Default then LBookmark := Cds.Bookmark else LBookmark := nil;

    Cds.AfterScroll         := nil;
    Cds.DisableControls;

    Cds.First;
    Cds.Insert;

    Cds.Fields[0].AsString  := DateTimeToStr(Now);
    Cds.Fields[1].AsString  := ARequestInfo.RemoteIP.Trim;
    Cds.Fields[2].AsString  := ARequestInfo.Command.Trim;
    Cds.Fields[3].AsString  := ARequestInfo.URI;
    Cds.Fields[4].AsString  := ARequestInfo.RawHeaders.Text;
    Cds.Fields[5].AsString  := ARequestInfo.QueryParams.Trim;
    Cds.Fields[6].AsString  := ARequestInfo.FormParams;
    Cds.Fields[7].AsString  := ReadStringFromStream(ARequestInfo.PostStream);
    Cds.Fields[8].AsString  := MemoRes.Lines.Text.Trim;
    Cds.Fields[9].AsInteger := CbResType.ItemIndex;

    Cds.Post;

    if PmActionKeepCurrRecord.Default then if Cds.BookmarkValid(LBookmark) then Cds.Bookmark := LBookmark;

    Cds.AfterScroll         := CdsAfterScroll;
    Cds.EnableControls;
  except on E:Exception do
    begin
      Application.MessageBox(PWideChar('Falha ao registrar os dados: ' + E.Message),PWideChar(Self.Caption),MB_ICONERROR+MB_OK);
      Cds.Cancel;
    end;
  end;

  AResponseInfo.ContentType := IfThen(CbResType.ItemIndex = 1,'application/json',IfThen(CbResType.ItemIndex = 2,'application/xml','text/html'));
  AResponseInfo.ResponseNo  := 200;
  AResponseInfo.ContentText := IfThen(MemoRes.Lines.Text.Trim.IsEmpty,'OK',MemoRes.Lines.Text.Trim);
  AResponseInfo.WriteContent;
end;

procedure TFrmMain.WebServerListenException(AThread: TIdListenerThread; AException: Exception);
begin
  SetServerStatus('FALHA',clRed,AException.Message);
end;

procedure TFrmMain.WebServerParseAuthentication(AContext: TIdContext; const AAuthType, AAuthData: string; var VUsername, VPassword: string; var VHandled: Boolean);
begin
  VHandled := True; // Evita erros caso use outros modos de autenticação que não seja AuthBasic.
end;

end.
