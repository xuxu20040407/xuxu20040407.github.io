Attribute VB_Name = "LAB_Plotting_Module"

' LAB Values vs Formulation Variations Plotting Module
' This module provides functionality to create 3x3 plots showing LAB components vs formulation variables
' Author: Generated for xuxu20040407.github.io repository
' Date: Created for issue implementation

Option Explicit

' Constants for chart configuration
Const CHART_WIDTH As Double = 300
Const CHART_HEIGHT As Double = 200
Const GRID_COLS As Integer = 3
Const GRID_ROWS As Integer = 3
Const DATA_POINTS As Integer = 100
Const VARIATION_PERCENT As Double = 0.2 ' ±20% variation around optimal

' Main plotting subroutine - call this after 算方 process
Public Sub CreateLABFormulationPlots()
    On Error GoTo ErrorHandler
    
    ' Validate prerequisites
    If Not ValidateWorksheetStructure() Then
        MsgBox "错误：工作表结构不符合要求。请确保存在'宏按钮'和'范围'工作表。", vbCritical
        Exit Sub
    End If
    
    ' Read optimal formulation and parameters
    Dim optimalFormulation(1 To 3) As Double
    Dim targetLAB(1 To 3) As Double
    Dim deltaLAB(1 To 3) As Double
    Dim polynomialOrder As Integer
    Dim fittingCoeffs As Variant
    
    If Not ReadOptimalFormulation(optimalFormulation) Then Exit Sub
    If Not ReadTargetValues(targetLAB, deltaLAB) Then Exit Sub
    If Not ReadFittingParameters(polynomialOrder, fittingCoeffs) Then Exit Sub
    
    ' Clear existing charts in 范围 sheet
    ClearExistingCharts
    
    ' Create the 3x3 grid of plots
    Dim labComponent As Integer, formVariable As Integer
    Dim chartObj As ChartObject
    Dim startRow As Integer, startCol As Integer
    
    startRow = 25 ' Starting position for charts
    startCol = 2  ' Column B
    
    For labComponent = 1 To 3 ' L, A, B components
        For formVariable = 1 To 3 ' X1, X2, X3 variables
            ' Calculate chart position
            Dim chartLeft As Double, chartTop As Double
            chartLeft = Worksheets("范围").Cells(startRow, startCol + (formVariable - 1) * 5).Left
            chartTop = Worksheets("范围").Cells(startRow + (labComponent - 1) * 12, startCol).Top
            
            ' Create individual plot
            Set chartObj = CreateSinglePlot(labComponent, formVariable, _
                                          optimalFormulation, targetLAB, deltaLAB, _
                                          polynomialOrder, fittingCoeffs, _
                                          chartLeft, chartTop)
        Next formVariable
    Next labComponent
    
    MsgBox "LAB配方变化图表创建完成！", vbInformation
    Exit Sub
    
ErrorHandler:
    MsgBox "创建图表时发生错误：" & Err.Description, vbCritical
End Sub

' Create a single plot for one LAB component vs one formulation variable
Private Function CreateSinglePlot(labComp As Integer, formVar As Integer, _
                                optForm() As Double, targetLAB() As Double, deltaLAB() As Double, _
                                polyOrder As Integer, coeffs As Variant, _
                                chartLeft As Double, chartTop As Double) As ChartObject
    
    Dim ws As Worksheet
    Set ws = Worksheets("范围")
    
    ' Generate data points for the curves
    Dim xValues As Variant, yOriginal As Variant, yShifted As Variant
    GenerateCurveData labComp, formVar, optForm, targetLAB, deltaLAB, _
                     polyOrder, coeffs, xValues, yOriginal, yShifted
    
    ' Create chart object
    Dim chartObj As ChartObject
    Set chartObj = ws.ChartObjects.Add(chartLeft, chartTop, CHART_WIDTH, CHART_HEIGHT)
    
    With chartObj.Chart
        .ChartType = xlXYScatterSmooth
        
        ' Add original curve (solid line)
        Dim series1 As Series
        Set series1 = .SeriesCollection.NewSeries
        With series1
            .Name = "拟合曲线"
            .XValues = xValues
            .Values = yOriginal
            .Format.Line.ForeColor.RGB = RGB(0, 0, 255) ' Blue
            .Format.Line.Weight = 2
        End With
        
        ' Add shifted curve (dashed line)
        Dim series2 As Series
        Set series2 = .SeriesCollection.NewSeries
        With series2
            .Name = "目标曲线"
            .XValues = xValues
            .Values = yShifted
            .Format.Line.ForeColor.RGB = RGB(255, 0, 0) ' Red
            .Format.Line.Weight = 2
            .Format.Line.DashStyle = msoLineDash
        End With
        
        ' Mark optimal point
        Dim series3 As Series
        Set series3 = .SeriesCollection.NewSeries
        With series3
            .Name = "最优点"
            .XValues = Array(optForm(formVar))
            .Values = Array(计算拟合值_Generic(labComp, optForm, polyOrder, coeffs))
            .ChartType = xlXYScatter
            .MarkerStyle = xlMarkerStyleCircle
            .MarkerSize = 8
            .MarkerForegroundColor = RGB(0, 128, 0) ' Green
        End With
        
        ' Format chart
        .HasTitle = True
        .ChartTitle.Text = GetLABName(labComp) & " vs " & GetFormulationName(formVar)
        .Axes(xlCategory).HasTitle = True
        .Axes(xlCategory).AxisTitle.Text = GetFormulationName(formVar)
        .Axes(xlValue).HasTitle = True
        .Axes(xlValue).AxisTitle.Text = GetLABName(labComp)
        .HasLegend = True
        .Legend.Position = xlLegendPositionBottom
    End With
    
    Set CreateSinglePlot = chartObj
End Function

' Generate curve data points for plotting
Private Sub GenerateCurveData(labComp As Integer, formVar As Integer, _
                             optForm() As Double, targetLAB() As Double, deltaLAB() As Double, _
                             polyOrder As Integer, coeffs As Variant, _
                             ByRef xValues As Variant, ByRef yOriginal As Variant, ByRef yShifted As Variant)
    
    ' Calculate variation range around optimal value
    Dim minVal As Double, maxVal As Double
    Dim dataRange As Double
    dataRange = GetDataRange(formVar) ' Get the full data range for this variable
    
    minVal = optForm(formVar) - VARIATION_PERCENT * dataRange
    maxVal = optForm(formVar) + VARIATION_PERCENT * dataRange
    
    ' Initialize arrays
    ReDim xValues(1 To DATA_POINTS)
    ReDim yOriginal(1 To DATA_POINTS)
    ReDim yShifted(1 To DATA_POINTS)
    
    Dim i As Integer
    Dim currentFormulation(1 To 3) As Double
    Dim stepSize As Double
    
    stepSize = (maxVal - minVal) / (DATA_POINTS - 1)
    
    ' Copy optimal formulation as base
    For i = 1 To 3
        currentFormulation(i) = optForm(i)
    Next i
    
    ' Generate data points
    For i = 1 To DATA_POINTS
        xValues(i) = minVal + (i - 1) * stepSize
        currentFormulation(formVar) = xValues(i)
        
        ' Calculate original curve value
        yOriginal(i) = 计算拟合值_Generic(labComp, currentFormulation, polyOrder, coeffs)
        
        ' Calculate shifted curve value (target + delta)
        yShifted(i) = yOriginal(i) + (targetLAB(labComp) + deltaLAB(labComp) - _
                      计算拟合值_Generic(labComp, optForm, polyOrder, coeffs))
    Next i
End Sub

' Wrapper function that calls the existing 计算拟合值_Generic function
Private Function 计算拟合值_Generic(labComponent As Integer, formulation() As Double, _
                                  polynomialOrder As Integer, coefficients As Variant) As Double
    ' This function should call the existing 计算拟合值_Generic function
    ' The implementation depends on the existing code structure
    ' For now, providing a template structure
    
    Dim result As Double
    Dim x1 As Double, x2 As Double, x3 As Double
    
    x1 = formulation(1)
    x2 = formulation(2)  
    x3 = formulation(3)
    
    ' Call existing function or implement polynomial calculation
    ' This is a placeholder - should be replaced with actual function call
    Select Case polynomialOrder
        Case 2 ' 2nd order polynomial
            result = CalculateSecondOrderPolynomial(labComponent, x1, x2, x3, coefficients)
        Case 3 ' 3rd order polynomial  
            result = CalculateThirdOrderPolynomial(labComponent, x1, x2, x3, coefficients)
        Case Else
            Err.Raise vbObjectError + 1, , "不支持的多项式阶数"
    End Select
    
    计算拟合值_Generic = result
End Function

' Calculate 2nd order polynomial value
Private Function CalculateSecondOrderPolynomial(labComp As Integer, x1 As Double, x2 As Double, x3 As Double, coeffs As Variant) As Double
    ' 2nd order: 10 coefficients per LAB component
    ' a0 + a1*x1 + a2*x2 + a3*x3 + a4*x1^2 + a5*x2^2 + a6*x3^2 + a7*x1*x2 + a8*x1*x3 + a9*x2*x3
    
    Dim baseIndex As Integer
    baseIndex = (labComp - 1) * 10 + 1 ' Coefficient offset for this LAB component
    
    Dim result As Double
    result = coeffs(baseIndex) + _           ' a0
             coeffs(baseIndex + 1) * x1 + _ ' a1*x1
             coeffs(baseIndex + 2) * x2 + _ ' a2*x2  
             coeffs(baseIndex + 3) * x3 + _ ' a3*x3
             coeffs(baseIndex + 4) * x1 * x1 + _ ' a4*x1^2
             coeffs(baseIndex + 5) * x2 * x2 + _ ' a5*x2^2
             coeffs(baseIndex + 6) * x3 * x3 + _ ' a6*x3^2
             coeffs(baseIndex + 7) * x1 * x2 + _ ' a7*x1*x2
             coeffs(baseIndex + 8) * x1 * x3 + _ ' a8*x1*x3
             coeffs(baseIndex + 9) * x2 * x3     ' a9*x2*x3
             
    CalculateSecondOrderPolynomial = result
End Function

' Calculate 3rd order polynomial value
Private Function CalculateThirdOrderPolynomial(labComp As Integer, x1 As Double, x2 As Double, x3 As Double, coeffs As Variant) As Double
    ' 3rd order: 20 coefficients per LAB component
    ' Includes all 2nd order terms plus 3rd order terms
    
    Dim baseIndex As Integer
    baseIndex = (labComp - 1) * 20 + 1 ' Coefficient offset for this LAB component
    
    Dim result As Double
    ' 2nd order terms
    result = coeffs(baseIndex) + _           ' a0
             coeffs(baseIndex + 1) * x1 + _ ' a1*x1
             coeffs(baseIndex + 2) * x2 + _ ' a2*x2
             coeffs(baseIndex + 3) * x3 + _ ' a3*x3
             coeffs(baseIndex + 4) * x1 * x1 + _ ' a4*x1^2
             coeffs(baseIndex + 5) * x2 * x2 + _ ' a5*x2^2
             coeffs(baseIndex + 6) * x3 * x3 + _ ' a6*x3^2
             coeffs(baseIndex + 7) * x1 * x2 + _ ' a7*x1*x2
             coeffs(baseIndex + 8) * x1 * x3 + _ ' a8*x1*x3
             coeffs(baseIndex + 9) * x2 * x3     ' a9*x2*x3
    
    ' 3rd order terms
    result = result + _
             coeffs(baseIndex + 10) * x1 * x1 * x1 + _ ' a10*x1^3
             coeffs(baseIndex + 11) * x2 * x2 * x2 + _ ' a11*x2^3
             coeffs(baseIndex + 12) * x3 * x3 * x3 + _ ' a12*x3^3
             coeffs(baseIndex + 13) * x1 * x1 * x2 + _ ' a13*x1^2*x2
             coeffs(baseIndex + 14) * x1 * x1 * x3 + _ ' a14*x1^2*x3
             coeffs(baseIndex + 15) * x2 * x2 * x1 + _ ' a15*x2^2*x1
             coeffs(baseIndex + 16) * x2 * x2 * x3 + _ ' a16*x2^2*x3
             coeffs(baseIndex + 17) * x3 * x3 * x1 + _ ' a17*x3^2*x1
             coeffs(baseIndex + 18) * x3 * x3 * x2 + _ ' a18*x3^2*x2
             coeffs(baseIndex + 19) * x1 * x2 * x3     ' a19*x1*x2*x3
             
    CalculateThirdOrderPolynomial = result
End Function

' Read optimal formulation from G14-I14 in 宏按钮 sheet
Private Function ReadOptimalFormulation(ByRef optFormulation() As Double) As Boolean
    On Error GoTo ErrorHandler
    
    Dim ws As Worksheet
    Set ws = Worksheets("宏按钮")
    
    optFormulation(1) = ws.Range("G14").Value ' X1
    optFormulation(2) = ws.Range("H14").Value ' X2
    optFormulation(3) = ws.Range("I14").Value ' X3
    
    ' Validate values
    If optFormulation(1) = 0 And optFormulation(2) = 0 And optFormulation(3) = 0 Then
        MsgBox "警告：最优配方值为空或零。请先运行算方过程。", vbExclamation
        ReadOptimalFormulation = False
        Exit Function
    End If
    
    ReadOptimalFormulation = True
    Exit Function
    
ErrorHandler:
    MsgBox "读取最优配方失败：" & Err.Description, vbCritical
    ReadOptimalFormulation = False
End Function

' Read target LAB values (D17-F17) and delta LAB values (A19-C19)
Private Function ReadTargetValues(ByRef targetLAB() As Double, ByRef deltaLAB() As Double) As Boolean
    On Error GoTo ErrorHandler
    
    Dim ws As Worksheet
    Set ws = Worksheets("宏按钮")
    
    ' Read target LAB values
    targetLAB(1) = ws.Range("D17").Value ' Target L
    targetLAB(2) = ws.Range("E17").Value ' Target A
    targetLAB(3) = ws.Range("F17").Value ' Target B
    
    ' Read delta LAB values
    deltaLAB(1) = ws.Range("A19").Value ' Delta L
    deltaLAB(2) = ws.Range("B19").Value ' Delta A
    deltaLAB(3) = ws.Range("C19").Value ' Delta B
    
    ReadTargetValues = True
    Exit Function
    
ErrorHandler:
    MsgBox "读取目标LAB值失败：" & Err.Description, vbCritical
    ReadTargetValues = False
End Function

' Read fitting parameters from 范围 sheet
Private Function ReadFittingParameters(ByRef polynomialOrder As Integer, ByRef coefficients As Variant) As Boolean
    On Error GoTo ErrorHandler
    
    Dim ws As Worksheet
    Set ws = Worksheets("范围")
    
    ' Determine polynomial order by checking coefficient array size
    ' This is a placeholder - actual implementation depends on how coefficients are stored
    Dim coeffRange As Range
    
    ' Try to read from a specific range - adjust according to actual layout
    Set coeffRange = ws.Range("A1:A60") ' Assuming coefficients are in column A
    
    Dim coeffCount As Integer
    coeffCount = 0
    Dim i As Integer
    
    For i = 1 To coeffRange.Rows.Count
        If coeffRange.Cells(i, 1).Value <> "" Then
            coeffCount = coeffCount + 1
        End If
    Next i
    
    ' Determine order based on coefficient count
    If coeffCount = 30 Then ' 3 LAB * 10 coefficients each
        polynomialOrder = 2
    ElseIf coeffCount = 60 Then ' 3 LAB * 20 coefficients each
        polynomialOrder = 3
    Else
        MsgBox "无法确定多项式阶数。系数数量：" & coeffCount, vbCritical
        ReadFittingParameters = False
        Exit Function
    End If
    
    ' Read coefficients
    ReDim coefficients(1 To coeffCount)
    For i = 1 To coeffCount
        coefficients(i) = coeffRange.Cells(i, 1).Value
    Next i
    
    ReadFittingParameters = True
    Exit Function
    
ErrorHandler:
    MsgBox "读取拟合参数失败：" & Err.Description, vbCritical
    ReadFittingParameters = False
End Function

' Validate that required worksheets exist
Private Function ValidateWorksheetStructure() As Boolean
    Dim wsExists As Boolean
    wsExists = True
    
    ' Check for 宏按钮 sheet
    On Error Resume Next
    Set Worksheets("宏按钮")
    If Err.Number <> 0 Then
        wsExists = False
        Err.Clear
    End If
    
    ' Check for 范围 sheet
    Set Worksheets("范围")
    If Err.Number <> 0 Then
        wsExists = False
        Err.Clear
    End If
    On Error GoTo 0
    
    ValidateWorksheetStructure = wsExists
End Function

' Clear existing charts in 范围 sheet
Private Sub ClearExistingCharts()
    Dim ws As Worksheet
    Set ws = Worksheets("范围")
    
    Dim chartObj As ChartObject
    For Each chartObj In ws.ChartObjects
        If InStr(chartObj.Chart.ChartTitle.Text, "vs") > 0 Then ' Only remove our charts
            chartObj.Delete
        End If
    Next chartObj
End Sub

' Get data range for formulation variable (placeholder)
Private Function GetDataRange(formVar As Integer) As Double
    ' This should return the actual data range for the formulation variable
    ' Placeholder implementation - adjust according to actual data structure
    GetDataRange = 100 ' Default range
End Function

' Get LAB component name
Private Function GetLABName(labComp As Integer) As String
    Select Case labComp
        Case 1: GetLABName = "L值"
        Case 2: GetLABName = "A值"
        Case 3: GetLABName = "B值"
        Case Else: GetLABName = "未知"
    End Select
End Function

' Get formulation variable name
Private Function GetFormulationName(formVar As Integer) As String
    Select Case formVar
        Case 1: GetFormulationName = "X1"
        Case 2: GetFormulationName = "X2"
        Case 3: GetFormulationName = "X3"
        Case Else: GetFormulationName = "未知"
    End Select
End Function

' Integration subroutine - call this from existing workflow
Public Sub IntegrateWithExistingWorkflow()
    ' This subroutine can be called from the existing 算方 process
    ' Add error handling to ensure it doesn't break the main workflow
    
    On Error Resume Next
    CreateLABFormulationPlots
    If Err.Number <> 0 Then
        MsgBox "图表创建过程中出现错误，但主流程继续执行。错误：" & Err.Description, vbExclamation
        Err.Clear
    End If
    On Error GoTo 0
End Sub