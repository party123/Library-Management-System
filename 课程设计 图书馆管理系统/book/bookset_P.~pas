unit bookset_P;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, Buttons, DB, ADODB, Mask,
  DBCtrls,jpeg;

type
  Tbookset = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Label4: TLabel;
    Edit2: TEdit;
    Label5: TLabel;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    DBEdit1: TDBEdit;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBMemo1: TDBMemo;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    Label21: TLabel;
    Image1: TImage;
    Label22: TLabel;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  bookset: Tbookset;

implementation
uses unit1,bookadd_P,bookxiu_P;
{$R *.dfm}

//光标移动//
procedure Tbookset.BitBtn4Click(Sender: TObject);
begin
adoquery1.First;
end;

procedure Tbookset.BitBtn5Click(Sender: TObject);
begin
adoquery1.Prior;
end;

procedure Tbookset.BitBtn6Click(Sender: TObject);
begin
adoquery1.Next;
end;

procedure Tbookset.BitBtn7Click(Sender: TObject);
begin
adoquery1.Last;
end;

//添加按键//
procedure Tbookset.BitBtn8Click(Sender: TObject);
begin
if bookadd= nil then
    bookadd:= Tbookadd.Create(Self);
    bookadd.ShowModal;
end;
//修改按键//
procedure Tbookset.BitBtn9Click(Sender: TObject);
begin
if adoquery1.recordcount=0 then
begin
application.messagebox('列表为空!','提示',0+64);
end
else
begin
if bookxiu= nil then
    bookxiu:= Tbookxiu.Create(Self);
    bookxiu.ShowModal;
    end;
end;
//删除按键//
procedure Tbookset.BitBtn10Click(Sender: TObject);
begin
if adoquery1.recordcount=0 then
begin
application.messagebox('列表为空!','提示',0+64);
end
else
begin
      ADOQuery3.Close;
      ADOQuery3.SQL.Clear;
      ADOQuery3.SQL.Add('select * from dbo.lend where b_id=:a');
      ADOQuery3.parameters.ParamByName('a').Value:=Trim(dbedit1.Text);
      ADOQuery3.Open;
      if ADOQuery3.eof=false then
     begin
     application.MessageBox('该书未全部归还!','提示',0+64);
     end
else
begin
if Application.MessageBox('确定删除该图书？','提示',MB_YESNO)=IDYES then
   begin
      ADOQuery2.Close;
      ADOQuery2.SQL.Clear;
      ADOQuery2.SQL.Add('delete from dbo.lend where b_id=:a');
      ADOQuery2.parameters.ParamByName('a').Value:=Trim(dbedit1.Text);
      ADOQuery2.SQL.Add('delete from dbo.book where b_id=:b');
      ADOQuery2.parameters.ParamByName('b').Value:=Trim(dbEdit1.Text);
      ADOQuery2.ExecSQL;
      application.MessageBox('删除成功!','提示',0+64);
      label2.Caption:=inttostr( bookset.ADOQuery1.RecordCount);
   end;
   end;
   end;
   end;
//查询按键//
procedure Tbookset.BitBtn11Click(Sender: TObject);
begin
      edit1.Clear;
      edit2.Clear;
      edit3.Clear;
      ADOQuery1.Close;
      ADOQuery1.SQL.Clear;
      ADOQuery1.SQL.Add('select * from dbo.book,dbo.book_type,dbo.book_shelf,dbo.room where (dbo.book.bt_no=dbo.book_type.bt_no) and (dbo.book.bs_no=dbo.book_shelf.bs_no) and (dbo.book_shelf.room_no=dbo.room.room_no)');
      ADOQuery1.Open;
      label2.Caption:=inttostr(bookset.ADOQuery1.RecordCount);
 end;
procedure Tbookset.BitBtn12Click(Sender: TObject);
begin
close;
unit1.Menu.show;
end;

procedure Tbookset.BitBtn1Click(Sender: TObject);
begin
edit2.clear;
edit3.clear;
if (edit1.Text='') then
     begin
      application.MessageBox('请输入图书编号!','提示',0+64);
    end
  else
     begin
      ADOQuery1.Close;
      ADOQuery1.SQL.Clear;
      ADOQuery1.SQL.Add('select * from dbo.book,dbo.book_type,dbo.book_shelf,dbo.room where (dbo.book.b_id=:a) and (dbo.book.bt_no=dbo.book_type.bt_no) and (dbo.book.bs_no=dbo.book_shelf.bs_no) and (dbo.book_shelf.room_no=dbo.room.room_no)');
      ADOQuery1.parameters.ParamByName('a').Value:=Trim(edit1.Text);
      ADOQuery1.Open;
      if ADOquery1.RecordCount=0 then
       application.MessageBox('未找到该图书！','提示',0+64);
      label2.Caption:=inttostr(bookset.ADOQuery1.RecordCount);
end;
end;
procedure Tbookset.BitBtn2Click(Sender: TObject);
begin
edit1.clear;
edit3.clear;
  if (edit2.Text='') then
     begin
      application.MessageBox('请输入图书名称!','提示',0+64);
    end
  else
     begin
      ADOQuery1.Close;
      ADOQuery1.SQL.Clear;
      ADOQuery1.SQL.Add('select * from dbo.book,dbo.book_type,dbo.book_shelf,dbo.room where (dbo.book.b_name=:a) and (dbo.book.bt_no=dbo.book_type.bt_no) and (dbo.book.bs_no=dbo.book_shelf.bs_no) and (dbo.book_shelf.room_no=dbo.room.room_no)');
      ADOQuery1.parameters.ParamByName('a').Value:=Trim(edit2.Text);
      ADOQuery1.Open;
      if ADOquery1.RecordCount=0 then
       application.MessageBox('未找到该图书！','提示',0+64);
      label2.Caption:=inttostr(bookset.ADOQuery1.RecordCount);
end;
end;

procedure Tbookset.BitBtn3Click(Sender: TObject);
begin
edit1.clear;
edit2.clear;
  if (edit3.Text='') then
     begin
      application.MessageBox('请输入图书类型!','提示',0+64);
    end
  else
     begin
      ADOQuery1.Close;
      ADOQuery1.SQL.Clear;
      ADOQuery1.SQL.Add('select * from dbo.book,dbo.book_type,dbo.book_shelf,dbo.room where (dbo.book_type.bt_name=:a) and (dbo.book.bt_no=dbo.book_type.bt_no) and (dbo.book.bs_no=dbo.book_shelf.bs_no) and (dbo.book_shelf.room_no=dbo.room.room_no)');
      ADOQuery1.parameters.ParamByName('a').Value:=Trim(edit3.Text);
      ADOQuery1.Open;
      if ADOquery1.RecordCount=0 then
       application.MessageBox('未找到该图书！','提示',0+64);
      label2.Caption:=inttostr(bookset.ADOQuery1.RecordCount);
end;
end;
//打开图片

procedure Tbookset.DBEdit1Change(Sender: TObject);
var
  Stream:TMemoryStream;
  bmp:TBitmap;
  jpg:TJpegImage; //jpg图片信息
  Buffer:word;
begin
  if not ADOQuery1.FieldByName('b_p').IsNull then
  begin
  label22.Caption:='';
    Stream:=TMemoryStream.Create;
          jpg:=TJpegImage.Create;
          TBlobField(ADOQuery1.FieldByName('b_p')).SaveToStream(Stream);    // 显示的转换为BlobField并保存到内存流
          Stream.Position :=0;
          if Stream.size=0 then
            begin
              label22.Caption:='   未 找 到 照 片';
            end
          else
            begin
              Stream.ReadBuffer(Buffer,2);
              if Buffer=$4D42 then
                begin
                  bmp:=TBitmap.create;
                  Stream.Position :=0;
                  bmp.LoadFromStream(Stream);    // 加载图片
                  image1.Picture.Assign(bmp);
                end
              else if Buffer=$D8FF then
                begin
                  //showmessage('JPG');
                  jpg:=TJpegImage.Create;
                  Stream.Position :=0;
                  jpg.LoadFromStream(Stream);    // 加载图片
                  image1.Picture.Assign(jpg);
                end;
            end;
  end
  else
  begin
  image1.Picture :=nil;
  label22.Caption:='   未 找 到 照 片';
  end;
end;

end.
