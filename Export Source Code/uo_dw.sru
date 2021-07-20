$PBExportHeader$uo_dw.sru
forward
global type uo_dw from nonvisualobject
end type
end forward

type str_dwlist from structure
	string		dwlist
end type

type str_browseinfo from structure
	unsignedlong		howner
	unsignedlong		pidlroot
	string		pszdisplayname
	string		lpsztitle
	unsignedlong		ulflags
	unsignedlong		lpfn
	unsignedlong		lparm
	string		iimage
end type

type strc_nod_tree from structure
	unsignedlong		nod_addr
	unsignedlong		next_left
	unsignedlong		next_right
	boolean		flag
end type

type str_openfilename from structure
	long		lstructsize
	long		hwndowner
	long		hinstance
	blob		lpstrfilter
	long		lpstrcustomfilter
	long		nmaxcustfilter
	long		nfilterindex
	blob		lpstrfile
	long		nmaxfile
	blob		lpstrfiletitle
	long		nmaxfiletitle
	string		lpstrinitialdir
	blob		lpstrtitle
	long		flags
	long		nfileoffset
	integer		nfileextension
	long		lpstrdefext
	long		lcustdata
	long		lpfnhook
	long		lptemplatename
end type

global type uo_dw from nonvisualobject
end type
global uo_dw uo_dw

type prototypes
function integer LibDirExt(string sFileName,string sExtName,ref str_dwlist sDelphiResult) library "PBLibrary.dll"
function boolean CreateDirectoryA(ref string lppathname,int sa) library "kernel32.dll"
Function Ulong GetCurrentDirectoryA(Ulong buflen, ref String dir) Library "kernel32.dll"
function ulong GetModuleFileNameA(ulong hModule,ref string lpFilename,ulong nsize) Library "kernel32.dll"
FUNCTION integer GetOpenFileNameA(REF str_OPENFILENAME lpOpenfilename)LIBRARY "comdlg32.dll"
FUNCTION integer GetOpenFileNameW(REF str_OPENFILENAME lpOpenfilename)LIBRARY "comdlg32.dll"
function ulong ShellExecuteA(ulong hWnd,string Operation,string FileName,string Parameters,string Directory,integer ShowCmd) library "shell32.dll"
Function unsignedlong SHBrowseForFolderA( str_browseinfo lpbrowseinfo ) Library 'shell32'
Function unsignedlong SHGetPathFromIDListA( unsignedlong pidl, ref string pszPath) Library 'shell32'
Subroutine CoTaskMemFree(ulong idlist) Library 'ole32'
//FUNCTION ulong GetPrivateProfileStringA(readonly string lpApplicationName,readonly string lpKeyName,readonly string lpDefault,ref string lpReturnedString,ulong nSize,readonly string lpFileName) LIBRARY "kernel32.dll"
//FUNCTION ulong GetPrivateProfileStringW(readonly string lpApplicationName,readonly string lpKeyName,readonly string lpDefault,ref string lpReturnedString,ulong nSize,readonly string lpFileName) LIBRARY "kernel32.dll"


end prototypes

type variables
environment ienv
date id_byrq=today()
datastore ids,ids_dwlist,ids_tblist
string is_rundir,is_libpath[]
end variables

forward prototypes
public function string get_syntax (readonly string as_objname, readonly string as_library)
public function string get_syntax (readonly string as_objname)
public function string get_syntax (readonly datawindow adw)
public function string get_syntax (readonly datastore ads)
public subroutine tv_load (ref treeview atv)
public function boolean dw_import (readonly string as_objname, readonly string as_syntax, string as_comments, readonly string as_library)
public function boolean dw_import (readonly string as_objname, readonly string as_syntax, readonly string as_comments)
public function boolean dw_import ()
public function boolean dw_import (readonly string as_dwpath, readonly string as_libpath)
public function string get_folder (readonly window aw, readonly string as_info)
public function string get_exportdir ()
public function any ifnull (readonly any any, readonly any default)
public function any iif (readonly boolean ab, readonly any a1, readonly any a2)
public function boolean dw_export (readonly string as_objname, readonly datawindow adw, readonly string as_comments, readonly string as_path)
public function boolean dw_export (readonly string as_objname, readonly datawindow adw, readonly string as_comments, readonly window aw)
public function boolean dw_export (readonly string as_objname, string as_syntax, string as_comments, string as_path)
public function boolean dw_export (readonly string as_objname, readonly string as_syntax, readonly string as_comments, readonly window aw)
public function boolean dw_export (ref treeview atv, readonly long al_handle, readonly string as_path, ref integer ai_count)
public function boolean dw_import (readonly string as_path)
public function string get_comments (readonly string as_comments)
public function boolean dw_delete (ref treeview atv, readonly long al_handle)
public function boolean dw_delete (readonly string as_library, readonly string as_objname)
public function boolean dw_import (ref treeview atv, readonly long al_handle)
public function boolean dw_copy (ref treeview atv, readonly long al_handle)
public function boolean dw_move (ref treeview atv, readonly long al_handle)
public function boolean lib_remove (ref treeview atv, readonly long al_handle)
public subroutine lib_remove (readonly string as_libpath)
public function string get_dwolist (readonly string as_pbdpath)
public function string split (ref string as_str, readonly string as_pos)
public function string splitlast (ref string as_str, readonly string as_pos)
public function string get_rundir ()
public function integer get_openfilename (readonly long al_handle, readonly string as_title, ref string as_pathname, ref blob ab_filename, string as_filter, readonly long al_flags)
public function integer get_openfilename (readonly long al_handle, readonly string as_title, ref string as_pathname, ref string as_filename, readonly string as_filter)
public function integer get_openfilename (readonly long al_handle, readonly string as_title, ref string as_pathname, ref string as_filename[], readonly string as_filter)
public function boolean lib_add (readonly string as_libpath)
public function string posmidlast (string as_str, readonly string as_tou, readonly string as_wei)
public function string posmid (readonly string as_str, readonly string as_tou, readonly string as_wei, readonly long al_l)
public function string posreplace (string ls_str, readonly string ls_pos, readonly string ls_replace)
public function string get_liblist ()
public subroutine set_libarray (string as_liblist)
public function string get_bakdir ()
public function boolean get_tblist (readonly string as_dbtype)
public function boolean db_connect (readonly string as_dbms, readonly string as_servername, readonly string as_database, readonly string as_logid, readonly string as_logpass, readonly string as_dbparm)
public subroutine set_liblist_ini ()
public function string get_liblist_ini ()
public subroutine lib_clear ()
public function boolean set_liblist (readonly string as_liblist)
public subroutine get_liblist_pbt (readonly string as_pbt, ref string as_liblist[])
public function string get_pbtlibpath (readonly string as_path)
public subroutine tv_load (ref treeview atv, ref string adw[])
end prototypes

public function string get_syntax (readonly string as_objname, readonly string as_library);string ls_syntax,ls_error
ls_syntax=LibraryExport(as_library,as_objname,ExportDataWindow!)
IF ls_syntax="" then ls_syntax=get_syntax(as_objname)
return ls_syntax
end function

public function string get_syntax (readonly string as_objname);ids.dataobject=as_objname
return get_syntax(ids)
end function

public function string get_syntax (readonly datawindow adw);string ls_syntax,ls_data
if isvalid(adw) then
	ls_syntax=adw.Describe("DataWindow.Syntax")
	ls_data=Trim(adw.Describe("DataWindow.Syntax.Data"))
	if ls_data<>"data()" then ls_syntax+="~r~n"+ls_data
end if
return ls_syntax
end function

public function string get_syntax (readonly datastore ads);string ls_syntax,ls_data
if isvalid(ads) then
	ls_syntax=ads.Describe("DataWindow.Syntax")
	ls_data=Trim(ads.Describe("DataWindow.Syntax.Data"))
	if ls_data<>"data()" then ls_syntax+="~r~n"+ls_data
end if
return ls_syntax
end function

public subroutine tv_load (ref treeview atv);string dw[]
tv_load(atv,dw)
end subroutine

public function boolean dw_import (readonly string as_objname, readonly string as_syntax, string as_comments, readonly string as_library);string ls_error
as_comments=get_comments(as_comments)
if libraryimport(as_library,as_objname,ImportDataWindow!,as_syntax,ls_error,as_comments)<>1 then
	messagebox("提示","往库文件"+as_library+"中导入数据窗口"+as_objname+"失败!~r~n错误信息:"+ls_error+"~r~n如果错误信息为空则说明是PB本身的问题，重新打开软件试试。")
	return false
end if
return true
end function

public function boolean dw_import (readonly string as_objname, readonly string as_syntax, readonly string as_comments);string ls_path,ls_filename
if getfilesavename("请选择要保存的库文件",ls_path,ls_filename, "库文件","库文件(*.pbl;*.pbd),*.pbl;*.pbd")>0 then
	if not fileexists(ls_path) then librarycreate(ls_path,"PBDWEDIT By Hucxy")
	return dw_import(as_objname,as_syntax,as_comments,ls_path)
end if
return false
end function

public function boolean dw_import ();string ls_dwpath,ls_libpath,ls_file
if getfileopenname("请选择要导入的数据窗口文件",ls_dwpath,ls_file,"srd","DataWindows (*.srd),*.srd")>0 then
	if getfileopenname("请选择要导入的PBL文件",ls_libpath,ls_file,"PBL","PBL Files (*.PBL),*.PBL")>0 then return dw_import(ls_dwpath,ls_libpath)
end if
return false
end function

public function boolean dw_import (readonly string as_dwpath, readonly string as_libpath);string ls_syntax,ls_dwstr,ls_objname,ls_pos
integer li_fileno,li_i,li_len
li_len=int(filelength(as_dwpath)/32765)
li_fileno=fileopen(as_dwpath,streammode!,read!,shared!)
for li_i=0 to li_len
	fileread(li_fileno,ls_dwstr)
	ls_syntax+=ls_dwstr
next
fileclose(li_fileno)
ls_objname=posmid(ls_syntax,"$PBExportHeader$",".srd",1)
ls_pos="$PBExportHeader$"+ls_objname+".srd~r~n"
ls_dwstr=posmid(ls_syntax,"$PBExportComments$","~r",1)
if ls_dwstr<>"" then ls_pos="$PBExportComments$"+ls_dwstr+"~r~n"
ls_syntax=posmid(ls_syntax,ls_pos,"",1)
return dw_import(ls_objname,ls_syntax,ls_dwstr,as_libpath)
end function

public function string get_folder (readonly window aw, readonly string as_info);str_browseinfo lstr_bi
unsignedlong ll_pidl
unsignedlong ll_r
Integer li_pos
String ls_Path
unsignedlong ll_Null
unsignedLong BIF_RETURNONLYFSDIRS = 1
SetNull(ll_Null)
lstr_bi.hOwner = handle(aw)
lstr_bi.pidlRoot = 0
lstr_bi.lpszTitle = as_info
lstr_bi.ulFlags = bif_ReturnOnlyFSDirs
lstr_bi.pszDisplayName = Space( 255 )
lstr_bi.lpfn = ll_Null
ll_pidl = SHBrowseForFolderA( lstr_bi )
ls_Path = Space( 255 )
ll_R = SHGetPathFromIDListA( ll_pidl, ls_Path )
CoTaskMemFree( ll_pidl )
RETURN ls_Path
end function

public function string get_exportdir ();return is_rundir+"导出\"+string(today(),"yyyymmdd")+string(now(),"hhmmss")+"\"
end function

public function any ifnull (readonly any any, readonly any default);if isnull(any) then return default
return any
end function

public function any iif (readonly boolean ab, readonly any a1, readonly any a2);if ab then return a1
return a2
end function

public function boolean dw_export (readonly string as_objname, readonly datawindow adw, readonly string as_comments, readonly string as_path);return dw_export(as_objname,get_syntax(adw),as_comments,as_path)
end function

public function boolean dw_export (readonly string as_objname, readonly datawindow adw, readonly string as_comments, readonly window aw);return dw_export(as_objname,get_syntax(adw),as_comments,aw)
end function

public function boolean dw_export (readonly string as_objname, string as_syntax, string as_comments, string as_path);string ls_path//,ls_dwstr
integer li_fileno,li_i
blob lbb_dw,lbb_dwwrite
//判断参数合法性
if len(as_path)=0 or len(as_objname)=0 or len(as_syntax)=0 then return false
as_comments=get_comments(as_comments)
if right(as_path,1)<>"\" then as_path+="\"
//生成目录
li_i=pos(as_path,"\",1)
do while li_i>0
	ls_path=left(as_path,li_i)
	if not fileexists(ls_path) then CreateDirectoryA(ls_path,0)
	li_i=pos(as_path,"\",li_i+1)
loop
//合成文件数据
as_syntax="$PBExportHeader$"+as_objname+".srd~r~n$PBExportComments$"+as_comments+"~r~n"+as_syntax
//写出文件
li_fileno=fileopen(as_path+as_objname+".srd",streammode!, write!, lockwrite!, replace!)
if ienv.PBMajorRevision>9 then lbb_dw=blob(char(65279))
lbb_dw+=blob(as_syntax)
for li_i=0 to int(len(lbb_dw)/32765)
	lbb_dwwrite=blobmid(lbb_dw,32765*li_i+1,32765)
	filewrite(li_fileno,lbb_dwwrite)
next
fileclose(li_fileno)
return true
end function

public function boolean dw_export (readonly string as_objname, readonly string as_syntax, readonly string as_comments, readonly window aw);return dw_export(as_objname,as_syntax,as_comments,get_folder(aw,"选择导出目录"))

end function

public function boolean dw_export (ref treeview atv, readonly long al_handle, readonly string as_path, ref integer ai_count);string ls_syntax
long ll_handle
TreeViewItem ltvi_item,ltvi_lib
atv.GetItem(al_handle,ltvi_item)
if ltvi_item.level=3 then
	ll_handle=atv.FindItem(ParentTreeItem!,al_handle)
	atv.GetItem(ll_handle,ltvi_lib)
	ls_syntax=get_syntax(ltvi_item.label,ltvi_lib.label)
	if ls_syntax<>"" then 
		if dw_export(ltvi_item.label,ls_syntax,string(ltvi_item.data),as_path+ltvi_lib.label) then 
			ai_count++
			return true
		end if
	end if
	return false
else
	ll_handle=atv.FindItem(ChildTreeItem!,al_handle)
	do while ll_handle <> -1
		if dw_export(atv,ll_handle,as_path,ai_count) = false then return false
		ll_handle=atv.FindItem(NextTreeItem!,ll_handle)
	loop
	return true
end if
end function

public function boolean dw_import (readonly string as_path);string ls_path,ls_file
if pos(as_path,'.pbl')>0 then
	if pos(as_path,'.srd')<0 then
		if getfileopenname("请选择要导入的数据窗口文件",ls_path,ls_file,"srd","DataWindows (*.srd),*.srd")>0 then return dw_import(ls_path,as_path)
	end if
else
	if pos(as_path,'.srd')>0 then
		if getfileopenname("请选择要导入的PBL文件",ls_path,ls_file,"PBL","PBL Files (*.PBL),*.PBL")>0 then return dw_import(as_path,ls_path)
	else
		return dw_import()
	end if
end if
return false
end function

public function string get_comments (readonly string as_comments);if isnull(as_comments) or as_comments="" then
	return "PBDWEDIT By Hucxy"
elseif pos(as_comments,"PBDWEDIT By Hucxy")=0 then
	return as_comments+" PBDWEDIT By Hucxy"
else
	return as_comments
end if
end function

public function boolean dw_delete (ref treeview atv, readonly long al_handle);TreeViewItem ltvi_item,ltvi_lib
atv.GetItem(al_handle,ltvi_item)
if ltvi_item.level=3 then
	atv.GetItem(atv.FindItem(ParentTreeItem!,al_handle),ltvi_lib)
	dw_delete(string(ltvi_lib.data),ltvi_item.label)
	atv.deleteitem(al_handle)
	return true
end if
return false
end function

public function boolean dw_delete (readonly string as_library, readonly string as_objname);return LibraryDelete(as_library,as_objname,ImportDataWindow!)=1
end function

public function boolean dw_import (ref treeview atv, readonly long al_handle);string ls_path,ls_file
long ll_handle
TreeViewItem ltvi_item
atv.GetItem(al_handle,ltvi_item)
if ltvi_item.level=2 then
	if getfileopenname("请选择要导入的数据窗口文件",ls_path,ls_file,"srd","DataWindows (*.srd),*.srd")>0 then
		if dw_import(ls_path,string(ltvi_item.data)) then
			tv_load(atv)
//			ltvi_item.Label = pos_mid(ls_file,"",'.srd',1)
//			ltvi_item.Data = ""
//			ltvi_item.PictureIndex = 3
//			ltvi_item.SelectedPictureIndex = 3
//			ltvi_item.children=false
//			ll_handle=atv.InsertItemLast(al_handle,ltvi_item)
//			atv.trigger event selectionchanged(1,ll_handle)
			return true
		end if
	end if
end if
return false
end function

public function boolean dw_copy (ref treeview atv, readonly long al_handle);string ls_syntax
TreeViewItem ltvi_item,ltvi_lib
atv.GetItem(al_handle,ltvi_item)
if ltvi_item.level=3 then
	atv.GetItem(atv.FindItem(ParentTreeItem!,al_handle),ltvi_lib)
	ls_syntax=get_syntax(ltvi_item.label,string(ltvi_lib.data))
	if dw_import(ltvi_item.label,ls_syntax,string(ltvi_item.data)) then
		tv_load(atv)
		return true
	end if
end if
return false
end function

public function boolean dw_move (ref treeview atv, readonly long al_handle);string ls_syntax,ls_path
TreeViewItem ltvi_item,ltvi_lib
atv.GetItem(al_handle,ltvi_item)
if ltvi_item.level=3 then
	if getfilesavename("请选择要保存的库文件",ls_path,ls_syntax, "库文件","库文件(*.pbl;*.pbd),*.pbl;*.pbd")>0 then
		atv.GetItem(atv.FindItem(ParentTreeItem!,al_handle),ltvi_lib)
		if lower(ls_path)<>lower(string(ltvi_lib.data)) then
			if not fileexists(ls_path) then librarycreate(ls_path,"PBDWEDIT By Hucxy")
			ls_syntax=get_syntax(ltvi_item.label,string(ltvi_lib.data))
			if dw_import(ltvi_item.label,ls_syntax,string(ltvi_item.data),ls_path) then
				dw_delete(string(ltvi_lib.data),ltvi_item.label)
				tv_load(atv)
				return true
			end if
		end if
	end if
end if
return false
end function

public function boolean lib_remove (ref treeview atv, readonly long al_handle);TreeViewItem ltvi_item
atv.GetItem(al_handle,ltvi_item)
if ltvi_item.level=2 then
	lib_remove(string(ltvi_item.data))
	atv.deleteitem(al_handle)
	return true
end if
return false
end function

public subroutine lib_remove (readonly string as_libpath);string lsnull[],ls_libpath[]
int li_i
ls_libpath=is_libpath
is_libpath=lsnull[]
for li_i=1 to upperbound(ls_libpath)
	if ls_libpath[li_i]<>as_libpath then
		is_libpath[upperbound(is_libpath)+1]=ls_libpath[li_i]
	end if
next
end subroutine

public function string get_dwolist (readonly string as_pbdpath);string ls_dwolist
//get dwo name list
//get dwo list from ent band


//open file
int iFileHandle
blob bread
boolean isUnicode = false
ulong ul_NOD_OFFSET                    //process current NOD
ulong ul_NEXT_NOD_OFFSET = 1024        //default first NOD 0x400H
ulong ul_LenOfObjName_OFFSET = 22      //dwo name's index of ENT*
ulong ul_LenOfENTBand = 3040
ulong ul_LenOfObjectInfo = 24
string ls_objname
ulong ul_fileLen;

strc_nod_tree Nod_List[]               //array list

int i


ul_fileLen = FileLength(as_pbdpath)

//note:must be shared! FILE-LOCK-MODE,else,after restart() event,cannt open the file.important this.
iFileHandle = FileOpen(as_pbdpath,StreamMode!,Read!,shared!)
if iFileHandle <1 then
	messagebox("open file error","Cannt open file: " + as_pbdpath)
	return ""
end if

//get hdr offse
//find the hdr if dll
long hdr_offset = 0

//if gs_filetype = ".dll" or gs_filetype = ".exe" then
//	//file seek to RTL FromEnd!
//	FileSeek(iFileHandle, -512,FromEnd!)
//	Fileread(iFileHandle,bread)
//
//	hdr_offset = long(blobmid(bread,5,4))
//end if

//1.ansi or unicode
FileSeek(iFileHandle,hdr_offset,FromBeginning!)
Fileread(iFileHandle,bread)

//the fifth char is "00" then it's unicode
if Integer(BlobMid(bread,5,4)) = 80 then //0x0050H
	isUnicode = true
	ul_NEXT_NOD_OFFSET = 1536         //0x600H
	ul_LenOfObjName_OFFSET = 26
end if

//get next NOD address
ulong ul_LenOfObjName
ulong ul_obj_OFFSET

//find all NOD bands
Nod_List[upperbound(Nod_List)+1].NOD_addr = hdr_offset + ul_NEXT_NOD_OFFSET //first add the "hdr_offset",others not,they are Absolute address
Nod_List[upperbound(Nod_List)].flag = false      //Two values(next-NODE) are not read


for i = 1 to upperbound(Nod_List)        //upper limit will change,not a fixed value
	if not Nod_List[i].flag then
		//find left-NOD tree
		ul_NOD_OFFSET = Nod_List[i].nod_addr

		FileSeek(iFileHandle,ul_NOD_OFFSET,FromBeginning!)
		FileRead(iFileHandle,bread)
		ul_NEXT_NOD_OFFSET = long(BlobMid(bread,5,4))
	
		if ul_NEXT_NOD_OFFSET>0 and ul_NEXT_NOD_OFFSET<ul_fileLen - 512 then 
			Nod_List[upperbound(Nod_List)+1].NOD_addr = ul_NEXT_NOD_OFFSET
			Nod_List[upperbound(Nod_List)].flag = false      //Two values(next-NODE) are not read
		end if
		
		//find right-NOD tree
		ul_NEXT_NOD_OFFSET = long(BlobMid(bread,13,4))
	
		if ul_NEXT_NOD_OFFSET>0 and ul_NEXT_NOD_OFFSET<ul_fileLen - 512  then 
			Nod_List[upperbound(Nod_List)+1].NOD_addr = ul_NEXT_NOD_OFFSET
			Nod_List[upperbound(Nod_List)].flag = false      //Two values(next-NODE) are not read
		end if
		
		//set flag
		Nod_List[i].flag = true;           //Two values(Current-NODE) are read
	end if
next


for i = 1 to upperbound(Nod_List)
	//address of NOD
	ul_NOD_OFFSET = Nod_List[i].NOD_addr
	
	//ENT list
	//not add hdr_offset,they are Absolute address
	FileSeek(iFileHandle,ul_NOD_OFFSET+32,FromBeginning!)
	FileRead(iFileHandle,bread)

	//round to get ent list	
	ul_obj_OFFSET = 0
	uint li_obj = 0
	
	DO while(ul_obj_OFFSET < ul_LenOfENTBand -ul_LenOfObjectInfo)
		ul_LenOfObjName = 0
		ul_LenOfObjName = integer(BlobMid(bread,ul_obj_OFFSET + &
																		ul_LenOfObjName_OFFSET + 1,4))    //note: length Must be 4,not 2.if length=2,result is 0.
																													 //integer() and long() is same!PB5 only.
	
		if isUnicode then
			ls_objname = "choose error,pb8 is ansi"
			messagebox("choose error","pb5 is ansi!~r~n" + as_pbdpath)
			return ""
		else
			ls_objname = String(BlobMid(bread,ul_obj_OFFSET + &
																ul_LenOfObjName_OFFSET + 2 + 1,ul_LenOfObjName))
		end if	
		
																				
		if right(ls_objname,4) = ".dwo" then
			li_obj ++
			ls_dwolist+=Left(ls_objname,Len(ls_objname) -4)+"~r~n"
			//gs_dwolist[li_obj] = Left(ls_objname,Len(ls_objname) -4)
		end if
																				
		ul_obj_OFFSET += ul_LenOfObjName_OFFSET + 2 + ul_LenOfObjName	
	LOOP
next

FileClose(iFileHandle)        //must!,else not be:setlibrarylist
return ls_dwolist
end function

public function string split (ref string as_str, readonly string as_pos);string ls_result
long ll_pos
ll_pos=pos(as_str,as_pos) - 1
if ll_pos>=0 then
	ls_result=left(as_str,ll_pos)
	as_str=right(as_str,len(as_str) - len(as_pos) - ll_pos)
end if
return ls_result

end function

public function string splitlast (ref string as_str, readonly string as_pos);string ls_result
as_str=reverse(as_str)
ls_result=split(as_str,as_pos)
as_str=reverse(as_str)
return reverse(ls_result)
end function

public function string get_rundir ();string ls_dir=space(255)
If Handle(GetApplication(), False) = 0 Then
    //开发模式运行
	 GetCurrentDirectoryA(255,ls_dir)
Else
    //编译后运行
    If GetModuleFileNameA(Handle(GetApplication()),ls_dir,255) <> 0 Then splitlast(ls_dir,"\")
End If
return ls_dir+"\"
end function

public function integer get_openfilename (readonly long al_handle, readonly string as_title, ref string as_pathname, ref blob ab_filename, string as_filter, readonly long al_flags);//定义OPENFILENAME类型的结构变量
str_OPENFILENAME OFName
//设置结构的大小
OFName.lStructSize = 76
//设置父窗口为对话框的属主
OFName.hwndOwner = al_handle
//设置应用实例，在PB中设置为0
//OFName.hInstance = 0
//定义过滤文件的类型
blob{1} lb_ansi
blob lb_null
if ienv.PBMajorRevision>9 then 
	lb_null=lb_ansi +lb_ansi
else
	lb_null=lb_ansi
end if
string ls_str
as_filter=as_filter
ls_str=split(as_filter,',')
do while ls_str<>''
	OFName.lpstrFilter+=blob(ls_str)+lb_null
	ls_str=split(as_filter,',')
loop
OFName.lpstrFilter+=blob(as_filter)+lb_null+lb_null
//-------------------------------------------
OFName.nMaxFile = 16384
OFName.lpstrFile=lb_null+blob(space(OFName.nMaxFile))
OFName.nMaxFileTitle = 2048
OFName.lpstrFileTitle = blob(Space(OFName.nMaxFileTitle))
//设置初始化目录
OFName.lpstrInitialDir = get_rundir()
//设置对话框标题
OFName.lpstrTitle = blob(as_title)+lb_null
OFName.nFilterIndex	= 1
//设置标识符0为单选
OFName.flags=al_flags
//显示打开对话框
long ll_ret
if ienv.PBMajorRevision>9 then
	ll_ret=GetOpenFileNameW(OFName)
else
	ll_ret=GetOpenFileNameA(OFName)
end if
//判断用户的操作
If ll_ret = 1 Then
	as_pathname=string(OFName.lpstrFile)
	long ll_len
	ll_len=len(as_pathname)+2
	if ienv.PBMajorRevision>9 then ll_len=2*ll_len - 1
	if al_flags = 524800 and blobmid(OFName.lpstrFile,ll_len,len(lb_null))<>lb_null then
		ab_filename=blobmid(OFName.lpstrFile,ll_len)
		as_pathname+='\'
	else
		ab_filename=blob(string(OFName.lpstrFileTitle))
	end if
end if
return ll_ret
end function

public function integer get_openfilename (readonly long al_handle, readonly string as_title, ref string as_pathname, ref string as_filename, readonly string as_filter);long ll_ret
blob lb_filename
ll_ret=get_openfilename(al_handle,as_title,as_pathname,lb_filename,as_filter,0)
if ll_ret=1 then as_filename=string(lb_filename)
return ll_ret
end function

public function integer get_openfilename (readonly long al_handle, readonly string as_title, ref string as_pathname, ref string as_filename[], readonly string as_filter);long ll_ret,ll_l=1
blob lb_filename,lb_null
blob{1} lb_ansi
if ienv.PBMajorRevision>9 then 
	lb_null=lb_ansi+lb_ansi
else
	lb_null=lb_ansi
end if
ll_ret=get_openfilename(al_handle,as_title,as_pathname,lb_filename,as_filter,524800)
if ll_ret=1 then
	do 
		as_filename[upperbound(as_filename)+1]=string(blobmid(lb_filename,ll_l))
		if ienv.PBMajorRevision>9 then 
			ll_l+=2*(len(as_filename[upperbound(as_filename)])+1)
		else
			ll_l+=len(as_filename[upperbound(as_filename)])+1
		end if
	loop while ll_l<=len(lb_filename) and blobmid(lb_filename,ll_l,len(lb_null))<>lb_null
end if
return ll_ret
end function

public function boolean lib_add (readonly string as_libpath);int li_i,li_j
boolean lb_have
string ls_liblist[]
if lower(right(as_libpath,4)) = ".pbt" then
	get_liblist_pbt(as_libpath,ls_liblist)
else
	ls_liblist[1] = as_libpath
end if
for li_j = 1 to upperbound(ls_liblist)
	lb_have = false
	for li_i=1 to upperbound(is_libpath)
		if is_libpath[li_i]=ls_liblist[li_j] then
			lb_have=true
			exit
		end if
	next
	if lb_have=false then
		is_libpath[upperbound(is_libpath)+1]=ls_liblist[li_j]
		//PB version problem;PB9以上才支持AddToLibraryList函数
		//ienv.PBMajorRevision>=9 then AddToLibraryList(as_libpath)
	end if
next
return not lb_have
end function

public function string posmidlast (string as_str, readonly string as_tou, readonly string as_wei);return reverse(posmid(reverse(as_str),as_tou,as_wei,1))
end function

public function string posmid (readonly string as_str, readonly string as_tou, readonly string as_wei, readonly long al_l);long ll_tou,ll_wei
if as_tou="" then
	ll_tou=al_l
else
	ll_tou=pos(as_str,as_tou,al_l)
	if ll_tou=0 then return ""
end if
ll_tou+=len(as_tou)
if as_wei="" then 
	ll_wei=len(as_str) + 1
else
	ll_wei=pos(as_str,as_wei,ll_tou)
	if ll_wei=0 then return ""
end if
return mid(as_str,ll_tou,ll_wei - ll_tou)
end function

public function string posreplace (string ls_str, readonly string ls_pos, readonly string ls_replace);long ll_pos
if ls_pos="" then return ls_replace
ll_pos=pos(ls_str,ls_pos)
do while ll_pos>0
	ls_str=replace(ls_str,ll_pos,len(ls_pos),ls_replace)
	ll_pos=pos(ls_str,ls_pos)
loop
return ls_str
end function

public function string get_liblist ();string ls_liblist
int li_i
for li_i=1 to upperbound(is_libpath)
	if li_i=1 then
		ls_liblist=is_libpath[li_i]
	else
		ls_liblist+=","+is_libpath[li_i]
	end if
next
return ls_liblist
end function

public subroutine set_libarray (string as_liblist);if set_liblist(as_liblist)=false then return
string ls_libpath
if as_liblist<>"" then
	ls_libpath=split(as_liblist,",")
	do while ls_libpath<>""
		is_libpath[upperbound(is_libpath)+1]=ls_libpath
		ls_libpath=split(as_liblist,",")
	loop
	is_libpath[upperbound(is_libpath)+1]=as_liblist
end if
end subroutine

public function string get_bakdir ();return is_rundir+"备份\"+string(today(),"yyyymmdd")+string(now(),"hhmmss")+"\"
end function

public function boolean get_tblist (readonly string as_dbtype);string ls_sql,ls_tablename,ls_columnname,ls_type
long ll_length,ll_row
choose case as_dbtype
	case 'SQLSERVER'
		ls_sql="SELECT sysobjects.name AS tablename, syscolumns.name AS columnname, systypes.name AS type, syscolumns.length AS length FROM sysobjects INNER JOIN syscolumns ON sysobjects.id = syscolumns.id INNER JOIN systypes ON syscolumns.xtype = systypes.xtype WHERE (sysobjects.xtype = 'U') AND (systypes.name IN ('char', 'varchar', 'nvarchar', 'sysname')) ORDER BY sysobjects.name, syscolumns.name"
	case 'ORACLE'
		ls_sql="SELECT T.TABLE_NAME AS tablename,C.COLUMN_NAME AS columnname,C.DATA_TYPE AS type,C.DATA_LENGTH AS length FROM TABS T ,ALL_TAB_COLUMNS C WHERE T.TABLE_NAME=C.TABLE_NAME AND C.DATA_TYPE IN ('CHAR','NCHAR','VARCHAR2','NVARCHAR2') ORDER BY T.TABLE_NAME"
	case else
		messagebox('提示','数据库类型不能为空!')
		return false
end choose
if ids_tblist.create('release 5;&
datawindow(units=0 timer_interval=0 color=16777215 processing=1 print.documentname="" print.orientation = 0 print.margin.left = 110 print.margin.right = 110 print.margin.top = 97 print.margin.bottom = 97 print.paper.source = 0 print.paper.size = 0 print.prompt=no grid.lines=0 )&
header(height=97 color="536870912" )&
summary(height=1 color="536870912" )&
footer(height=1 color="536870912" )&
detail(height=109 color="536870912" )&
table(column=(type=char(255) updatewhereclause=no name=tablename dbname="tablename" )&
 column=(type=char(255) updatewhereclause=no name=columnname dbname="columnname" )&
 column=(type=char(255) updatewhereclause=no name=type dbname="type" )&
 column=(type=long updatewhereclause=no name=length dbname="length" )&
 )&
text(band=header alignment="2" text="Tablename"border="0" color="0" x="10" y="8" height="77" width="1601"  name=tablename_t  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )&
text(band=header alignment="2" text="Columnname"border="0" color="0" x="1619" y="8" height="77" width="1601"  name=columnname_t  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )&
text(band=header alignment="2" text="Type"border="0" color="0" x="3228" y="8" height="77" width="1601"  name=type_t  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )&
text(band=header alignment="2" text="Length"border="0" color="0" x="4837" y="8" height="77" width="257"  name=length_t  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )&
column(band=detail id=1 alignment="0" tabsequence=10 border="0" color="0" x="10" y="8" height="89" width="1601" format="[general]"  name=tablename edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=yes edit.autohscroll=yes  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )&
column(band=detail id=2 alignment="0" tabsequence=20 border="0" color="0" x="1619" y="8" height="89" width="1601" format="[general]"  name=columnname edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=yes edit.autohscroll=yes  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )&
column(band=detail id=3 alignment="0" tabsequence=30 border="0" color="0" x="3228" y="8" height="89" width="1601" format="[general]"  name=type edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=yes edit.autohscroll=yes  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )&
column(band=detail id=4 alignment="1" tabsequence=40 border="0" color="0" x="4837" y="8" height="89" width="257" format="[general]"  name=length edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=yes edit.autohscroll=yes  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )')= -1 then halt close
DECLARE cursor_base DYNAMIC CURSOR FOR SQLSA;
PREPARE SQLSA from :ls_sql;
OPEN DYNAMIC cursor_base;
FETCH cursor_base INTO :ls_tablename,:ls_columnname,:ls_type,:ll_length;
DO WHILE SQLCA.SQLCODE=0
	ll_row=ids_tblist.insertrow(0)
	ids_tblist.setitem(ll_row,'tablename',ls_tablename)
	ids_tblist.setitem(ll_row,'columnname',ls_columnname)
	ids_tblist.setitem(ll_row,'type',ls_type)
	ids_tblist.setitem(ll_row,'length',ll_length)
	FETCH cursor_base INTO :ls_tablename,:ls_columnname,:ls_type,:ll_length;
LOOP
CLOSE cursor_base;
disconnect using Sqlca;
if ids_tblist.rowcount()=0 then
	messagebox('提示','无法获取数据库字段信息!')
	return false
end if
return true
end function

public function boolean db_connect (readonly string as_dbms, readonly string as_servername, readonly string as_database, readonly string as_logid, readonly string as_logpass, readonly string as_dbparm);disconnect using Sqlca;
SQLCA.DBMS=as_dbms
SQLCA.ServerName=as_servername
SQLCA.Database=as_database
SQLCA.LogId=as_logid
SQLCA.LogPass=as_logpass
SQLCA.DBParm=as_dbparm
Connect Using Sqlca;
if sqlca.sqlcode <> 0 then
	messagebox('提示:','未能连接到数据库，请重新进行设置!~r~n'+sqlca.sqlerrtext)
	return false
end if
return true
end function

public subroutine set_liblist_ini ();SetProfileString(guo_dw.is_rundir+"config.ini", 'liblist', 'liblist', get_liblist())
end subroutine

public function string get_liblist_ini ();//string ls_ret
//ulong ll_len
//ll_len=32768
//ls_ret=space(ll_len)
//if ienv.PBMajorRevision<=9 then
//	GetPrivateProfileStringA("liblist","liblist",'',ls_ret,ll_len,guo_dw.is_rundir+"config.ini")
//else
//	GetPrivateProfileStringW("liblist","liblist",'',ls_ret,ll_len,guo_dw.is_rundir+"config.ini")
//end if
//return ls_ret
return ProfileString(guo_dw.is_rundir+"config.ini", 'liblist', 'liblist', '')
end function

public subroutine lib_clear ();string lsnull[]
is_libpath=lsnull[]
end subroutine

public function boolean set_liblist (readonly string as_liblist);if pos(lower(as_liblist),'.pbl')>0 then return true
application lapp
lapp=getapplication()
int li_ret
li_ret=lapp.SetLibraryList(as_liblist)
choose case li_ret
	case 1
		return true
	case -1
		messagebox('设置库列表错误-1','If the application is being run from PowerBuilder, rather than from a standalone executable.')
	case -2
		messagebox('设置库列表错误-2','If a currently instantiated object is in a library that is not on the new list.')
	case else
		messagebox('设置库列表错误','未知的错误编码'+string(li_ret))
end choose
return false
end function

public subroutine get_liblist_pbt (readonly string as_pbt, ref string as_liblist[]);int li_fileno
string ls_read
long ll_pos,ll_pos2
string ls_libname
string ls_path
ll_pos =len(as_pbt) - pos(reverse(as_pbt),"\") + 1
ls_path = left(as_pbt,ll_pos)
li_fileno = fileopen(as_pbt,LineMode!,read!,shared!)
do while	fileread(li_fileno,ls_read)>=0
	if lower(left(ls_read,9))= 'liblist "' then
		ll_pos = 10
		ll_pos2 = pos(ls_read,";",ll_pos)
		long ll_l
		do while ll_pos2 > 0
			ll_l++
			ls_libname = mid(ls_read,ll_pos,ll_pos2 - ll_pos)
			if right(ls_libname,1) = '"' then ls_libname = left(ls_libname,len(ls_libname) - 1)
			if pos(ls_libname,"\") < 1 then 
				ls_libname = ls_path + ls_libname
			else
				ls_libname = get_pbtlibpath(ls_libname)
			end if
			as_liblist[ll_l] = ls_libname
			ll_pos = ll_pos2 + 1
			ll_pos2 = pos(ls_read,";",ll_pos)
		loop
	end if
loop
fileclose(li_fileno)
end subroutine

public function string get_pbtlibpath (readonly string as_path);string ls_ret,ls_char,ls_charnext
long ll_i
for ll_i=1 to len(as_path)
	ls_char = mid(as_path,ll_i,1)
	if ls_char="\" then
		ls_charnext = mid(as_path,ll_i + 1,1)
		if ls_charnext = "\" then
			ll_i++
		elseif lower(ls_charnext)="x" then
			ls_char = char(integer(f_convert(mid(as_path,ll_i + 2,2),16,10)))
			ll_i= ll_i + 3
		end if
	end if
	ls_ret+=ls_char
next
return ls_ret
end function

public subroutine tv_load (ref treeview atv, ref string adw[]);int li_i,li_j
long ll_handle1,ll_handle2
str_dwlist lstr_dwlist
TreeViewItem ltvi_libdw
ids_dwlist.create('release 5;&
datawindow(units=0 timer_interval=0 color=16777215 processing=1 print.documentname="" print.orientation = 0 print.margin.left = 110 print.margin.right = 110 print.margin.top = 97 print.margin.bottom = 97 print.paper.source = 0 print.paper.size = 0 print.prompt=no grid.lines=0 )&
header(height=97 color="536870912" )&
summary(height=1 color="536870912" )&
footer(height=1 color="536870912" )&
detail(height=109 color="536870912" )&
table(column=(type=char(100) updatewhereclause=yes name=objectname dbname="objectname" )&
 column=(type=char(100) updatewhereclause=yes name=createtime dbname="createtime" )&
 column=(type=char(100) updatewhereclause=yes name=comments dbname="comments" )&
 column=(type=char(100) updatewhereclause=yes name=library dbname="library" )&
 )&
text(band=header alignment="2" text="Objectname"border="0" color="0" x="10" y="8" height="77" width="3201"  name=objectname_t  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )&
text(band=header alignment="2" text="Createtime"border="0" color="0" x="3219" y="8" height="77" width="3201"  name=createtime_t  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )&
text(band=header alignment="2" text="Comments"border="0" color="0" x="6428" y="8" height="77" width="3201"  name=comments_t  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )&
text(band=header alignment="2" text="Library"border="0" color="0" x="9637" y="8" height="77" width="3201"  name=library_t  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )&
column(band=detail id=1 alignment="0" tabsequence=10 border="0" color="0" x="10" y="8" height="89" width="3201" format="[general]"  name=objectname edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=yes edit.autohscroll=yes  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )&
column(band=detail id=2 alignment="0" tabsequence=20 border="0" color="0" x="3219" y="8" height="89" width="3201" format="[general]"  name=createtime edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=yes edit.autohscroll=yes  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )&
column(band=detail id=3 alignment="0" tabsequence=30 border="0" color="0" x="6428" y="8" height="89" width="3201" format="[general]"  name=comments edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=yes edit.autohscroll=yes  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )&
column(band=detail id=4 alignment="0" tabsequence=40 border="0" color="0" x="9637" y="8" height="89" width="3201" format="[general]"  name=library edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=yes edit.autohscroll=yes  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )')
atv.DeleteItem(0)
ltvi_libdw.Label = "PBDWEDIT"
ltvi_libdw.Data = "Hucxy"
ltvi_libdw.PictureIndex = 1
ltvi_libdw.SelectedPictureIndex = 1
ltvi_libdw.children = True
atv.InsertItemLast(0,ltvi_libdw)
if upperbound(is_libpath)>0 then
	for li_i=1 to upperbound(is_libpath)
		ids_dwlist.modify('#4.Initial ="'+is_libpath[li_i]+'"')	
		if ienv.PBMajorRevision<9 and pos(lower(is_libpath[li_i]),".pbd")>0 then
//			if ienv.PBMajorRevision=5 then
				lstr_dwlist.dwlist=get_dwolist(is_libpath[li_i])
//			else
//				LibDirExt(is_libpath[li_i],".dwo",lstr_dwlist)
//				lstr_dwlist.dwlist=posreplace(lstr_dwlist.dwlist,"~t","~r~n")
//			end if
		else
			lstr_dwlist.dwlist=librarydirectory(is_libpath[li_i],dirdatawindow!)
		end if 
		ids_dwlist.importstring(lstr_dwlist.dwlist)
		ids_dwlist.setfilter('#4 = "'+is_libpath[li_i]+'"')
		ids_dwlist.filter()
		ltvi_libdw.Label = guo_dw.posmidlast(is_libpath[li_i],"","\") 
		ltvi_libdw.Data = is_libpath[li_i]
		ltvi_libdw.PictureIndex = 2
		ltvi_libdw.SelectedPictureIndex = 2
		ltvi_libdw.children=ids_dwlist.rowcount()>0
		ll_handle1=atv.InsertItemLast(1,ltvi_libdw)
		for li_j=1 to ids_dwlist.rowcount()
			ltvi_libdw.Label = ids_dwlist.getitemstring(li_j,1)
			adw[li_j] = ltvi_libdw.Label
			ltvi_libdw.Data = ifnull(ids_dwlist.getitemstring(li_j,3),"")
			ltvi_libdw.PictureIndex = 3
			ltvi_libdw.SelectedPictureIndex = 3
			ltvi_libdw.children=ifnull(ids_dwlist.getitemstring(li_j,2),"")<>""
			ll_handle2=atv.InsertItemLast(ll_handle1,ltvi_libdw)
			if ltvi_libdw.children then
				ltvi_libdw.Label = ids_dwlist.getitemstring(li_j,2)
				ltvi_libdw.PictureIndex = 4
				ltvi_libdw.SelectedPictureIndex = 4
				ltvi_libdw.children = false
				atv.InsertItemLast(ll_handle2,ltvi_libdw)
			end if
		next
	next
	ids_dwlist.setfilter('')
	ids_dwlist.filter()
	atv.ExpandItem(1)
end if
end subroutine

on uo_dw.create
TriggerEvent( this, "constructor" )
end on

on uo_dw.destroy
TriggerEvent( this, "destructor" )
end on

event constructor;//---------测试函数------------------------
//getlibrarylist()
//SetLibraryList('')
//AddToLibraryList('')
//LibraryCreate('')
//LibraryDelete('')
//LibraryDirectory()
//LibraryExport()
//LibraryImport(ls_file,ls_obj,importdatawindow!,ls_syntax,ls_error,ls_zhushi)
//FileDelete('')
//PBORCX0.DLL	PBORCA_SessionOpen、PBORCA_SessionClose、PBORCA_SessionSetLibraryList、PBORCA_SessionSetCurrentAppl、PBORCA_CompileEntryImport
//FindClassDefinition()	FindFunctionDefinition()
//dirlist("*.pbl",0)
//ds_all.modify("file.Initial ='" + ddlb_list.text(li_i) + "'")
//ds_all.importstring(librarydirectory(ddlb_list.text(li_i),dirdatawindow!))
//describe("datawindow.syntax")
//Describe('DataWindow.Syntax.Data')
//describe("datawindow.data")
//create(ls_syntax,ls_error)
//DirectoryExists('')
//-----------------------------------------
ids=create datastore
ids_dwlist=create datastore
ids_tblist=create datastore
GetEnvironment(ienv)
is_rundir=get_rundir()
end event

event destructor;destroy ids
destroy ids_dwlist
destroy ids_tblist
end event

