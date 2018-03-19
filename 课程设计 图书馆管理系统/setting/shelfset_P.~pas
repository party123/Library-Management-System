unit shelfset_P;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, Buttons, DB, ADODB, Mask,
  DBCtrls;

type
  Tshelfset = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBGrid1: TDBGrid;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit5: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  shelfset: Tshelfset;

implementation
uses unit1,shelfadd_P,shelfxiu_P;
{$R *.dfm}
//返回按键//
procedure Tshelfset.BitBtn9Click(Sender: TObject);
begin
 close;
 unit1.Menu.show;
end;
//查询按键//
procedure Tshelfset.BitBtn1Click(Sender: TObject);
begin
 if (edit5.Text='') then
     begin
      shelfset.ADOQuery1.Close;
      shelfset.ADOQuery1.SQL.Clear;
      shelfset.ADOQuery1.SQL.Add('select * from dbo.book_shelf,dbo.room where dbo.book_shelf.room_no=dbo.room.room_no');
      shelfset.ADOQuery1.Open;
      label6.Caption:=inttostr(shelfset.ADOQuery1.RecordCount);
    end
  else
     begin
     shelfset.ADOQuery1.Close;
      shelfset.ADOQuery1.SQL.Clear;
       shelfset.ADOQuery1.SQL.Add('select * from dbo.book_shelf,dbo.room where (dbo.book_shelf.room_no=dbo.room.room_no) and dbo.book_shelf.bs_no='+''''+edit5.Text+'''');
          shelfset.ADOQuery1.Open;
       label6.Caption:=inttostr(shelfset.ADOQuery1.RecordCount);
       if ADOQuery1.recordcount=0 then
    application.MessageBox('未找到该书架!','提示',0+64);
    end;
 end;

//光标移动//
procedure Tshelfset.BitBtn2Click(Sender: TObject);
begin
shelfset.adoquery1.First;
end;

procedure Tshelfset.BitBtn3Click(Sender: TObject);
begin
shelfset.adoquery1.Prior;
end;

procedure Tshelfset.BitBtn4Click(Sender: TObject);
begin
shelfset.adoquery1.Next;
end;

procedure Tshelfset.BitBtn5Click(Sender: TObject);
begin
shelfset.adoquery1.Last;
end;
//删除按键//
procedure Tshelfset.BitBtn8Click(Sender: TObject);
begin
    if ADOQuery1.recordcount=0 then
    begin
    application.MessageBox('列表为空!','提示',0+64);
    end
    else
    begin
      ADOQuery3.Close;
      ADOQuery3.SQL.Clear;
      ADOQuery3.SQL.Add('select * from dbo.book where bs_no=:a');
      ADOQuery3.parameters.ParamByName('a').Value:=Trim(dbedit1.Text);
      ADOQuery3.Open;
     if ADOQuery3.Eof=false then
     begin
        application.MessageBox('该书架存在图书!','提示',0+64);
        end
        else begin
if Application.MessageBox('确定删除该书架？','提示',MB_YESNO)=IDYES then
   begin
      ADOQuery2.Close;
      ADOQuery2.SQL.Clear;
      ADOQuery2.SQL.Add('delete from dbo.book where bs_no=:a');
      ADOQuery2.parameters.ParamByName('a').Value:=Trim(dbedit1.Text);
      ADOQuery2.SQL.Add('delete from dbo.book_shelf where bs_no=:b');
      ADOQuery2.parameters.ParamByName('b').Value:=Trim(dbEdit1.Text);
      ADOQuery2.ExecSQL;
      application.MessageBox('删除成功!','提示',0+64);
      label6.Caption:=inttostr(shelfset.ADOQuery1.RecordCount);
      end;
      end;
   end;
end;
//添加按键//
procedure Tshelfset.BitBtn6Click(Sender: TObject);
begin
 if shelfadd= nil then
    shelfadd:= Tshelfadd.Create(Self);
    shelfadd.ShowModal;
end;
//修改按键//
procedure Tshelfset.BitBtn7Click(Sender: TObject);
begin
 if ADOQuery1.recordcount=0 then
 begin
    application.MessageBox('列表为空!','提示',0+64);
    end
    else
    begin
 if shelfxiu= nil then
    shelfxiu:= Tshelfxiu.Create(Self);
    shelfxiu.ShowModal;
    end;
end;

end.
