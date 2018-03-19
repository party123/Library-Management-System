program Project1;

uses
  Forms,
  about_P in 'about_P.pas' {about},
  main in 'main.pas' {frmMain},
  miwang_P in 'miwang_P.pas' {miwang},
  bookadd_P in 'book\bookadd_P.pas' {bookadd},
  bookset_P in 'book\bookset_P.pas' {bookset},
  booktype_P in 'book\booktype_P.pas' {booktype},
  booktypeadd_P in 'book\booktypeadd_P.pas' {booktypeadd},
  booktypexiu_P in 'book\booktypexiu_P.pas' {booktypexiu},
  bookxiu_P in 'book\bookxiu_P.pas' {bookxiu},
  zhuxiao_P in 'book\zhuxiao_P.pas' {zhuxiao},
  chaoqi_P in 'control\chaoqi_P.pas' {chaoqi},
  jiechu_P in 'control\jiechu_P.pas' {jiechu},
  jieyuepai_P in 'control\jieyuepai_P.pas' {jieyuepai},
  chaoqifakuan_p in 'liutong\chaoqifakuan_p.pas' {chaoqifakuan},
  fakuan_P in 'liutong\fakuan_P.pas' {fakuan},
  guihuan_P in 'liutong\guihuan_P.pas' {guihuan},
  jiansuo_P in 'liutong\jiansuo_P.pas' {jiansuo},
  jieyue_P in 'liutong\jieyue_P.pas' {jieyue},
  xujie_P in 'liutong\xujie_P.pas' {xujie},
  guashi_P in 'reader\guashi_P.pas' {guashi},
  readeradd_P in 'reader\readeradd_P.pas' {readeradd},
  readerdang_P in 'reader\readerdang_P.pas' {readerdang},
  readertype_P in 'reader\readertype_P.pas' {readertype},
  readertypeadd_P in 'reader\readertypeadd_P.pas' {readertypeadd},
  readertypexiu_P in 'reader\readertypexiu_P.pas' {readertypexiu},
  readerxiu_P in 'reader\readerxiu_P.pas' {readerxiu},
  admainadd_P in 'setting\admainadd_P.pas' {admainadd},
  admainset_P in 'setting\admainset_P.pas' {admainset},
  admainxiu_P in 'setting\admainxiu_P.pas' {admainxiu},
  mibao_P in 'setting\mibao_P.pas' {mibao},
  mima_P in 'setting\mima_P.pas' {mima},
  roomadd_P in 'setting\roomadd_P.pas' {roomadd},
  roomset_P in 'setting\roomset_P.pas' {roomset},
  roomxiu_P in 'setting\roomxiu_P.pas' {roomxiu},
  shelfadd_P in 'setting\shelfadd_P.pas' {shelfadd},
  shelfset_P in 'setting\shelfset_P.pas' {shelfset},
  shelfxiu_P in 'setting\shelfxiu_P.pas' {shelfxiu},
  Unit1 in 'Unit1.pas' {Menu};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '图书馆管理系统';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TMenu, Menu);
  Application.Run;
end.
