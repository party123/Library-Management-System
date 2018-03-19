unit bookxiu_P;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, ComCtrls, DBCtrls, ExtDlgs, ExtCtrls,jpeg;

type
  Tbookxiu = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Memo1: TMemo;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DateTimePicker1: TDateTimePicker;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    ComboBox1: TComboBox;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    Label15: TLabel;
    BitBtn3: TBitBtn;
    OpenPictureDialog1: TOpenPictureDialog;
    ADOQuery3: TADOQuery;
    Image1: TImage;
    ADOConnection2: TADOConnection;
    procedure Formshow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
    procedure Edit9KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  bookxiu: Tbookxiu;

implementation
uses bookset_P;
{$R *.dfm}
procedure Tbookxiu.Formshow(Sender: TObject);
var
  Stream:TMemoryStream;
  bmp:TBitmap;
  jpg:TJpegImage; //jpg图片信息
  Buffer:word;
begin
   edit1.Text:=bookset_P.bookset.dbedit1.Text;
   edit2.Text:=bookset_P.bookset.dbedit2.Text;
   edit3.Text:=bookset_P.bookset.dbedit3.Text;
   edit4.Text:=bookset_P.bookset.dbedit4.Text;
   edit5.Text:=bookset_P.bookset.dbedit6.Text;
   edit6.Text:=bookset_P.bookset.dbedit9.Text;
   datetimepicker1.date:=strtodate(bookset_P.bookset.dbedit10.Text);
   edit7.Text:=bookset_P.bookset.dbedit11.Text;
   edit8.Text:=bookset_P.bookset.dbedit12.Text;
   edit9.Text:=bookset_P.bookset.dbedit13.Text;
   combobox1.Text:=bookset_P.bookset.dbedit14.Text;
    memo1.Text:=bookset_P.bookset.dbmemo1.Text;
   adoquery1.close;
   adoquery1.sql.clear;
   adoquery1.sql.add('select * from dbo.book_type');
   adoquery1.open;
   adoquery2.close;
   adoquery2.sql.clear;
   adoquery2.sql.add('select * from dbo.book_shelf');
   adoquery2.open;
   ADOQuery3.Close;
   ADOQuery3.Sql.add('select * from dbo.book where b_id =:1');
   Adoquery3.parameters.parambyname('1').value:=''+Edit1.Text+'';
  ADOQuery3.Open;
 if not ADOQuery3.FieldByName('b_p').IsNull then
  begin
    Stream:=TMemoryStream.Create;
          jpg:=TJpegImage.Create;
          TBlobField(ADOQuery3.FieldByName('b_p')).SaveToStream(Stream);    // 显示的转换为BlobField并保存到内存流
          Stream.Position :=0;
              Stream.ReadBuffer(Buffer,2);
              if Buffer=$4D42 then
                begin
                  bmp:=TBitmap.create;
                  Stream.Position :=0;
                  bmp.LoadFromStream(Stream);    // 加载图片
                  image1.Picture.Assign(bmp);
                end
              else if Buffer=$D8FF then
                begin
                  //showmessage('JPG');
                  jpg:=TJpegImage.Create;
                  Stream.Position :=0;
                  jpg.LoadFromStream(Stream);    // 加载图片
                  image1.Picture.Assign(jpg);
                end;
            end;

end;
//修改按键//
procedure Tbookxiu.BitBtn1Click(Sender: TObject);
var
  Stream:TMemoryStream;
begin
if (edit2.Text='')or(edit3.Text='')or(edit4.Text='')or(edit5.Text='')or(edit6.Text='')or(edit7.Text='')or(edit8.Text='')or(edit9.Text='') or(combobox1.Text='') or (dblookupcombobox1.Keyvalue='')or (dblookupcombobox2.Keyvalue='') or (memo1.Text='')  then
begin
application.MessageBox('信息不完整!','提示',0+64);
exit;
end
else
begin
try
    Stream:=TMemoryStream.Create; //  创建内存流
    Image1.Picture.Graphic.SaveToStream(Stream);
adoquery1.close;
adoquery1.sql.clear;
Adoquery1.sql.add('update dbo.book set b_name=:2,press=:3,writer=:4,bt_no=:5,ISBN=:6,price=:7,in_time=:8,bs_no=:9,total_vol=:10,remain_vol=:11,lend_times=:12,memo=:13,b_state=:14,b_p=:15 where b_id=:1');
Adoquery1.parameters.parambyname('1').value:=''+Edit1.Text+'';
Adoquery1.parameters.parambyname('2').value:=''+Edit2.Text+'';
Adoquery1.parameters.parambyname('3').value:=''+Edit3.Text+'';
Adoquery1.parameters.parambyname('4').value:=''+Edit4.Text+'';
Adoquery1.parameters.parambyname('5').value:=''+dblookupcombobox1.KeyValue+'';
Adoquery1.parameters.parambyname('6').value:=''+Edit5.Text+'';
Adoquery1.parameters.parambyname('7').value:=''+Edit6.Text+'';
Adoquery1.parameters.parambyname('8').value:=datetostr(DateTimePicker1.Date);
Adoquery1.parameters.parambyname('9').value:=''+dblookupcombobox2.KeyValue+'';
Adoquery1.parameters.parambyname('10').value:=''+Edit7.Text+'';
Adoquery1.parameters.parambyname('11').value:=''+Edit8.Text+'';
Adoquery1.parameters.parambyname('12').value:=''+Edit9.Text+'';
Adoquery1.parameters.parambyname('13').value:=''+memo1.Text+'';
Adoquery1.parameters.parambyname('14').value:=''+combobox1.Text+'';
adoQuery1.Parameters.ParamByName('15').LoadFromStream(Stream,ftBlob);
Adoquery1.execsql;
finally
    Stream.Free;     // 释放内存流
  end;
if (adoquery1.rowsaffected>=1) then
    application.MessageBox('修改成功!','提示',0+64);
     Edit2.Clear;
     Edit3.Clear;
     Edit4.Clear;
     Edit5.Clear;
     Edit6.Clear;
     Edit7.Clear;
     Edit8.Clear;
     Edit9.Clear;
end;
end;

procedure Tbookxiu.BitBtn2Click(Sender: TObject);
begin
Close;
end;

procedure Tbookxiu.BitBtn3Click(Sender: TObject);
begin
if OpenPictureDialog1.Execute then
  begin
    Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
  end;
end;

procedure Tbookxiu.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9'])  then
 begin
   application.MessageBox('请输入数字！', '提示',0+64);
   key:=#0;
   edit7.Text:='';
   end;
end;

procedure Tbookxiu.Edit8KeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9'])  then
 begin
   application.MessageBox('请输入数字！', '提示',0+64);
   key:=#0;
   edit8.Text:='';
   end;
end;

procedure Tbookxiu.Edit9KeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9'])  then
 begin
   application.MessageBox('请输入数字！', '提示',0+64);
   key:=#0;
   edit9.Text:='';
   end;
end;

end.
