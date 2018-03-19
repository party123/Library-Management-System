unit mibao_P;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  Tmibao = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    Label1: TLabel;
    Label4: TLabel;
    Edit2: TEdit;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    procedure Formshow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mibao: Tmibao;

implementation
uses unit1,main;
{$R *.dfm}
procedure Tmibao.Formshow(Sender: TObject);
begin
  edit2.Text:=main.frmMain.edit1.Text;
  end;
procedure Tmibao.BitBtn2Click(Sender: TObject);
begin
  close;
  unit1.Menu.show;
end;

procedure Tmibao.BitBtn1Click(Sender: TObject);
var temp:String;
begin
   if(edit1.text='') or (combobox1.text='') then
   begin
   application.MessageBox('请输入问题和答案!','提示',0+64);
   end
   else
   begin
   ADOquery3.Close;
   ADOquery3.SQl.Clear;
   ADOquery3.SQL.add('select * from dbo.admain where a_name=:a');
   Adoquery3.parameters.parambyname('a').value:=trim(Edit2.Text);
   ADOquery3.Open;
   temp:=ADOquery3.FieldByName('a_id').AsString;
   ADOquery2.Close;
   ADOquery2.SQL.Clear;
   ADOquery2.SQL.add('select * from dbo.admain,dbo.mibao where (dbo.admain.a_name=:a) and (dbo.mibao.a_id=dbo.admain.a_id)');
   Adoquery2.parameters.parambyname('a').value:=''+Edit2.Text+'';
   ADoquery2.Open;
   if(ADoquery2.RecordCount=0) then
   begin
   ADOQuery1.Close;
   ADOQuery1.SQL.Clear;
   Adoquery1.sql.add('insert into dbo.mibao(a_id,a_q,a_an)'
   +'values (:1,:2,:3)');
   Adoquery1.parameters.parambyname('1').value:=''+temp+'';
   Adoquery1.parameters.parambyname('2').value:=''+Combobox1.Text+'';
   Adoquery1.parameters.parambyname('3').value:=''+Edit1.Text+'';
   Adoquery1.execsql;
   if (adoquery1.rowsaffected>=1) then
     application.MessageBox('密码保护添加成功!','提示',0+64);
     Edit1.Clear;
     end
   else
   begin
   ADOQuery1.Close;
   ADOQuery1.SQL.Clear;
   Adoquery1.sql.add('update dbo.mibao set a_id=:1,a_q=:2,a_an=:3');
   Adoquery1.parameters.parambyname('1').value:=''+temp+'';
   Adoquery1.parameters.parambyname('2').value:=''+Combobox1.Text+'';
   Adoquery1.parameters.parambyname('3').value:=''+Edit1.Text+'';
   Adoquery1.execsql;
   if (adoquery1.rowsaffected>=1) then
     application.MessageBox('密码保护修改成功!','提示',0+64);
     Edit1.Clear;
end;
end;
end;

end.
