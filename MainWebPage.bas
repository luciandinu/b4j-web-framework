B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=6
@EndOfDesignText@
'Class module
Sub Class_Globals
	Public LWElements As List
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize
	LWElements.Initialize 'Initialize the list of web elements
	buildWebApp
End Sub


Private Sub buildWebApp
	Dim a As LWButton = Factory.CreateLWButtonWithID("gigi", "gigi button")
	a.InlineCSS = "border: 2px solid #ededed;"

	Dim b As LWButton
	b.Initialize("mylabel2")
	b.InlineCSS = "border: 12px solid #adadad;"

	LWElements.Add(a)
	LWElements.Add(b)
End Sub