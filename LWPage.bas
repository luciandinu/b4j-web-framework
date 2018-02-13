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
	Public Title As String

	'Private
	Private mWS As WebSocket
	Private mElements As List
	Private isNew = True As Boolean
	Private isGenerated = False As Boolean
	Private mApp As LWApp
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize(WebApp As LWApp)
	mApp = WebApp
	mElements.Initialize
End Sub

Public Sub SetWS(WS As WebSocket)
	mWS = WS
'	If isGenerated And Not(isNew) Then 
'		mWS.Eval("location.reload();",Null)
'		isGenerated = False
'	End If
	
End Sub


'Register all page events
Public Sub RegisterEvents
	For Each webElement As Object In mElements
		If SubExists(webElement, "registerEvents") Then
			CallSub(webElement, "registerEvents")
		End If
	Next
End Sub

'Process all page events
Public Sub ProcessEvents(CallBack As Object, Params As Map)
	Dim eVType As String = Params.Get("EventType")
	Dim eVName As String = Params.Get("EventName") & "_" & eVType

	If SubExists(CallBack, eVName) Then
		CallSub2(CallBack, eVName, Params)
	End If
End Sub

'Add a LW web element to the page
Public Sub AddElement(WebElement As Object)
	CallSub2(WebElement, "SetPC", Me)
	mElements.Add(WebElement)
End Sub

Public Sub JSEval(Script As String)
	mWS.Eval(Script, Null)
	mWS.Flush
End Sub

'Prepare the page to be used
Public Sub Prepare
	If isNew Then
		Dim rHTML As String = generateHTMLLayout(mElements)
	 File.WriteString(mApp.LWServer.StaticFilesFolder, "index.html", rHTML)
	 isNew = False
	 isGenerated = True
	End If
End Sub

Private Sub generateHTMLLayout(WebElementList As List) As String
	Dim returnHTML="" As String
	Dim webSB As StringBuilder
	webSB.Initialize
	'Iterate trought the web elements
	For Each webElement As Object In WebElementList
		Dim elHTML As String = CallSub(webElement, "HTML")
		If elHTML <> Null Then
			If elHTML.Length >0 Then
				webSB.Append(elHTML)
			End If
		End If
	Next
	

	'Write the return html
	returnHTML = _
$"<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>${mApp.Title & " - " & Title}</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
	<meta http-equiv="Pragma" content="no-cache">
	<link rel="shortcut icon" href="/favicon.ico" />
</head>
<body>	
<div id="lw-app" style="position:absolute;">
${webSB.ToString}
</div>
	<script src="/jquery.js"></script>
	<script src="/reconnecting-websocket.js"></script> 
	<script src="/b4j_ws.js"></script>

	<script src="/jquery-ui.js"></script>
    <script>
    //connect To the web socket when the page Is ready.
    $( document ).ready(function() {
        b4j_connect("/ws");
    });
    </script>
</body>
</html>
"$
	Return returnHTML
End Sub