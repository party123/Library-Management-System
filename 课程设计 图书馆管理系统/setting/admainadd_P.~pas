unit admainadd_P;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  Tadmainadd = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ComboBox1: TComboBox;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Label6: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  admainadd: Tadmainadd;

implementation

{$R *.dfm}

procedure Tadmainadd.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure Tadmainadd.BitBtn1Click(Sender: TObject);
begin
 with ADOQuery1 do
   begin
      close;
      SQL.Clear;
      SQL.Add('select * from dbo.admain where a_id=:b');
      parameters.ParamByName('b').Value:=Trim(Edit1.Text);
      Open;
   end;
  if (edit1.Text='')or(edit2.Text='') or(edit3.Text='')or(edit4.Text='') then
begin
application.MessageBox('信息不完整!','提示',0+64);
exit;
end
else if(edit3.Text<>edit4.Text) then
begin
  application.MessageBox('密码不一致!','提示',0+64);
  edit3.Clear;
  edit4.clear;
exit;
end
else if(length(edit1.Text)>8) then
     begin
     application.MessageBox('编号超过8位!','提示',0+64);
     Edit1.Clear;
     end
else if ADOQuery1.Eof=false then
   begin
     application.MessageBox('ID已存在，请重新输入!','提示',0+64);
     Edit1.Clear;
     Edit2.Clear;
     Edit3.Clear;
     Edit4.Clear;
   end
else
begin
 adoquery1.close;
adoquery1.sql.clear;
Adoquery1.sql.add('insert into dbo.admain(a_id,a_name,pwd,qx)'
+'values (:1,:2,:3,:4)');
Adoquery1.parameters.parambyname('1').value:=''+Edit1.Text+'';
Adoquery1.parameters.parambyname('2').value:=''+Edit2.Text+'';
Adoquery1.parameters.parambyname('3').value:=''+Edit3.Text+'';
Adoquery1.parameters.parambyname('4').value:=''+Combobox1.Text+'';
Adoquery1.execsql;
if (adoquery1.rowsaffected>=1) then
    application.MessageBox('添加成功!','提示',0+64);
     Edit1.Clear;
     Edit2.Clear;
     Edit3.Clear;
     Edit4.Clear;
end;
end;

procedure Tadmainadd.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9'])  then
 begin
   application.MessageBox('请输入数字！', '提示',0+64);
   key:=#0;
   edit1.Text:='';
   end;
end;

end.
