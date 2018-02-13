B4J=true
Group=LWF
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
	Public LWServer As Server
	Public LWElements As List
	Public LWPages As Map
	Public Title As String
	Public PageContent As String
	Public PAGEISNEW = True As Boolean
End Sub

Public Sub InitApp
	'Init Web Elements List
	LWElements.Initialize
End Sub

Public Sub StartApp
	
	LWServer.Initialize("srvr")
'	srvr.AddBackgroundWorker("BgTask") 'testing


	LWServer.AddHandler("", "WebApp", True)
'	LWServer.AddFilter("/b4j_ws.js", "SessionCreator", False)
	LWServer.AddWebSocket("/ws", "MainPage")

	LWServer.Port = 51245
	LWServer.Start
End Sub

Public Sub RegisterPage(PageName As String, Page As Object)
	If Not(LWPages.IsInitialized) Then
		LWPages.Initialize
	End If
	LWPages.Put(PageName, Page)
End Sub


Public Sub AddLWElement(WebElement As Object)
	LWElements.Add(WebElement)
End Sub