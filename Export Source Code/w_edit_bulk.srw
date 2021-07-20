$PBExportHeader$w_edit_bulk.srw
forward
global type w_edit_bulk from Window
end type
type rb_2 from radiobutton within w_edit_bulk
end type
type rb_1 from radiobutton within w_edit_bulk
end type
type st_9 from statictext within w_edit_bulk
end type
type st_jindu from statictext within w_edit_bulk
end type
type cb_chuli from commandbutton within w_edit_bulk
end type
type hsb_jindu from hscrollbar within w_edit_bulk
end type
type st_2 from statictext within w_edit_bulk
end type
type lb_zd from listbox within w_edit_bulk
end type
type cb_qingkong from commandbutton within w_edit_bulk
end type
type cb_shanchu from commandbutton within w_edit_bulk
end type
type cb_tianjia from commandbutton within w_edit_bulk
end type
type sle_zdgs from singlelineedit within w_edit_bulk
end type
type em_zdcd from editmask within w_edit_bulk
end type
type ddlb_zdlx from dropdownlistbox within w_edit_bulk
end type
type sle_zdmc from singlelineedit within w_edit_bulk
end type
type st_1 from statictext within w_edit_bulk
end type
end forward

global type w_edit_bulk from Window
int X=1335
int Y=521
int Width=3543
int Height=897
boolean TitleBar=true
string Title="批量更新字段属性"
boolean ControlMenu=true
WindowType WindowType=response!
rb_2 rb_2
rb_1 rb_1
st_9 st_9
st_jindu st_jindu
cb_chuli cb_chuli
hsb_jindu hsb_jindu
st_2 st_2
lb_zd lb_zd
cb_qingkong cb_qingkong
cb_shanchu cb_shanchu
cb_tianjia cb_tianjia
sle_zdgs sle_zdgs
em_zdcd em_zdcd
ddlb_zdlx ddlb_zdlx
sle_zdmc sle_zdmc
st_1 st_1
end type
global w_edit_bulk w_edit_bulk

on w_edit_bulk.create
this.rb_2=create rb_2
this.rb_1=create rb_1
this.st_9=create st_9
this.st_jindu=create st_jindu
this.cb_chuli=create cb_chuli
this.hsb_jindu=create hsb_jindu
this.st_2=create st_2
this.lb_zd=create lb_zd
this.cb_qingkong=create cb_qingkong
this.cb_shanchu=create cb_shanchu
this.cb_tianjia=create cb_tianjia
this.sle_zdgs=create sle_zdgs
this.em_zdcd=create em_zdcd
this.ddlb_zdlx=create ddlb_zdlx
this.sle_zdmc=create sle_zdmc
this.st_1=create st_1
this.Control[]={ this.rb_2,&
this.rb_1,&
this.st_9,&
this.st_jindu,&
this.cb_chuli,&
this.hsb_jindu,&
this.st_2,&
this.lb_zd,&
this.cb_qingkong,&
this.cb_shanchu,&
this.cb_tianjia,&
this.sle_zdgs,&
this.em_zdcd,&
this.ddlb_zdlx,&
this.sle_zdmc,&
this.st_1}
end on

on w_edit_bulk.destroy
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.st_9)
destroy(this.st_jindu)
destroy(this.cb_chuli)
destroy(this.hsb_jindu)
destroy(this.st_2)
destroy(this.lb_zd)
destroy(this.cb_qingkong)
destroy(this.cb_shanchu)
destroy(this.cb_tianjia)
destroy(this.sle_zdgs)
destroy(this.em_zdcd)
destroy(this.ddlb_zdlx)
destroy(this.sle_zdmc)
destroy(this.st_1)
end on

type rb_2 from radiobutton within w_edit_bulk
int X=2839
int Y=705
int Width=343
int Height=77
string Text="导出修改"
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="宋体"
FontPitch FontPitch=Variable!
end type

type rb_1 from radiobutton within w_edit_bulk
int X=2510
int Y=705
int Width=343
int Height=77
string Text="直接修改"
boolean Checked=true
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="宋体"
FontPitch FontPitch=Variable!
end type

type st_9 from statictext within w_edit_bulk
int X=2209
int Y=713
int Width=307
int Height=77
boolean Enabled=false
string Text="修改模式："
Alignment Alignment=Right!
boolean FocusRectangle=false
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="宋体"
FontPitch FontPitch=Variable!
end type

type st_jindu from statictext within w_edit_bulk
int X=1975
int Y=713
int Width=225
int Height=77
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

type cb_chuli from commandbutton within w_edit_bulk
int X=3173
int Y=693
int Width=339
int Height=97
int TabOrder=90
string Text="批量修改"
int TextSize=-10
int Weight=400
string FaceName="宋体"
FontPitch FontPitch=Variable!
end type

event clicked;string ls_ziduan[],ls_leixing[],ls_changdu[],ls_geshi[],ls_lx[],ls_zd[],ls_cd[],ls_gs[],ls_reset[],ls_bakdir,ls_libpath,ls_obj,ls_syntax,ls_zhushi,ls_modify,ls_dbname,ls_name,ls_cd_old,ls_gs_old,ls_error,ls_compute_expression,ls_compute_format,ls_exportdir
int li_i,li_j
long ll_l,ll_pos,ll_pos1,ll_pos2,ll_upcount
boolean lb_have
if lb_zd.totalitems() = 0 then
	messagebox("提示","未指定要处理的字段!")
	return
end if
for li_i=1 to lb_zd.totalitems()
	ls_ziduan[li_i] = guo_dw.posmid(lb_zd.text(li_i),":","~t",1)
	ls_leixing[li_i] = guo_dw.posmid(lb_zd.text(li_i),":","~t",10)
	ls_changdu[li_i] = guo_dw.posmid(lb_zd.text(li_i),":","~t",pos(lb_zd.text(li_i),ls_leixing[li_i]))
	ls_geshi[li_i] = guo_dw.posmid(lb_zd.text(li_i),":","",pos(lb_zd.text(li_i),ls_changdu[li_i]))
	for li_j=1 to upperbound(ls_lx)
		if ls_lx[li_j] = ls_leixing[li_i] then
			lb_have=true
			exit
		end if
	next
	if lb_have = false then
		ls_lx[upperbound(ls_lx)+1]=ls_leixing[li_i]
	else
		lb_have=false
	end if
next
if messagebox("提示","您是否已经做好库文件备份,确认要批量更改吗?",question!,yesno!,2)=2 then return
ls_bakdir=guo_dw.get_bakdir()
if rb_2.checked then ls_exportdir=guo_dw.get_exportdir()
for ll_l=1 to guo_dw.ids_dwlist.rowcount()
	ls_obj=guo_dw.ids_dwlist.getitemstring(ll_l,1)
	if isnull(ls_obj) or right(ls_obj,1) = "_" then continue
	ls_libpath=guo_dw.ids_dwlist.getitemstring(ll_l,4)
	ls_syntax=guo_dw.get_syntax(ls_obj,ls_libpath)
	IF guo_dw.ids.create(ls_syntax,ls_error) = -1 then goto jieshu
	ls_zhushi=guo_dw.ids_dwlist.getitemstring(ll_l,3)
	ls_modify = ""
	for li_i=1 to upperbound(ls_lx)
		ls_zd[]=ls_reset[]
		ls_cd[]=ls_reset[]
		ls_gs[]=ls_reset[]
		for li_j=1 to lb_zd.totalitems()
			if ls_leixing[li_j] <> ls_lx[li_i] or pos(ls_syntax,ls_ziduan[li_j],1)=0 then continue
			ls_zd[upperbound(ls_zd)+1]=ls_ziduan[li_j]
			ls_cd[upperbound(ls_cd)+1]=ls_changdu[li_j]
			ls_gs[upperbound(ls_gs)+1]=ls_geshi[li_j]
		next
		if upperbound(ls_zd)=0 then continue
		ll_pos = pos(ls_syntax,"column=(type="+ls_lx[li_i]+"(",1)
		do while ll_pos>0
			ls_dbname=guo_dw.posmid(ls_syntax,"dbname=~"","~"",ll_pos)
			ls_name=guo_dw.posmid(ls_syntax," name="," ",ll_pos)
			for li_j=1 to upperbound(ls_zd)
				if ls_dbname=ls_zd[li_j] or ls_name=ls_zd[li_j] or right(ls_dbname,len(ls_zd[li_j])+1)="."+ls_zd[li_j] or right(ls_name,len(ls_zd[li_j])+1)="_"+ls_zd[li_j] then
					//长度、小数
					ls_cd_old=guo_dw.posmid(ls_syntax,"column=(type="+ls_lx[li_i]+"(",")",ll_pos)
					if ls_cd_old<>ls_cd[li_j] then
						lb_have=true
						ls_syntax = replace(ls_syntax,ll_pos+len("column=(type="+ls_lx[li_i]+"("),len(ls_cd_old),ls_cd[li_j])
						if ls_lx[li_i]="char" then
							if long(guo_dw.ids.describe(ls_name + ".Edit.Limit")) > 0 then 
								ls_modify += ls_name + ".Edit.Limit='" + ls_cd[li_j] + "' "
							elseif long(guo_dw.ids.describe(ls_name + ".DDDW.Limit")) > 0 then 
								ls_modify += ls_name + ".DDDW.Limit='" + ls_cd[li_j] + "' "
							elseif long(guo_dw.ids.describe(ls_name + ".DDLB.Limit")) > 0 then 
								ls_modify += ls_name + ".DDLB.Limit='" + ls_cd[li_j] + "' "
							end if
						end if
					end if
					//格式
					if ls_lx[li_i]="decimal" and ls_gs[li_j]<>'' then
						ls_gs_old=guo_dw.ids.describe(ls_name + ".format")
						if ls_gs_old<>"?" and ls_gs_old <> ls_gs[li_j] then
							lb_have=true
							ls_modify += ls_name + '.format="'+ls_gs[li_j]+'" '
							if guo_dw.ids.describe(ls_name + '.editmask.mask') <> "?" then
								ls_modify += ls_name + '.editmask.mask="'+ls_gs[li_j]+'" '
							end if
							//----------
							ll_pos1 = pos(ls_syntax,'compute(',1)
							do while ll_pos1>0
								ls_compute_expression=guo_dw.posmid(ls_syntax,'expression="','"',ll_pos1)
								ll_pos2=pos(ls_compute_expression,ls_name)
								if ll_pos2>0 then
									ls_compute_format=guo_dw.posmid(ls_syntax,'format="','"',ll_pos1)
									if ls_compute_format<>ls_gs[li_i] then
										ll_pos2=pos(ls_syntax,ls_compute_format,ll_pos1)
										ls_syntax = replace(ls_syntax,ll_pos2,len(ls_compute_format),ls_gs[li_i])
									end if
								end if
								ll_pos1 = pos(ls_syntax,'compute(',ll_pos1+1)
							loop
							//----------
						end if
					end if
				end if
			next
			ll_pos = pos(ls_syntax,"column=(type="+ls_lx[li_i]+"(",ll_pos+1)
		loop
	next
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
	st_jindu.text=string(round(100*ll_l/guo_dw.ids_dwlist.rowcount(),2))+"%"
	yield()
next
jieshu:
messagebox("提示","总共"+string(guo_dw.ids_dwlist.rowcount())+"个数据窗口，其中修改"+string(ll_upcount)+"个数据窗口!")
close(parent)
end event

type hsb_jindu from hscrollbar within w_edit_bulk
int X=174
int Y=701
int Width=1797
int Height=77
boolean Enabled=false
boolean StdHeight=false
int MaxPosition=100
end type

type st_2 from statictext within w_edit_bulk
int X=14
int Y=713
int Width=179
int Height=77
boolean Enabled=false
string Text="进度："
boolean FocusRectangle=false
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="宋体"
FontPitch FontPitch=Variable!
end type

type lb_zd from listbox within w_edit_bulk
int Y=129
int Width=3516
int Height=553
int TabOrder=80
BorderStyle BorderStyle=StyleLowered!
boolean VScrollBar=true
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="宋体"
FontPitch FontPitch=Variable!
end type

type cb_qingkong from commandbutton within w_edit_bulk
int X=3237
int Y=21
int Width=247
int Height=93
int TabOrder=70
string Text="清 空"
int TextSize=-10
int Weight=400
string FaceName="宋体"
FontPitch FontPitch=Variable!
end type

event clicked;lb_zd.reset()
end event

type cb_shanchu from commandbutton within w_edit_bulk
int X=2963
int Y=21
int Width=247
int Height=93
int TabOrder=60
string Text="删 除"
int TextSize=-10
int Weight=400
string FaceName="宋体"
FontPitch FontPitch=Variable!
end type

event clicked;do while lb_zd.deleteitem(lb_zd.selectedIndex())>0 
loop
end event

type cb_tianjia from commandbutton within w_edit_bulk
int X=2689
int Y=21
int Width=247
int Height=93
int TabOrder=50
string Text="添 加"
int TextSize=-10
int Weight=400
string FaceName="宋体"
FontPitch FontPitch=Variable!
end type

event clicked;string ls_zdmc,ls_zdlx,ls_info,ls_zdgs
int li_zdcd,li_row
ls_zdmc=sle_zdmc.text
ls_zdlx=ddlb_zdlx.text
li_zdcd=integer(em_zdcd.text)
ls_zdgs=sle_zdgs.text
if ls_zdmc="" then
	messagebox("提示","字段名称不能为空!")
	return
end if
if ls_zdlx="char" then
	if li_zdcd<1 or li_zdcd>8000 then
		messagebox("提示","字段长度设置值必须位于1和8000之间!")
		return
	end if
	ls_info="字段长度"
elseif ls_zdlx="decimal" then
	if li_zdcd<0 or li_zdcd>18 then
		messagebox("提示","小数位数设置值必须位于0和18之间!")
		return
	end if
	ls_info="小数位数"
else
	messagebox("提示","字段类型不能为空!")
	return
end if
for li_row=1 to lb_zd.totalitems()
	if ls_zdmc = guo_dw.posmid(lb_zd.text(li_row),":","~t",1) then
		messagebox('提示','不能添加重复字段!')
		return
	end if
next
if len(ls_zdmc)<4 then 
	if messagebox("提示","该字段长度小于4,可能会有歧义!~r~n是否继续添加?",question!,yesno!,2)=2 then return
end if
lb_zd.additem("字段名称:"+ls_zdmc+"~t字段类型:"+ls_zdlx+"~t"+ls_info+":"+string(li_zdcd)+"~t字段格式:"+ls_zdgs)
sle_zdmc.text=""
sle_zdmc.setfocus()
end event

type sle_zdgs from singlelineedit within w_edit_bulk
int X=2186
int Y=25
int Width=467
int Height=93
int TabOrder=40
boolean Enabled=false
BorderStyle BorderStyle=StyleLowered!
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="宋体"
FontPitch FontPitch=Variable!
end type

type em_zdcd from editmask within w_edit_bulk
int X=1692
int Y=25
int Width=188
int Height=93
int TabOrder=30
BorderStyle BorderStyle=StyleLowered!
string Mask="###0"
string DisplayData=""
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="宋体"
FontPitch FontPitch=Variable!
end type

type ddlb_zdlx from dropdownlistbox within w_edit_bulk
int X=1038
int Y=25
int Width=330
int Height=229
int TabOrder=20
BorderStyle BorderStyle=StyleLowered!
boolean VScrollBar=true
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="宋体"
FontPitch FontPitch=Variable!
string Item[]={"char",&
"decimal"}
end type

event selectionchanged;if text="decimal" then
	sle_zdgs.enabled=true
else
	sle_zdgs.text=""
	sle_zdgs.enabled=false
end if
end event

type sle_zdmc from singlelineedit within w_edit_bulk
int X=334
int Y=25
int Width=417
int Height=93
int TabOrder=10
BorderStyle BorderStyle=StyleLowered!
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="宋体"
FontPitch FontPitch=Variable!
end type

type st_1 from statictext within w_edit_bulk
int X=42
int Y=37
int Width=2154
int Height=77
boolean Enabled=false
string Text="字段名称:              字段类型：          长度/小数：      字段格式："
boolean FocusRectangle=false
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="宋体"
FontPitch FontPitch=Variable!
end type

