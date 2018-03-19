unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, Menus, StdCtrls, Buttons,shellapi;

type
  TMenu = class(TForm)
    Image1: TImage;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    N9: TMenuItem;
    Y1: TMenuItem;
    Z1: TMenuItem;
    X1: TMenuItem;
    Y2: TMenuItem;
    Z2: TMenuItem;
    W1: TMenuItem;
    X2: TMenuItem;
    Z3: TMenuItem;
    Z4: TMenuItem;
    W2: TMenuItem;
    X3: TMenuItem;
    Y3: TMenuItem;
    Z5: TMenuItem;
    X4: TMenuItem;
    Y4: TMenuItem;
    Z6: TMenuItem;
    X5: TMenuItem;
    Z8: TMenuItem;
    Label1: TLabel;
    Label5: TLabel;
    Timer1: TTimer;
    Label6: TLabel;
    N5: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    SpeedButton7: TSpeedButton;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure X5Click(Sender: TObject);
    procedure Z8Click(Sender: TObject);
    procedure W1Click(Sender: TObject);
    procedure X2Click(Sender: TObject);
    procedure Z3Click(Sender: TObject);
    procedure Z4Click(Sender: TObject);
    procedure X1Click(Sender: TObject);
    procedure Z2Click(Sender: TObject);
    procedure Y2Click(Sender: TObject);
    procedure X4Click(Sender: TObject);
    procedure Z6Click(Sender: TObject);
    procedure Y4Click(Sender: TObject);
    procedure Z5Click(Sender: TObject);
    procedure X3Click(Sender: TObject);
    procedure Y3Click(Sender: TObject);
    procedure TimeTimer(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure Y1Click(Sender: TObject);
    procedure Z1Click(Sender: TObject);
    procedure W2Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Menu: TMenu;

implementation
uses main,jiansuo_P,jieyue_P,guihuan_P,xujie_P,fakuan_P,about_P,readertype_P,guashi_P,readerdang_P,
roomset_P,mima_P,shelfset_P,jieyuepai_P,chaoqi_P,jiechu_P,booktype_P,bookset_P,zhuxiao_P,admainset_P,mibao_P;
{$R *.dfm}
//时间显示//
procedure TMenu.TimeTimer(Sender: TObject);
begin
     Label1.Caption:=DatetimetoStr(now);
     Label5.Caption:=main.frmMain.edit1.Text;
     Label6.Caption:=main.frmMain.combobox1.Text;
end;
//功能键//
procedure TMenu.SpeedButton1Click(Sender: TObject);
begin
    unit1.Menu.hide;
    if jiansuo= nil then
    jiansuo:= Tjiansuo.Create(Self);
    jiansuo.ShowModal;
end;

procedure TMenu.SpeedButton2Click(Sender: TObject);
begin
  unit1.Menu.hide;
   if jieyue= nil then
    jieyue:= Tjieyue.Create(Self);
    jieyue.ShowModal;
end;

procedure TMenu.SpeedButton3Click(Sender: TObject);
begin
    unit1.Menu.hide;
    if guihuan= nil then
    guihuan:= Tguihuan.Create(Self);
    guihuan.ShowModal;
end;

procedure TMenu.SpeedButton4Click(Sender: TObject);
begin
    unit1.Menu.hide;
    if xujie= nil then
    xujie:= Txujie.Create(Self);
    xujie.ShowModal;
end;

procedure TMenu.SpeedButton5Click(Sender: TObject);
begin
    unit1.Menu.hide;
    if fakuan= nil then
    fakuan:= Tfakuan.Create(Self);
    fakuan.ShowModal;
end;

procedure TMenu.SpeedButton6Click(Sender: TObject);
begin
    close;
end;
procedure TMenu.X5Click(Sender: TObject);
begin
if about= nil then
    about:= Tabout.Create(Self);
    about.ShowModal;
end;

procedure TMenu.Z8Click(Sender: TObject);
begin
if Application.MessageBox('确定退出系统？','提示',MB_YESNO)=IDYES then
close;
end;

procedure TMenu.W1Click(Sender: TObject);
begin
    unit1.Menu.hide;
    if jieyue= nil then
    jieyue:= Tjieyue.Create(Self);
    jieyue.ShowModal;
end;

procedure TMenu.X2Click(Sender: TObject);
begin
    unit1.Menu.hide;
    if guihuan= nil then
    guihuan:= Tguihuan.Create(Self);
    guihuan.ShowModal;
end;

procedure TMenu.Z3Click(Sender: TObject);
begin
    unit1.Menu.hide;
    if xujie= nil then
    xujie:= Txujie.Create(Self);
    xujie.ShowModal;
end;

procedure TMenu.Z4Click(Sender: TObject);
begin
    unit1.Menu.hide;
    if fakuan= nil then
    fakuan:= Tfakuan.Create(Self);
    fakuan.ShowModal;
end;

procedure TMenu.X1Click(Sender: TObject);
begin
unit1.Menu.hide;
if readertype= nil then
    readertype:= Treadertype.Create(Self);
    readertype.ShowModal;
end;

procedure TMenu.Z2Click(Sender: TObject);
begin
unit1.Menu.hide;
if guashi= nil then
    guashi:= Tguashi.Create(Self);
    guashi.ShowModal;
end;

procedure TMenu.Y2Click(Sender: TObject);
begin
unit1.Menu.hide;
if readerdang= nil then
    readerdang:= Treaderdang.Create(Self);
    readerdang.ShowModal;
end;

procedure TMenu.X4Click(Sender: TObject);
begin
unit1.Menu.hide;
if roomset= nil then
    roomset:= Troomset.Create(Self);
    roomset.ShowModal;
end;

procedure TMenu.Z6Click(Sender: TObject);
begin
unit1.Menu.hide;
if mima= nil then
    mima:= Tmima.Create(Self);
    mima.ShowModal;
end;

procedure TMenu.Y4Click(Sender: TObject);
begin
unit1.Menu.hide;
if shelfset= nil then
    shelfset:= Tshelfset.Create(Self);
    shelfset.ShowModal;
end;

procedure TMenu.Z5Click(Sender: TObject);
begin
unit1.Menu.Hide;
if jieyuepai= nil then
    jieyuepai:= Tjieyuepai.Create(Self);
    jieyuepai.ShowModal;
end;

procedure TMenu.X3Click(Sender: TObject);
begin
unit1.Menu.hide;
if chaoqi= nil then
    chaoqi:= Tchaoqi.Create(Self);
    chaoqi.ShowModal;
end;

procedure TMenu.Y3Click(Sender: TObject);
begin
unit1.Menu.hide;
if jiechu= nil then
   jiechu:= Tjiechu.Create(Self);
   jiechu.ShowModal;
end;

procedure TMenu.N5Click(Sender: TObject);
begin
close;
main.frmMain.show;
main.frmMain.edit1.Text:='';
main.frmMain.edit2.Text:='';
main.frmMain.combobox1.Text:='';
end;

procedure TMenu.N9Click(Sender: TObject);
begin
unit1.Menu.hide;
 if booktype= nil then
   booktype:= Tbooktype.Create(Self);
   booktype.ShowModal;
end;

procedure TMenu.Y1Click(Sender: TObject);
begin
unit1.Menu.hide;
   if bookset= nil then
   bookset:= Tbookset.Create(Self);
   bookset.ShowModal;
end;

procedure TMenu.Z1Click(Sender: TObject);
begin
   unit1.Menu.hide;
   if zhuxiao= nil then
   zhuxiao:= Tzhuxiao.Create(Self);
   zhuxiao.ShowModal;
end;

procedure TMenu.W2Click(Sender: TObject);
begin
    unit1.Menu.hide;
   if jiansuo= nil then
   jiansuo:= Tjiansuo.Create(Self);
   jiansuo.ShowModal;
end;

procedure TMenu.N10Click(Sender: TObject);
begin
  if main.frmMain.combobox1.Text='员工' then
  begin
  application.MessageBox('您没有此权限！','提示',0+64);
  end
  else
  begin
   unit1.Menu.hide;
   if admainset= nil then
   admainset:= Tadmainset.Create(Self);
   admainset.ShowModal;
   end;
end;

procedure TMenu.N11Click(Sender: TObject);
begin
   unit1.Menu.hide;
   if mibao= nil then
   mibao:= Tmibao.Create(Self);
   mibao.ShowModal;
end;

procedure TMenu.SpeedButton7Click(Sender: TObject);
begin
if Application.MessageBox('确定退出系统？','提示',MB_YESNO)=IDYES then
close;
end;

procedure TMenu.N14Click(Sender: TObject);
begin
ShellExecute(Handle, nil, 'NOTEPAD.EXE', nil, nil, SW_SHOW);
end;

procedure TMenu.N13Click(Sender: TObject);
begin
  ShellExecute(Handle, nil, 'Calc.EXE', nil, nil, SW_SHOW);
end;

end.
