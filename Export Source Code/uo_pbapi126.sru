$PBExportHeader$uo_pbapi126.sru
forward
global type uo_pbapi126 from uo_pbapi
end type
end forward

global type uo_pbapi126 from uo_pbapi
end type
global uo_pbapi126 uo_pbapi126

type prototypes
//PB�ڴ����
function ulong pbstg_begin(long n) library "pbshr126.dll"
function ulong pbstg_end(ulong memo) library "pbshr126.dll"

//PB�����
function ulong LMI_OpenLibrary(ulong memo, ref blob libName, int mode, ulong comment) library "pbshr126.dll"
function long LMI_CloseLibrary(ulong lib) library "pbshr126.dll"
function long LMI_OpenEntry(ulong lib, ref blob objectName, int mode, ref blob comment) library "pbshr126.dll"
function long LMI_CloseEntry(ulong lib) library "pbshr126.dll"
function long LMI_ReadEntry(ulong lib, ref blob block, long size) library "pbshr126.dll"
function long LMI_WriteEntry(ulong lib, ref blob block, long size) library "pbshr126.dll"
end prototypes

on uo_pbapi126.create
TriggerEvent( this, "constructor" )
end on

on uo_pbapi126.destroy
TriggerEvent( this, "destructor" )
end on

