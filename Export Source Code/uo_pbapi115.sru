$PBExportHeader$uo_pbapi115.sru
forward
global type uo_pbapi115 from uo_pbapi
end type
end forward

global type uo_pbapi115 from uo_pbapi
end type
global uo_pbapi115 uo_pbapi115

type prototypes
//PB�ڴ����
function ulong pbstg_begin(long n) library "pbshr115.dll"
function ulong pbstg_end(ulong memo) library "pbshr115.dll"

//PB�����
function ulong LMI_OpenLibrary(ulong memo, ref blob libName, int mode, ulong comment) library "pbshr115.dll"
function long LMI_CloseLibrary(ulong lib) library "pbshr115.dll"
function long LMI_OpenEntry(ulong lib, ref blob objectName, int mode, ref blob comment) library "pbshr115.dll"
function long LMI_CloseEntry(ulong lib) library "pbshr115.dll"
function long LMI_ReadEntry(ulong lib, ref blob block, long size) library "pbshr115.dll"
function long LMI_WriteEntry(ulong lib, ref blob block, long size) library "pbshr115.dll"
end prototypes

on uo_pbapi115.create
TriggerEvent( this, "constructor" )
end on

on uo_pbapi115.destroy
TriggerEvent( this, "destructor" )
end on
