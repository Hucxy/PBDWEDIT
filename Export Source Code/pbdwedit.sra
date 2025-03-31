$PBExportHeader$pbdwedit.sra
forward
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
uo_dw guo_dw
end variables

global type pbdwedit from application
 end type
global pbdwedit pbdwedit

type prototypes
Function ulong CopyFile(ref string lpExistingFileName,ref string lpNewFileName,ulong bFailIfExists) LIBRARY "kernel32.dll" ALIAS FOR "CopyFileA"
end prototypes

on pbdwedit.create
appname = "pbdwedit"
message = create message
sqlca = create transaction
sqlda = create dynamicdescriptionarea
sqlsa = create dynamicstagingarea
error = create error
end on

on pbdwedit.destroy
destroy( sqlca )
destroy( sqlda )
destroy( sqlsa )
destroy( error )
destroy( message )
end on

event open;//LibraryCreate("test.pbl")
guo_dw = create uo_dw
string ls_liblist
ls_liblist=commandparm()
//ls_liblist = "-PBD2PBL|PBDÂ·¾¶|PBLÂ·¾¶|sr*Â·¾¶|"
//ls_liblist = "-ExportDW|C:\PB\PB5\Powersoft\PowerBuilder 5.0\Examples\Code Examples\PBEXDPBS.PBD|C:\PbdViewer_Fix\TEMP\80131167-90f4-486a-9730-65bab6b2e1e8\|"
if ls_liblist <> "" then
	string pbd,sr,pbl
	long ll_l
	if left(ls_liblist,8) = "-PBD2PBL" then
		ll_l = 10
		pbd = f_posmid(ls_liblist,"","|",ll_l)
		pbl = f_posmid(ls_liblist,"","|",ll_l)
		sr = f_posmid(ls_liblist,"","|",ll_l)
		f_pbds2pbl(pbd,pbl,sr)
		open(w_pb5close)
		HALT CLOSE
		return
	elseif left(ls_liblist,9) = "-ExportDW" then
		ll_l = 11
		pbd = f_posmid(ls_liblist,"","|",ll_l)
		sr = f_posmid(ls_liblist,"","|",ll_l)
		f_export(pbd,sr)
		open(w_pb5close)
		HALT CLOSE
		return
	end if
else
	ls_liblist=guo_dw.get_liblist_ini()
end if
if ls_liblist<>"" then guo_dw.set_libarray(ls_liblist)
open(w_pbdwedit)
end event
event close;destroy guo_dw
end event

