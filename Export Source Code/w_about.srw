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
string Title="����"
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
1.������֧��PBL��PBD��EXE���ָ�ʽ�ļ���~r~n&
2.Ŀǰ������Ŀǰ���ܣ�~r~n&
~t(1)�ӿ��ļ��м��ز���ʾ���ݴ����б�~r~n&
~t(2)���б����Ƴ����ļ������ݴ���~r~n&
~t(3)�ӿ��ļ���Ԥ�����ݴ��ڲ���ʾ����~r~n&
~t(4)���ļ������ݴ��ڼ���~r~n&
~t(5)���ļ������ݴ��ڸ���~r~n&
~t(6)���ļ������ݴ����ƶ�~r~n&
~t(7)�ӿ��ļ��е������ݴ���~r~n&
~t(8)���ݴ��ڵ��뵽���ļ�~r~n&
~t(9)���ݴ����ֶγ���ͬ��~r~n&
~t(10)���ݴ����ֶ����������޸�~r~n&
3.����Ա��������κ�������飬��ӭ��QQȺ658840632����������~r~n&
4.�����֧��PB����汾�����������汾�뵽����QQȺ����������~r~n&
~r~n~r~n~t~t~t~t����PBDWEDIT By Hucxy(QQ:992716161)'


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
string FaceName="����"
FontPitch FontPitch=Variable!
end type

