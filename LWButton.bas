B4J=true
Group=LWF
ModulesStructureVersion=1
Type=Class
Version=6
@EndOfDesignText@
'----------------------------------------
'LWF
'Author: Lucian Dinu https://luciandinu.com
'Website: https://miranasolutions.com
'----------------------------------------

'LWButton Class module
Sub Class_Globals
	'Public
	Dim Left As Int = 0 'Default position 'ignore
	Dim Top As Int = 0 'ignore
	Dim Width As Int = 100 'Default size 'ignore
	Dim Height As Int = 32 'ignore
	Dim InlineCSS As String
	'---------------------------
	'Private
	Private mLabel As String
	Private mID As String
	Private mWS As WebSocket
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize(Label As String)
	mID = Utils.GenerateWebID 	'Generate a random WebID based on UUID algorithm
	mLabel = Label
End Sub

'Returns the web element ID
Public Sub GetID As String
	Return mID
End Sub

Public Sub SetWS(WS As WebSocket)
	mWS = WS
End Sub

Public Sub SetNewID(NewID As String)
	mID = NewID
End Sub

'Builds the element html representation
Public Sub BuildHTML As String
	Dim html As String
	Dim css As String
	If InlineCSS.Length>0 Then css = $"style='${InlineCSS}'"$
	html = $"<button id='${mID}' ${css}/>${mLabel}</button>${CRLF}"$
	Return html
End Sub


Public Sub Shake
	Main.LWWS.Eval($"$('#${mID}').effect('shake');"$, Null)
End Sub
