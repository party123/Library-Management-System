unit chaoqi_P;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons, DB, ADODB;

type
  Tchaoqi = class(TForm)
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
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  chaoqi: Tchaoqi;

implementation
uses unit1;
{$R *.dfm}
procedure Tchaoqi.Formshow(Sender: TObject);
begin
label2.Caption:=inttostr(chaoqi.ADOQuery1.RecordCount);
end;
procedure Tchaoqi.BitBtn1Click(Sender: TObject);
begin
chaoqi.adoquery1.First;
end;

procedure Tchaoqi.BitBtn2Click(Sender: TObject);
begin
chaoqi.adoquery1.Prior;
end;

procedure Tchaoqi.BitBtn3Click(Sender: TObject);
begin
chaoqi.adoquery1.Next;
end;

procedure Tchaoqi.BitBtn4Click(Sender: TObject);
begin
chaoqi.adoquery1.Last;
end;
procedure Tchaoqi.BitBtn5Click(Sender: TObject);
begin
close;
unit1.Menu.show;
end;

end.
