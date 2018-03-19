unit zhuxiao_P;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, DB, ADODB;

type
  Tzhuxiao = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    BitBtn1: TBitBtn;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  zhuxiao: Tzhuxiao;
  ok:integer;
implementation
uses unit1;
{$R *.dfm}
procedure Tzhuxiao.BitBtn1Click(Sender: TObject);
begin
if (edit1.Text='') then
     begin
      application.MessageBox('请输入图书编号!','提示',0+64);
    end
  else
     begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('select * from dbo.图书信息,dbo.图书类型,dbo.书架信息,dbo.借阅室信息,dbo.图书书次信息 where (dbo.图书信息.图书编号=:a)'+'and (dbo.图书书次信息.图书类型编号=dbo.图书类型.图书类型编号) and (dbo.图书信息.书架编号=dbo.书架信息.书架编号) and (dbo.书架信息.借阅室编号=dbo.借阅室信息.借阅室编号) and (dbo.图书信息.索书号=dbo.图书书次信息.索书号)');
    adoquery1.parameters.ParamByName('a').Value:=Trim(edit1.Text);
    ADOQuery1.Open;
    ok:=ADOquery1.RecordCount;
    if ADOquery1.RecordCount=0 then
       application.MessageBox('未找到该图书！','提示',0+64);
end;
end;

procedure Tzhuxiao.BitBtn2Click(Sender: TObject);
 begin
  if (edit1.Text='') then
     begin
      application.MessageBox('请输入图书编号!','提示',0+64);
      Exit;
     end
     else if ok=0 then
     begin
       application.MessageBox('无可操作图书！','提示',0+64);
       end
  else if(RadioButton1.Checked=true) then
     begin
        if Application.MessageBox('确定注销该图书？','提示',MB_YESNO)=IDYES then
               begin
                 ADOQuery1.Close;
                 ADOQuery1.SQL.Clear;
                 Adoquery1.sql.add('update dbo.图书信息 set 图书状态=:b where 图书编号=:a');
                 adoquery1.parameters.ParamByName('a').Value:=Trim(edit1.Text);
                 adoquery1.parameters.ParamByName('b').Value:=Trim('不可借');
                 Adoquery1.execsql;;
                  application.MessageBox('注销成功！','提示',0+64);
                  edit1.clear;
           end;
     end
  else if(RadioButton2.Checked=true)  then
     begin
        if Application.MessageBox('确定为该图书恢复注销？','提示',MB_YESNO)=IDYES then
           begin
              ADOQuery1.Close;
                  ADOQuery1.SQL.Clear;
                 Adoquery1.sql.add('update dbo.图书信息 set 图书状态=:b where 图书编号=:a');
                 adoquery1.parameters.ParamByName('a').Value:=Trim(edit1.Text);
                 adoquery1.parameters.ParamByName('b').Value:=Trim('可借');
                 Adoquery1.execsql;;
                   application.MessageBox('恢复注销成功！','提示',0+64);
                  edit1.clear;
              end;
           end
end;

procedure Tzhuxiao.BitBtn3Click(Sender: TObject);
begin
close;
unit1.Menu.show;
end;

end.
