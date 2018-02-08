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
	Private SState As UUIDState
End Sub

Public Sub Initialize

End Sub

Private Sub WebSocket_Connected (MainWebSocket As WebSocket)
	WS = MainWebSocket
	EventsShared.WS = WS
	EventsShared.IS_ALREADY_CONNECTED = True
'	WS.Session.MaxInactiveInterval = 2


'	Dim session As HttpSession = WS.UpgradeRequest.GetSession
'	If session.HasAttribute("active") = False Then 
'		session.SetAttribute("active", "yes") 'sets a reference to the state object.
'		Log("WS Connected!")
'		registerEvents
'	Else
'			session.RemoveAttribute("state")
'	End If


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
	EventsShared.IS_ALREADY_CONNECTED = False
End Sub

'Register all events
Private Sub registerEvents
	For Each webElement As Object In Main.LWElements
		If SubExists(webElement, "registerEvents") Then
			CallSub(webElement, "registerEvents")
		End If
'		If webElement Is LWButton Then
'			Dim tmpBtn As LWButton = webElement
'			CallSub(tmpBtn, "registerEvents")
'		End If
	Next
End Sub

'Forward Click events
Private Sub WebApp_Click(Params As Map)
	Dim eV As String = Params.Get("Event") & "_Click"
	If SubExists(Main.Webpage, eV) Then
		CallSub(Main.Webpage, Params.Get("Event") & "_Click")
	End If

End Sub
