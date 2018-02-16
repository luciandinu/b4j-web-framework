B4J=true
Group=LWF
ModulesStructureVersion=1
Type=Class
Version=6
@EndOfDesignText@
#Event: Click(Params As Map)
'----------------------------------------
'LWF - Lightweight Web Framework
'Author: Lucian Dinu https://luciandinu.com
'Website: https://miranasolutions.com
'----------------------------------------

'Button Web Component
Sub Class_Globals
	'Public
	Dim ID As String


	Dim InlineCSS As String
	'---------------------------
	'Private
	Private mPosition As LWElementPosition 'Default position 'ignore
	Private mSize As LWElementSize 'ignore
	Private mLabel As String
	Private mValue As String
	Private mCallBack As Object 'ignore
	Private mEventName As String 'ignore
	Private mPageController As LWPage
End Sub

'Initializes the button web component
'CallBack = calback object
'EventName = event prefix
'TextLabel = the text of the button
Public Sub Initialize(CallBack As Object, EventName As String, TextLabel As String)
	mCallBack = CallBack
	mEventName = EventName
	
'	ID = LWUtils.GenerateWebID 	'Generate a random WebID based on UUID algorithm
	ID = "lw-button-" & EventName.ToLowerCase
	mLabel = TextLabel
	
	'Default position and size
	mPosition = LWAppGlobals.FactorPosition(0,0)
	mSize = LWAppGlobals.FactorSize(36, 140)
End Sub

Public Sub SetPC(PageController As LWPage)
	mPageController = PageController
End Sub

'Builds the element html representation
Public Sub HTML As String
	Dim rHTML As String
	Dim css As String
	Dim cssEl As String
	cssEl = $"position: fixed; left: ${mPosition.Left}px;"$ 
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
	mPosition.Left = aLeft
	If mPageController.IsInitialized Then
		mPageController.JSEval($"$('#${ID}').css('left', ${mPosition.Left});"$)
	End If


End Sub

Public Sub getLeft As Int
	Return mPosition.Left
End Sub

'Top positon
Public Sub setTop(aTop As Int)
	mPosition.Top = aTop
	If mPageController.IsInitialized Then
		mPageController.JSEval($"$('#${ID}').css('top', ${mPosition.Top});"$)		
	End If

End Sub

Public Sub getTop As Int
	Return mPosition.Top
End Sub

Public Sub SetPosition(aLeft As Int, aTop As Int)
	setLeft(aLeft)
	setTop(aTop)
End Sub

'Label of the button
Public Sub setLabel(aLabel As String)
	mLabel = aLabel
	mPageController.JSEval($"$('#${ID}').html('${mLabel}');"$)
End Sub

Public Sub getLabel As String
	Return mLabel
End Sub


'Value attribute for button
'Value is a string type conversion is needed for numbers
Public Sub setValue(aValue As String)
	mLabel = aValue
	mPageController.JSEval($"$('#${ID}').ptop('value', '${mValue}');"$)
End Sub

Public Sub getValue As String
	Return mValue
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
	If LWAppGlobals.DebugMessages Then sb.Append($"console.log('[Click event] Id: ${ID} ; EventName: ${mEventName}');"$)
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
