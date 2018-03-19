unit shelfxiu_P;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, DBCtrls, Mask;

type
  Tshelfxiu = class(TForm)
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
    Label4: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    ADOQuery2: TADOQuery;
    procedure Formshow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  shelfxiu: Tshelfxiu;

implementation
uses shelfset_P;
{$R *.dfm}
procedure Tshelfxiu.Formshow(Sender: TObject);
begin
    edit1.text:=shelfset_P.shelfset.dbedit1.Text;
    edit2.text:=shelfset_P.shelfset.dbedit2.Text;
    adoquery2.close;
    adoquery2.sql.clear;
    adoquery2.sql.add('select * from dbo.room');
    adoquery2.open;
end;
//修改按键//
procedure Tshelfxiu.BitBtn1Click(Sender: TObject);
begin
  if (edit2.Text='')or(dblookupcombobox1.keyvalue='') then
begin
application.MessageBox('信息不完整！','错误操作',mb_ok);
exit;
end
else
begin
adoquery1.close;
adoquery1.sql.clear;
Adoquery1.sql.add('update dbo.book_shelf set bs_name=:b,room_no=:c where bs_no=:a');
adoquery1.parameters.ParamByName('a').Value:=Trim(edit1.Text);
adoquery1.parameters.ParamByName('b').Value:=Trim(edit2.Text);
adoquery1.parameters.ParamByName('c').Value:=Trim(dblookupcombobox1.keyvalue);
Adoquery1.execsql;
   MessageBox(Handle, '修改成功！', '信息', MB_ICONASTERISK);
   edit2.Clear;
   end;
end;
//退出按键//
procedure Tshelfxiu.BitBtn2Click(Sender: TObject);
begin
close;
end;
end.

