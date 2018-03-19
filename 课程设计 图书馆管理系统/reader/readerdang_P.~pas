unit readerdang_P;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, DB, ADODB, Mask, DBCtrls,
  Buttons,jpeg;

type
  Treaderdang = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DBEdit1: TDBEdit;
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
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Edit1: TEdit;
    Label15: TLabel;
    Edit2: TEdit;
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
    ADOQuery2: TADOQuery;
    Label16: TLabel;
    Image1: TImage;
    ADOQuery3: TADOQuery;
    Label17: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  readerdang: Treaderdang;

implementation
uses unit1,readeradd_P,readerxiu_P;
{$R *.dfm}
//退出按键//
procedure Treaderdang.BitBtn11Click(Sender: TObject);
begin
 close;
 unit1.Menu.show;
end;
//编号搜索按键//
procedure Treaderdang.BitBtn1Click(Sender: TObject);
begin
  edit2.clear;
 if (edit1.Text='') then
     begin
      application.MessageBox('请输入读者编号!','提示',0+64);
    end
  else
     begin
     readerdang.ADOQuery1.Close;
      readerdang.ADOQuery1.SQL.Clear;
       readerdang.ADOQuery1.SQL.Add('select * from dbo.reader_type,dbo.reader '+'where r_id='+''''+edit1.Text+''' and dbo.reader.rt_no=dbo.reader_type.rt_no');
          readerdang.ADOQuery1.Open;
          if ADOQuery1.recordcount=0 then
          application.MessageBox('未找到该读者!','提示',0+64);
       label13.Caption:=inttostr(readerdang.ADOQuery1.RecordCount);
    end;
 end;

//光标移动//
procedure Treaderdang.BitBtn3Click(Sender: TObject);
begin
readerdang.adoquery1.First;
end;

procedure Treaderdang.BitBtn4Click(Sender: TObject);
begin
readerdang.adoquery1.Prior;
end;

procedure Treaderdang.BitBtn5Click(Sender: TObject);
begin
readerdang.adoquery1.Next;
end;

procedure Treaderdang.BitBtn6Click(Sender: TObject);
begin
readerdang.adoquery1.Last;
end;
//删除按键//
procedure Treaderdang.BitBtn9Click(Sender: TObject);
begin
if adoquery1.recordcount=0 then
begin
application.Messagebox('列表为空!','提示',0+64);
end
else
if (strtoint(dbedit10.Text)>0) then
begin
     application.MessageBox('该读者有未还图书!','提示',0+64);
     end
else
begin
if Application.MessageBox('确定删除该类型？','提示',MB_YESNO)=IDYES then
   begin
      ADOQuery2.Close;
      ADOQuery2.SQL.Clear;
      ADOQuery2.SQL.Add('delete from dbo.lend where r_id=:a');
      ADOQuery2.parameters.ParamByName('a').Value:=Trim(dbedit1.Text);
      ADOQuery2.SQL.Add('delete from dbo.reader where r_id=:b');
      ADOQuery2.parameters.ParamByName('b').Value:=Trim(dbEdit1.Text);
      ADOQuery2.ExecSQL;
      application.MessageBox('删除成功!','提示',0+64);
      label13.Caption:=inttostr(readerdang.ADOQuery1.RecordCount);
   end;
   end;
end;
//全部显示//
procedure Treaderdang.BitBtn10Click(Sender: TObject);
begin
     edit1.clear;
     edit2.clear;
    readerdang.ADOQuery1.Close;
      readerdang.ADOQuery1.SQL.Clear;
      readerdang.ADOQuery1.SQL.Add('select * from dbo.reader,dbo.reader_type where dbo.reader.rt_no=dbo.reader_type.rt_no');
      readerdang.ADOQuery1.Open;
      label13.Caption:=inttostr(readerdang.ADOQuery1.RecordCount);
      end;
procedure Treaderdang.BitBtn7Click(Sender: TObject);
begin
if readeradd= nil then
    readeradd:= Treaderadd.Create(Self);
    readeradd.ShowModal;
end;

procedure Treaderdang.BitBtn8Click(Sender: TObject);
begin
if adoquery1.recordcount=0 then
begin
application.Messagebox('列表为空!','提示',0+64);
end
else
begin
if readerxiu= nil then
    readerxiu:= Treaderxiu.Create(Self);
    readerxiu.ShowModal;
end;
end;

procedure Treaderdang.BitBtn2Click(Sender: TObject);
begin
edit1.clear;
if (edit2.Text='') then
     begin
      application.MessageBox('请输入读者姓名!','提示',0+64);
    end
  else
     begin
     readerdang.ADOQuery1.Close;
      readerdang.ADOQuery1.SQL.Clear;
       readerdang.ADOQuery1.SQL.Add('select * from dbo.reader_type,dbo.reader '+'where r_name='+''''+edit2.Text+''' and dbo.reader.rt_no=dbo.reader_type.rt_no');
          readerdang.ADOQuery1.Open;
          if ADOQuery1.recordcount=0 then
          application.MessageBox('未找到该读者!','提示',0+64);
       label13.Caption:=inttostr(readerdang.ADOQuery1.RecordCount);
    end;
end;
//显示照片

procedure Treaderdang.DBEdit1Change(Sender: TObject);
var
  Stream:TMemoryStream;
  bmp:TBitmap;
  jpg:TJpegImage; //jpg图片信息
  Buffer:word;
begin
  if not ADOQuery1.FieldByName('r_p').IsNull then
  begin
  label17.Caption:='';
    Stream:=TMemoryStream.Create;
          jpg:=TJpegImage.Create;
          TBlobField(ADOQuery1.FieldByName('r_p')).SaveToStream(Stream);    // 显示的转换为BlobField并保存到内存流
          Stream.Position :=0;
          if Stream.size=0 then
            begin
              label17.Caption:='   未 找 到 照 片';
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
  label17.Caption:='   未 找 到 照 片';
  end;
end;

end.
