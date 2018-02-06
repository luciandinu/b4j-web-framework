B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=StaticCode
Version=6
@EndOfDesignText@
'Factory static code
Sub Process_Globals
	
End Sub


Public Sub CreateLWButtonWithID(ID As String, Label As String) As LWButton
	Dim mButton As LWButton
	mButton.Initialize(Label)
	mButton.SetNewID(ID)
	Return mButton
End Sub