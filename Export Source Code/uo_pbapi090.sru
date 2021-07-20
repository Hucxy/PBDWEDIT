$PBExportHeader$uo_pbapi090.sru
forward
global type uo_pbapi090 from uo_pbapi
end type
end forward

global type uo_pbapi090 from uo_pbapi
end type
global uo_pbapi090 uo_pbapi090

type prototypes
//PB内存管理
function ulong pbstg_begin(long n) library "pbvm90.dll"
function ulong pbstg_end(ulong memo) library "pbvm90.dll"

//PB库管理
function ulong LMI_OpenLibrary(ulong memo, ref blob libName, int mode, ulong comment) library "pbvm90.dll"
function long LMI_CloseLibrary(ulong lib) library "pbvm90.dll"
function long LMI_OpenEntry(ulong lib, ref blob objectName, int mode, ref blob comment) library "pbvm90.dll"
function long LMI_CloseEntry(ulong lib) library "pbvm90.dll"
function long LMI_ReadEntry(ulong lib, ref blob block, long size) library "pbvm90.dll"
function long LMI_WriteEntry(ulong lib, ref blob block, long size) library "pbvm90.dll"
end prototypes

on uo_pbapi090.create
TriggerEvent( this, "constructor" )
end on

on uo_pbapi090.destroy
TriggerEvent( this, "destructor" )
end on

