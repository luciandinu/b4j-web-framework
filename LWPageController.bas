B4J=true
Group=LWF
ModulesStructureVersion=1
Type=Class
Version=6
@EndOfDesignText@
'----------------------------------------
'LWF - Lightweight Web Framework
'Author: Lucian Dinu https://luciandinu.com
'Website: https://miranasolutions.com
'----------------------------------------

'Class module
Sub Class_Globals
	Private mWS As WebSocket
	Private mElements As List
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize
	mElements.Initialize
End Sub

Public Sub SetWS(WS As WebSocket)
	mWS = WS
End Sub


'Register all events
Public Sub RegisterEvents
	For Each webElement As Object In mElements
		If SubExists(webElement, "registerEvents") Then
			CallSub(webElement, "registerEvents")
		End If
	Next
	
End Sub

Public Sub ProcessEvents(CallBack As Object, Params As Map)
	Dim eVType As String = Params.Get("EventType")
	Dim eVName As String = Params.Get("EventName") & "_" & eVType

	If SubExists(CallBack, eVName) Then
		CallSub2(CallBack, eVName, Params)
	End If
End Sub

Public Sub AddElement(WebElement As Object)
	CallSub2(WebElement, "SetPC", Me)
	mElements.Add(WebElement)
End Sub

Public Sub JSEval(Script As String)
	mWS.Eval(Script, Null)
	mWS.Flush
End Sub