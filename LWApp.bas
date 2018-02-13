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
	Public LWElements As List
	Public LWPages As Map
	Public Title As String
	Public PageContent As String
	Public PAGEISNEW = True As Boolean
	Private mPort As Double = 52245 
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize
	LWServer.Initialize("srvr")
	LWServer.Port = mPort
	LWElements.Initialize
	LWServer.SetStaticFilesOptions(CreateMap("cacheControl": "max-age=604800,public","gzip":True,"dirAllowed":False))
End Sub



Public Sub Start
	LWServer.Start
End Sub


Public Sub SetServerPort(Port As Int)
	mPort = Port
	LWServer.Port = mPort
End Sub

Public Sub RegisterPageHandler(URLToHandle As String, ClassName As String)
	Dim mRoute As String = URLToHandle
	If mRoute = "/" Or mRoute = "\" Or mRoute = "" Then
		mRoute = ""
	End If

	LWServer.AddWebSocket(mRoute & "/ws", ClassName)
End Sub

