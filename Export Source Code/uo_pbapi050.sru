$PBExportHeader$uo_pbapi050.sru
forward
global type uo_pbapi050 from uo_pbapi
end type
end forward

global type uo_pbapi050 from uo_pbapi
end type
global uo_pbapi050 uo_pbapi050

type prototypes
//PB内存管理
function ulong pbstg_begin(long n) library "PBSHR050.DLL"
function ulong pbstg_end(ulong memo) library "PBSHR050.DLL"
function ulong pbstg_alc(ulong memo, ulong size, int n) library "PBSHR050.DLL"
function ulong pbstg_fee(ulong memo, ulong block) library "PBSHR050.DLL"

//PB库管理
function ulong LMI_OpenLibrary(ulong memo,ref blob libName, int mode, ulong comment) library "PBSHR050.DLL"
function long LMI_CloseLibrary(ulong lib) library "PBSHR050.DLL"
function long LMI_OpenEntry(ulong lib,ref blob objectName, int mode, ref blob comment) library "PBSHR050.DLL"
function long LMI_CloseEntry(ulong lib) library "PBSHR050.DLL"
function long LMI_ReadEntry(ulong lib, ref blob block, long size) library "PBSHR050.DLL"
function long LMI_WriteEntry(ulong lib, ref blob block, long size) library "PBSHR050.DLL"
end prototypes

on uo_pbapi050.create
TriggerEvent( this, "constructor" )
end on

on uo_pbapi050.destroy
TriggerEvent( this, "destructor" )
end on

