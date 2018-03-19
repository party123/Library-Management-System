unit readerxiu_P;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DBCtrls, DB, ADODB, Buttons, ExtCtrls,
  ExtDlgs,jpeg;

type
  Treaderxiu = class(TForm)
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
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    ComboBox1: TComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker3: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Label11: TLabel;
    Edit6: TEdit;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    Image1: TImage;
    Label12: TLabel;
    BitBtn3: TBitBtn;
    OpenPictureDialog1: TOpenPictureDialog;
    procedure Formshow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  readerxiu: Treaderxiu;

implementation
uses readerdang_P;
{$R *.dfm}
procedure Treaderxiu.Formshow(Sender: TObject);
var
  Strean:TMemoryStream;
  Jpg:TjpegImage;
begin
  edit1.Text:=readerdang_P.readerdang.dbedit1.Text;
   edit2.Text:=readerdang_P.readerdang.dbedit2.Text;
   combobox1.Text:=readerdang_P.readerdang.dbedit3.Text;
   datetimepicker1.Date:=StrToDate(readerdang_P.readerdang.dbedit7.Text);
   datetimepicker2.Date:=StrToDate(readerdang_P.readerdang.dbedit8.Text);
   datetimepicker3.Date:=StrToDate(readerdang_P.readerdang.dbedit9.Text);
   edit3.Text:=readerdang_P.readerdang.dbedit6.Text;
   edit4.Text:=readerdang_P.readerdang.dbedit5.Text;
   edit5.Text:=readerdang_P.readerdang.dbedit11.Text;
   edit6.Text:=readerdang_P.readerdang.dbedit10.Text;
   adoquery2.close;
   adoquery2.sql.clear;
   adoquery2.sql.add('select * from dbo.reader_type');
   adoquery2.open;
  ADOQuery1.Close;
  ADOQuery1.SQL.Text:='SELECT * FROM dbo.reader where r_id =' + edit1.Text;   // 查询图片
  ADOQuery1.Open;
  if not ADOQuery1.FieldByName('r_p').IsNull then
  begin
    Strean:=TMemoryStream.Create ;
    Jpg:=TjpegImage.Create ;
    TBlobField(ADOQuery1.FieldByName('r_p')).SaveToStream(Strean);    // 显示的转换为BlobField并保存到内存流
    Strean.Position:=0;
    jpg.LoadFromStream(Strean);    // 加载图片
    image1.Picture.Assign(Jpg);
    Strean.Free;
    Jpg.Free;
  end
  else
  begin
    image1.Picture:=nil;
  end;
  end;
//添加按键//
procedure Treaderxiu.BitBtn1Click(Sender: TObject);
var
  Stream:TMemoryStream;
begin
  if (edit2.Text='') or(combobox1.Text='') or (dblookupcombobox1.Keyvalue='') or (edit4.Text='') or(edit5.Text='') then
begin
application.MessageBox('信息不完整!','提示',0+64);
exit;
end
else
begin
 try
    Stream:=TMemoryStream.Create; //  创建内存流
    Image1.Picture.Graphic.SaveToStream(Stream);   // 将图片保存到内存流中
adoquery1.close;
adoquery1.sql.clear;
Adoquery1.sql.add('update dbo.reader set r_name=:2,sex=:3,birth=:4,rt_no=:5,r_state=:6,regtd=:7,department=:8,tel=:9,deadline=:10,bor_vol=:11,r_p=:12 where r_id=:1');
Adoquery1.parameters.parambyname('1').value:=''+Edit1.Text+'';
Adoquery1.parameters.parambyname('2').value:=''+Edit2.Text+'';
Adoquery1.parameters.parambyname('3').value:=''+combobox1.Text+'';
Adoquery1.parameters.parambyname('4').value:=datetostr(DateTimePicker1.Date);
Adoquery1.parameters.parambyname('5').value:=''+dblookupcombobox1.KeyValue+'';
Adoquery1.parameters.parambyname('6').value:=''+Edit3.Text+'';
Adoquery1.parameters.parambyname('7').value:=datetostr(DateTimePicker2.Date);
Adoquery1.parameters.parambyname('8').value:=''+Edit4.Text+'';
Adoquery1.parameters.parambyname('9').value:=''+Edit5.Text+'';
Adoquery1.parameters.parambyname('10').value:=datetostr(DateTimePicker3.DateTime);
Adoquery1.parameters.parambyname('11').value:=''+Edit6.Text+'';
adoQuery1.Parameters.ParamByName('12').LoadFromStream(Stream,ftBlob);
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
end;
end;
procedure Treaderxiu.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure Treaderxiu.BitBtn3Click(Sender: TObject);
begin
if OpenPictureDialog1.Execute then
  begin
    Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
  end;
end;
procedure Treaderxiu.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9'])  then
 begin
   application.MessageBox('请输入数字！', '提示',0+64);
   key:=#0;
   edit6.Text:='';
   end;
end;

procedure Treaderxiu.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9'])  then
 begin
   application.MessageBox('请输入数字！', '提示',0+64);
   key:=#0;
   edit5.Text:='';
   end;
end;

end.
