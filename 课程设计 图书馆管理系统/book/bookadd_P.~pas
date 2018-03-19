unit bookadd_P;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, ComCtrls, DBCtrls, ExtCtrls,
  ExtDlgs;

type
  Tbookadd = class(TForm)
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
    OpenPictureDialog1: TOpenPictureDialog;
    Label16: TLabel;
    Image1: TImage;
    BitBtn3: TBitBtn;
    ADOQuery3: TADOQuery;
    DataSource3: TDataSource;
    procedure Formshow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  bookadd: Tbookadd;

implementation

{$R *.dfm}
procedure Tbookadd.Formshow(Sender: TObject);
begin
   adoquery3.close;
   adoquery3.sql.clear;
   adoquery3.sql.add('select * from dbo.book_type');
   adoquery3.open;
   adoquery2.close;
   adoquery2.sql.clear;
   adoquery2.sql.add('select * from dbo.book_shelf');
   adoquery2.open;
   end;
//添加按键//
procedure Tbookadd.BitBtn1Click(Sender: TObject);
var
  Stream:TMemoryStream;
begin
 with ADOQuery1 do
   begin
      close;
      SQL.Clear;
      SQL.Add('select * from dbo.book where b_id=:b');
      parameters.ParamByName('b').Value:=Trim(Edit1.Text);
      Open;
   end;
  if (edit1.Text='')or(edit2.Text='')or(edit3.Text='')or(edit4.Text='')or(edit5.Text='')or(edit6.Text='')or(edit7.Text='')or(edit8.Text='')or(edit9.Text='') or(combobox1.Text='') or (dblookupcombobox1.Keyvalue='')or (dblookupcombobox2.Keyvalue='') or (memo1.Text='')  then
begin
application.MessageBox('信息不完整!','提示',0+64);
exit;
end
else if(length(edit1.Text)>10) then
     begin
     application.MessageBox('编号超过10位!','提示',0+64);
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
    Image1.Picture.Graphic.SaveToStream(Stream);
 adoquery1.close;
adoquery1.sql.clear;
Adoquery1.sql.add('insert into dbo.book(b_id,b_name,press,writer,bt_no,ISBN,price,in_time,bs_no,total_vol,remain_vol,lend_times,memo,b_state,b_p)'
+'values (:1,:2,:3,:4,:5,:6,:7,:8,:9,:10,:11,:12,:13,:14,:15)');
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
adoQuery1.Parameters.ParamByName('15').LoadFromStream(Stream,ftBlob); // 读取保存的内存图
Adoquery1.execsql;
finally
    Stream.Free;     // 释放内存流
    end;
if (adoquery1.rowsaffected>=1) then
    application.MessageBox('添加成功!','提示',0+64);
     Edit1.Clear;
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

procedure Tbookadd.BitBtn2Click(Sender: TObject);
begin
Close;
end;

procedure Tbookadd.BitBtn3Click(Sender: TObject);
begin
 if OpenPictureDialog1.Execute then
  begin
    Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
  end;
end;

procedure Tbookadd.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9'])  then
 begin
   application.MessageBox('请输入数字！', '提示',0+64);
   key:=#0;
   edit1.Text:='';
   end;
end;

procedure Tbookadd.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9'])  then
 begin
   application.MessageBox('请输入数字！', '提示',0+64);
   key:=#0;
   edit7.Text:='';
   end;
end;

procedure Tbookadd.Edit8KeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9'])  then
 begin
   application.MessageBox('请输入数字！', '提示',0+64);
   key:=#0;
   edit8.Text:='';
   end;
end;

end.
