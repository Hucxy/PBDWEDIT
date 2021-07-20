$PBExportHeader$w_pbdwedit.srw
$PBExportComments$主窗口
forward
global type w_pbdwedit from Window
end type
type mle_syntax from multilineedit within w_pbdwedit
end type
type dw_edit from datawindow within w_pbdwedit
end type
type tv_libdw from treeview within w_pbdwedit
end type
end forward

global type w_pbdwedit from Window
int X=1975
int Y=693
int Width=4604
int Height=2261
boolean TitleBar=true
string MenuName="m_pbdwedit"
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
boolean Resizable=true
WindowState WindowState=maximized!
mle_syntax mle_syntax
dw_edit dw_edit
tv_libdw tv_libdw
end type
global w_pbdwedit w_pbdwedit

type variables

end variables

event resize;tv_libdw.x=0
tv_libdw.y=0
tv_libdw.width=newwidth / 5
tv_libdw.height=newheight 

dw_edit.x=tv_libdw.width
dw_edit.y=0
dw_edit.width=newwidth - tv_libdw.width
dw_edit.height=newheight * 2 / 3


mle_syntax.x=dw_edit.x
mle_syntax.y=dw_edit.height
mle_syntax.width=dw_edit.width
mle_syntax.height=newheight - dw_edit.height
end event

on w_pbdwedit.create
if this.MenuName = "m_pbdwedit" then this.MenuID = create m_pbdwedit
this.mle_syntax=create mle_syntax
this.dw_edit=create dw_edit
this.tv_libdw=create tv_libdw
this.Control[]={ this.mle_syntax,&
this.dw_edit,&
this.tv_libdw}
end on

on w_pbdwedit.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mle_syntax)
destroy(this.dw_edit)
destroy(this.tv_libdw)
end on

event open;if not fileexists(guo_dw.is_rundir+"config.ini") then fileclose(FileOpen(guo_dw.is_rundir+"config.ini", StreamMode!, Write!, LockWrite!, Replace!))
string pbver
pbver=string(guo_dw.ienv.PBMajorRevision) 
if guo_dw.ienv.pbminorrevision >= 5 then
	pbver+="." + string(guo_dw.ienv.pbminorrevision)
end if
title="PBDWEDIT FOR PB"+pbver+" Build "+string(guo_dw.id_byrq,'yyyy.mm.dd')+" By Hucxy (本软件支持PB5以上所有版本,如需其它版本,请到群文件下载! QQ交流群:658840632)"
guo_dw.tv_load(tv_libdw)
end event

event close;guo_dw.set_liblist_ini()
if today()<>date(ProfileString(guo_dw.is_rundir+"config.ini", 'QQ', 'rq',string(RelativeDate(today(),-1),'yyyy-mm-dd'))) then
	messagebox('邀请函:','真诚的邀请您加入PBSpy交流QQ群，并留下您宝贵的意见!')
	m_pbdwedit.m_help.m_qq_qun.trigger event clicked()
end if
end event

event closequery;if messagebox("提示","确定退出吗?",question!,yesno!,2)=2 then return 1
end event

type mle_syntax from multilineedit within w_pbdwedit
int X=1143
int Y=965
int Width=3173
int Height=965
int TabOrder=2
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=true
boolean VScrollBar=true
boolean AutoHScroll=true
long BackColor=16777215
int TextSize=-12
int Weight=400
string FaceName="宋体"
FontPitch FontPitch=Variable!
end type

type dw_edit from datawindow within w_pbdwedit
int X=1125
int Y=5
int Width=3191
int Height=941
int TabOrder=20
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=true
boolean VScrollBar=true
boolean LiveScroll=true
end type

type tv_libdw from treeview within w_pbdwedit
int Y=9
int Width=1098
int Height=1921
int TabOrder=10
BorderStyle BorderStyle=StyleLowered!
string PictureName[]={"Application5!",&
"Library5!",&
"DataWindow5!",&
"DosEdit5!"}
long PictureMaskColor=553648127
long StatePictureMaskColor=553648127
long BackColor=16777215
int TextSize=-9
int Weight=400
string FaceName="宋体"
FontPitch FontPitch=Variable!
grSortType SortType=Ascending!
end type

event selectionchanged;long ll_handle
string ls_syntax,ls_error
TreeViewItem ltvi_dw,ltvi_lib
GetItem(newhandle,ltvi_dw)
mle_syntax.text=""
mle_syntax.tag=""
dw_edit.title=""
dw_edit.tag=""
dw_edit.dataobject=""
if ltvi_dw.level = 3 then
	ll_handle=FindItem(ParentTreeItem!,newhandle)
	GetItem(ll_handle,ltvi_lib)
	ls_syntax=guo_dw.get_syntax(ltvi_dw.label,ltvi_lib.data)
	IF dw_edit.create(ls_syntax,ls_error) = -1 then
		messagebox("错误","无法载入"+string(ltvi_lib.data)+"文件中的数据窗口" +ltvi_dw.label+"!~r~n请确认文件"+string(ltvi_lib.data)+"是否为PB"+string(guo_dw.ienv.PBMajorRevision)+"库文件!")
	else
		mle_syntax.text=ls_syntax
		mle_syntax.tag=string(ltvi_dw.data)
		dw_edit.title=ltvi_dw.label
		dw_edit.tag=string(ltvi_lib.data)
		dw_edit.insertrow(0)
	end if
end if
end event

event rightclicked;TreeViewItem ltvi_item
menu lm_tv_libdw
SelectItem(handle)
GetItem(handle,ltvi_item)
if ltvi_item.level>3 then return
lm_tv_libdw = create m_tv_libdw
choose case ltvi_item.level
	case 1
		m_tv_libdw.m_remove.visible=false
	case 2
		m_tv_libdw.m_import.visible=true
	case 3
		m_tv_libdw.m_copy.visible=true
		m_tv_libdw.m_move.visible=true
		m_tv_libdw.m_delete.visible=true
end choose
lm_tv_libdw.popmenu(pointerx(),pointery())
end event

