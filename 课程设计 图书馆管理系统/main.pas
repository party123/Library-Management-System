unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, Buttons, DB, ADODB, FMTBcd, SqlExpr,
  sSkinManager;

type
  TfrmMain = class(TForm)
    login: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edit1: TEdit;
    edit2: TEdit;
    Time: TTimer;
    ComboBox1: TComboBox;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    Label6: TLabel;
    sSkinManager1: TsSkinManager;
    procedure TimeTimer(Sender: TObject);
   procedure BitBtn2Click(Sender: TObject);
   procedure BitBtn1Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
implementation
uses unit1,miwang_P;
{$R *.dfm}

procedure TfrmMain.TimeTimer(Sender: TObject);
begin
     Label5.Caption:=DatetimetoStr(now);
end;

procedure TfrmMain.BitBtn2Click(Sender: TObject);
begin
    close;
end;
procedure TfrmMain.Bitbtn1Click(Sender: TObject);
begin
if((edit1.Text='') or (edit2.Text='')) then
begin
   application.MessageBox('请输入用户名和密码','提示',0+64);
   end
else if (combobox1.Text='') then
begin
    application.MessageBox('请选择身份','提示',0+64);
    end
else
begin
with
 adoquery1
  do
  begin
    close;
    SQL.Clear;
    Sql.Add('select * from dbo.用户信息 where (用户编号=:a) and (密码=:b) and (身份=:c)');
     parameters.ParamByName('a').Value:=Trim(edit1.Text);
     parameters.ParamByName('b').Value:=Trim(edit2.Text);
     parameters.ParamByName('c').Value:=''+combobox1.Text+'';
     open;
     end;
     if adoquery1.RecordCount>0  then
     begin
        frmMain.hide;
        unit1.Menu.show;
        adoquery1.sql.clear;
        end
     else
     begin
        application.MessageBox('验证错误,请重新登录','提示',0+64);
        edit1.Text:='';
        edit2.Text:='';
        end;
   end;
   end;

procedure TfrmMain.Label6Click(Sender: TObject);
begin
        if edit1.Text='' then
        begin
        application.MessageBox('请输入用户名!','提示',0+64);
        end
        else
        begin
        frmMain.hide;
        if miwang= nil then
        miwang:= Tmiwang.Create(Self);
        miwang.ShowModal;
        end;
end;

end.

