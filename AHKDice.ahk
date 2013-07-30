/*
Created by Phy25.com
*/
SetBatchLines, -1
#SingleInstance, Off
#NoEnv
SetWorkingDir, %A_ScriptDir%

Random, , 119219319 * %A_MSec% * %A_Sec%

SplitPath, A_ScriptName, , , , ScriptFileWOExt

IfExist %ScriptFileWOExt%.ini
{
  IniRead, StartNum, %ScriptFileWOExt%.ini, User, StartNum
	IniRead, EndNum, %ScriptFileWOExt%.ini, User, EndNum
}
Else
{
	StartNum = 1
	EndNum = 6
}


Gui +LastFound
Gui, Color, White
Gui, Font, s350
Gui, Add , Text, x0 y0 h480 w480 vText Center, *
Gui, Show, h480 w480, 骰子
Gui +LastFound
WinGet, GUIID, ID, A
GroupAdd, BtnArea, ahk_id %GUIID%
Return ; // End of Auto-Execute Section

DoRand:
Random, RandNo, %StartNum%, %EndNum%
GuiControl, , Text, %RandNo%
Return

#IfWinActive ahk_group BtnArea
~LButton::
SetTimer, DoRand, 40
KeyWait, LButton
SetTimer, DoRand, Off
Return
#IfWinActive

GuiClose:
ExitApp
