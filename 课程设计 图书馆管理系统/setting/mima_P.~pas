unit mima_P;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  Tmima = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mima: Tmima;

implementation
uses unit1,main;
{$R *.dfm}

procedure Tmima.BitBtn2Click(Sender: TObject);
begin
close;
unit1.Menu.show;
end;
procedure Tmima.FormShow(Sender: TObject);
begin
        edit1.text:='';
         edit2.text:='';
         edit3.text:='';
end;
procedure Tmima.BitBtn1Click(Sender: TObject);
begin
   if edit1.text='' then
   begin
         MessageBox(Handle, '请填写原始密码！', '提示', MB_ICONEXCLAMATION);
         exit;
   end
   else if edit1.text<>main.frmMain.edit2.Text then
   begin
        MessageBox(Handle, '原始密码填写错误！', '提示', MB_ICONEXCLAMATION);
        edit1.text:='';
         exit;
   end
   else if edit2.text='' then
   begin
         MessageBox(Handle, '请填写新密码！', '提示', MB_ICONEXCLAMATION);
         exit;
   end
   else if edit3.text='' then
   begin
       MessageBox(Handle, '请确认新密码！', '提示', MB_ICONEXCLAMATION);
         exit;
   end
   else if edit2.text<>edit3.text then
   begin
       MessageBox(Handle, '密码不一致！', '提示', MB_ICONEXCLAMATION);
       edit3.text:='';
         exit;
   end
   else
   begin
         ADOQuery1.Close;
         ADOQuery1.SQL.Clear;
         ADOQuery1.SQL.Add('Update dbo.admain Set pwd='''+edit2.text+''' Where a_name=:a');
         adoquery1.parameters.ParamByName('a').Value:=Trim(edit1.text);
         Adoquery1.execsql;
         MessageBox(Handle, '密码修改成功！', '提示', MB_ICONEXCLAMATION);
         exit;

         end;
end;

end.
