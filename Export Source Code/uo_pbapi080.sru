$PBExportHeader$uo_pbapi080.sru
forward
global type uo_pbapi080 from uo_pbapi
end type
end forward

global type uo_pbapi080 from uo_pbapi
end type
global uo_pbapi080 uo_pbapi080

type prototypes
//PB内存管理
function ulong pbstg_begin(long n) library "pbvm80.dll"
function ulong pbstg_end(ulong memo) library "pbvm80.dll"

//PB库管理
function ulong LMI_OpenLibrary(ulong memo, ref blob libName, int mode, ulong comment) library "pbvm80.dll"
function long LMI_CloseLibrary(ulong lib) library "pbvm80.dll"
function long LMI_OpenEntry(ulong lib, ref blob objectName, int mode, ref blob comment) library "pbvm80.dll"
function long LMI_CloseEntry(ulong lib) library "pbvm80.dll"
function long LMI_ReadEntry(ulong lib, ref blob block, long size) library "pbvm80.dll"
function long LMI_WriteEntry(ulong lib, ref blob block, long size) library "pbvm80.dll"
end prototypes

on uo_pbapi080.create
TriggerEvent( this, "constructor" )
end on

on uo_pbapi080.destroy
TriggerEvent( this, "destructor" )
end on

