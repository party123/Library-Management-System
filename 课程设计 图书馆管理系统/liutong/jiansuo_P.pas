unit jiansuo_P;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, ADODB, DBCtrls, Mask,
  ExtCtrls,jpeg;

type
  Tjiansuo = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Label3: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGrid1: TDBGrid;
    Label5: TLabel;
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
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    Label18: TLabel;
    BitBtn7: TBitBtn;
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
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBMemo1: TDBMemo;
    DBEdit15: TDBEdit;
    Label19: TLabel;
    ADOConnection1: TADOConnection;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Image1: TImage;
    Label4: TLabel;
    Label20: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  jiansuo: Tjiansuo;

implementation
 uses unit1;
{$R *.dfm}
 procedure Tjiansuo.BitBtn1Click(Sender: TObject);
begin
  jiansuo.ADOQuery1.Close;
  jiansuo.ADOQuery1.SQL.Clear;
  jiansuo.ADOQuery1.SQL.Add('select * from dbo.book,dbo.book_type,dbo.room,dbo.book_shelf where dbo.book.bt_no=dbo.book_type.bt_no and dbo.book.bs_no=dbo.book_shelf.bs_no and dbo.book_shelf.room_no=dbo.room.room_no');
  jiansuo.ADOQuery1.Open;
  Label15.caption:=inttostr(jiansuo.ADOQuery1.recordcount);
  if Label15.caption='0' then
      application.MessageBox('未找到该图书!','提示',0+64);
end;
procedure Tjiansuo.BitBtn2Click(Sender: TObject);
begin
 close;
 unit1.Menu.show;
end;
//光标移动//
procedure Tjiansuo.BitBtn3Click(Sender: TObject);
begin
jiansuo.adoquery1.First;
end;

procedure Tjiansuo.BitBtn4Click(Sender: TObject);
begin
jiansuo.adoquery1.Prior;
end;

procedure Tjiansuo.BitBtn5Click(Sender: TObject);
begin
jiansuo.adoquery1.Next;
end;

procedure Tjiansuo.BitBtn6Click(Sender: TObject);
begin
jiansuo.adoquery1.Last;
end;
procedure Tjiansuo.BitBtn7Click(Sender: TObject);
begin
  jiansuo.ADOQuery1.Close;
  jiansuo.ADOQuery1.SQL.Clear;
  if  ComboBox1.Text = '图书编号' then
    begin
   if(RadioButton1.Checked=true) then
        begin
          jiansuo.ADOQuery1.SQL.Add('select * from dbo.book,dbo.book_type,dbo.room,dbo.book_shelf where dbo.book.b_id like :a and dbo.book_type.bt_no=dbo.book.bt_no and dbo.book.bs_no=dbo.book_shelf.bs_no and dbo.book_shelf.room_no=dbo.room.room_no' );
          ADOQuery1.parameters.ParamByName('a').Value:=Trim('%'+edit1.Text+'%');
        end
        else
        begin
    jiansuo.ADOQuery1.SQL.Add('select * from dbo.book,dbo.book_type,dbo.room,dbo.book_shelf where dbo.book.b_id=:a and dbo.book_type.bt_no=dbo.book.bt_no and dbo.book.bs_no=dbo.book_shelf.bs_no and dbo.book_shelf.room_no=dbo.room.room_no' );
    ADOQuery1.parameters.ParamByName('a').Value:=Trim(edit1.Text);
    end;
    jiansuo.ADOQuery1.Open;
    Label15.caption:=inttostr(jiansuo.ADOQuery1.recordcount);
    if Label15.caption='0' then
      begin
       application.MessageBox('未找到该图书!','提示',0+64);
       edit1.Clear;
       end;
   end
   else if ComboBox1.Text = '图书名称' then
    begin
    if(RadioButton1.Checked=true) then
        begin
          jiansuo.ADOQuery1.SQL.Add('select * from dbo.book,dbo.book_type,dbo.room,dbo.book_shelf where  dbo.book.b_name like :a and dbo.book_type.bt_no=dbo.book.bt_no and dbo.book.bs_no=dbo.book_shelf.bs_no and dbo.book_shelf.room_no=dbo.room.room_no' );
          ADOQuery1.parameters.ParamByName('a').Value:=Trim('%'+edit1.Text+'%');
        end
        else
        begin
      jiansuo.ADOQuery1.SQL.Add('select * from dbo.book,dbo.book_type,dbo.room,dbo.book_shelf where dbo.book.b_name=:a and dbo.book_type.bt_no=dbo.book.bt_no and dbo.book.bs_no=dbo.book_shelf.bs_no and dbo.book_shelf.room_no=dbo.room.room_no' );
      ADOQuery1.parameters.ParamByName('a').Value:=Trim(edit1.Text);
      end;
      jiansuo.ADOQuery1.Open;
      Label15.caption:=inttostr(jiansuo.ADOQuery1.recordcount);
      if Label15.caption='0' then
      begin
       application.MessageBox('未找到该图书!','提示',0+64);
       edit1.Clear;
       end;
    end
    else if ComboBox1.Text = '图书类型' then
    begin
    if(RadioButton1.Checked=true) then
        begin
          jiansuo.ADOQuery1.SQL.Add('select * from dbo.book,dbo.book_type,dbo.room,dbo.book_shelf where  dbo.book_type.bt_name  like :a and dbo.book_type.bt_no=dbo.book.bt_no and dbo.book.bs_no=dbo.book_shelf.bs_no and dbo.book_shelf.room_no=dbo.room.room_no' );
          ADOQuery1.parameters.ParamByName('a').Value:=Trim('%'+edit1.Text+'%');
        end
        else
        begin
      jiansuo.ADOQuery1.SQL.Add('select * from dbo.book,dbo.book_type,dbo.room,dbo.book_shelf where dbo.book_type.bt_name=:a and dbo.book_type.bt_no=dbo.book.bt_no and dbo.book.bs_no=dbo.book_shelf.bs_no and dbo.book_shelf.room_no=dbo.room.room_no' );
      ADOQuery1.parameters.ParamByName('a').Value:=Trim(edit1.Text);
      end;
      jiansuo.ADOQuery1.Open;
      Label15.caption:=inttostr(jiansuo.ADOQuery1.recordcount);
      if Label15.caption='0' then
        begin
       application.MessageBox('未找到该图书!','提示',0+64);
       edit1.Clear;
       end;
    end
    else if ComboBox1.Text = '出版社' then
    begin
    if(RadioButton1.Checked=true) then
        begin
          jiansuo.ADOQuery1.SQL.Add('select * from dbo.book,dbo.book_type,dbo.room,dbo.book_shelf where dbo.book.press like :a and dbo.book_type.bt_no=dbo.book.bt_no and dbo.book.bs_no=dbo.book_shelf.bs_no and dbo.book_shelf.room_no=dbo.room.room_no' );
          ADOQuery1.parameters.ParamByName('a').Value:=Trim('%'+edit1.Text+'%');
        end
        else
        begin
      jiansuo.ADOQuery1.SQL.Add('select * from dbo.book,dbo.book_type,dbo.room,dbo.book_shelf where dbo.book.press=:a and dbo.book_type.bt_no=dbo.book.bt_no and dbo.book.bs_no=dbo.book_shelf.bs_no and dbo.book_shelf.room_no=dbo.room.room_no' );
      ADOQuery1.parameters.ParamByName('a').Value:=Trim(edit1.Text);
      end;
      jiansuo.ADOQuery1.Open;
      Label15.caption:=inttostr(jiansuo.ADOQuery1.recordcount);
      if Label15.caption='0' then
         begin
       application.MessageBox('未找到该图书!','提示',0+64);
       edit1.Clear;
       end;
    end
    else if ComboBox1.Text = '作者' then
    begin
    if(RadioButton1.Checked=true) then
        begin
          jiansuo.ADOQuery1.SQL.Add('select * from dbo.book,dbo.book_type,dbo.room,dbo.book_shelf where dbo.book.writer like :a and dbo.book_type.bt_no=dbo.book.bt_no and dbo.book.bs_no=dbo.book_shelf.bs_no and dbo.book_shelf.room_no=dbo.room.room_no' );
          ADOQuery1.parameters.ParamByName('a').Value:=Trim('%'+edit1.Text+'%');
        end
        else
        begin
      jiansuo.ADOQuery1.SQL.Add('select * from dbo.book,dbo.book_type,dbo.room,dbo.book_shelf where dbo.book.writer=:a and dbo.book_type.bt_no=dbo.book.bt_no and dbo.book.bs_no=dbo.book_shelf.bs_no and dbo.book_shelf.room_no=dbo.room.room_no' );
      ADOQuery1.parameters.ParamByName('a').Value:=Trim(edit1.Text);
      end;
      jiansuo.ADOQuery1.Open;
      Label15.caption:=inttostr(jiansuo.ADOQuery1.recordcount);
      if Label15.caption='0' then
         begin
       application.MessageBox('未找到该图书!','提示',0+64);
       edit1.Clear;
       end;
    end
     else if ComboBox1.Text = '存放室' then
    begin
    if(RadioButton1.Checked=true) then
        begin
          jiansuo.ADOQuery1.SQL.Add('select * from dbo.book,dbo.book_type,dbo.room,dbo.book_shelf where dbo.room.room_name like :a and dbo.book_type.bt_no=dbo.book.bt_no and dbo.book.bs_no=dbo.book_shelf.bs_no and dbo.book_shelf.room_no=dbo.room.room_no' );
          ADOQuery1.parameters.ParamByName('a').Value:=Trim('%'+edit1.Text+'%');
        end
        else
        begin
      jiansuo.ADOQuery1.SQL.Add('select * from dbo.book,dbo.book_type,dbo.room,dbo.book_shelf where dbo.room.room_name=:a and dbo.book_type.bt_no=dbo.book.bt_no and dbo.book.bs_no=dbo.book_shelf.bs_no and dbo.book_shelf.room_no=dbo.room.room_no' );
      ADOQuery1.parameters.ParamByName('a').Value:=Trim(edit1.Text);
      end;
      jiansuo.ADOQuery1.Open;
      Label15.caption:=inttostr(jiansuo.ADOQuery1.recordcount);
      if Label15.caption='0' then
         begin
       application.MessageBox('未找到该图书!','提示',0+64);
       edit1.Clear;
       end;
    end
     else if ComboBox1.Text = '书架' then
    begin
     if(RadioButton1.Checked=true) then
        begin
          jiansuo.ADOQuery1.SQL.Add('select * from dbo.book,dbo.book_type,dbo.room,dbo.book_shelf where dbo.book_shelf.bs_name like :a and dbo.book_type.bt_no=dbo.book.bt_no and dbo.book.bs_no=dbo.book_shelf.bs_no and dbo.book_shelf.room_no=dbo.room.room_no' );
          ADOQuery1.parameters.ParamByName('a').Value:=Trim('%'+edit1.Text+'%');
        end
      else
        begin
      jiansuo.ADOQuery1.SQL.Add('select * from dbo.book,dbo.book_type,dbo.room,dbo.book_shelf where dbo.book_shelf.bs_name=:a and dbo.book_type.bt_no=dbo.book.bt_no and dbo.book.bs_no=dbo.book_shelf.bs_no and dbo.book_shelf.room_no=dbo.room.room_no' );
      ADOQuery1.parameters.ParamByName('a').Value:=Trim(edit1.Text);
      end;
      jiansuo.ADOQuery1.Open;
      Label15.caption:=inttostr(jiansuo.ADOQuery1.recordcount);
      if Label15.caption='0' then
       begin
       application.MessageBox('未找到该图书!','提示',0+64);
       edit1.Clear;
       end;
    end
end;

procedure Tjiansuo.DBEdit1Change(Sender: TObject);
var
  Stream:TMemoryStream;
  bmp:TBitmap;
  jpg:TJpegImage; //jpg图片信息
  Buffer:word;
begin
  if not ADOQuery1.FieldByName('b_p').IsNull then
  begin
  label20.Caption:='';
    Stream:=TMemoryStream.Create;
          jpg:=TJpegImage.Create;
          TBlobField(ADOQuery1.FieldByName('b_p')).SaveToStream(Stream);    // 显示的转换为BlobField并保存到内存流
          Stream.Position :=0;
          if Stream.size=0 then
            begin
              label20.Caption:='   未 找 到 图 片';
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
  label20.Caption:='   未 找 到 图 片';
  end;
end;


end.
