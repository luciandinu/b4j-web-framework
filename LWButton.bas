B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=6
@EndOfDesignText@
'Class module
Sub Class_Globals
	Dim Left As Int = 0 'Default position 'ignore
	Dim Top As Int = 0 'ignore
	Dim Width As Int = 100 'Default size 'ignore
	Dim Height As Int = 32 'ignore
	Dim InlineCSS As String
	'---------------------------
	Private m_Label As String
	Private m_ID As String
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize(Label As String)
	m_ID = Utils.GenerateWebID 	'Generate a random WebID based on UUID
	m_Label = Label
End Sub

'Returns the web element ID
Public Sub GetID As String
	Return m_ID
End Sub

Public Sub SetNewID(NewID As String)
	m_ID = NewID
End Sub

'Renders the element html representation
Public Sub RenderHTML As String
	Dim html As String
	Dim css As String
	If InlineCSS.Length>0 Then css = $"style='${InlineCSS}'"$
	html = $"<button id='${m_ID}' ${css}/>${m_Label}</button>${CRLF}"$
	Return html
End Sub
