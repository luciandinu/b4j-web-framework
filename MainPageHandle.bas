B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=6
@EndOfDesignText@
#ExcludeFromLibrary: True
'WebSocket class
Sub Class_Globals
	Private mWS As WebSocket 'ignore
	Private mPage As LWPage

	Dim aButton As LWButton

End Sub

Public Sub Initialize
	mPage.Initialize
	
	aButton.Initialize(Me, "bla", "blabla")
	aButton.InlineCSS = "border: 2px solid #ededed;"
	aButton.Left = 2
	
	mPage.AddElement(aButton)
	mPage.Prepare
End Sub

Private Sub WebSocket_Connected (WS As WebSocket)
	mWS = WS
	Log("WS Connected!")

	mPage.SetWS(mWS)
	
	
'	LWAppShared.PageContent = aButton.HTML
'	If LWAppShared.PAGEISNEW Then mWS.Eval("location.reload();",Null)
	
	'Registering events
	mPage.RegisterEvents
End Sub

Private Sub WebSocket_Disconnected
	Log("WS Disconnected!")
End Sub


'Forward/process WebApp events
Private Sub WebSocket_Events(Params As Map)
	mPage.ProcessEvents(Me, Params)
End Sub

Private Sub bla_Click(Params As Map)
	Log(Params)
'	aButton.Shake
	aButton.Label = "Bla " & Rnd(30, 1200)
	aButton.Left = Rnd(0, 200)
End Sub
