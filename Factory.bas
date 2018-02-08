B4J=true
Group=LWF
ModulesStructureVersion=1
Type=StaticCode
Version=6
@EndOfDesignText@
'Factory static code
Sub Process_Globals
	
End Sub


Public Sub CreateLWButtonWithID(CallBack As Object, EventName As String, ID As String, Label As String) As LWButton
	Dim mButton As LWButton
	mButton.Initialize(CallBack, EventName, Label)
	mButton.ID = ID
	Return mButton
End Sub