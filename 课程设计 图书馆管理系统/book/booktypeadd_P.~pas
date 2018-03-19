unit booktypeadd_P;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  Tbooktypeadd = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    Label3: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  booktypeadd: Tbooktypeadd;

implementation

{$R *.dfm}
//添加按键//
procedure Tbooktypeadd.BitBtn1Click(Sender: TObject);
begin
 with ADOQuery1 do
   begin
      close;
      SQL.Clear;
      SQL.Add('select * from dbo.book_type where bt_no=:b');
      parameters.ParamByName('b').Value:=Trim(Edit1.Text);
      Open;
   end;
  if (edit1.Text='')or(edit2.Text='') then
begin
application.MessageBox('信息不完整!','提示',0+64);
exit;
end
else if(length(edit1.Text)>4) then
     begin
     application.MessageBox('编号超过4位!','提示',0+64);
     Edit1.Clear;
     end
else if ADOQuery1.Eof=false then
   begin
     application.MessageBox('编号已存在，请重新输入!','提示',0+64);
     Edit1.Clear;
     Edit2.Clear;
   end
else
begin
 adoquery1.close;
adoquery1.sql.clear;
Adoquery1.sql.add('insert into dbo.book_type(bt_no,bt_name)'
+'values (:1,:2)');
Adoquery1.parameters.parambyname('1').value:=''+Edit1.Text+'';
Adoquery1.parameters.parambyname('2').value:=''+Edit2.Text+'';
Adoquery1.execsql;
if (adoquery1.rowsaffected>=1) then
    application.MessageBox('添加成功!','提示',0+64);
     Edit1.Clear;
     Edit2.Clear;
end;
end;
//退出按键//
procedure Tbooktypeadd.BitBtn2Click(Sender: TObject);
begin
Close;
end;

procedure Tbooktypeadd.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9'])  then
 begin
   application.MessageBox('请输入数字！', '提示',0+64);
   key:=#0;
   edit1.Text:='';
   end;
end;

end.
