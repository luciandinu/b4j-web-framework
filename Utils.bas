﻿B4J=true
Group=LWF
ModulesStructureVersion=1
Type=StaticCode
Version=6
@EndOfDesignText@
'Utils static code
Sub Process_Globals
	
End Sub

'Generates a random WebID and returns the string representation
Sub GenerateWebID As String
	Dim jObject As JavaObject
	jObject = jObject.InitializeStatic("java.util.UUID")
	jObject = jObject.RunMethod("randomUUID", Null)
	Dim rString As String = jObject.RunMethod("toString", Null)
	Return rString.Replace("-", "_")
End Sub
