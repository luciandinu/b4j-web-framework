B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=StaticCode
Version=6.01
@EndOfDesignText@
'----------------------------------------
'LWF - Lightweight Web Framework
'Author: Lucian Dinu https://luciandinu.com
'Website: https://miranasolutions.com
'----------------------------------------
Sub Process_Globals
	Type LWElementPosition (Left As Int, Top As Int)
	Type LWElementSize(Width As Int, Height As Int)
	Public DebugMessages As Boolean = False
End Sub

Public Sub FactorPosition(Left As Int, Top As Int) As LWElementPosition
	Dim mPos As LWElementPosition
	mPos.Initialize
	mPos.Left= Left
	mPos.Top = Top
	Return mPos
End Sub

Public Sub FactorSize(Width As Int, Height As Int) As LWElementSize
	Dim mSize As LWElementSize
	mSize.Initialize
	mSize.Width= Width
	mSize.Height = Height
	Return mSize
End Sub