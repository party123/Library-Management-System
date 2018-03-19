unit guashi_P;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Mask, DBCtrls, StdCtrls, Buttons;

type
  Tguashi = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  guashi: Tguashi;
  ok:integer;
implementation
 uses unit1;
{$R *.dfm}

procedure Tguashi.BitBtn3Click(Sender: TObject);
begin
if (edit1.Text='') then
     begin
      application.MessageBox('请输入读者编号!','提示',0+64);
    end
  else
     begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('select * from dbo.读者信息,dbo.读者类型 '+'where dbo.读者类型.读者编号='+''''+edit1.Text+''' and dbo.读者信息.读者类型编号=dbo.读者类型.读者类型编号');
    ADOQuery1.Open;
    ok:=ADOQuery1.recordcount;
    if ADOQuery1.recordcount=0 then
     application.MessageBox('未找到该读者!','提示',0+64);
end;
end;
procedure Tguashi.BitBtn2Click(Sender: TObject);
begin
close;
unit1.Menu.show;
end;

procedure Tguashi.BitBtn1Click(Sender: TObject);
 begin
  if (edit1.Text='') then
     begin
      application.MessageBox('请输入读者编号!','提示',0+64);
      Exit;
     end
     else if ok=0 then
     begin
      application.MessageBox('不存在可操作的读者!','提示',0+64);
      end
  else if(RadioButton1.Checked=true) then
     begin
        if Application.MessageBox('确定挂失该读者？','提示',MB_YESNO)=IDYES then
               begin
                 ADOQuery1.Close;
                 ADOQuery1.SQL.Clear;
                 Adoquery1.sql.add('update dbo.读者信息 set 读者状态=:b where 读者编号=:a');
                 adoquery1.parameters.ParamByName('a').Value:=Trim(edit1.Text);
                 adoquery1.parameters.ParamByName('b').Value:=Trim('挂失');
                 Adoquery1.execsql;;
                   application.MessageBox('挂失成功!','提示',0+64);
                  edit1.clear;
           end;
     end
  else if(RadioButton2.Checked=true)  then
     begin
        if Application.MessageBox('确定为该读者解除挂失？','提示',MB_YESNO)=IDYES then
           begin
              ADOQuery1.Close;
                  ADOQuery1.SQL.Clear;
                 Adoquery1.sql.add('update dbo.读者信息 set 读者状态=:b where 读者编号=:a');
                 adoquery1.parameters.ParamByName('a').Value:=Trim(edit1.Text);
                 adoquery1.parameters.ParamByName('b').Value:=Trim('正常');
                 Adoquery1.execsql;;
                   application.MessageBox('解除挂失成功!','提示',0+64);
                  edit1.clear;
              end;
           end
end;

end.
