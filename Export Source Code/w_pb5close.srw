$PBExportHeader$w_pb5close.srw
forward
global type w_pb5close from Window
end type
end forward

global type w_pb5close from Window
int X=2291
int Y=589
int Width=1
int Height=1
boolean Visible=false
boolean Enabled=false
boolean TitleBar=true
boolean ToolBarVisible=false
end type
global w_pb5close w_pb5close

on w_pb5close.create
end on

on w_pb5close.destroy
end on

event timer;close(this)
end event

event open;timer(0.001)
end event

