$PBExportHeader$w_edit_sync.srw
forward
global type w_edit_sync from Window
end type
type cb_2 from commandbutton within w_edit_sync
end type
type rb_2 from radiobutton within w_edit_sync
end type
type rb_1 from radiobutton within w_edit_sync
end type
type st_9 from statictext within w_edit_sync
end type
type sle_database from singlelineedit within w_edit_sync
end type
type st_8 from statictext within w_edit_sync
end type
type st_jindu from statictext within w_edit_sync
end type
type st_7 from statictext within w_edit_sync
end type
type sle_dbparm from singlelineedit within w_edit_sync
end type
type st_6 from statictext within w_edit_sync
end type
type sle_dbms from singlelineedit within w_edit_sync
end type
type st_5 from statictext within w_edit_sync
end type
type hsb_jindu from hscrollbar within w_edit_sync
end type
type sle_logpass from singlelineedit within w_edit_sync
end type
type sle_logid from singlelineedit within w_edit_sync
end type
type sle_servername from singlelineedit within w_edit_sync
end type
type ddlb_dbtype from dropdownlistbox within w_edit_sync
end type
type cb_1 from commandbutton within w_edit_sync
end type
type st_4 from statictext within w_edit_sync
end type
type st_3 from statictext within w_edit_sync
end type
type st_2 from statictext within w_edit_sync
end type
type st_1 from statictext within w_edit_sync
end type
end forward

shared variables
boolean sb_interrupt
end variables

global type w_edit_sync from Window
int X=1660
int Y=569
int Width=2332
int Height=801
boolean TitleBar=true
string Title="同步字段长度"
boolean ControlMenu=true
WindowType WindowType=response!
cb_2 cb_2
rb_2 rb_2
rb_1 rb_1
st_9 st_9
sle_database sle_database
st_8 st_8
st_jindu st_jindu
st_7 st_7
sle_dbparm sle_dbparm
st_6 st_6
sle_dbms sle_dbms
st_5 st_5
hsb_jindu hsb_jindu
sle_logpass sle_logpass
sle_logid sle_logid
sle_servername sle_servername
ddlb_dbtype ddlb_dbtype
cb_1 cb_1
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
end type
global w_edit_sync w_edit_sync

forward prototypes
public subroutine wf_get_ini ()
public subroutine wf_set_ini ()
end prototypes

public subroutine wf_get_ini ();ddlb_dbtype.text=ProfileString(guo_dw.is_rundir+"config.ini", 'SYNC', 'DatabaseType', '')
sle_dbms.text=ProfileString(guo_dw.is_rundir+"config.ini", 'SYNC', 'DBMS', '')
sle_servername.text=ProfileString(guo_dw.is_rundir+"config.ini", 'SYNC', 'ServerName', '')
sle_database.text=ProfileString(guo_dw.is_rundir+"config.ini", 'SYNC', 'Database', '')
sle_logid.text=ProfileString(guo_dw.is_rundir+"config.ini", 'SYNC', 'LogId', '')
sle_logpass.text=ProfileString(guo_dw.is_rundir+"config.ini", 'SYNC', 'LogPass', '')
sle_dbparm.text=ProfileString(guo_dw.is_rundir+"config.ini", 'SYNC', 'DBParm', '')
if ProfileString(guo_dw.is_rundir+"config.ini", 'SYNC', 'AlterMode', '1')='2' then rb_2.checked=true
end subroutine

public subroutine wf_set_ini ();SetProfileString (guo_dw.is_rundir+"config.ini", 'SYNC', 'DatabaseType', ddlb_dbtype.text)
SetProfileString (guo_dw.is_rundir+"config.ini", 'SYNC', 'DBMS', sle_dbms.text)
SetProfileString (guo_dw.is_rundir+"config.ini", 'SYNC', 'ServerName', sle_servername.text)
SetProfileString (guo_dw.is_rundir+"config.ini", 'SYNC', 'Database', sle_database.text)
SetProfileString (guo_dw.is_rundir+"config.ini", 'SYNC', 'LogId', sle_logid.text)
SetProfileString (guo_dw.is_rundir+"config.ini", 'SYNC', 'LogPass', sle_logpass.text)
SetProfileString (guo_dw.is_rundir+"config.ini", 'SYNC', 'DBParm', sle_dbparm.text)
SetProfileString (guo_dw.is_rundir+"config.ini", 'SYNC', 'AlterMode', guo_dw.iif(rb_1.checked,'1','2'))
end subroutine

on w_edit_sync.create
this.cb_2=create cb_2
this.rb_2=create rb_2
this.rb_1=create rb_1
this.st_9=create st_9
this.sle_database=create sle_database
this.st_8=create st_8
this.st_jindu=create st_jindu
this.st_7=create st_7
this.sle_dbparm=create sle_dbparm
this.st_6=create st_6
this.sle_dbms=create sle_dbms
this.st_5=create st_5
this.hsb_jindu=create hsb_jindu
this.sle_logpass=create sle_logpass
this.sle_logid=create sle_logid
this.sle_servername=create sle_servername
this.ddlb_dbtype=create ddlb_dbtype
this.cb_1=create cb_1
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.Control[]={ this.cb_2,&
this.rb_2,&
this.rb_1,&
this.st_9,&
this.sle_database,&
this.st_8,&
this.st_jindu,&
this.st_7,&
this.sle_dbparm,&
this.st_6,&
this.sle_dbms,&
this.st_5,&
this.hsb_jindu,&
this.sle_logpass,&
this.sle_logid,&
this.sle_servername,&
this.ddlb_dbtype,&
this.cb_1,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1}
end on

on w_edit_sync.destroy
destroy(this.cb_2)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.st_9)
destroy(this.sle_database)
destroy(this.st_8)
destroy(this.st_jindu)
destroy(this.st_7)
destroy(this.sle_dbparm)
destroy(this.st_6)
destroy(this.sle_dbms)
destroy(this.st_5)
destroy(this.hsb_jindu)
destroy(this.sle_logpass)
destroy(this.sle_logid)
destroy(this.sle_servername)
destroy(this.ddlb_dbtype)
destroy(this.cb_1)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
end on

event open;wf_get_ini()
end event

type cb_2 from commandbutton within w_edit_sync
int X=1573
int Y=533
int Width=284
int Height=97
int TabOrder=81
string Text="终止同步"
int TextSize=-10
int Weight=400
string FaceName="宋体"
FontCharSet FontCharSet=Ansi!
FontPitch FontPitch=Variable!
end type

event clicked;sb_interrupt=true
end event

type rb_2 from radiobutton within w_edit_sync
int X=814
int Y=545
int Width=343
int Height=81
string Text="导出修改"
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="宋体"
FontCharSet FontCharSet=Ansi!
FontPitch FontPitch=Variable!
end type

type rb_1 from radiobutton within w_edit_sync
int X=485
int Y=545
int Width=343
int Height=81
string Text="直接修改"
boolean Checked=true
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="宋体"
FontCharSet FontCharSet=Ansi!
FontPitch FontPitch=Variable!
end type

type st_9 from statictext within w_edit_sync
int X=110
int Y=553
int Width=353
int Height=81
boolean Enabled=false
string Text="修改模式："
Alignment Alignment=Right!
boolean FocusRectangle=false
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="宋体"
FontCharSet FontCharSet=Ansi!
FontPitch FontPitch=Variable!
end type

type sle_database from singlelineedit within w_edit_sync
int X=1559
int Y=153
int Width=718
int Height=101
int TabOrder=40
BorderStyle BorderStyle=StyleLowered!
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="宋体"
FontPitch FontPitch=Variable!
end type

type st_8 from statictext within w_edit_sync
int X=1139
int Y=181
int Width=430
int Height=57
boolean Enabled=false
string Text="Database:"
Alignment Alignment=Right!
boolean FocusRectangle=false
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="宋体"
FontPitch FontPitch=Variable!
end type

type st_jindu from statictext within w_edit_sync
int X=2030
int Y=553
int Width=238
int Height=61
boolean Enabled=false
string Text="0.00%"
Alignment Alignment=Right!
boolean FocusRectangle=false
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="宋体"
FontPitch FontPitch=Variable!
end type

type st_7 from statictext within w_edit_sync
int X=1875
int Y=553
int Width=156
int Height=77
boolean Enabled=false
string Text="进度:"
Alignment Alignment=Right!
boolean FocusRectangle=false
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="宋体"
FontPitch FontPitch=Variable!
end type

type sle_dbparm from singlelineedit within w_edit_sync
int X=421
int Y=413
int Width=1857
int Height=101
int TabOrder=70
BorderStyle BorderStyle=StyleLowered!
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="宋体"
FontPitch FontPitch=Variable!
end type

type st_6 from statictext within w_edit_sync
int Y=429
int Width=430
int Height=57
boolean Enabled=false
string Text="DBParm:"
Alignment Alignment=Right!
boolean FocusRectangle=false
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="宋体"
FontPitch FontPitch=Variable!
end type

type sle_dbms from singlelineedit within w_edit_sync
int X=1559
int Y=25
int Width=718
int Height=101
int TabOrder=20
BorderStyle BorderStyle=StyleLowered!
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="宋体"
FontPitch FontPitch=Variable!
end type

type st_5 from statictext within w_edit_sync
int X=1139
int Y=45
int Width=430
int Height=57
boolean Enabled=false
string Text="DBMS:"
Alignment Alignment=Right!
boolean FocusRectangle=false
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="宋体"
FontPitch FontPitch=Variable!
end type

type hsb_jindu from hscrollbar within w_edit_sync
int X=10
int Y=637
int Width=2314
int Height=69
boolean Enabled=false
int MaxPosition=100
end type

type sle_logpass from singlelineedit within w_edit_sync
int X=1559
int Y=285
int Width=718
int Height=101
int TabOrder=60
BorderStyle BorderStyle=StyleLowered!
boolean PassWord=true
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="宋体"
FontPitch FontPitch=Variable!
end type

type sle_logid from singlelineedit within w_edit_sync
int X=421
int Y=285
int Width=718
int Height=101
int TabOrder=50
BorderStyle BorderStyle=StyleLowered!
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="宋体"
FontPitch FontPitch=Variable!
end type

type sle_servername from singlelineedit within w_edit_sync
int X=421
int Y=153
int Width=718
int Height=101
int TabOrder=30
BorderStyle BorderStyle=StyleLowered!
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="宋体"
FontPitch FontPitch=Variable!
end type

type ddlb_dbtype from dropdownlistbox within w_edit_sync
int X=421
int Y=33
int Width=718
int Height=245
int TabOrder=10
BorderStyle BorderStyle=StyleLowered!
boolean Sorted=false
boolean VScrollBar=true
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="宋体"
FontPitch FontPitch=Variable!
string Item[]={"SQLSERVER",&
"ORACLE"}
end type

event selectionchanged;sle_dbms.text=''
sle_servername.text=''
sle_database.text=''
sle_logid.text=''
sle_logpass.text=''
sle_dbparm.text=''
end event

type cb_1 from commandbutton within w_edit_sync
int X=1162
int Y=533
int Width=394
int Height=97
int TabOrder=80
string Text="同步字段长度"
int TextSize=-10
int Weight=400
string FaceName="宋体"
FontPitch FontPitch=Variable!
end type

event clicked;string ls_bakdir,ls_libpath,ls_obj,ls_syntax,ls_modify,ls_zhushi,ls_error,ls_length,ls_length_old,ls_name,ls_dbname,ls_tablename,ls_columnname,ls_exportdir
long ll_l,ll_upcount,ll_pos,ll_row
boolean lb_have
if not guo_dw.db_connect(sle_dbms.text,sle_servername.text,sle_database.text,sle_logid.text,sle_logpass.text,sle_dbparm.text) then return
if not guo_dw.get_tblist(ddlb_dbtype.text) then return
if messagebox("提示","您是否已经做好库文件备份,确认要批量更改吗?",question!,yesno!,2)=2 then return
wf_set_ini()
sb_interrupt=false
ls_bakdir=guo_dw.get_bakdir()
if rb_2.checked then ls_exportdir=guo_dw.get_exportdir()
for ll_l=1 to guo_dw.ids_dwlist.rowcount()
	ls_obj=guo_dw.ids_dwlist.getitemstring(ll_l,1)
	if isnull(ls_obj) or right(ls_obj,1) = "_" then continue
	ls_libpath = guo_dw.ids_dwlist.getitemstring(ll_l,4)
	ls_syntax=guo_dw.get_syntax(ls_obj,ls_libpath)
	IF guo_dw.ids.create(ls_syntax,ls_error) = -1 then goto jieshu
	ls_zhushi = guo_dw.ids_dwlist.getitemstring(ll_l,3)
	ls_modify = ""
	ll_pos = pos(ls_syntax,"column=(type=char(",1)
	do while ll_pos>0
		ls_name=guo_dw.posmid(ls_syntax," name="," ",ll_pos)
		ls_dbname=guo_dw.posmid(ls_syntax,"dbname=~"","~"",ll_pos)
		ls_tablename=guo_dw.posmid(ls_dbname,"",".",1)
		ls_columnname=guo_dw.posmid(ls_dbname,".","",1)
		ll_row=guo_dw.ids_tblist.find("tablename='"+ls_tablename+"' and columnname='"+ls_columnname+"'",1,guo_dw.ids_tblist.rowcount())
		if ll_row > 0 then
			ls_length=string(guo_dw.ids_tblist.getitemnumber(ll_row,'length'))
			ls_length_old=guo_dw.posmid(ls_syntax,"column=(type=char(",")",ll_pos)
			if ls_length_old<>ls_length then
				lb_have=true
				ls_syntax = replace(ls_syntax,ll_pos+len("column=(type=char("),len(ls_length_old),ls_length)
				if long(guo_dw.ids.describe(ls_name + ".Edit.Limit")) > 0 then 
					ls_modify += ls_name + ".Edit.Limit='" + ls_length + "' "
				elseif long(guo_dw.ids.describe(ls_name + ".DDDW.Limit")) > 0 then 
					ls_modify += ls_name + ".DDDW.Limit='" + ls_length + "' "
				elseif long(guo_dw.ids.describe(ls_name + ".DDLB.Limit")) > 0 then 
				ls_modify += ls_name + ".DDLB.Limit='" + ls_length + "' "
				end if
			end if
		end if
		ll_pos = pos(ls_syntax,"column=(type=char(",ll_pos+1)
	loop
	if lb_have=true then
		lb_have=false
		IF guo_dw.ids.create(ls_syntax,ls_error) = -1 then
			messagebox("错误","无法创建"+ls_libpath+"中的数据窗口"+ls_obj+"!~r~n错误:"+ls_error)
			goto jieshu
		end if
		if ls_modify <> "" then
			ls_error = guo_dw.ids.modify(ls_modify)
			if ls_error <> "" then 
				messagebox("错误",ls_libpath+"中的数据窗口"+ls_obj+"发生modify错误~r~nmodify:"+ls_modify+"~r~n错误信息:" +ls_error)
				goto jieshu
			end if
		end if
		if guo_dw.dw_export(ls_obj,guo_dw.get_syntax(ls_obj,ls_libpath),ls_zhushi,ls_bakdir+guo_dw.posmidlast(ls_libpath,"","\"))=false then goto jieshu
		if ls_exportdir='' then
			if guo_dw.dw_import(ls_obj,guo_dw.get_syntax(guo_dw.ids),ls_zhushi,ls_libpath)=false then goto jieshu
		else
			if guo_dw.dw_export(ls_obj,guo_dw.get_syntax(guo_dw.ids),ls_zhushi,ls_exportdir+guo_dw.posmidlast(ls_libpath,"","\"))=false then goto jieshu
		end if
		ll_upcount++
	end if
	hsb_jindu.position = integer(100*ll_l/guo_dw.ids_dwlist.rowcount())
	st_jindu.text = string(round(100*ll_l/guo_dw.ids_dwlist.rowcount(),2))+"%"
	yield()
	if sb_interrupt then exit
next
jieshu:
messagebox("提示","总共"+string(guo_dw.ids_dwlist.rowcount())+"个数据窗口，其中修改"+string(ll_upcount)+"个数据窗口!")
close(parent)
end event

type st_4 from statictext within w_edit_sync
int X=1139
int Y=301
int Width=430
int Height=57
boolean Enabled=false
string Text="LogPass:"
Alignment Alignment=Right!
boolean FocusRectangle=false
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="宋体"
FontPitch FontPitch=Variable!
end type

type st_3 from statictext within w_edit_sync
int Y=301
int Width=430
int Height=57
boolean Enabled=false
string Text="LogId:"
Alignment Alignment=Right!
boolean FocusRectangle=false
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="宋体"
FontPitch FontPitch=Variable!
end type

type st_2 from statictext within w_edit_sync
int Y=173
int Width=430
int Height=57
boolean Enabled=false
string Text="ServerName:"
Alignment Alignment=Right!
boolean FocusRectangle=false
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="宋体"
FontPitch FontPitch=Variable!
end type

type st_1 from statictext within w_edit_sync
int Y=45
int Width=430
int Height=57
boolean Enabled=false
string Text="DatabaseType:"
Alignment Alignment=Right!
boolean FocusRectangle=false
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="宋体"
FontPitch FontPitch=Variable!
end type

