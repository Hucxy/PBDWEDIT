$PBExportHeader$uo_pbd2pbl.sru
forward
global type uo_pbd2pbl from nonvisualobject
end type
end forward

type s_filetime from structure
	unsignedlong		lowdatetime
	unsignedlong		highdatetime
end type

type s_find_data from structure
	unsignedlong		fileattribus
	s_filetime		creationtime
	s_filetime		lastaccesstime
	s_filetime		lastwritetime
	unsignedlong		filesizehigh
	unsignedlong		filesizelow
	unsignedlong		reserved0
	unsignedlong		reserved1
	character		filename[260]
	character		alternatefilename[14]
end type

global type uo_pbd2pbl from nonvisualobject autoinstantiate
end type

type prototypes
Function   ulong   GetFileAttributesA(string   lpFileName)   LIBRARY   "kernel32.dll " 
FUNCTION ulong FindFirstFile(ref string lpFileName,ref s_FIND_DATA lpFindFileData) LIBRARY "kernel32.dll" ALIAS FOR "FindFirstFileA"   
FUNCTION ulong FindNextFile(ulong hFindFile,ref s_FIND_DATA lpFindFileData) LIBRARY "kernel32.dll" ALIAS FOR "FindNextFileA" 
FUNCTION Long FindClose ( Long hFindFile) LIBRARY "kernel32" 
Function Integer GetLastError ( ) Library "kernel32"
end prototypes

type variables
uo_pbapi iuo_pbapi
end variables

forward prototypes
public function boolean f_pbd2pbl (readonly string as_pbd, readonly string as_pbl)
public function boolean f_pbd2pbl (readonly string as_pbd, readonly string as_pbl, readonly string as_sr)
public function boolean f_pbd2pbl (readonly string as_pbd[], readonly string as_pbl, readonly string as_sr)
public subroutine f_getfilelist (string as_directoryname, string as_filetype, ref string as_files[])
public function boolean f_libimport (string as_pblib, string as_sr)
end prototypes

public function boolean f_pbd2pbl (readonly string as_pbd, readonly string as_pbl);blob lb_file
lb_file = blob("")
blob lb_read
integer li_len,li_fileno,li_j
li_len=int(filelength(as_pbd)/32765)
li_fileno=fileopen(as_pbd,streammode!,read!,shared!)
for li_j=0 to li_len
	fileread(li_fileno,lb_read)
	lb_file+=lb_read
next
fileclose(li_fileno)

if guo_dw.ienv.PBMajorRevision > 9 then
	blobedit(lb_file,45,blob(char(1)))
else
	blobedit(lb_file,27,blob(char(1)))
end if

li_fileno=fileopen(as_pbl, streammode!, write!, lockwrite!, replace!)
for li_j=0 to int(len(lb_file)/32765)
	lb_read=blobmid(lb_file,32765*li_j+1,32765)
	filewrite(li_fileno,lb_read)
next
fileclose(li_fileno)

return true
end function

public function boolean f_pbd2pbl (readonly string as_pbd, readonly string as_pbl, readonly string as_sr);f_pbd2pbl(as_pbd,as_pbl)
string files[]
f_getfilelist(as_sr,"*",files) 
long ll_l
for ll_l=1 to upperbound(files)
	f_libimport(as_pbl,as_sr + files[ll_l])
next
return true
end function

public function boolean f_pbd2pbl (readonly string as_pbd[], readonly string as_pbl, readonly string as_sr);long ll_l
string ls_pbl
for ll_l=1 to upperbound(as_pbd)
	ls_pbl = f_getfilenamewithoutext(as_pbd[ll_l]) +".pbl"
	f_pbd2pbl(as_pbd[ll_l],as_pbl + ls_pbl,as_sr)
next
return true
end function

public subroutine f_getfilelist (string as_directoryname, string as_filetype, ref string as_files[]);string   filename
long   ll_rtn 
s_find_data   FindFileData 
ulong   ll_FileAttributes 
string   ls_FileAttributes= " " 
//判断文件夹是否存在 
ll_FileAttributes=GetFileAttributesA(as_directoryname) 
IF   ll_FileAttributes=4294967295   THEN 
	SetNull(ls_FileAttributes) 
ELSE 
	IF   Mod(ll_FileAttributes,   2)   >     0   THEN   ls_FileAttributes   +=   "R " 
	IF   Mod(ll_FileAttributes,   4)   >     1   THEN   ls_FileAttributes   +=   "H " 
	IF   Mod(ll_FileAttributes,   8)   >     3   THEN   ls_FileAttributes   +=   "S " 
	IF   Mod(ll_FileAttributes,32)   >   15   THEN   ls_FileAttributes   +=   "D " 
	IF   Mod(ll_FileAttributes,64)   >   31   THEN   ls_FileAttributes   +=   "A " 
END   IF
IF   IsNull(ls_FileAttributes)   OR   Pos(ls_FileAttributes, "D ") <=0   THEN   
	RETURN
END   IF 
//获得文件列表 
filename= trim(as_directoryname) + "*." + trim(as_filetype) 
ll_rtn   =   FindFirstFile(filename,FindFileData) 
filename=FindFileData.filename 
filename=trim(filename) 
if trim(as_filetype) <> "*" and filename = "." then //as_filetype = * 遍历整个目录 
	as_files[upperbound(as_files)+1] = filename
end if 
do   while  true 
	if FindNextFile(ll_rtn,FindFileData) = 0  then 
		FindClose(ll_rtn) 
		return 
	else 
		filename=FindFileData.filename 
		filename=trim(filename) 
		if filename <> ".." then //as_filetype = * 遍历整个目录 
			as_files[upperbound(as_files)+1] = filename
		end if 
	end if 
loop
end subroutine

public function boolean f_libimport (string as_pblib, string as_sr);blob lb_file
lb_file = blob("")
integer li_fileno,li_j
string ls_comment
ls_comment = ""
//判断是否为sr*文件
string ls_type
ls_type= mid(as_sr,len(as_sr) - 3 ,3)
if ls_type = ".sr" then
	li_fileno=fileopen(as_sr,linemode!,read!,shared!)
	string ls_sytanx,ls_read
	ls_sytanx=""
	li_j = 0
	do while	fileread(li_fileno,ls_read)>=0
		li_j++
		if li_j = 1 then
			continue
		elseif li_j = 2 and left(ls_read,18) = "$PBExportComments$" then
			ls_comment = right(ls_read,len(ls_read) - 18)
			continue
		else
			ls_sytanx += ls_read + "~r~n"
		end if
	loop
	lb_file = blob(ls_sytanx)
else
	//读取文件二进制数据
	blob lb_read
	integer li_len
	li_len=int(filelength(as_sr)/32765)
	li_fileno=fileopen(as_sr,streammode!,read!,shared!)
	for li_j=0 to li_len
		fileread(li_fileno,lb_read)
		lb_file+=lb_read
	next
end if
fileclose(li_fileno)
return iuo_pbapi.write_entry(as_pblib,as_sr,ls_comment,lb_file)
end function

on uo_pbd2pbl.create
TriggerEvent( this, "constructor" )
end on

on uo_pbd2pbl.destroy
TriggerEvent( this, "destructor" )
end on

event constructor;choose case guo_dw.ienv.PBMajorRevision
	case 5
		iuo_pbapi = create uo_pbapi050
	case 6
		iuo_pbapi = create uo_pbapi060
	case 7
		iuo_pbapi = create uo_pbapi070
	case 8
		iuo_pbapi = create uo_pbapi080
	case 9
		iuo_pbapi = create uo_pbapi090
	case 10
		if guo_dw.ienv.pbminorrevision <5 then
			iuo_pbapi = create uo_pbapi100
		else
			iuo_pbapi = create uo_pbapi105
		end if
	case 11
		if guo_dw.ienv.pbminorrevision <5 then
			iuo_pbapi = create uo_pbapi110
		else
			iuo_pbapi = create uo_pbapi115
		end if
	case 12
		if guo_dw.ienv.pbminorrevision <5 then
			iuo_pbapi = create uo_pbapi120
		elseif guo_dw.ienv.pbminorrevision >5 then
			iuo_pbapi = create uo_pbapi126
		else
			iuo_pbapi = create uo_pbapi125
		end if
	case 15
		iuo_pbapi = create uo_pbapi150
	case 17
		iuo_pbapi = create uo_pbapi150
	case 18
		iuo_pbapi = create uo_pbapi150
	case else
		iuo_pbapi = create uo_pbapi
end choose
end event

