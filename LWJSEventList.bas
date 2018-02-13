B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=6
@EndOfDesignText@
'Class module
Sub Class_Globals
	Private mEventList As List
	Private mCallBack As Object	
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize
	mEventList.Initialize
End Sub


Public Sub AddJS(Script As String)
	mEventList.Add(Script)
'	CallSub(mCallBack, "JSAdded")
End Sub


Public Sub SetCallBack(CallBack As Object)
	mCallBack = CallBack
End Sub

Public Sub EventsList As List
	Return mEventList
End Sub