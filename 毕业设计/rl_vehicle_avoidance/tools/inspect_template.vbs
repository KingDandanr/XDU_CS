Function TryOpenPresentation(app, path)
    Dim i
    Dim pres
    Set pres = Nothing
    For i = 1 To 20
        On Error Resume Next
        Set pres = app.Presentations.Open(path, False, False, False)
        If Err.Number = 0 Then
            Set TryOpenPresentation = pres
            Exit Function
        End If
        Err.Clear
        WScript.Sleep 1000
        On Error GoTo 0
    Next
    Set TryOpenPresentation = Nothing
End Function

Dim pptApp
Dim presentation
Dim templatePath

templatePath = "D:\file\study\XDU_CS\毕业设计\蓝色背景幻灯模版.ppt"

Set pptApp = CreateObject("PowerPoint.Application")
pptApp.Visible = True
WScript.Sleep 3000

Set presentation = TryOpenPresentation(pptApp, templatePath)

If presentation Is Nothing Then
    WScript.Echo "OPEN_FAILED"
Else
    WScript.Echo "Slides=" & presentation.Slides.Count
    presentation.Close
End If

pptApp.Quit

Set presentation = Nothing
Set pptApp = Nothing
