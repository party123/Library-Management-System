unit jieyuepai_P;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons, DB, ADODB;

type
  Tjieyuepai = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    procedure Formshow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  jieyuepai: Tjieyuepai;

implementation
uses unit1;
{$R *.dfm}
procedure Tjieyuepai.Formshow(Sender: TObject);
begin
      ADOQuery1.Close;
      ADOQuery1.SQL.Clear;
      ADOQuery1.SQL.Add('select * from dbo.book,dbo.book_type where dbo.book.bt_no=dbo.book_type.bt_no order by lend_times desc');
      ADOQuery1.Open;
      label2.Caption:=inttostr(jieyuepai.ADOQuery1.RecordCount);
end;
//π‚±Í“∆∂Ø//
procedure Tjieyuepai.BitBtn1Click(Sender: TObject);
begin
jieyuepai.adoquery1.First;
end;
procedure Tjieyuepai.BitBtn2Click(Sender: TObject);
begin
jieyuepai.adoquery1.Prior;
end;
procedure Tjieyuepai.BitBtn3Click(Sender: TObject);
begin
jieyuepai.adoquery1.Next;
end;
procedure Tjieyuepai.BitBtn4Click(Sender: TObject);
begin
jieyuepai.adoquery1.Last;
end;
procedure Tjieyuepai.BitBtn5Click(Sender: TObject);
begin
close;
unit1.Menu.show;
end;
end.
