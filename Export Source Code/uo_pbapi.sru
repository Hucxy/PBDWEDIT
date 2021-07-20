$PBExportHeader$uo_pbapi.sru
forward
global type uo_pbapi from nonvisualobject
end type
end forward

global type uo_pbapi from nonvisualobject
end type
global uo_pbapi uo_pbapi

type prototypes
//PB内存管理
function ulong pbstg_begin(long n) library "pbshr.dll"
function ulong pbstg_end(ulong memo) library "pbshr.dll"

//PB库管理
function ulong LMI_OpenLibrary(ulong memo,ref blob libName, int mode, ulong comment) library "pbshr.dll"
function long LMI_CloseLibrary(ulong lib) library "pbshr.dll"
function long LMI_OpenEntry(ulong lib, ref blob objectName, int mode, ref blob comment) library "pbshr.dll"
function long LMI_CloseEntry(ulong lib) library "pbshr.dll"
function long LMI_ReadEntry(ulong lib, ref blob block, long size) library "pbshr.dll"
function long LMI_WriteEntry(ulong lib, ref blob block, long size) library "pbshr.dll"
end prototypes

type variables
private:
ulong il_memo
end variables

forward prototypes
public function boolean write_entry (ref string as_libname, ref string as_entryname, ref string as_coments, ref blob ab_entrydata)
end prototypes

public function boolean write_entry (ref string as_libname, ref string as_entryname, ref string as_coments, ref blob ab_entrydata);boolean ret = false
ulong ll_lib
blob ab_libname,ab_entryname,ab_coments
blob{1} lb_ansi
blob lb_null
if guo_dw.ienv.PBMajorRevision>9 then 
	lb_null=lb_ansi +lb_ansi
else
	lb_null=lb_ansi
end if
ab_libname = blob(as_libname)+lb_null
ab_entryname = blob(as_entryname)+lb_null
ab_coments = blob(as_coments)+lb_null
ll_lib = LMI_OpenLibrary(il_memo,ref ab_libname, 3, 0)
if ll_lib > 0 then
	if LMI_OpenEntry(ll_lib,ref ab_entryname, 3,ref ab_coments) = 0 then
		if LMI_WriteEntry(ll_lib,ref ab_entrydata, len(ab_entrydata)) > 0 then
			ret = true
		end if
		LMI_CloseEntry(ll_lib)
	end if
	LMI_CloseLibrary(ll_lib)
end if
return ret
end function

on uo_pbapi.create
TriggerEvent( this, "constructor" )
end on

on uo_pbapi.destroy
TriggerEvent( this, "destructor" )
end on

event constructor;il_memo = pbstg_begin(0)
end event

event destructor;pbstg_end(il_memo)
end event

