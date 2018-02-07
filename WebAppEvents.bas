B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=6
@EndOfDesignText@
'WebSocket class
Sub Class_Globals
	Private ws As WebSocket 'ignore
	Private el As List
	Dim gigi As LWButton
End Sub

Public Sub Initialize
	el.Initialize
	el.Clear
End Sub

Private Sub WebSocket_Connected (MainWebSocket As WebSocket)
	ws = MainWebSocket
	Main.LWWS = ws
	For Each webElement As Object In Main.LWElements
		If webElement Is LWButton Then
			Dim tmpBtn As LWButton = webElement
			If tmpBtn.GetID <> "gigi" Then
				gigi = tmpBtn
			End If
			Log("Got LWButton")
'			Dim tmpBtn As LWButton = webElement
'			Dim tmpEl As JQueryElement
'			tmpEl.SetHtml(tmpBtn.RenderHTML)
		End If
	Next
End Sub

Private Sub WebSocket_Disconnected

End Sub

Private Sub gigi_Click (Params As Map)
	Log(Params)
	gigi.Shake
End Sub


