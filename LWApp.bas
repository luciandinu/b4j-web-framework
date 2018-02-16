B4J=true
Group=LWF
ModulesStructureVersion=1
Type=Class
Version=6
@EndOfDesignText@
'Class module
'----------------------------------------
'LWF - Lightweight Web Framework
'Author: Lucian Dinu https://luciandinu.com
'Website: https://miranasolutions.com
'----------------------------------------
Sub Class_Globals
	Public LWServer As Server
	Public LWPages As Map
	'The title of the app
	Public Title As String
	'Private
	Private mPort As Double = 52245
	
End Sub

'Initializes the app
Public Sub Initialize
	LWPages.Initialize
	LWServer.Initialize("srvr")
	LWServer.Port = mPort
	Log(LWServer.StaticFilesFolder)
	LWServer.SetStaticFilesOptions(CreateMap("cacheControl": "max-age=604800,public","gzip":True,"dirAllowed":False))
End Sub

'Start the app
Public Sub Start
	LWServer.Start
End Sub

'Set the app server port
Public Sub AppServerPort(Port As Int)
	mPort = Port
	LWServer.Port = mPort
End Sub


'Register a handler for a web page
'URLToHandle = url that the page handles
'ClassName = websocket class to handle requests
Public Sub RegisterPageHandler(URLToHandle As String, ClassName As String)
	Dim mRoute As String = URLToHandle
	If mRoute = "/" Or mRoute = "\" Or mRoute = "" Then
		mRoute = ""
	End If
	'We keep a record of pages
	Dim tmpKey As String
	If mRoute = "" Then 
		tmpKey = "[root]"
	Else
		tmpKey = mRoute
	End If
	LWPages.Put(tmpKey, ClassName)
	LWServer.AddWebSocket(mRoute & "/ws", ClassName)
End Sub

