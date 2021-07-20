$PBExportHeader$uo_pbkiller_repair.sru
forward
global type uo_pbkiller_repair from nonvisualobject
end type
end forward

type str_sql from structure
	string		sentence
	string		sqltype
	string		transaction
	string		parameterslist
	string		parameter[]
	string		parametertype[]
	string		sentence_repair
	boolean		error
end type

type str_cursor from structure
	string		cursordeclare
	string		cursoropen
	str_sql		sql
end type

global type uo_pbkiller_repair from nonvisualobject autoinstantiate
end type

forward prototypes
private function boolean f_issqldt (readonly string as_dt)
private function boolean f_posreplace (ref string as_str, readonly string as_pos, readonly string as_replace)
private function long f_posrighthalf (readonly string as_str, readonly string ls_left, readonly string ls_right, readonly long ll_start)
private function boolean f_repair_messagebox (ref string as_sentence)
private function boolean f_repair_sql_select (ref string as_sql, ref string as_parameter[], ref integer ai_i)
private function boolean f_repair_sqlca (ref string as_sentence)
private function boolean f_write (readonly string as_path, readonly string as_file)
public function boolean f_repair (readonly string as_path, readonly string as_file)
public function boolean f_repair (readonly string as_pathfile)
public function long f_lastpos (readonly string as_str, readonly string as_pos)
public function boolean f_repair_richtextedit (ref string as_sentence)
public function boolean f_repair_editmask (ref string as_sentence)
public function boolean f_repair_variable (ref string as_sentence)
public function string f_posmid (readonly string as_str, readonly string as_tou, readonly string as_wei)
private function string f_posmid (readonly string as_str, readonly string as_tou, readonly string as_wei, ref long al_l)
public function string f_lastposmid (readonly string as_str, readonly string as_tou, readonly string as_wei)
private function string f_lastposmid (readonly string as_str, readonly string as_tou, readonly string as_wei, ref long al_l)
public function boolean f_repair_sql (ref string as_syntax, ref string as_sentence, ref str_sql astr_sql)
public subroutine f_alter_comments (ref string as_syntax, ref string as_sentence)
private subroutine f_repair_case (ref string as_sentence)
private subroutine f_repair_object (ref string as_sentence)
private function string f_get_sqltype (readonly string as_sentence)
public subroutine f_insert_repair (ref string as_syntax, ref string as_sentence, readonly string as_sentence_repair, readonly integer ai_sucess)
public subroutine f_insert_repair (ref string as_syntax, ref string as_sentence, readonly string as_sentence_repair)
public function boolean f_repair_cursor (ref string as_syntax, ref string as_sentence, ref str_cursor astr_cursor[], ref integer ai_cursor)
private function boolean f_repair_sql (ref str_sql astr_sql)
public subroutine f_repair_array (ref string as_sentence)
public subroutine f_repair_menu (ref string as_sentence)
public subroutine f_repair_compare (ref string as_sentence)
private function boolean f_repair_settransobject (readonly string as_syntax, ref string as_sentence)
private function boolean f_shield_error (readonly string as_syntax, ref string as_sentence)
public function long f_posnot (readonly string as_str, readonly string as_pos)
private function string f_get_variabletype (readonly string as_synatx, readonly string as_parameter)
private function string f_get_parametertype (readonly string as_synatx, string as_parameter)
public subroutine f_repair_text (ref string as_sentence)
end prototypes

private function boolean f_issqldt (readonly string as_dt);if isdate(as_dt) then return true
if not isdate(f_posmid(as_dt,'',' ')) then return false
if not istime(f_posmid(as_dt,' ','.')) then return false
if not isnumber(f_posmid(as_dt,'.','')) then return false
return true
end function

private function boolean f_posreplace (ref string as_str, readonly string as_pos, readonly string as_replace);if as_pos="" then return false
long ll_pos
ll_pos=pos(as_str,as_pos)
if ll_pos>0 then 
	as_str=replace(as_str,ll_pos,len(as_pos),as_replace)
	return true
else
	return false
end if
end function

private function long f_posrighthalf (readonly string as_str, readonly string ls_left, readonly string ls_right, readonly long ll_start);long ll_l,ll_r
ll_l=pos(as_str,ls_left,ll_start)
ll_r=pos(as_str,ls_right,ll_l+len(ls_left))
if ls_right=ls_left then return ll_r
do while ll_l>0 
	ll_l=pos(as_str,ls_left,ll_l+len(ls_left))
	if ll_l=0 or ll_l>ll_r then return ll_r
	ll_r=pos(as_str,ls_right,ll_r+len(ls_right))
loop
return 0
end function

private function boolean f_repair_messagebox (ref string as_sentence);boolean lb_ret
long ll_pos,ll_pos1
ll_pos=pos(lower(as_sentence),'messagebox(')
if ll_pos=0 then return lb_ret

ll_pos1=pos(lower(as_sentence),'messagebox(',ll_pos+1)
//如果有多个messagebox,先去重
if ll_pos1>0 then 
	as_sentence=replace(as_sentence,ll_pos,ll_pos1 - ll_pos,'')
	lb_ret=true
end if

if pos(as_sentence,".?????messagebox(?????)")>0 then
	f_posreplace(as_sentence,".?????messagebox(?????)","")
	//as_sentence="messagebox("+as_sentence+",sqlca.sqlerrtext)"
	as_sentence=replace(as_sentence,f_lastpos(as_sentence,"~t")+1,0,"messagebox(")+",sqlca.sqlerrtext)"
	lb_ret=true
elseif pos(as_sentence,".messagebox(?????)")>0 then
	f_posreplace(as_sentence,".messagebox(?????)",")")
	//as_sentence='messagebox("提示",'+as_sentence
	as_sentence=replace(as_sentence,f_lastpos(as_sentence,"~t")+1,0,'messagebox("提示",')
	lb_ret=true
elseif pos(as_sentence,")messagebox(?????)")>0 then
	f_posreplace(as_sentence,")messagebox(?????)",")")
	f_posreplace(as_sentence,'(','messagebox("提示",')
	lb_ret=true
elseif pos(as_sentence,'"messagebox(?????)')>0 then
	f_posreplace(as_sentence,'"messagebox(?????)','")')
	f_posreplace(as_sentence,'"','messagebox("提示","')
	lb_ret=true
elseif pos(as_sentence,"messagebox(?????)")>0 then
	if pos(as_sentence,')question!yesno!')>0 then
		f_posreplace(as_sentence,"messagebox(?????)",")")
		f_posreplace(as_sentence,'(','messagebox("提示",')
		f_posreplace(as_sentence,')question!yesno!',',question!,yesno!,')
		lb_ret=true
	elseif pos(as_sentence,'"question!yesno!')>0 then
		f_posreplace(as_sentence,'messagebox(?????)',')')
		f_posreplace(as_sentence,'"','messagebox("提示","')
		f_posreplace(as_sentence,'"question!yesno!','",question!,yesno!,')
		lb_ret=true
	end if
end if
return lb_ret
end function

private function boolean f_repair_sql_select (ref string as_sql, ref string as_parameter[], ref integer ai_i);string ls_sql,ls_select,ls_into
int li_c,li_bl,li_br
ls_sql=lower(as_sql)
ls_select=f_posmid(ls_sql,'selectblob ',' from')
if ls_select="" then ls_select=f_posmid(ls_sql,'select ',' from')
ai_i=1
ls_into= ' into '+ as_parameter[ai_i]
li_c=pos(ls_select,',',1)
li_bl=pos(ls_select,'(',1)
do while li_c>0 
	if li_bl>0 then
		if li_c<li_bl then
			ai_i++
			ls_into+=','+as_parameter[ai_i]
		else
			li_br=f_posrighthalf(ls_select,'(',')',li_bl)
			if li_br=0 then
				messagebox('错误','sql语句'+as_sql+'中，有未闭合的括号!')
				return false
			end if
			if li_c>li_br then
				ai_i++
				ls_into+=','+as_parameter[ai_i]
			else
				li_c=li_br - 1
				li_bl=pos(ls_select,'(',li_br)
			end if
		end if
	else
		ai_i++
		ls_into+=','+as_parameter[ai_i]
	end if
	li_c=pos(ls_select,',',li_c+1)
loop
as_sql=replace(as_sql,pos(ls_sql,' from'),1,ls_into+' ')
return true
end function

private function boolean f_repair_sqlca (ref string as_sentence);boolean lb_ret
if f_posreplace(as_sentence,".?????.","sqlca.sqlcode") then lb_ret=true
if f_posreplace(as_sentence,"?????.","sqlca.sqlcode") then lb_ret=true
if f_posreplace(as_sentence,"sqlcode.","sqlca.sqlcode") then lb_ret=true
if f_posreplace(as_sentence,"sqldbcode.","sqlca.sqldbcode") then lb_ret=true
return lb_ret
end function

private function boolean f_write (readonly string as_path, readonly string as_file);string ls_write
integer li_fileno,li_i
li_fileno=fileopen(as_path,streammode!, write!, lockwrite!, replace!)
if li_fileno=0 then return false
for li_i=0 to int(len(as_file)/32765)
	ls_write=mid(as_file,32765*li_i+1,32765)
	filewrite(li_fileno,ls_write)
next
fileclose(li_fileno)
return true
end function

public function boolean f_repair (readonly string as_path, readonly string as_file);int li_fileno,li_cursor
string ls_read,ls_syntax
str_sql lstr_sql
str_cursor lstr_cursor[]
if left(as_file,len('PBKillerRepair_'))='PBKillerRepair_' then return false
li_fileno=fileopen(as_file,LineMode!,read!,shared!)
do while	fileread(li_fileno,ls_read)>=0
	if f_repair_cursor(ls_syntax,ls_read,lstr_cursor,li_cursor)=false then
		messagebox('提示','修复文件'+as_file+'中的游标发生错误!')
		return false
	end if
	if f_repair_sql(ls_syntax,ls_read,lstr_sql)=false then
		messagebox('提示','修复文件'+as_file+'中的sql语句发生错误!')
		return false
	end if
	f_alter_comments(ls_syntax,ls_read)
	//修复其他问题
	if ls_read<>"" then
		string ls_read_repair
		ls_read_repair=ls_read
		f_repair_object(ls_read_repair)
		f_repair_settransobject(ls_syntax,ls_read_repair)
		f_repair_messagebox(ls_read_repair)
		f_repair_sqlca(ls_read_repair)
		f_repair_case(ls_read_repair)
		f_repair_editmask(ls_read_repair)
		f_repair_richtextedit(ls_read_repair)
		f_repair_variable(ls_read_repair)
		f_repair_menu(ls_read_repair)
		f_repair_array(ls_read_repair)
		f_repair_compare(ls_read_repair)
		f_repair_text(ls_read_repair)//可能有问题
		int li_sucess
		if f_shield_error(ls_syntax,ls_read_repair) then li_sucess=-1 else li_sucess=1
		f_insert_repair(ls_syntax,ls_read,ls_read_repair,li_sucess)
	end if
loop
fileclose(li_fileno)
f_write('PBKillerRepair_'+as_file,ls_syntax)
return true
end function

public function boolean f_repair (readonly string as_pathfile);int li_pos
string ls_path,ls_file
li_pos=pos(reverse(as_pathfile),'\')
if li_pos=0 then
	ls_file=as_pathfile
else
	ls_path=left(as_pathfile,len(as_pathfile) - li_pos + 1)
	ls_file=right(as_pathfile,li_pos - 1)
end if
return f_repair(ls_path,ls_file)
end function

public function long f_lastpos (readonly string as_str, readonly string as_pos);return len(as_str) - pos(reverse(as_str),reverse(as_pos)) + 1
end function

public function boolean f_repair_richtextedit (ref string as_sentence);boolean lb_ret
if left(as_sentence,len("set_hscrollbar("))="set_hscrollbar(" or pos(as_sentence,"~tset_hscrollbar(") >0 then
	f_posreplace(as_sentence,"set_hscrollbar(","this.hscrollbar=")
	as_sentence=left(as_sentence,len(as_sentence) - 1)
	lb_ret = true
elseif left(as_sentence,len("set_vscrollbar("))="set_vscrollbar(" or pos(as_sentence,"~tset_vscrollbar(") >0 then
	f_posreplace(as_sentence,"set_vscrollbar(","this.vscrollbar=")
	as_sentence=left(as_sentence,len(as_sentence) - 1)
	lb_ret = true
elseif left(as_sentence,len("set_headerfooter("))="set_headerfooter(" or pos(as_sentence,"~tset_headerfooter") >0 then
	f_posreplace(as_sentence,"set_headerfooter(","this.headerfooter=")
	as_sentence=left(as_sentence,len(as_sentence) - 1)
	lb_ret = true
elseif left(as_sentence,len("set_rulerbar("))="set_rulerbar(" or pos(as_sentence,"~tset_rulerbar(") >0 then
	f_posreplace(as_sentence,"set_rulerbar(","this.rulerbar=")
	as_sentence=left(as_sentence,len(as_sentence) - 1)
	lb_ret = true
elseif left(as_sentence,len("set_toolbar("))="set_toolbar(" or pos(as_sentence,"~tset_toolbar(") >0 then
	f_posreplace(as_sentence,"set_toolbar(","this.toolbar=")
	as_sentence=left(as_sentence,len(as_sentence) - 1)
	lb_ret = true
elseif left(as_sentence,len("set_leftmargin("))="set_leftmargin(" or pos(as_sentence,"~tset_leftmargin(") >0 then
	f_posreplace(as_sentence,"set_leftmargin(","this.leftmargin=")
	as_sentence=left(as_sentence,len(as_sentence) - 1)
	lb_ret = true
elseif left(as_sentence,len("set_topmargin("))="set_topmargin(" or pos(as_sentence,"~tset_topmargin(") >0 then
	f_posreplace(as_sentence,"set_topmargin(","this.topmargin=")
	as_sentence=left(as_sentence,len(as_sentence) - 1)
	lb_ret = true
elseif left(as_sentence,len("set_rightmargin("))="set_rightmargin(" or pos(as_sentence,"~tset_rightmargin(") >0 then
	f_posreplace(as_sentence,"set_rightmargin(","this.rightmargin=")
	as_sentence=left(as_sentence,len(as_sentence) - 1)
	lb_ret = true
elseif left(as_sentence,len("set_bottommargin("))="set_bottommargin(" or pos(as_sentence,"~tset_bottommargin(") >0 then
	f_posreplace(as_sentence,"set_bottommargin(","this.bottommargin=")
	as_sentence=left(as_sentence,len(as_sentence) - 1)
	lb_ret = true
end if
return lb_ret
end function

public function boolean f_repair_editmask (ref string as_sentence);long ll_pos
ll_pos=pos(as_sentence,"double increment = -214748")
if ll_pos>0 then
	as_sentence=replace(as_sentence,ll_pos + 19,11,"1")
	return true
end if
return false
end function

public function boolean f_repair_variable (ref string as_sentence);if as_sentence="transaction sqlca" or left(as_sentence,15)="public cursor " then
	as_sentence=""
	return true
end if
return false
end function

public function string f_posmid (readonly string as_str, readonly string as_tou, readonly string as_wei);long ll_i=1
return f_posmid(as_str,as_tou,as_wei,ll_i)
end function

private function string f_posmid (readonly string as_str, readonly string as_tou, readonly string as_wei, ref long al_l);long ll_tou,ll_wei
if al_l<1 then al_l=1
if as_tou="" then
	ll_tou=al_l
else
	ll_tou=pos(as_str,as_tou,al_l)
	if ll_tou=0 then
		al_l=0
		return ""
	end if
	ll_tou+=len(as_tou)
end if
if as_wei="" then
	ll_wei=len(as_str)
	al_l=0
else
	ll_wei=pos(as_str,as_wei,ll_tou)
	if ll_wei=0 then 
		al_l=0
		return ""
	end if
	al_l=ll_wei+len(as_wei)
	if al_l=len(as_str) then al_l=0
	ll_wei -= 1
end if
return mid(as_str,ll_tou,ll_wei - ll_tou + 1)
end function

public function string f_lastposmid (readonly string as_str, readonly string as_tou, readonly string as_wei);return reverse(f_posmid(reverse(as_str),reverse(as_wei),reverse(as_tou)))
end function

private function string f_lastposmid (readonly string as_str, readonly string as_tou, readonly string as_wei, ref long al_l);return reverse(f_posmid(reverse(as_str),reverse(as_wei),reverse(as_tou),al_l))
end function

public function boolean f_repair_sql (ref string as_syntax, ref string as_sentence, ref str_sql astr_sql);if as_sentence<>"" then
	if astr_sql.sentence="" then
		astr_sql.sqltype=f_get_sqltype(as_sentence)
		if astr_sql.sqltype<>"" then
			astr_sql.sentence=as_sentence
			astr_sql.transaction=f_lastposmid(astr_sql.sentence,' using ',';')
			as_sentence=""
		end if
	else
		if astr_sql.parameterslist="" and as_sentence='/* SQL Parameters List' then
			astr_sql.parameterslist=as_sentence+'~r~n'
			as_sentence=""
		elseif astr_sql.parameterslist<>"" and as_sentence<>'*/' then
			astr_sql.parameter[upperbound(astr_sql.parameter)+1]=f_posmid(as_sentence,'-> ','')
			astr_sql.parametertype[upperbound(astr_sql.parametertype)+1]=f_get_parametertype(as_syntax,astr_sql.parameter[upperbound(astr_sql.parameter)])
			astr_sql.parameterslist+=as_sentence+'~r~n'
			as_sentence=""
		else
			if as_sentence='*/' then
				astr_sql.parameterslist+=as_sentence
				as_sentence=""
			end if
			if astr_sql.transaction<>'sqlca' and astr_sql.transaction<>'' then 
				astr_sql.parameter[upperbound(astr_sql.parameter)+1]=':'+astr_sql.transaction
				astr_sql.parametertype[upperbound(astr_sql.parametertype)+1]=f_get_parametertype(as_syntax,astr_sql.transaction)
			end if
			if f_repair_sql(astr_sql)=false then return false
			int li_sucess
			if astr_sql.error then li_sucess=0 else li_sucess=1
			f_insert_repair(as_syntax,astr_sql.sentence,astr_sql.sentence_repair,li_sucess)
			if astr_sql.parameterslist<>"" then as_syntax+=astr_sql.parameterslist+"~r~n"
			str_sql lstr_sqlnull
			astr_sql=lstr_sqlnull
			if as_sentence<>"" then return f_repair_sql(as_syntax,as_sentence,astr_sql)
		end if
	end if
end if
return true
end function

public subroutine f_alter_comments (ref string as_syntax, ref string as_sentence);if left(as_sentence,18)="$PBExportComments$" then
	as_syntax +=as_sentence+"~~r~~nPBKillerRepair By Hucxy(QQ:992716161)~r~n"
	as_sentence=""
end if
end subroutine

private subroutine f_repair_case (ref string as_sentence);long ll_pos
string ls_test
ll_pos=pos(lower(as_sentence),'~tcase ')
if ll_pos>0 then
	ls_test=f_lastposmid(as_sentence,' ','')
	choose case ls_test
		case '='
			as_sentence=replace(left(as_sentence,len(as_sentence)-len(ls_test)-1),ll_pos+5,1,' is = ')
		case '<'
			as_sentence=replace(left(as_sentence,len(as_sentence)-len(ls_test)-1),ll_pos+5,1,' is >= ')
		case '>'
			as_sentence=replace(left(as_sentence,len(as_sentence)-len(ls_test)-1),ll_pos+5,1,' is <= ')
		case '<='
			as_sentence=replace(left(as_sentence,len(as_sentence)-len(ls_test)-1),ll_pos+5,1,' is > ')
		case '>='
			as_sentence=replace(left(as_sentence,len(as_sentence)-len(ls_test)-1),ll_pos+5,1,' is < ')
		case else
	end choose
end if
end subroutine

private subroutine f_repair_object (ref string as_sentence);if pos(as_sentence,".?????.")>0 and pos(as_sentence,"+.?????.")=0 and pos(as_sentence,".?????.+")=0 and pos(as_sentence,"(.?????.")=0 and pos(as_sentence,".?????.)")=0 and pos(as_sentence," .?????.")=0 and pos(as_sentence,".?????. ")=0 then
	f_posreplace(as_sentence,".?????.",".object.")
end if

end subroutine

private function string f_get_sqltype (readonly string as_sentence);string ls_sql,ls_check
if right(as_sentence,1)<>';' then return ''
ls_sql=lower(as_sentence)
if pos(ls_sql,'insert into ')>0 then
	ls_check=f_posmid(ls_sql,'','insert into ')
	if ls_check='' or right(ls_check,1)='~t' or right(ls_check,1)=';' then return 'insert'
elseif pos(ls_sql,'delete from ')>0 then
	ls_check=f_posmid(ls_sql,'','delete from ')
	if ls_check='' or right(ls_check,1)='~t' or right(ls_check,1)=';' then return 'delete'
elseif pos(ls_sql,'update ')>0 then
	ls_check=f_posmid(ls_sql,'','update ')
	if ls_check='' or right(ls_check,1)='~t' or right(ls_check,1)=';' then return 'update'
elseif pos(ls_sql,'select ')>0 then
	ls_check=f_posmid(ls_sql,'','select ')
	if ls_check='' or right(ls_check,1)='~t' or right(ls_check,1)=';' then return 'select'
elseif pos(ls_sql,'selectblob ')>0 then
	ls_check=f_posmid(ls_sql,'','selectblob ')
	if ls_check='' or right(ls_check,1)='~t' or right(ls_check,1)=';' then return 'selectblob'
end if
return ''
end function

public subroutine f_insert_repair (ref string as_syntax, ref string as_sentence, readonly string as_sentence_repair, readonly integer ai_sucess);if as_sentence<>"" then
	if as_sentence_repair<>"" then
		if as_sentence=as_sentence_repair then
			as_syntax+=as_sentence+"~r~n"
		else
			choose case ai_sucess
				case 2
					as_syntax+="//"+as_sentence+"//PBKillerRepairHide~r~n"+as_sentence_repair+"~r~n"
				case 1
					as_syntax+="//"+as_sentence+"//PBKillerRepairHide~r~n"+as_sentence_repair+"//PBKillerRepairResult~r~n"
				case 0
					as_syntax+="//"+as_sentence+"//PBKillerRepairHide~r~n"+as_sentence_repair+"//PBKillerRepairResult&PBKillerRepairPossibleError~r~n"
				case -1
					as_syntax+="//"+as_sentence+"//PBKillerRepairHide~r~n"+as_sentence_repair+"//PBKillerRepairResult&PBKillerRepairError~r~n"
				case else
					as_syntax+="//"+as_sentence+"//PBKillerRepairHide~r~n"+as_sentence_repair+"//PBKillerRepairUndefinition~r~n"
					messagebox("提示","未定义的错误表示"+string(ai_sucess))
			end choose
		end if
	else
		choose case ai_sucess
			case 2
				as_syntax+="//"+as_sentence+"//PBKillerRepairHide~r~n"
			case 1
				as_syntax+="//"+as_sentence+"//PBKillerRepairHide&PBKillerRepairResult~r~n"
			case 0
				as_syntax+="//"+as_sentence+"//PBKillerRepairHide&PBKillerRepairPossibleError~r~n"
			case -1
				as_syntax+="//"+as_sentence+"//PBKillerRepairHide&PBKillerRepairError~r~n"
			case else
				as_syntax+="//"+as_sentence+"//PBKillerRepairHide&PBKillerRepairUndefinition~r~n"
				messagebox("提示","未定义的错误表示"+string(ai_sucess))
		end choose
	end if
	as_sentence=""
else
	if as_sentence_repair<>"" then
		choose case ai_sucess
			case 2
				as_syntax+=as_sentence_repair+"~r~n"
			case 1
				as_syntax+=as_sentence_repair+"//PBKillerRepairResult~r~n"
			case 0
				as_syntax+=as_sentence_repair+"//PBKillerRepairResult&PBKillerRepairPossibleError~r~n"
			case -1
				as_syntax+=as_sentence_repair+"//PBKillerRepairResult&PBKillerRepairError~r~n"
			case else
				as_syntax+=as_sentence_repair+"//PBKillerRepairUndefinition~r~n"
				messagebox("提示","未定义的错误表示"+string(ai_sucess))
		end choose
	else
		return
	end if
end if
end subroutine

public subroutine f_insert_repair (ref string as_syntax, ref string as_sentence, readonly string as_sentence_repair);f_insert_repair(as_syntax,as_sentence,as_sentence_repair,2)
end subroutine

public function boolean f_repair_cursor (ref string as_syntax, ref string as_sentence, ref str_cursor astr_cursor[], ref integer ai_cursor);string ls_cursor
ls_cursor=f_posmid(as_sentence,"open ",";")
if ls_cursor<>"" and pos(ls_cursor," ")=0 then
	for ai_cursor=upperbound(astr_cursor) to 1 step -1
		if pos(astr_cursor[ai_cursor].cursordeclare," "+ls_cursor+" ")>0 then
			exit;
		end if
	next
	if ai_cursor=0 then
		messagebox("","未找该游标的定义!~r~n"+as_sentence)
		return false
	end if
	astr_cursor[ai_cursor].cursoropen=as_sentence
	as_sentence=""
	return true
end if
if ai_cursor<>0 then
	if astr_cursor[ai_cursor].sql.parameterslist="" and as_sentence='/* SQL Parameters List' then
		astr_cursor[ai_cursor].sql.parameterslist=as_sentence+'~r~n'
		as_sentence=""
	elseif astr_cursor[ai_cursor].sql.parameterslist<>"" and as_sentence<>'*/' then
		astr_cursor[ai_cursor].sql.parameter[upperbound(astr_cursor[ai_cursor].sql.parameter)+1]=f_posmid(as_sentence,'-> ','')
		astr_cursor[ai_cursor].sql.parametertype[upperbound(astr_cursor[ai_cursor].sql.parametertype)+1]=f_get_parametertype(as_syntax,astr_cursor[ai_cursor].sql.parameter[upperbound(astr_cursor[ai_cursor].sql.parameter)])
		astr_cursor[ai_cursor].sql.parameterslist+=as_sentence+'~r~n'
		as_sentence=""
	else
		if as_sentence='*/' then
			astr_cursor[ai_cursor].sql.parameterslist+=as_sentence
			as_sentence=""
		end if
		if f_repair_sql(astr_cursor[ai_cursor].sql)=false then return false
		f_insert_repair(as_syntax,ls_cursor,f_posmid(astr_cursor[ai_cursor].cursoropen,'','open')+astr_cursor[ai_cursor].cursordeclare,1)
		int li_sucess
		if astr_cursor[ai_cursor].sql.error then li_sucess=0 else li_sucess=1
		f_insert_repair(as_syntax,ls_cursor,f_posmid(astr_cursor[ai_cursor].cursoropen,'','open')+astr_cursor[ai_cursor].sql.sentence_repair,li_sucess)
		as_syntax+=astr_cursor[ai_cursor].cursoropen+"~r~n"
		if astr_cursor[ai_cursor].sql.parameterslist<>"" then as_syntax+=astr_cursor[ai_cursor].sql.parameterslist+"~r~n"
		ai_cursor=0
		if as_sentence<>"" then f_repair_cursor(as_syntax,as_sentence,astr_cursor,ai_cursor)
	end if
	return true
end if
ls_cursor=f_posmid(as_sentence,"declare "," cursor for")
if ls_cursor<>"" and pos(ls_cursor," ")=0 then
	astr_cursor[upperbound(astr_cursor)+1].cursordeclare=as_sentence
	f_insert_repair(as_syntax,as_sentence,"")
	return true
end if
if upperbound(astr_cursor)<>0 then
	if astr_cursor[upperbound(astr_cursor)].cursordeclare<>"" and astr_cursor[upperbound(astr_cursor)].sql.sentence="" then
		astr_cursor[upperbound(astr_cursor)].sql.sentence=as_sentence
		astr_cursor[upperbound(astr_cursor)].sql.sqltype="curosr"
		f_insert_repair(as_syntax,as_sentence,"")
		return true
	end if
end if
return true
end function

private function boolean f_repair_sql (ref str_sql astr_sql);astr_sql.sentence_repair=astr_sql.sentence
int li_i
if astr_sql.sqltype="select" or astr_sql.sqltype="selectblob" then 
	if f_repair_sql_select(astr_sql.sentence_repair,astr_sql.parameter,li_i) = false then return false
end if
long ll_start=1,ll_str,ll_str1,ll_date,ll_date1,ll_num,ll_num1
string ls_str,ls_type
do while true
	ll_str1=ll_start
	do
		ll_str=pos(astr_sql.sentence_repair,"'",ll_str1)
		ls_str=f_posmid(astr_sql.sentence_repair,"'","'",ll_str1)
		if ls_str=" " then
			ls_type="文本"
			exit;
		elseif f_issqldt(ls_str) then
			ls_type="日期"
			exit;
		end if
	loop until ll_str=0
	if ll_str=0 then ll_str=len(astr_sql.sentence_repair)
	ll_date=pos(astr_sql.sentence_repair,'{d ',ll_start)
	if ll_date=0 then
		ll_date=len(astr_sql.sentence_repair)
	else
		ll_date1=pos(astr_sql.sentence_repair,'}',ll_date)
	end if
	ll_num=pos(astr_sql.sentence_repair,' 0 ',ll_start)
	ll_num1=pos(astr_sql.sentence_repair,'=0 ',ll_start)
	if ll_num1<>0 and (ll_num>ll_num1 or ll_num=0) then ll_num=ll_num1
	ll_num1=pos(astr_sql.sentence_repair,'+0 ',ll_start)
	if ll_num1<>0 and (ll_num>ll_num1 or ll_num=0) then ll_num=ll_num1
	ll_num1=pos(astr_sql.sentence_repair,'-0 ',ll_start)
	if ll_num1<>0 and (ll_num>ll_num1 or ll_num=0) then ll_num=ll_num1
	ll_num1=pos(astr_sql.sentence_repair,'*0 ',ll_start)
	if ll_num1<>0 and (ll_num>ll_num1 or ll_num=0) then ll_num=ll_num1
	ll_num1=pos(astr_sql.sentence_repair,'/0 ',ll_start)
	if ll_num1<>0 and (ll_num>ll_num1 or ll_num=0) then ll_num=ll_num1
	if ll_num=0 then ll_num=len(astr_sql.sentence_repair)
	if ll_str<ll_num and ll_str<ll_date then
		if li_i=upperbound(astr_sql.parameter) then
			astr_sql.error=true
			exit
		end if
		boolean lb_pd
		if astr_sql.parametertype[li_i+1]="" then
			lb_pd=true
		else
			lb_pd=false
			if ls_type="日期" then
				if astr_sql.parametertype[li_i+1]="datetime" or astr_sql.parametertype[li_i+1]<>"date" or astr_sql.parametertype[li_i+1]<>"time" then lb_pd = true
			else
				if astr_sql.parametertype[li_i+1]="string" then lb_pd = true
			end if
		end if
		if lb_pd=true then
			li_i++
			astr_sql.sentence_repair=replace(astr_sql.sentence_repair,ll_str,ll_str1 - ll_str,astr_sql.parameter[li_i])
			ll_start=ll_str + len(astr_sql.parameter[li_i])
		else
			astr_sql.error=true
			ll_start++
		end if
	elseif ll_num<ll_str and ll_num<ll_date then
		if li_i=upperbound(astr_sql.parameter) then
			astr_sql.error=true
			exit
		end if
		if astr_sql.parametertype[li_i+1]="" or astr_sql.parametertype[li_i+1]="decimal" or astr_sql.parametertype[li_i+1]="double" or astr_sql.parametertype[li_i+1]="integer" or astr_sql.parametertype[li_i+1]="long" or astr_sql.parametertype[li_i+1]="real" or astr_sql.parametertype[li_i+1]="uint" or astr_sql.parametertype[li_i+1]="ulong" then
			li_i++
			astr_sql.sentence_repair=replace(astr_sql.sentence_repair,ll_num+1,1,astr_sql.parameter[li_i])
			ll_start=ll_num + len(astr_sql.parameter[li_i]) + 2
		else
			astr_sql.error=true
			ll_start++
		end if
	elseif ll_date<ll_str and ll_date<ll_num then
		if li_i=upperbound(astr_sql.parameter) then
			astr_sql.error=true
			exit
		end if
		if astr_sql.parametertype[li_i+1]="" or astr_sql.parametertype[li_i+1]="datetime" or astr_sql.parametertype[li_i+1]<>"date" or astr_sql.parametertype[li_i+1]<>"time" then
			li_i++
			astr_sql.sentence_repair=replace(astr_sql.sentence_repair,ll_date,ll_date1 - ll_date + 1,astr_sql.parameter[li_i])
			ll_start=ll_date + len(astr_sql.parameter[li_i])
		else
			astr_sql.error=true
			ll_start++
		end if
	else
		exit
	end if
loop

if li_i<upperbound(astr_sql.parameter)-1 then
	messagebox('提示','错误!~r~n'+astr_sql.sentence_repair)
	return false
elseif li_i=upperbound(astr_sql.parameter)-1 then
	if lower(f_lastposmid(astr_sql.sentence_repair,' ',';'))='sqlca' then
		messagebox('提示','错误!~r~n'+astr_sql.sentence_repair)
		return false
	end if
elseif li_i=upperbound(astr_sql.parameter) then
	if astr_sql.transaction<>'sqlca' and astr_sql.transaction<>'' then 
		f_posreplace(astr_sql.sentence_repair,f_lastposmid(astr_sql.sentence_repair,' ',';')+';','sqlca;')
	end if
end if
return true
end function

public subroutine f_repair_array (ref string as_sentence);int li_pos
li_pos=pos(as_sentence,"[")
if li_pos>0 then
	if f_posrighthalf(as_sentence,"[","]",li_pos)=0 then
		li_pos=pos(as_sentence," = ",li_pos)
		if li_pos>0 then
			as_sentence=replace(as_sentence,li_pos,0," + 1]")
		end if
	end if
end if
end subroutine

public subroutine f_repair_menu (ref string as_sentence);if pos(as_sentence,".item[")>0 and pos(as_sentence,"].       [")>0 and pos(as_sentence,"].on ")>0 then
	f_posreplace(as_sentence,"].       [","].item[")
	f_posreplace(as_sentence,"].on ","].enabled ")
end if
end subroutine

public subroutine f_repair_compare (ref string as_sentence);int li_pos
li_pos=pos(as_sentence," -  > ")
if li_pos>0 then
	string ls_var
	ls_var=f_lastposmid(as_sentence," "," -  > ")
	f_posreplace(as_sentence," "+ls_var+" -  > "," - "+ls_var+" > ")
end if
end subroutine

private function boolean f_repair_settransobject (readonly string as_syntax, ref string as_sentence);string ls_str
if pos(as_sentence,"settransobject(")=0 or pos(as_sentence,".settransobject(")>0 then return false
ls_str=f_posmid(as_sentence,"settransobject(",")")
if ls_str<>"" and pos(lower(ls_str),'sqlca')=0 then
	string ls_test
	if pos(ls_str,".")>0 then 
		ls_test=f_lastposmid(ls_str,".","")
	else
		ls_test=ls_str
	end if
	if pos(as_syntax,"type "+ls_test+" from datawindow within ") >0 or pos(as_syntax,"datastore "+ls_test) >0 then
		f_posreplace(as_sentence,"("+ls_str+")","(sqlca)")
		as_sentence=ls_str+"."+as_sentence
		return true
	end if
end if
return false
end function

private function boolean f_shield_error (readonly string as_syntax, ref string as_sentence);if as_sentence="" then return false

int li_pos
li_pos=pos(as_sentence,"if  then")
if li_pos>0 then
	as_sentence=replace(as_sentence,li_pos + 3,0,"true")
	return true
end if

if &
pos(as_sentence,'?????')>0 or &
pos(as_sentence," + ,")>0 &
then
	as_sentence=""
	return true
end if

string ls_test
ls_test=right(as_sentence,len(as_sentence) - f_posnot(as_sentence,"~t") + 1)
if ls_test<>"return" and ls_test<>"forward" and ls_test<>"continue" and ls_test<>"else" and ls_test<>"next" and ls_test<>"do" and ls_test<>"loop" and ls_test<>"exit" and ls_test<>"halt" then
	if pos(ls_test," ")=0 and pos(ls_test,"~t")=0 and pos(ls_test,"(")=0 and pos(ls_test,".")=0 and pos(ls_test,";")=0 and pos(ls_test,":")=0 and pos(ls_test,",")=0 and pos(ls_test,"//")=0 and pos(ls_test,"/*")=0 and pos(ls_test,"*/")=0 then
		if isnumber(ls_test) then
			as_sentence=""
			return true
		elseif ls_test="true" or ls_test="false" then
			as_sentence=""
			return true
		elseif f_get_variabletype(as_syntax,ls_test)<>"" then
			as_sentence=""
			return true
		end if
	end if
end if

return false
end function

public function long f_posnot (readonly string as_str, readonly string as_pos);long ll_pos=1
if as_str="" or as_pos="" then return 0
do while as_pos=mid(as_str,ll_pos,len(as_pos))
	ll_pos+=len(as_pos)
loop
return ll_pos
end function

private function string f_get_variabletype (readonly string as_synatx, readonly string as_parameter);long ll_pos
string ls_test,ls_type
int li_moshi
if pos(as_parameter,'.')>0 then
	ls_test=f_posmid(as_parameter,".","")
	choose case ls_test
		case "text"
			ls_type="string"
		case "dataobject"
			ls_type="string"
		case else
			ls_type=""
	end choose
else
	if right(as_parameter,1)="]" then
		ls_test=" "+f_posmid(as_parameter,"","[")
	else
		ls_test=" "+as_parameter
	end if
	ll_pos=1
	li_moshi=0
	do
		if right(as_parameter,1)="]" then
			ls_type=f_lastposmid(as_synatx,"~r~n",ls_test + "[",ll_pos)
			if ll_pos = 0 then
				ll_pos = -1
			end if
		else
			choose case li_moshi
				case 0
					ls_type=f_lastposmid(as_synatx,"~r~n",ls_test+"~r~n",ll_pos)
				case 1
					ls_type=f_lastposmid(as_synatx,"~r~n",ls_test+" ",ll_pos)
				case 2
					ls_type=f_lastposmid(as_synatx,"~r~n",ls_test+",",ll_pos)
				case 3
					ls_type=f_lastposmid(as_synatx,"~r~n",ls_test+")",ll_pos)
				case else
					ll_pos=-1
			end choose
			if ll_pos=0 then 
				li_moshi++
				continue
			end if
		end if
		if ll_pos=-1 then
			ls_type=""
		else
			boolean lb_loop
			lb_loop=true
			do
				if pos(ls_type,';')>0 then
					ls_type=f_lastposmid(ls_type,";","")
				elseif pos(ls_type,',')>0 then 
					ls_type=f_lastposmid(ls_type,",","")
				elseif pos(ls_type,'(')>0 then
					ls_type=f_lastposmid(ls_type,"(","")
				elseif pos(ls_type,' ')>0 then 
					ls_type=f_lastposmid(ls_type," ","")
				else
					lb_loop=false
				end if
			loop while lb_loop
			if ls_type="string" or ls_type="decimal" or ls_type="double" or ls_type="integer" or ls_type="long" or ls_type="real" or ls_type="uint" or ls_type="ulong" or ls_type="datetime" or ls_type="date" or ls_type="time" then exit
		end if
	loop until ll_pos=-1
end if
return ls_type
end function

private function string f_get_parametertype (readonly string as_synatx, string as_parameter);if left(as_parameter,1)=":" then as_parameter=right(as_parameter,len(as_parameter) - 1)
return f_get_variabletype(as_synatx,as_parameter)
end function

public subroutine f_repair_text (ref string as_sentence);if pos(as_sentence,".?????")>0 and pos(as_sentence," = ")>0 then
	f_posreplace(as_sentence,".?????",".text")
	as_sentence+="//PBKillerRepairTest"
end if
end subroutine

on uo_pbkiller_repair.create
TriggerEvent( this, "constructor" )
end on

on uo_pbkiller_repair.destroy
TriggerEvent( this, "destructor" )
end on

