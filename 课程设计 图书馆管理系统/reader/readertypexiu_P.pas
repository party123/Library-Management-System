unit readertypexiu_P;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  Treadertypexiu = class(TForm)
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label6: TLabel;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    Edit5: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  readertypexiu: Treadertypexiu;

implementation
uses readertype_P;
{$R *.dfm}
procedure Treadertypexiu.FormCreate(Sender: TObject);
begin
edit5.Text:=readertype_P.readertype.dbedit5.Text;
edit1.Text:=readertype_P.readertype.dbedit2.Text;
edit2.Text:=readertype_P.readertype.dbedit2.Text;
edit3.Text:=readertype_P.readertype.dbedit3.Text;
edit4.Text:=readertype_P.readertype.dbedit4.Text;
end;
procedure Treadertypexiu.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure Treadertypexiu.BitBtn1Click(Sender: TObject);
begin
  if (edit2.Text='') or(edit3.Text='') or(edit4.Text='') or (edit5.Text='') then
begin
application.MessageBox('信息不完整!','提示',0+64);
exit;
end
else
begin
 adoquery1.close;
adoquery1.sql.clear;
Adoquery1.sql.add('update dbo.读者类型 set 读者类型名称=:2,最大借阅数量=:3,最长借阅时间=:4,最大续借次数=:5 where 读者类型编号=:1');
Adoquery1.parameters.parambyname('2').value:=''+Edit1.Text+'';
Adoquery1.parameters.parambyname('3').value:=''+Edit2.Text+'';
Adoquery1.parameters.parambyname('4').value:=''+Edit3.Text+'';
Adoquery1.parameters.parambyname('5').value:=''+Edit4.Text+'';
Adoquery1.parameters.parambyname('1').value:=''+Edit5.Text+'';
Adoquery1.execsql;
if (adoquery1.rowsaffected>=1) then
    application.MessageBox('修改成功!','提示',0+64);
     Edit1.Clear;
     Edit2.Clear;
     Edit3.Clear;
     Edit4.Clear;
end;
end;

procedure Treadertypexiu.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9'])  then
 begin
   application.MessageBox('请输入数字！', '提示',0+64);
   key:=#0;
   edit2.Text:='';
   end;
end;

procedure Treadertypexiu.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9'])  then
 begin
   application.MessageBox('请输入数字！', '提示',0+64);
   key:=#0;
   edit3.Text:='';
   end;
end;

procedure Treadertypexiu.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9'])  then
 begin
   application.MessageBox('请输入数字！', '提示',0+64);
   key:=#0;
   edit4.Text:='';
   end;
end;

end.
