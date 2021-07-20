$PBExportHeader$w_about.srw
forward
global type w_about from Window
end type
type mle_1 from multilineedit within w_about
end type
end forward

global type w_about from Window
int X=1335
int Y=521
int Width=3187
int Height=1561
boolean TitleBar=true
string Title="关于"
boolean ControlMenu=true
WindowType WindowType=response!
mle_1 mle_1
end type
global w_about w_about

on w_about.create
this.mle_1=create mle_1
this.Control[]={ this.mle_1}
end on

on w_about.destroy
destroy(this.mle_1)
end on

event resize;mle_1.x=0
mle_1.y=0
mle_1.width=newwidth
mle_1.height=newheight
end event

event open;mle_1.text='&
1.本工具支持PBL、PBD、EXE三种格式文件。~r~n&
2.目前本工具目前功能：~r~n&
~t(1)从库文件中加载并显示数据窗口列表~r~n&
~t(2)从列表中移除库文件和数据窗口~r~n&
~t(3)从库文件中预览数据窗口并显示代码~r~n&
~t(4)库文件间数据窗口剪切~r~n&
~t(5)库文件间数据窗口复制~r~n&
~t(6)库文件间数据窗口移动~r~n&
~t(7)从库文件中导出数据窗口~r~n&
~t(8)数据窗口导入到库文件~r~n&
~t(9)数据窗口字段长度同步~r~n&
~t(10)数据窗口字段属性批量修改~r~n&
3.如果对本工具有任何意见或建议，欢迎加QQ群658840632反馈交流。~r~n&
4.本软件支持PB多个版本，如需其它版本请到交流QQ群共享内下载~r~n&
~r~n~r~n~t~t~t~t——PBDWEDIT By Hucxy(QQ:992716161)'


end event

type mle_1 from multilineedit within w_about
int Width=2839
int Height=1293
int TabOrder=1
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=true
boolean VScrollBar=true
boolean AutoHScroll=true
boolean DisplayOnly=true
long BackColor=16777215
int TextSize=-12
int Weight=400
string FaceName="宋体"
FontPitch FontPitch=Variable!
end type

