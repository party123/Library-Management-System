unit booktypexiu_P;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons;

type
  Tbooktypexiu = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    procedure Formshow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  booktypexiu: Tbooktypexiu;

implementation
uses booktype_P;
{$R *.dfm}
procedure Tbooktypexiu.Formshow(Sender: TObject);
begin
    edit1.text:=booktype_P.booktype.dbedit1.Text;
    edit2.text:=booktype_P.booktype.dbedit2.Text;
end;
//修改按键//
procedure Tbooktypexiu.BitBtn1Click(Sender: TObject);
begin
if (edit1.Text='')then
begin
application.MessageBox('信息不完整！','提示',0+64);
exit;
end
else
begin
adoquery1.close;
adoquery1.sql.clear;
Adoquery1.sql.add('update dbo.book_type set bt_name=:1 where bt_no=:2');
Adoquery1.parameters.parambyname('1').value:=''+Edit2.Text+'';
Adoquery1.parameters.parambyname('1').value:=''+Edit1.Text+'';
Adoquery1.execsql;
if (adoquery1.rowsaffected>=1) then
    application.MessageBox('修改成功！','提示',0+64);
     Edit2.Clear;
end;
end;
//退出按键//
procedure Tbooktypexiu.BitBtn2Click(Sender: TObject);
begin
close;
end;
end.
