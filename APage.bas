B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=StaticCode
Version=6
@EndOfDesignText@
#ExcludeFromLibrary: True
'My main page
Sub Process_Globals
	Dim b As LWButton
	Dim a As LWButton
End Sub


'Create the webapp page layout
'Define all the necessary web elements here
Private Sub HTML_Layout
	a = Factory.CreateLWButtonWithID(Me, "gigisor","gigi", "gigi button")
	a.InlineCSS = "border: 2px solid #ededed;"

	b.Initialize(Me, "mylabel","mylabel2")
	b.Left = 150
	b.InlineCSS = "border: 12px solid #adadad;"

	LWAppShared.AddLWElement(a)
	LWAppShared.AddLWElement(b)
End Sub

'Handle events

Private Sub gigisor_Click(Params As Map)
	a.Left = Rnd(30,102)
	a.Label = "New label " & Rnd(1, 30)
	Log("Gigisor!")
'	Log(Params)
End Sub

Private Sub mylabel_Click(Params As Map)
'	b.Left = Rnd(130,102)
	b.Label = "New gigi " & Rnd(1, 30)
	b.Shake
	Log("mylabel click!")
'	Log(Params)
End Sub

