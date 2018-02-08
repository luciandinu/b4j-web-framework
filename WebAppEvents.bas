B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=6
@EndOfDesignText@
'WebSocket class
Sub Class_Globals
	Private WS As WebSocket 'ignore
	Type UUIDState (ID As String)
'	Private SState As UUIDState
End Sub

Public Sub Initialize

End Sub

Private Sub WebSocket_Connected (MainWebSocket As WebSocket)
	WS = MainWebSocket
	EventsShared.WS = WS
'	WS.Session.MaxInactiveInterval = 2

'	Dim session As HttpSession = WS.UpgradeRequest.GetSession
'	If session.HasAttribute("state") = False Then
'		SState.Initialize
'		SState.ID = Utils.GenerateWebID
'		session.SetAttribute("state", SState)
'		Log($"Creating new state. Number = ${SState.ID}"$)
''		Log("WS Connected!")
'		registerEvents
'	Else
'		SState = session.GetAttribute("state")
'		Log($"Reusing previous state. Number = ${SState.ID}"$)
'		registerEvents
'	End If

	Log("WS Connected!")
	registerEvents
End Sub

Private Sub WebSocket_Disconnected
	Log("WS Disconnected!")
End Sub

'Register all events
Private Sub registerEvents
	For Each webElement As Object In Main.LWElements
		If SubExists(webElement, "registerEvents") Then
			CallSub(webElement, "registerEvents")
		End If
	Next
End Sub

'Forward/process WebApp events
Private Sub processWebApp_Events(Params As Map)
	Dim eVType As String = Params.Get("EventType")
	Dim eVName As String = Params.Get("EventName") & "_" & eVType
	If SubExists(Main.Webpage, eVName) Then
		CallSub2(Main.Webpage, eVName, Params)
	End If

End Sub
