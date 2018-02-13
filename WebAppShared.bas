B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=StaticCode
Version=6.01
@EndOfDesignText@

Sub Process_Globals
	Public LWServer As Server
	Public LWElements As List
	Public LWPages As Map
	Public Title As String
End Sub

Public Sub StartApp
	
	LWServer.Initialize("srvr")
'	srvr.AddBackgroundWorker("BgTask") 'testing


	LWServer.AddHandler("", "WebApp", True)
	LWServer.AddFilter("/b4j_ws.js", "SessionCreator", False)
	LWServer.AddWebSocket("/ws", "WebAppEvents")


	LWServer.Port = 51242
	LWServer.Start
End Sub

Public Sub RegisterPage(PageName As String, Page As Object)
	If Not(LWPages.IsInitialized) Then
		LWPages.Initialize
	End If
	LWPages.Put(PageName, Page)
End Sub

Public Sub RegisterPage2(PageName As String, ClassName As String)
	If Not(LWPages.IsInitialized) Then
		LWPages.Initialize
	End If
	Dim tmpObj As JavaObject
	Dim resObj As Object = tmpObj.InitializeNewInstance(Utils.GetPackageName & "." & ClassName.ToLowerCase, Null)
	Log(tmpObj)
	LWPages.Put(PageName, resObj)
	
End Sub

Public Sub AddLWElement(WebElement As Object)
	LWElements.Add(WebElement)
End Sub