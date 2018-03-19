unit jiechu_P;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons, DB, ADODB;

type
  Tjiechu = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    procedure Formshow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  jiechu: Tjiechu;

implementation
uses unit1;
{$R *.dfm}
procedure Tjiechu.Formshow(Sender: TObject);
begin
label2.Caption:=inttostr(jiechu.ADOQuery1.RecordCount);
end;
procedure Tjiechu.BitBtn1Click(Sender: TObject);
begin
jiechu.adoquery1.First;
end;

procedure Tjiechu.BitBtn2Click(Sender: TObject);
begin
jiechu.adoquery1.Prior;
end;

procedure Tjiechu.BitBtn3Click(Sender: TObject);
begin
jiechu.adoquery1.Next;
end;

procedure Tjiechu.BitBtn4Click(Sender: TObject);
begin
jiechu.adoquery1.Last;
end;
procedure Tjiechu.BitBtn5Click(Sender: TObject);
begin
close;
unit1.Menu.show;
end;

end.
