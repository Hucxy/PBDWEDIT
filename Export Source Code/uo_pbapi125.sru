$PBExportHeader$uo_pbapi125.sru
forward
global type uo_pbapi125 from uo_pbapi
end type
end forward

global type uo_pbapi125 from uo_pbapi
end type
global uo_pbapi125 uo_pbapi125

type prototypes
//PB内存管理
function ulong pbstg_begin(long n) library "pbshr125.dll"
function ulong pbstg_end(ulong memo) library "pbshr125.dll"

//PB库管理
function ulong LMI_OpenLibrary(ulong memo, ref blob libName, int mode, ulong comment) library "pbshr125.dll"
function long LMI_CloseLibrary(ulong lib) library "pbshr125.dll"
function long LMI_OpenEntry(ulong lib, ref blob objectName, int mode, ref blob comment) library "pbshr125.dll"
function long LMI_CloseEntry(ulong lib) library "pbshr125.dll"
function long LMI_ReadEntry(ulong lib, ref blob block, long size) library "pbshr125.dll"
function long LMI_WriteEntry(ulong lib, ref blob block, long size) library "pbshr125.dll"
end prototypes

on uo_pbapi125.create
TriggerEvent( this, "constructor" )
end on

on uo_pbapi125.destroy
TriggerEvent( this, "destructor" )
end on

