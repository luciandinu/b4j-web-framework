B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=6
@EndOfDesignText@
'Handler class
Sub Class_Globals
	Dim FIXED_LAYOUT = True As Boolean
End Sub

Public Sub Initialize

End Sub

Sub Handle(req As ServletRequest, resp As ServletResponse)

	
	resp.Write(writeHTML(Main.LWElements))
	
'	resp.Write(a.RenderHTML)
End Sub


Private Sub writeHTML(WebElementList As List) As String
	Dim returnHTML As String
	Dim webSB As StringBuilder
	webSB.Initialize
	'Iterate trought the web elements
	For Each webElement As Object In WebElementList
		Dim elHTML As String = CallSub(webElement, "BuildHTML")
		If elHTML <> Null Then
			If elHTML.Length >0 Then
				webSB.Append(elHTML)
			End If
		End If
	Next
	
	If FIXED_LAYOUT Then 
		
	End If
	'Write the return html
	returnHTML = _
$"<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>WebApp test</title>
     <meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
    <link rel="shortcut icon" href="/favicon.ico" />
	<script src="/jquery.js"></script>
    <script src="/b4j_ws.js"></script>
	<script src="/jquery-ui.js"></script>
</head>
<body >	
${webSB.ToString}

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