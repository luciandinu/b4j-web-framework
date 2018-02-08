B4J=true
Group=LWF
ModulesStructureVersion=1
Type=Class
Version=6
@EndOfDesignText@
#Event: Click
'----------------------------------------
'LWF
'Author: Lucian Dinu https://luciandinu.com
'Website: https://miranasolutions.com
'----------------------------------------

'LWButton Class module
Sub Class_Globals
	'Public
	Dim ID As String
	Dim Left As Int = 0 'Default position 'ignore
	Dim Top As Int = 0 'ignore
	Dim Width As Int = 100 'Default size 'ignore
	Dim Height As Int = 32 'ignore
	Dim InlineCSS As String
	'---------------------------
	'Private
	Private mLabel As String
	Private mCallBack As Object 'ignore
	Private mEventName As String 'ignore

End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize(CallBack As Object, EventName As String, Label As String)
	mCallBack = CallBack
	mEventName = EventName
	ID = Utils.GenerateWebID 	'Generate a random WebID based on UUID algorithm
	mLabel = Label
End Sub


'Builds the element html representation
Public Sub HTML As String
	Dim rHTML As String
	Dim css As String
	If InlineCSS.Length>0 Then css = $"style='${InlineCSS}'"$
	rHTML = $"<button id='${ID}' ${css}/>${mLabel}</button>${CRLF}"$
	Return rHTML
End Sub

Public Sub Shake
	EventsShared.WS.Eval($"$('#${ID}').effect('shake');"$, Null)
	CallSub(mCallBack, mEventName & "_OnShake")
End Sub

'Register all events
Private Sub registerEvents
	AddClickEvent
End Sub


'Add a click event to any element on the page
Private Sub AddClickEvent
	Dim sb As StringBuilder
	sb.Initialize
'	sb.Append("<script>")
	sb.Append($"$(function() {"$)
	sb.Append($"$('#${ID}').click(function(){"$)
'	sb.Append("event.stopPropagation();")
'	sb.Append($"console.log('click event ${ID} ; ${mEventName}');"$)
	sb.Append($"b4j_raiseEvent('WebApp_Click', {'Id':'${ID}', 'Event': '${mEventName}'});"$)
	sb.Append("});")
	sb.Append("});")
'	sb.Append("</script>")
	EventsShared.WS.Eval(sb.ToString, Null)
End Sub

Private Sub bla_Click(value As Map)
	Log("bla")
End Sub
