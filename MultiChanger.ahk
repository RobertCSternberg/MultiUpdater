#NoEnv
SetWorkingDir %A_ScriptDir%
SendMode Input
#SingleInstance Force
CoordMode, Mouse, Screen

MsgBox F5 to START

F5::
	Macro1:

		MsgBox F4 Emergency Stop at any time.  Esc to Break Loop.  Q to Restart Loop.

		InputBox, vMouseAware, MouseAware, Make script mouse-location aware? Yes or No, FALSE, 180, 180, , , , 100,

		InputBox, vClickBeforeType, Click Before Type, Click before Typing? Yes or No, FALSE, 180, 180, , , , 100

		if (vClickBeforeType = "Yes" or vClickBeforeType = "YES")
			{
				Msgbox, Click a location to click before typing. 	
				ToolTip,% "Click a position"
				KeyWait, LButton, D
				MouseGetPos, vClickBeforeTypeLocX, vClickBeforeTypeLocY
				KeyWait, LButton
			}

		InputBox, vBeforeKey, BeforeKey, Key to press before typing?, FALSE, 180, 180, , , , 100,{TAB}

		InputBox, vBeforeTypeKey, Times to Press, Times to Press %vBeforeKey% Before Typing?, FALSE, 180, 180, , , , 100

		InputBox, vType1, What to Type, What to Type?, FALSE, 180, 180, , , , 100

		InputBox, vAfterKey, AfterKey, Key to press after typing?, FALSE, 180, 180, , , , 100,{TAB}

		InputBox, vAfterTypeKey, Times to Press, Times to Press %vAfterKey% After Typing?, FALSE, 180, 180, , , , 100

		InputBox, vType2, What to Type Next, What to Type Next? REMINDER: First Type was: %vType1%, FALSE, 180, 180, , , , 100

		InputBox, vSave, Save?, Would you like to save between records? Yes or No, FALSE, 150, , , , 100

		InputBox, vNext, Next Key, What is the next key Example: {PgDn}`, {ENTER}`, {TAB} , FALSE, 180, 180, , , , 100,{PgDn}

		InputBox, vClickBeforeNext, Click Before Next, Click before Next Record? Yes or No, FALSE, 180, 180, , , , 100

		if (vClickBeforeNext = "Yes" or vClickBeforeNext = "YES")
			{
				Msgbox, Click a location to click before typing. 	
				ToolTip,% "Click a position"
				KeyWait, LButton, D
				MouseGetPos, vClickBeforeNextLocX, vClickBeforeNextLocY
				KeyWait, LButton
			}

		InputBox, vSaveCMD, Save Command, What is the Save Command , FALSE, 150, 300, , , , 100,{Ctrl down}s{Ctrl up}

		InputBox, vLoop, Times to Type, How Many Times to cycle?, FALSE, 180, 180, , , , 100

		InputBox, vActionDelay, Action Delay, Mil Seconds between actions?, FALSE, 180, 180, , , , 100,300

		InputBox, vSaveDelay, Save Delay, Mil Seconds AFTER saves?, FALSE, 180, 180, , , , 100,1400

		InputBox, vLoadDelay, Load Delay, Mil Seconds AFTER Next Command?, FALSE, 180, 180, , , , 100,1400

		MsgBox, Start Delay is 5 Seconds`, Next Action will be to confirm cycles.  F4 to Stop at any time.

		b=0
		
q::
		
			InputBox, vLoop, Times to Type, How Many Times to Type?, FALSE, 180, 180, , , , 100, %vLoop%

			Sleep, 5000

			Loop, %vLoop%
			{

				If (b = 1)
					{
						MsgBox Q to Restart Loop.
						b=0
						break
					}


				if (vClickBeforeType = "Yes" or vClickBeforeType = "YES")
					{

						if (vMouseAware = "Yes" or vMouseAware = "YES")
							{			
								MouseMove, vClickBeforeTypeLocX, vClickBeforeTypeLocY
							}

						
						Click, Left, 1
						Sleep, %vActionDelay%
					}

				Loop, %vBeforeTypeKey%
				{
					Send, %vBeforeKey%
					Sleep, %vActionDelay%
				}


				Send, %vType1%
				Sleep, %vActionDelay%

				Loop, %vAfterTypeKey%
				{
					Send, %vAfterKey%
					Sleep, %vActionDelay%
				}

				Send, %vType2%
				Sleep, %vActionDelay%

				if (vSave = "Yes" or vSave = "YES")
				{
					Send, %vSaveCMD%
					Sleep, %vSaveDelay%
				}

				

				if (vClickBeforeNext = "Yes" or vClickBeforeNext = "YES")
				{
					Sleep, %vSaveDelay%
					if (vMouseAware = "Yes" or vMouseAware = "YES")
					{
						MouseMove, vClickBeforeNextLocX, vClickBeforeNextLocY
					}
					Click, Left, 1
					Sleep, %vActionDelay%
				}

				Send, %vNext%
				Sleep, %vLoadDelay%





			}
Return

MsgBox Press Q to Restart, F4 to Quit.

Esc::b := !b
F4::ExitApp
