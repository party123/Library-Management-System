unit chaoqifakuan_p;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DB,
  ADODB;

type
  Tchaoqifakuan = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    ADOQuery3: TADOQuery;
    BitBtn1: TBitBtn;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  chaoqifakuan: Tchaoqifakuan;

implementation
uses guihuan_p, main;
var
  bookcount:integer;

{$R *.dfm}

procedure Tchaoqifakuan.BitBtn2Click(Sender: TObject);
begin
  close;
  guihuan_p.guihuan.show;
end;

procedure Tchaoqifakuan.FormCreate(Sender: TObject);
var
  I:integer;
  j:integer;
  count:Extended;
  temp1:string;
begin
    Edit1.Text:=guihuan_p.guihuan.Edit1.Text;
    ADOQuery2.Close;
    ADOQuery2.SQL.Clear;
    ADOQuery2.SQL.Add('select * from  dbo.reader,dbo.reader_type where (dbo.reader.r_id=:a) and dbo.reader.rt_no=dbo.reader_type.rt_no ');
    ADOQuery2.Parameters.ParamByName('a').Value:=Trim(Edit1.Text);
    ADOQuery2.Open;
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('select * from  dbo.book,dbo.forfeit where dbo.forfeit.r_id=:a and dbo.book.b_id=dbo.forfeit.b_id and ok=:c and f_memo=:b');
    ADOQuery1.Parameters.ParamByName('a').Value:=Trim(Edit1.Text);
    ADOQuery1.Parameters.ParamByName('b').Value:=Trim('超期');
    ADOQuery1.Parameters.ParamByName('c').Value:=0;
    ADOQuery1.Open;
    j:=ADOQuery1.RecordCount;
    label7.Caption:=inttostr(j);
    bookcount:=j;
    count:=0;
    for i:=1 to j do
    begin
      ADOQuery1.RecNo:=I;
      temp1:=DBGrid1.Fields[6].DisplayText;
      count:=count+strtofloat(temp1);
    end;
    Label9.Caption:=floattostr(count);
    Label11.Caption:=floattostr(count);
end;

procedure Tchaoqifakuan.BitBtn1Click(Sender: TObject);
var
 I:integer;
 j:integer;
 temp1:string;
begin
  j:=bookcount;
  if bookcount>0 then
    begin
      for i:=1 to j do
        begin
          ADOQuery1.RecNo:=I;
          temp1:=DBGrid1.Fields[0].DisplayText;
          ADOQuery3.Close;
          ADOQuery3.SQL.Clear;
          ADOQuery3.SQL.Add('update dbo.forfeit set ok=:a where f_no=:b');
          ADOQuery3.Parameters.ParamByName('a').Value:=1;
          ADOQuery3.Parameters.ParamByName('b').Value:=temp1;
          ADOQuery3.ExecSQL;
          ADOQuery1.Delete;
        end;
         application.MessageBox('罚款成功!','提示',0+64);
         Label7.Caption:='0';
         Label9.Caption:='0';
         Label11.Caption:='0';
         bookcount:=0;
      end
    else
       application.MessageBox('没有需要罚款的图书!','提示',0+64);
end;

end.
