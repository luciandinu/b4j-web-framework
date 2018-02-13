B4J=true
Group=LWF
ModulesStructureVersion=1
Type=Class
Version=6
@EndOfDesignText@
#Event: Click
'----------------------------------------
'LWF - Lightweight Web Framework
'Author: Lucian Dinu https://luciandinu.com
'Website: https://miranasolutions.com
'----------------------------------------

'LWButton Class module
Sub Class_Globals
	'Public
	Dim ID As String

	Dim Width As Int = 100 'Default size 'ignore
	Dim Height As Int = 32 'ignore
	Dim InlineCSS As String
	'---------------------------
	'Private
	Private mLeft As Int = 0 'Default position 'ignore
	Private mTop As Int = 0 'ignore
	Private mLabel As String
	Private mCallBack As Object 'ignore
	Private mEventName As String 'ignore
	Private isNew As Boolean = True 'ignore
	Private mPageController As LWPageController
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize(CallBack As Object, EventName As String, Label As String)
	mCallBack = CallBack
	mEventName = EventName
'	ID = Utils.GenerateWebID 	'Generate a random WebID based on UUID algorithm
	ID = "lw-" & EventName.ToLowerCase
	mLabel = Label
End Sub

Public Sub SetPC(PageController As LWPageController)
	mPageController = PageController
End Sub

'Builds the element html representation
Public Sub HTML As String
	Dim rHTML As String
	Dim css As String
	Dim cssEl As String
	cssEl = $"position: fixed; left: ${mLeft}px;"$ 
	If InlineCSS.Length>0 Then css = $"style='${cssEl & InlineCSS}'"$
	rHTML = $"<button id="${ID}" ${css}/>${mLabel}</button>${CRLF}"$
	Return rHTML
End Sub

Public Sub Shake
	If mPageController.IsInitialized Then
		mPageController.JSEval($"$('#${ID}').effect('shake');"$)
	End If

End Sub

'Left positon
Public Sub setLeft(aLeft As Int)
	mLeft = aLeft
	If mPageController.IsInitialized Then
		mPageController.JSEval($"$('#${ID}').css('left', ${mLeft});"$)
	End If


End Sub

Public Sub getLeft As Int
	Return mLeft
End Sub

'Top positon
Public Sub setTop(aTop As Int)
	mTop = aTop
	If mPageController.IsInitialized Then
		mPageController.JSEval($"$('#${ID}').css('top', ${mTop});"$)		
	End If

End Sub

Public Sub getTop As Int
	Return mTop
End Sub

'Label of the button
Public Sub setLabel(aLabel As String)
	mLabel = aLabel
	mPageController.JSEval($"$('#${ID}').html('${mLabel}');"$)
End Sub

Public Sub getLabel As String
	Return mLabel
End Sub

'Register all events
Private Sub registerEvents
	addClickEvent
End Sub


'Add a click event to any element on the page
Private Sub addClickEvent
'	Log("Click :" & ID)
	Dim sb As StringBuilder
	sb.Initialize
	sb.Append($"$(function() {"$)
'	sb.Append($"$('#${ID}').click(function(){"$)
	sb.Append($"$('#${ID}').on('click', function(){"$)
'	sb.Append("event.stopPropagation();")
	sb.Append($"console.log('click event ${ID} ; ${mEventName}');"$)
	sb.Append($"b4j_raiseEvent('WebSocket_Events', {'Id':'${ID}', 'EventName': '${mEventName}', 'EventType':'Click'});"$)
	sb.Append("});")
	sb.Append("});")
	'WS.Eval(sb.ToString, Null)
	mPageController.JSEval(sb.ToString)
End Sub

'Add web element to list
Public Sub AppendTo(WebElements As List)
	WebElements.Add(Me)
End Sub

