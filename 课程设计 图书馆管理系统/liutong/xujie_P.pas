unit xujie_P;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB, ADODB, Mask,
  DBCtrls,dateutils;

type
  Txujie = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit6: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    ADOConnection2: TADOConnection;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    DBGrid2: TDBGrid;
    BitBtn5: TBitBtn;
    Label10: TLabel;
    Label11: TLabel;
    ADOQuery3: TADOQuery;
    ADOQuery4: TADOQuery;
    ADOQuery5: TADOQuery;
    DataSource3: TDataSource;
    Timer1: TTimer;
    procedure Formshow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  xujie: Txujie;
  bookcount:integer;
  xjcs:integer;
  tt:integer;
implementation
uses unit1;
{$R *.dfm}
procedure Txujie.Formshow(Sender: TObject);
begin
  label8.Caption:='0';
  edit1.clear;
  edit6.clear;
  ADOQuery1.Close;
  ADOQuery2.Close;
  ADOQuery3.Close;
  ADOQuery4.Close;
  ADOQuery5.Close;
  end;
procedure Txujie.BitBtn2Click(Sender: TObject);
begin
         ADOQuery4.Close;
         ADOQuery4.SQL.Clear;
         ADOQuery4.SQL.Add('delete from dbo.xbook_id');
         ADOQuery4.ExecSQL;
 close;
 unit1.Menu.show;
end;

procedure Txujie.BitBtn4Click(Sender: TObject);
begin
if (edit1.Text='') then
 begin
 application.MessageBox('请输入读者编号!','提示',0+64);
 end
 else
 begin
 //删除xbook_id
 ADOQuery2.Close;
 ADOQuery2.SQL.Clear;
 ADOQuery2.SQL.Add('delete from dbo.xbook_id');
 ADOQuery2.ExecSQL;
 //显示读者信息
 ADOQuery1.Close;
 ADOQuery1.SQL.Clear;
 ADOQuery1.SQL.Add('select * from dbo.reader,dbo.reader_type where (dbo.reader.r_id=:a) and (dbo.reader.rt_no=dbo.reader_type.rt_no) ');
 ADOQuery1.parameters.ParamByName('a').Value:=Trim(edit1.Text);
 ADOQuery1.Open;
 xjcs:=strtoint(ADOQuery1.fieldbyname('xjcs').AsString);
 if ADOQuery1.recordCount=0 then
 begin
   application.MessageBox('未找到该读者!','提示',0+64);
   end
   else
   begin
  //显示图书信息
      ADOQuery2.Close;
      ADOQuery2.SQL.Clear;
      ADOQuery2.SQL.Add('select * from dbo.book,dbo.lend,dbo.reader,dbo.reader_type where (dbo.reader.r_id=:a) and (dbo.reader.rt_no=dbo.reader_type.rt_no) and '+'(dbo.lend.r_id=dbo.reader.r_id) and (dbo.lend.b_id=dbo.book.b_id) and (dbo.lend.l_no not in (select l_no from dbo.r_book))');
      ADOQuery2.parameters.ParamByName('a').Value:=Trim(edit1.Text);
      ADOQuery2.Open;
      if ADOQuery2.Eof=true then
        begin
          bookcount:=0;
    application.MessageBox('未找到该读者借阅信息!','提示',0+64);
     end
      else
         bookcount:=ADOQuery2.RecordCount;
         end;
end;
end;
//搜索想要续借的图书
procedure Txujie.BitBtn3Click(Sender: TObject);
var
  I:integer;
  j:integer;
  count:integer;
  temp1:string;
begin
count:=0;
  if (edit6.Text='') then
 begin
 application.MessageBox('请输入图书编号!','提示',0+64);
 end
 else
 begin
 j:=bookcount;      //DBGrid1记录数
      //判断是否有借该图书
      for I:=1 to j do
      begin
        ADOQuery2.RecNo:=I;
        temp1:=DBGrid1.Fields[1].DisplayText;
        if temp1=edit6.text then
          break;
      end;
      if i>j then
        begin
         application.MessageBox('该读者未借此书!','提示',0+64);
          edit6.Text:='';
        end
 else
 begin
      ADOQuery4.Close;
          ADOQuery4.SQL.Clear;
          //ADOQuery4.SQL.Add('delete * from dbo.book_id');
          ADOQuery4.SQL.Add('select * from dbo.xbook_id where b_id=:a');
          ADOQuery4.Parameters.ParamByName('a').Value:=''+edit6.Text+'';
          ADOQuery4.Open;
          if ADOQuery4.RecordCount>0 then
            begin
              application.MessageBox('该书已存在!','提示',0+64);
              edit6.Text:='';
            end
          else
            begin
              ADOQuery4.Close;
              ADOQuery4.SQL.Clear;
              Adoquery4.sql.add('insert into dbo.xbook_id(b_id)'+'values (:1)');
              Adoquery4.parameters.parambyname('1').value:=''+Edit6.Text+'';
              ADOQuery4.ExecSQL;
            end;
          //显示要续借图书
          ADOQuery3.Close;
          ADOQuery3.SQL.Clear;
          ADOQuery3.SQL.Add('select * from dbo.book,dbo.lend,dbo.xbook_id where (dbo.book.b_id=dbo.xbook_id.b_id) and (dbo.lend.r_id=:a) and (dbo.book.b_id=dbo.lend.b_id) and dbo.lend.l_no not in (select l_no from dbo.r_book)');
          //ADOQuery2.SQL.Add('select * from dbo.book,dbo.lend,dbo.reader,dbo.reader_type where (dbo.reader.r_id=:a) and (dbo.reader.rt_no=dbo.reader_type.rt_no) and '+'(dbo.lend.r_id=dbo.reader.r_id) and (dbo.lend.b_id=dbo.book.b_id) and (dbo.lend.l_no not in (select l_no from dbo.r_book))');
          ADOQuery3.parameters.ParamByName('a').Value:=Trim(edit1.Text);
          ADOQuery3.Open;
          tt:=ADOQuery3.recordcount;
          label8.caption:=inttostr(tt);
        end;
    end;
end;


procedure  Txujie.BitBtn5Click(Sender: TObject);
var
  temp:string;
begin
  if label8.caption='0' then
  begin
  application.MessageBox('列表为空!','提示',0+64);
  end
  else
  begin
  temp:=DBGrid2.Fields[0].DisplayText;
  ADOQuery3.delete;
  ADOQuery4.Close;
  ADOQuery4.SQL.Clear;
  ADOQuery4.SQL.Add('delete from dbo.xbook_id where b_id=:a');
  ADOQuery4.Parameters.ParamByName('a').Value:=trim(temp);
  ADOQuery4.ExecSQL;
  tt:=tt-1;
  label8.Caption:=inttostr(tt);
  end;
end;

procedure Txujie.BitBtn1Click(Sender: TObject);
var
 temp1:String;
 bkname:string;
 jycount:integer;
 i:integer;
 j:integer;
 today:String;
 jytianshu:integer;
begin
 if DBedit1.Text='' then
    begin
      application.MessageBox('请输入要续借读者!','提示',0+64);
      exit;
    end;
  ADOQuery4.Close;
  ADOQuery4.SQL.Clear;
  ADOQuery4.SQL.Add('select * from dbo.xbook_id');
  ADOQuery4.Open;
  ADOQuery5.Close;
  ADOQuery5.SQL.Clear;
  ADOQuery5.SQL.Add('select * from dbo.lend,dbo.reader,dbo.book where dbo.reader.r_id=:a and dbo.lend.b_id=dbo.book.b_id and dbo.lend.r_id=dbo.reader.r_id and datediff(d,r_time,getdate())>0 and (dbo.lend.l_no not in (select l_no from dbo.r_book));');
  ADOQuery5.Parameters.ParamByName('a').Value:=trim(Edit1.Text);
  ADOQuery5.Open;
  j:=ADOQuery4.RecordCount;
  label8.Caption:=inttostr(j);
  if ADOQuery4.RecordCount=0 then
    begin
      application.MessageBox('没有需要添加的图书!','提示',0+64);
    end
  else if ADOquery5.RecordCount>0 then
    begin
      application.MessageBox('存在超期图书，不可续借!','提示',0+64);
    end
  else
    begin
      ADOQuery4.Close;
      ADOQuery4.SQL.Clear;
      ADOQuery4.SQL.Add('select max_time from dbo.reader_type,dbo.reader where r_id=:a and dbo.reader.rt_no=dbo.reader_type.rt_no');
      ADOQuery4.Parameters.ParamByName('a').Value:=trim(Edit1.Text);
      ADOQuery4.Open;
      if adoquery4.recordcount>0 then
        begin
          jytianshu:=adoquery4.fieldByName('max_time').asinteger;
        end;
        //showmessage(inttostr(j));
      for  i:=1 to j do
        begin
          ADOQuery3.RecNo:=i;
          temp1:=DBGrid2.Fields[7].DisplayText;
          bkname:=DBGrid2.Fields[2].DisplayText;
          //showmessage(inttostr(I));
          if (strtoint(temp1)>xjcs) or (strtoint(temp1)=xjcs) then
            begin
              application.MessageBox('该书超过最大续借次数!','提示',0+64);
              ADOQuery3.delete;
              tt:=tt-1;
              label8.caption:=inttostr(tt);
              //application.MessageBox('该图书已超过最大续借次数，不可续借!','提示',0+64);
            end
          else
            begin
              ADOQuery4.Close;
              ADOQuery4.SQL.Clear;
              ADOQuery4.SQL.Add('update dbo.lend set r_time=:1,xj=:2 where r_id=:3 and b_id=:4 and dbo.lend.l_no not in (select l_no from r_book)');
              ADOQuery4.Parameters.ParamByName('1').Value:=Trim(Datetimetostr(Incday(now,jytianshu)));
              ADOQuery4.Parameters.ParamByName('2').Value:=strtoint(temp1)+1;
              ADOQuery4.Parameters.ParamByName('3').Value:=Trim(Edit1.Text);
              ADOQuery4.Parameters.ParamByName('4').Value:=Trim(Edit6.Text);
              ADOQuery4.ExecSQL;
              application.MessageBox('续借成功!','提示',0+64);
              ADOquery3.delete;
              tt:=tt-1;
              label8.caption:=inttostr(tt);
            end;
        end;
         ADOQuery4.Close;
         ADOQuery4.SQL.Clear;
         ADOQuery4.SQL.Add('delete from dbo.xbook_id');
         ADOQuery4.ExecSQL;
         //显示图书信息
         ADOQuery2.Close;
         ADOQuery2.SQL.Clear;
         ADOQuery2.SQL.Add('select * from dbo.book,dbo.lend,dbo.reader,dbo.reader_type where (dbo.reader.r_id=:a) and (dbo.reader.rt_no=dbo.reader_type.rt_no) and '+'(dbo.lend.r_id=dbo.reader.r_id) and (dbo.lend.b_id=dbo.book.b_id) and (dbo.lend.l_no not in (select l_no from dbo.r_book))');
         ADOQuery2.parameters.ParamByName('a').Value:=Trim(edit1.Text);
         ADOQuery2.Open;
         {application.MessageBox('存在超期图书，不可续借!','提示',0+64);
         ADOQuery1.Close;
         ADOQuery1.SQL.Clear;
         ADOQuery1.SQL.Add('select * from dbo.book,dbo.lend,dbo.reader,dbo.reader_type where (dbo.reader.r_id=:a) and (dbo.lend.r_id=dbo.reader.r_id) and (dbo.book.b_id=dbo.lend.b_id) and (dbo.reader.rt_no=dbo.reader_type.rt_no) and (dbo.lend.l_no not in (select l_no from dbo.r_book))');
         ADOQuery1.parameters.ParamByName('a').Value:=Trim(edit1.Text);
         ADOQuery1.Open; }
     end;

end;
procedure Txujie.Timer1Timer(Sender: TObject);
begin
   label11.Caption:=Datetimetostr(now);
end;

end.
