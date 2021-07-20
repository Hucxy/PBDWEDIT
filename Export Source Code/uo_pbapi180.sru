$PBExportHeader$uo_pbapi180.sru
forward
global type uo_pbapi180 from uo_pbapi
end type
end forward

global type uo_pbapi180 from uo_pbapi
end type
global uo_pbapi180 uo_pbapi180

type prototypes
//PB内存管理
function ulong pbstg_begin(long n) library "pbshr180.dll"
function ulong pbstg_end(ulong memo) library "pbshr180.dll"

//PB库管理
function ulong LMI_OpenLibrary(ulong memo, ref blob libName, int mode, ulong comment) library "pbshr180.dll"
function long LMI_CloseLibrary(ulong lib) library "pbshr180.dll"
function long LMI_OpenEntry(ulong lib, ref blob objectName, int mode, ref blob comment) library "pbshr180.dll"
function long LMI_CloseEntry(ulong lib) library "pbshr180.dll"
function long LMI_ReadEntry(ulong lib, ref blob block, long size) library "pbshr180.dll"
function long LMI_WriteEntry(ulong lib, ref blob block, long size) library "pbshr180.dll"
end prototypes

on uo_pbapi180.create
TriggerEvent( this, "constructor" )
end on

on uo_pbapi180.destroy
TriggerEvent( this, "destructor" )
end on

