unit admainxiu_P;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  Tadmainxiu = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery2: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  admainxiu: Tadmainxiu;
implementation
uses admainset_P;
{$R *.dfm}
procedure Tadmainxiu.FormCreate(Sender: TObject);
begin
edit1.Text:=admainset_P.admainset.dbedit1.Text;
edit2.Text:=admainset_P.admainset.dbedit2.Text;
edit3.Text:=admainset_P.admainset.dbedit3.Text;
combobox1.Text:=admainset_P.admainset.dbedit4.Text;
end;
procedure Tadmainxiu.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure Tadmainxiu.BitBtn1Click(Sender: TObject);
begin
  if (edit2.Text='') or(edit3.Text='') or(Combobox1.Text='') then
begin
application.MessageBox('信息不完整！','错误操作',mb_ok);
exit;
end
else
begin
 adoquery1.close;
adoquery1.sql.clear;
Adoquery1.sql.add('update dbo.admain set a_name=:2,pwd=:3,qx=:4 where a_id=:1');
Adoquery1.parameters.parambyname('1').value:=''+Edit1.Text+'';
Adoquery1.parameters.parambyname('2').value:=''+Edit2.Text+'';
Adoquery1.parameters.parambyname('3').value:=''+Edit3.Text+'';
Adoquery1.parameters.parambyname('4').value:=''+Combobox1.Text+'';
Adoquery1.execsql;
if (adoquery1.rowsaffected>=1) then
    application.messagebox('修改成功!','提示',0+64);
     Edit2.Clear;
     Edit3.Clear;
end;
end;
end.
