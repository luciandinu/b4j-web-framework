﻿B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=6
@EndOfDesignText@
'Class: SomeTask
Sub Class_Globals
	Private timer1 As Timer
End Sub

Public Sub Initialize
'	timer1.Initialize("timer1", 10 * DateTime.TicksPerMinute)
	timer1.Initialize("timer1", 10000)
	timer1.Enabled = True
	StartMessageLoop '<- don't forget!
End Sub

Sub Timer1_Tick
	'do the work required
'	Log("BgTask")
	Try
		If EventsShared.IS_ALREADY_CONNECTED Then
			EventsShared.WS.Close
		End If

	Catch
		'Log(LastException)
	End Try
End Sub