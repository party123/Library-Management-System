unit miwang_P;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls, DB, ADODB;

type
  Tmiwang = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ComboBox1: TComboBox;
    Label3: TLabel;
    Edit2: TEdit;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  miwang: Tmiwang;

implementation
uses main;
{$R *.dfm}
procedure Tmiwang.FormCreate(Sender: TObject);
begin
  edit1.clear;
  edit2.text:=main.frmMain.edit1.text;
end;

procedure Tmiwang.SpeedButton2Click(Sender: TObject);
begin
  close;
  main.frmMain.show;
end;

procedure Tmiwang.SpeedButton1Click(Sender: TObject);
var temp:String;
    temp1:String;
begin
 if(Combobox1.Text='') or (edit1.text='') then
 begin
 application.MessageBox('请输入问题和答案!','提示',0+64);
 end
 else
 begin
 ADOquery2.Close;
 ADOquery2.SQL.Clear;
 ADOquery2.SQL.add('select * from dbo.admain where dbo.admain.a_name=:a');
 Adoquery2.parameters.parambyname('a').value:=''+Edit2.Text+'';
 ADOquery2.open;
 temp:=ADOquery2.FieldByName('a_id').AsString;
 ADOquery1.Close;
 ADOquery1.SQl.Clear;
 ADOquery1.SQL.Add('select * from dbo.mibao where a_id=:1 and  a_q=:2 and a_an=:3');
 Adoquery1.parameters.parambyname('1').value:=trim(temp);
 Adoquery1.parameters.parambyname('2').value:=trim(Combobox1.Text);
 Adoquery1.parameters.parambyname('3').value:=trim(edit1.text);
 ADOquery1.Open;
 if ADOquery1.Recordcount=0 then
   begin
   application.MessageBox('用户名或答案错误!','提示',0+64);
   edit1.Clear;
   end
   else
   begin
   ADOquery3.Close;
   ADOquery3.SQl.Clear;
   ADOquery3.SQL.Add('select * from dbo.admain where a_id=:1');
   Adoquery3.parameters.parambyname('1').value:=trim(temp);
   ADOquery3.Open;
   temp1:=ADOquery3.FieldByName('pwd').AsString;
   application.MessageBox(PChar('密码:'+temp1),'密码信息',0+64);
end;
end;
end;
end.
