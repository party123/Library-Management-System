unit fakuan_P;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB, ADODB, Mask,
  DBCtrls;

type
  Tfakuan = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit5: TEdit;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Label10: TLabel;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    BitBtn3: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    BitBtn4: TBitBtn;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    ADOQuery3: TADOQuery;
    DataSource3: TDataSource;
    ADOQuery4: TADOQuery;
    ComboBox1: TComboBox;
    Label6: TLabel;
    Label7: TLabel;
    Edit2: TEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fakuan: Tfakuan;

implementation
 uses unit1,main;
{$R *.dfm}
var
   bookcount:integer;

procedure Tfakuan.BitBtn2Click(Sender: TObject);
begin
ADOQuery4.Close;
ADOQuery4.SQL.clear;
ADOQuery4.SQL.Add('delete from dbo.book_id');
ADOQuery4.ExecSQL;
 close;
 unit1.Menu.show;
end;

procedure Tfakuan.BitBtn4Click(Sender: TObject);
begin
  if (edit1.Text='') then
     begin
      application.MessageBox('请输入读者编号!','提示',0+64);
         exit;
    end
  else
     begin
     ADOQuery1.Close;
     ADOQuery1.SQL.Clear;
     ADOQuery1.SQL.Add('select * from dbo.reader,dbo.reader_type where (dbo.reader.r_id=:a) and (dbo.reader.rt_no=dbo.reader_type.rt_no)');
     ADOQuery1.parameters.ParamByName('a').Value:=Trim(edit1.Text);
     ADOQuery1.Open;
     if ADOQuery1.recordcount=0 then
      application.MessageBox('未找到该读者!','提示',0+64);
     ADOQuery2.Close;
     ADOQuery2.SQL.Clear;
     ADOQuery2.SQL.Add('select * from dbo.book,dbo.lend where  (dbo.lend.r_id=:a) and (dbo.book.b_id=dbo.lend.b_id) and dbo.lend.l_no not in (select l_no from dbo.r_book)');
     ADOQuery2.parameters.ParamByName('a').Value:=Trim(edit1.Text);
     ADOQuery2.Open;
     bookcount:=ADOQuery2.RecordCount;
     if ADOQuery2.recordcount=0 then
        application.MessageBox('未找到该读者借阅信息!','提示',0+64);
    end;
end;

procedure Tfakuan.BitBtn3Click(Sender: TObject);
var
  I:integer;
  j:integer;
  count:integer;
  temp1:string;
begin
  count:=0;
  if (edit5.Text='') then
     begin
      application.MessageBox('请输入图书编号!','提示',0+64);
         exit;
     end
   else
    begin
    //j:=DBGrid1.FieldCount;
    j:=bookcount;
    //showmessage(inttostr(j));
    for I:=1 to j do
    begin
      ADOQuery2.RecNo:=I;
      temp1:=DBGrid1.Fields[1].DisplayText;
      if temp1=edit5.text then
      begin
        ADOQuery3.Close;
        ADOQuery3.SQL.Clear;
        ADOQuery3.SQL.Add('select * from dbo.book,dbo.lend,dbo.reader where (dbo.book.b_id=:a) and (dbo.lend.r_id=dbo.reader.r_id) and (dbo.book.b_id=dbo.lend.b_id) and dbo.lend.l_no not in (select l_no from dbo.r_book)');
        ADOQuery3.Parameters.ParamByName('a').Value:=trim(edit5.Text);
        ADOQuery3.Open;
        break;
      end;
    end;
    if i>j then
      begin
        application.MessageBox('该读者未借过此书!','提示',0+64);
      end
    else
   begin
      ADOQuery4.Close;
      ADOQuery4.SQL.Clear;
      //ADOQuery4.SQL.Add('delete * from dbo.book_id');
      ADOQuery4.SQL.Add('select * from dbo.book_id where b_id=:a');
      ADOQuery4.Parameters.ParamByName('a').Value:=''+edit5.Text+'';
      ADOQuery4.Open;
      if ADOQuery4.RecordCount>0 then
        begin
          application.MessageBox('该书已存在!','提示',0+64);
          edit5.Text:='';
          ADOQuery3.Close;
          ADOQuery3.SQL.Clear;
          ADOQuery3.SQL.Add('select * from dbo.book,dbo.lend,dbo.book_id where (dbo.book.b_id=dbo.book_id.b_id)  and (dbo.book.b_id=dbo.lend.b_id) and (dbo.lend.r_id=:1) and dbo.lend.l_no not in (select l_no from dbo.r_book)');
          Adoquery3.parameters.parambyname('1').value:=''+Edit1.Text+'';
          ADOQuery3.Open;
        end
      else
        begin
          ADOQuery4.Close;
          ADOQuery4.SQL.Clear;
          Adoquery4.sql.add('insert into dbo.book_id(b_id)'+'values (:1)');
          Adoquery4.parameters.parambyname('1').value:=''+Edit5.Text+'';
          ADOQuery4.ExecSQL;
          ADOQuery3.Close;
          ADOQuery3.SQL.Clear;
          ADOQuery3.SQL.Add('select * from dbo.book,dbo.lend,dbo.book_id where (dbo.book.b_id=dbo.book_id.b_id) and  (dbo.book.b_id=dbo.lend.b_id) and (dbo.lend.r_id=:1) and dbo.lend.l_no not in (select l_no from dbo.r_book)');
          Adoquery3.parameters.parambyname('1').value:=''+Edit1.Text+'';
          ADOQuery3.Open;
        end;
      end;
   end;
end;

procedure Tfakuan.BitBtn1Click(Sender: TObject);
var
  I:integer;
  j:integer;
  fkcount:integer;
  cqcount:integer;
  today:string;
  temp1:string;
  temp2:string;
  temp3:string;
  temp4:string;
  temp5:string;
begin
 if DBedit1.Text='' then
    begin
      application.MessageBox('请输入罚款读者','提示',0+64);
      exit;
    end;
  ADOQuery4.Close;
  ADOQuery4.SQL.Clear;
  ADOQuery4.SQL.Add('select * from dbo.book_id');
  ADOQuery4.Open;
  j:=ADOQuery4.RecordCount;
  if ADOQuery4.RecordCount=0 then
    begin
      application.MessageBox('没有需要罚款的图书','提示',0+64);
      exit;
    end
    else if ComboBox1.Text='' then
    begin
    application.MessageBox('请选择罚款类型','提示',0+64);
    exit;
    end
  else if Edit2.Text='' then
  begin
    application.MessageBox('请输入罚款金额','提示',0+64);
    exit;
    end
  else
    begin
        today:=FormatDatetime('YYYYMMDD',now);
        ADOQuery4.Close;
        ADOQuery4.SQL.Clear;
        ADOQuery4.SQL.Add('select * from dbo.forfeit where f_no like :a');
        ADOQuery4.Parameters.ParamByName('a').Value:=trim(today+'%');
        ADOQuery4.Open;
        fkcount:=adoquery4.recordcount;

        //showmessage('ok');
        for I:=1 to j do
        begin
          ADOQuery3.RecNo:=I;
          temp1:=edit2.text;
          temp3:=DBGrid2.Fields[0].DisplayText;
          temp4:=DBGrid2.Fields[1].DisplayText;
          if strtofloat(temp1)>0 then
          begin
            //更新forfeit
            temp2:=format('%.4d',[fkcount+i]);
            //showmessage(temp2);
            cqcount:=1;
            ADOQuery4.Close;
            ADOQuery4.SQL.Clear;
            ADOQuery4.SQL.Add('insert into dbo.forfeit values(:1,:2,:3,:4,:5,:6,:7,:8)');
            ADOQuery4.Parameters.ParamByName('1').Value:=Trim(FormatDatetime('YYYYMMDD',now)+temp2);
            ADOQuery4.Parameters.ParamByName('2').Value:=Trim(Edit1.Text);
            ADOQuery4.Parameters.ParamByName('3').Value:=Trim(temp4);
            ADOQuery4.Parameters.ParamByName('4').Value:=strtofloat(temp1);
            ADOQuery4.Parameters.ParamByName('5').Value:=Trim(FormatDatetime('YYYY-MM-DD HH:NN:SS',now));
            ADOQuery4.Parameters.ParamByName('6').Value:=Trim(combobox1.Text);
            ADOQuery4.Parameters.ParamByName('7').Value:=Trim(main.frmMain.edit1.Text);
            ADOQuery4.Parameters.ParamByName('8').Value:=1;
            ADOQuery4.ExecSQL;
            application.MessageBox('罚款成功!','提示',0+64);
          end;
           //更新数据
          ADOQuery3.delete;
          //showmessage('delete');
          ADOQuery4.Close;
          ADOQuery4.SQL.Clear;
          ADOQuery4.SQL.Add('delete from dbo.book_id where b_id=:a');
          ADOQuery4.Parameters.ParamByName('a').Value:=Trim(temp4);
          ADOQuery4.ExecSQL;
          ADOQuery2.Close;
          ADOQuery2.SQL.Clear;
          ADOQuery2.SQL.Add('select * from dbo.book,dbo.lend where  (dbo.lend.r_id=:a) and (dbo.book.b_id=dbo.lend.b_id) and dbo.lend.l_no not in (select l_no from dbo.r_book)');
          ADOQuery2.parameters.ParamByName('a').Value:=Trim(edit1.Text);
          ADOQuery2.Open;
end;
end;
end;

procedure Tfakuan.FormCreate(Sender: TObject);
begin
    edit1.Clear;
    edit2.Clear;
    edit5.Clear;
    combobox1.itemindex:=-1;
    ADOQuery1.close;
    ADOQuery2.close;
    ADOQuery3.close;
    ADOQuery4.close;
end;

procedure Tfakuan.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9','.'])  then
 begin
  application.MessageBox('请输入数字！', '提示',0+64);
   key:=#0;
   edit2.Text:='';
   end;
   end;

end.
