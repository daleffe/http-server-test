object FrmMain: TFrmMain
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'HTTP Server Test'
  ClientHeight = 553
  ClientWidth = 1261
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GpHeader: TGridPanel
    Left = 0
    Top = 0
    Width = 1261
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    ColumnCollection = <
      item
        Value = 22.222222222222220000
      end
      item
        Value = 22.222222222222220000
      end
      item
        Value = 22.222222222222220000
      end
      item
        Value = 22.222222222222220000
      end
      item
        Value = 11.111111111111110000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = LblServer
        Row = 0
      end
      item
        Column = 1
        Control = IptServer
        Row = 0
      end
      item
        Column = 2
        Control = LblPort
        Row = 0
      end
      item
        Column = 3
        Control = EdPort
        Row = 0
      end
      item
        Column = 4
        Control = SbStartStop
        Row = 0
      end>
    ExpandStyle = emFixedSize
    RowCollection = <
      item
        Value = 100.000000000000000000
      end>
    ShowCaption = False
    TabOrder = 0
    ExplicitWidth = 973
    DesignSize = (
      1261
      41)
    object LblServer: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 274
      Height = 38
      Align = alClient
      Alignment = taCenter
      Caption = 'Servidor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
      ExplicitWidth = 43
      ExplicitHeight = 13
    end
    object IptServer: TLabel
      AlignWithMargins = True
      Left = 283
      Top = 3
      Width = 274
      Height = 38
      Align = alClient
      Alignment = taCenter
      Caption = 'DESCONHECIDO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
      ExplicitLeft = 197
      ExplicitWidth = 85
      ExplicitHeight = 13
    end
    object LblPort: TLabel
      AlignWithMargins = True
      Left = 563
      Top = 3
      Width = 274
      Height = 38
      Align = alClient
      Alignment = taCenter
      Caption = 'Porta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
      ExplicitLeft = 391
      ExplicitWidth = 28
      ExplicitHeight = 13
    end
    object EdPort: TSpinEdit
      AlignWithMargins = True
      Left = 919
      Top = 9
      Width = 121
      Height = 22
      Anchors = []
      MaxLength = 5
      MaxValue = 65535
      MinValue = 1
      TabOrder = 0
      Value = 8888
      ExplicitLeft = 618
    end
    object SbStartStop: TSpeedButton
      AlignWithMargins = True
      Left = 1123
      Top = 3
      Width = 135
      Height = 35
      Align = alClient
      Caption = 'Iniciar'
      OnClick = SbStartStopClick
      ExplicitLeft = 528
      ExplicitTop = 24
      ExplicitWidth = 23
      ExplicitHeight = 22
    end
  end
  object SBar: TStatusBar
    Left = 0
    Top = 534
    Width = 1261
    Height = 19
    Panels = <>
    SimplePanel = True
    ExplicitTop = 410
    ExplicitWidth = 973
  end
  object GpContent: TGridPanel
    AlignWithMargins = True
    Left = 3
    Top = 44
    Width = 1255
    Height = 487
    Align = alClient
    BevelOuter = bvNone
    ColumnCollection = <
      item
        Value = 55.555555555555560000
      end
      item
        Value = 44.444444444444440000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = GbConn
        Row = 0
      end
      item
        Column = 1
        Control = GpConnInfo
        Row = 0
      end>
    ExpandStyle = emFixedSize
    RowCollection = <
      item
        Value = 100.000000000000000000
      end>
    ShowCaption = False
    TabOrder = 2
    ExplicitWidth = 967
    ExplicitHeight = 363
    object GbConn: TGroupBox
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 691
      Height = 481
      Align = alClient
      Caption = 'Conex'#245'es'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      ExplicitWidth = 531
      ExplicitHeight = 357
      object GridConn: TDBGrid
        AlignWithMargins = True
        Left = 5
        Top = 18
        Width = 681
        Height = 345
        Align = alTop
        DataSource = Ds
        DrawingStyle = gdsGradient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection]
        ParentFont = False
        PopupMenu = PmConnActions
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'Timestamp'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Segoe UI'
            Title.Font.Style = []
            Width = 115
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RemoteIP'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Segoe UI'
            Title.Font.Style = []
            Width = 113
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Method'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Segoe UI'
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'URI'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Segoe UI'
            Title.Font.Style = []
            Width = 366
            Visible = True
          end>
      end
      object GbConnDetails: TGroupBox
        AlignWithMargins = True
        Left = 5
        Top = 369
        Width = 681
        Height = 107
        Align = alClient
        Caption = 'Detalhes'
        TabOrder = 1
        ExplicitTop = 246
        ExplicitHeight = 230
        object GpConnDetails: TGridPanel
          Left = 2
          Top = 15
          Width = 677
          Height = 90
          Align = alClient
          BevelOuter = bvNone
          ColumnCollection = <
            item
              Value = 12.507108797410210000
            end
            item
              Value = 87.492891202589790000
            end>
          ControlCollection = <
            item
              Column = 0
              Control = LblIP
              Row = 0
            end
            item
              Column = 1
              Control = DBEdIP
              Row = 0
            end
            item
              Column = 0
              Control = LblMethod
              Row = 1
            end
            item
              Column = 1
              Control = DBEdMethod
              Row = 1
            end
            item
              Column = 0
              Control = LblURI
              Row = 2
            end
            item
              Column = 1
              Control = DBEdURI
              Row = 2
            end>
          ExpandStyle = emFixedSize
          RowCollection = <
            item
              Value = 33.333333333333340000
            end
            item
              Value = 33.333333333333340000
            end
            item
              Value = 33.333333333333340000
            end>
          TabOrder = 0
          ExplicitWidth = 517
          ExplicitHeight = 89
          object LblIP: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 78
            Height = 27
            Align = alClient
            Alignment = taCenter
            Caption = 'IP'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
            WordWrap = True
            ExplicitWidth = 9
            ExplicitHeight = 13
          end
          object DBEdIP: TDBEdit
            AlignWithMargins = True
            Left = 87
            Top = 3
            Width = 587
            Height = 24
            Align = alClient
            DataField = 'RemoteIP'
            DataSource = Ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            ExplicitLeft = 67
            ExplicitWidth = 447
            ExplicitHeight = 21
          end
          object LblMethod: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 33
            Width = 78
            Height = 27
            Align = alClient
            Alignment = taCenter
            Caption = 'Tipo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
            WordWrap = True
            ExplicitTop = 32
            ExplicitWidth = 23
            ExplicitHeight = 13
          end
          object DBEdMethod: TDBEdit
            AlignWithMargins = True
            Left = 87
            Top = 33
            Width = 587
            Height = 24
            Align = alClient
            DataField = 'Method'
            DataSource = Ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            ExplicitLeft = 67
            ExplicitTop = 32
            ExplicitWidth = 447
            ExplicitHeight = 21
          end
          object LblURI: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 63
            Width = 78
            Height = 27
            Align = alClient
            Alignment = taCenter
            Caption = 'URI'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
            WordWrap = True
            ExplicitTop = 61
            ExplicitWidth = 18
            ExplicitHeight = 13
          end
          object DBEdURI: TDBEdit
            AlignWithMargins = True
            Left = 87
            Top = 63
            Width = 587
            Height = 24
            Align = alClient
            DataField = 'URI'
            DataSource = Ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
            ExplicitLeft = 67
            ExplicitTop = 61
            ExplicitWidth = 447
            ExplicitHeight = 21
          end
        end
      end
    end
    object GpConnInfo: TGridPanel
      Left = 697
      Top = 0
      Width = 558
      Height = 487
      Align = alClient
      BevelOuter = bvNone
      ColumnCollection = <
        item
          Value = 100.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 0
          Control = GbHeaders
          Row = 0
        end
        item
          Column = 0
          Control = GpData
          Row = 1
        end
        item
          Column = 0
          Control = GbResponse
          Row = 2
        end>
      RowCollection = <
        item
          Value = 33.333333333333340000
        end
        item
          Value = 33.333333333333340000
        end
        item
          Value = 33.333333333333340000
        end>
      ShowCaption = False
      TabOrder = 1
      ExplicitLeft = 537
      ExplicitWidth = 430
      ExplicitHeight = 363
      object GbHeaders: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 552
        Height = 156
        Align = alClient
        Caption = 'Cabe'#231'alho da Requisi'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        ExplicitWidth = 424
        ExplicitHeight = 115
        object DBMemoHeaders: TDBMemo
          AlignWithMargins = True
          Left = 5
          Top = 18
          Width = 542
          Height = 133
          Align = alClient
          DataField = 'Headers'
          DataSource = Ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
          ExplicitWidth = 414
          ExplicitHeight = 92
        end
      end
      object GpData: TGridPanel
        AlignWithMargins = True
        Left = 3
        Top = 165
        Width = 552
        Height = 156
        Align = alClient
        BevelOuter = bvNone
        ColumnCollection = <
          item
            Value = 33.333333333333340000
          end
          item
            Value = 33.333333333333340000
          end
          item
            Value = 33.333333333333340000
          end>
        ControlCollection = <
          item
            Column = 0
            Control = GbQS
            Row = 0
          end
          item
            Column = 1
            Control = GbForm
            Row = 0
          end
          item
            Column = 2
            Control = GbPost
            Row = 0
          end>
        ExpandStyle = emFixedSize
        RowCollection = <
          item
            Value = 100.000000000000000000
          end>
        ShowCaption = False
        TabOrder = 1
        ExplicitTop = 124
        ExplicitWidth = 424
        ExplicitHeight = 115
        object GbQS: TGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 178
          Height = 150
          Align = alClient
          Caption = 'QueryString'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          ExplicitWidth = 135
          ExplicitHeight = 109
          object DBMemoQS: TDBMemo
            AlignWithMargins = True
            Left = 5
            Top = 18
            Width = 168
            Height = 127
            Align = alClient
            DataField = 'QS'
            DataSource = Ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            ExplicitWidth = 125
            ExplicitHeight = 86
          end
        end
        object GbForm: TGroupBox
          AlignWithMargins = True
          Left = 187
          Top = 3
          Width = 178
          Height = 150
          Align = alClient
          Caption = 'Form'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          ExplicitLeft = 144
          ExplicitWidth = 135
          ExplicitHeight = 109
          object DBMemoForm: TDBMemo
            AlignWithMargins = True
            Left = 5
            Top = 18
            Width = 168
            Height = 127
            Align = alClient
            DataField = 'Form'
            DataSource = Ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            ExplicitWidth = 125
            ExplicitHeight = 86
          end
        end
        object GbPost: TGroupBox
          AlignWithMargins = True
          Left = 371
          Top = 3
          Width = 178
          Height = 150
          Align = alClient
          Caption = 'POST'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          ExplicitLeft = 285
          ExplicitWidth = 136
          ExplicitHeight = 109
          object DBMemoPOST: TDBMemo
            AlignWithMargins = True
            Left = 5
            Top = 18
            Width = 168
            Height = 127
            Align = alClient
            DataField = 'Post'
            DataSource = Ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            ExplicitWidth = 126
            ExplicitHeight = 86
          end
        end
      end
      object GbResponse: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 327
        Width = 552
        Height = 157
        Align = alClient
        Caption = 'Resposta ao Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        ExplicitTop = 245
        ExplicitWidth = 424
        ExplicitHeight = 115
        object MemoRes: TMemo
          AlignWithMargins = True
          Left = 5
          Top = 45
          Width = 542
          Height = 107
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsItalic]
          Lines.Strings = (
            '<h1>OK</h1>')
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 0
          ExplicitWidth = 414
          ExplicitHeight = 65
        end
        object CbResType: TComboBox
          AlignWithMargins = True
          Left = 5
          Top = 18
          Width = 542
          Height = 21
          Align = alTop
          Style = csDropDownList
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemIndex = 0
          ParentFont = False
          TabOrder = 1
          Text = 'HTML'
          Items.Strings = (
            'HTML'
            'JSON'
            'XML')
          ExplicitWidth = 414
        end
      end
    end
  end
  object WebServer: TIdHTTPServer
    Bindings = <>
    OnAfterBind = WebServerAfterBind
    OnListenException = WebServerListenException
    OnCommandOther = WebServerCommandOther
    OnParseAuthentication = WebServerParseAuthentication
    OnCommandGet = WebServerCommandOther
    Left = 680
    Top = 96
  end
  object Cds: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CdsAfterScroll
    Left = 633
    Top = 95
    object CdsTimestamp: TStringField
      DisplayLabel = 'Data / Hora'
      FieldName = 'Timestamp'
      Size = 50
    end
    object CdsRemoteIP: TStringField
      DisplayLabel = 'IP'
      FieldName = 'RemoteIP'
      Size = 50
    end
    object CdsMethod: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'Method'
      Size = 8
    end
    object CdsURI: TStringField
      FieldName = 'URI'
      Size = 80
    end
    object CdsHeaders: TWideMemoField
      FieldName = 'Headers'
      BlobType = ftWideMemo
    end
    object CdsQS: TWideMemoField
      FieldName = 'QS'
      BlobType = ftWideMemo
    end
    object CdsForm: TWideMemoField
      FieldName = 'Form'
      BlobType = ftWideMemo
    end
    object CdsPost: TWideMemoField
      FieldName = 'Post'
      BlobType = ftWideMemo
    end
    object CdsResponse: TWideMemoField
      FieldName = 'Response'
      BlobType = ftWideMemo
    end
    object CdsContentType: TIntegerField
      FieldName = 'ContentType'
    end
  end
  object Ds: TDataSource
    AutoEdit = False
    DataSet = Cds
    Left = 585
    Top = 95
  end
  object PmConnActions: TPopupMenu
    OnPopup = PmConnActionsPopup
    Left = 238
    Top = 159
    object PmActionKeepCurrRecord: TMenuItem
      Caption = 'Manter no registro atual'
      OnClick = PmActionKeepCurrRecordClick
    end
  end
end
