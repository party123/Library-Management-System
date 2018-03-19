unit roomxiu_P;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons;

type
  Troomxiu = class(TForm)
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
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  roomxiu: Troomxiu;

implementation
uses roomset_P;
{$R *.dfm}
procedure Troomxiu.FormCreate(Sender: TObject);
begin
edit1.Text:=roomset_P.roomset.dbedit1.Text;
edit2.Text:=roomset_P.roomset.dbedit2.Text;
end;
//添加按键//
procedure Troomxiu.BitBtn1Click(Sender: TObject);
begin
  if (edit2.Text='') then
begin
application.MessageBox('信息不完整！','错误操作',mb_ok);
exit;
end
else
begin
adoquery1.close;
adoquery1.sql.clear;
Adoquery1.sql.add('update dbo.room set room_name=:b where room_no=:a');
adoquery1.parameters.ParamByName('a').Value:=Trim(edit1.Text);
adoquery1.parameters.ParamByName('b').Value:=Trim(edit2.Text);
Adoquery1.execsql;
   MessageBox(Handle, '修改成功！', '信息', MB_ICONASTERISK);
   edit2.Clear;
   end;
end;
//退出按键//
procedure Troomxiu.BitBtn2Click(Sender: TObject);
begin
Close;
end;
end.
