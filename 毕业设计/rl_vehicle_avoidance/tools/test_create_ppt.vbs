Function RetryAddPresentation(app)
    Dim i
    Dim pres
    Set pres = Nothing
    For i = 1 To 20
        On Error Resume Next
        Set pres = app.Presentations.Add
        If Err.Number = 0 Then
            Set RetryAddPresentation = pres
            Exit Function
        End If
        Err.Clear
        WScript.Sleep 1000
        On Error GoTo 0
    Next
    Set RetryAddPresentation = Nothing
End Function

Function RetryAddSlide(pres, index, layout)
    Dim i
    Dim sld
    Set sld = Nothing
    For i = 1 To 20
        On Error Resume Next
        Set sld = pres.Slides.Add(index, layout)
        If Err.Number = 0 Then
            Set RetryAddSlide = sld
            Exit Function
        End If
        Err.Clear
        WScript.Sleep 1000
        On Error GoTo 0
    Next
    Set RetryAddSlide = Nothing
End Function

Sub RetrySaveAs(pres, path)
    Dim i
    For i = 1 To 20
        On Error Resume Next
        pres.SaveAs path
        If Err.Number = 0 Then
            Exit Sub
        End If
        Err.Clear
        WScript.Sleep 1000
        On Error GoTo 0
    Next
End Sub

Dim pptApp
Dim pres
Dim slide
Dim savePath

savePath = "D:\file\study\XDU_CS\毕业设计\rl_vehicle_avoidance\test_create.pptx"

Set pptApp = CreateObject("PowerPoint.Application")
pptApp.Visible = True
WScript.Sleep 5000

Set pres = RetryAddPresentation(pptApp)
If pres Is Nothing Then
    WScript.Echo "ADD_PRESENTATION_FAILED"
    pptApp.Quit
    WScript.Quit 1
End If

Set slide = RetryAddSlide(pres, 1, 12)
If slide Is Nothing Then
    WScript.Echo "ADD_SLIDE_FAILED"
    pres.Close
    pptApp.Quit
    WScript.Quit 1
End If

WScript.Sleep 1000
slide.Shapes.Title.TextFrame.TextRange.Text = "Test PPT"
WScript.Sleep 1000
RetrySaveAs pres, savePath
WScript.Sleep 1000

pres.Close
pptApp.Quit

Set slide = Nothing
Set pres = Nothing
Set pptApp = Nothing
