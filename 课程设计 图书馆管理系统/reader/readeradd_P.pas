unit readeradd_P;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DBCtrls, DB, ADODB, Buttons, ExtDlgs,
  ExtCtrls;

type
  Treaderadd = class(TForm)
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
    OpenPictureDialog1: TOpenPictureDialog;
    Image1: TImage;
    Label12: TLabel;
    BitBtn3: TBitBtn;
    Label13: TLabel;
    procedure Formshow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  readeradd: Treaderadd;

implementation

{$R *.dfm}
procedure Treaderadd.Formshow(Sender: TObject);
begin
   adoquery2.close;
   adoquery2.sql.clear;
   adoquery2.sql.add('select * from dbo.读者类型');
   adoquery2.open;
   end;
//添加按键//
procedure Treaderadd.BitBtn1Click(Sender: TObject);
var
  Stream:TMemoryStream;
begin
 with ADOQuery1 do
   begin
      close;
      SQL.Clear;
      SQL.Add('select * from dbo.读者信息 where 读者编号=:b');
      parameters.ParamByName('b').Value:=Trim(Edit1.Text);
      Open;
   end;
  if (edit1.Text='')or(edit2.Text='') or(combobox1.Text='') or (dblookupcombobox1.Keyvalue='') or (edit4.Text='') or(edit5.Text='') then
begin
application.MessageBox('信息不完整!','提示',0+64);
exit;
end
else if(length(edit1.Text)>8) then
     begin
     application.MessageBox('编号超过8位!','提示',0+64);
     Edit1.Clear;
     end
else if ADOQuery1.Eof=false then
   begin
     application.MessageBox('编号已存在，请重新输入!','提示',0+64);
     Edit1.Clear;
   end
else
begin
try
    Stream := TMemoryStream.Create; //  创建内存流
    Image1.Picture.Graphic.SaveToStream(Stream);   // 将图片保存到内存流中
 adoquery1.close;
adoquery1.sql.clear;
Adoquery1.sql.add('insert into dbo.读者信息(读者编号,读者姓名,性别,出生日期,读者类型编号,读者状态,登记日期,院系,联系电话,有效期至,欠款金额,读者照片)'
+'values (:1,:2,:3,:4,:5,:6,:7,:8,:9,:10,:11,:12)');
Adoquery1.parameters.parambyname('1').value:=''+Edit1.Text+'';
Adoquery1.parameters.parambyname('2').value:=''+Edit2.Text+'';
Adoquery1.parameters.parambyname('3').value:=''+combobox1.Text+'';
Adoquery1.parameters.parambyname('4').value:=datetostr(DateTimePicker1.Date);
Adoquery1.parameters.parambyname('5').value:=''+dblookupcombobox1.KeyValue+'';
Adoquery1.parameters.parambyname('6').value:=''+Edit3.Text+'';
Adoquery1.parameters.parambyname('7').value:=datetostr(DateTimePicker2.Date);
Adoquery1.parameters.parambyname('8').value:=''+Edit4.Text+'';
Adoquery1.parameters.parambyname('9').value:=''+Edit5.Text+'';
Adoquery1.parameters.parambyname('10').value:=datetostr(DateTimePicker3.Date);
Adoquery1.parameters.parambyname('11').value:=''+Edit6.Text+'';
adoQuery1.Parameters.ParamByName('12').LoadFromStream(Stream,ftBlob); // 读取保存的内存图
Adoquery1.execsql;
finally
    Stream.Free;     // 释放内存流
    end;
if (adoquery1.rowsaffected>=1) then
    application.MessageBox('添加成功!','提示',0+64);
     Edit1.Clear;
     Edit2.Clear;
     Edit4.Clear;
     Edit5.Clear;
end;
end;
procedure Treaderadd.BitBtn2Click(Sender: TObject);
begin
close;
end;
//上传照片
procedure Treaderadd.BitBtn3Click(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
  begin
    Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
  end;
end;
procedure Treaderadd.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9'])  then
 begin
   application.MessageBox('请输入数字！', '提示',0+64);
   key:=#0;
   edit1.Text:='';
   end;
end;

procedure Treaderadd.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9'])  then
 begin
   application.MessageBox('请输入数字！', '提示',0+64);
   key:=#0;
   edit5.Text:='';
   end;
end;

end.
