Attribute VB_Name = "Integration_Example"

' Integration Examples for LAB Plotting Functionality
' This file shows how to integrate the plotting functionality with existing workflows

Option Explicit

' Example 1: Basic integration at the end of existing 算方 subroutine
Sub ExampleIntegration_Method1()
    ' This is an example of how to modify your existing 算方 subroutine
    ' Add this code at the end of your existing optimization routine
    
    ' [Your existing 算方 code here...]
    ' ... optimization calculations ...
    ' ... write results to G14-I14 ...
    
    ' After successful optimization, offer to create plots
    Dim response As VbMsgBoxResult
    response = MsgBox("算方完成！是否创建LAB配方变化图表？", vbYesNo + vbQuestion, "创建图表")
    
    If response = vbYes Then
        Call CreateLABFormulationPlots
    End If
End Sub

' Example 2: Conditional integration with error handling
Sub ExampleIntegration_Method2()
    ' This method includes comprehensive error handling
    
    ' [Your existing 算方 code here...]
    
    ' Check if optimization was successful before plotting
    If IsOptimizationSuccessful() Then
        On Error Resume Next
        Call CreateLABFormulationPlots
        If Err.Number <> 0 Then
            MsgBox "图表创建失败，但优化结果已保存。错误: " & Err.Description, vbExclamation
            Err.Clear
        Else
            MsgBox "优化和图表创建都已完成！", vbInformation
        End If
        On Error GoTo 0
    Else
        MsgBox "优化未成功完成，跳过图表创建。", vbExclamation
    End If
End Sub

' Example 3: Batch processing with multiple formulations
Sub ExampleIntegration_BatchProcessing()
    ' This example shows how to handle multiple optimization runs
    
    Dim i As Integer
    Dim formulationCount As Integer
    formulationCount = 5 ' Example: process 5 different formulations
    
    For i = 1 To formulationCount
        ' Run optimization for formulation i
        Call RunOptimizationForFormulation(i)
        
        ' Create plots for this formulation
        If IsOptimizationSuccessful() Then
            ' Save current formulation data
            Call SaveFormulationData(i)
            
            ' Create plots with custom naming
            Call CreateCustomNamedPlots(i)
        End If
    Next i
    
    MsgBox "批量处理完成！", vbInformation
End Sub

' Example 4: Menu-driven interface
Sub ExampleIntegration_MenuDriven()
    ' Create a simple menu for user interaction
    
    Dim choice As String
    choice = InputBox("请选择操作:" & vbCrLf & _
                     "1 - 仅运行算方" & vbCrLf & _
                     "2 - 算方 + 创建图表" & vbCrLf & _
                     "3 - 仅创建图表（使用现有数据）" & vbCrLf & _
                     "输入选择 (1-3):", "操作选择", "2")
    
    Select Case choice
        Case "1"
            Call RunOptimizationOnly
        Case "2"
            Call RunOptimizationOnly
            If IsOptimizationSuccessful() Then
                Call CreateLABFormulationPlots
            End If
        Case "3"
            Call CreateLABFormulationPlots
        Case Else
            MsgBox "无效选择！", vbExclamation
    End Select
End Sub

' Helper function to check if optimization was successful
Private Function IsOptimizationSuccessful() As Boolean
    ' Check if G14-I14 contain valid optimization results
    On Error Resume Next
    
    Dim ws As Worksheet
    Set ws = Worksheets("宏按钮")
    
    Dim x1 As Double, x2 As Double, x3 As Double
    x1 = ws.Range("G14").Value
    x2 = ws.Range("H14").Value
    x3 = ws.Range("I14").Value
    
    If Err.Number <> 0 Then
        IsOptimizationSuccessful = False
        Err.Clear
    Else
        ' Check if values are non-zero (indicating successful optimization)
        IsOptimizationSuccessful = (x1 <> 0 Or x2 <> 0 Or x3 <> 0)
    End If
    
    On Error GoTo 0
End Function

' Placeholder for existing optimization routine
Private Sub RunOptimizationOnly()
    ' This represents your existing 算方 subroutine
    ' Replace this with a call to your actual optimization code
    MsgBox "这里调用您现有的算方子程序", vbInformation
    
    ' Example: Call YourExistingOptimizationSubroutine
End Sub

' Example of saving formulation data for batch processing
Private Sub SaveFormulationData(formulationIndex As Integer)
    ' Save current optimization results with index for batch processing
    Dim ws As Worksheet
    Set ws = Worksheets("范围")
    
    ' Save to a different area of the worksheet
    Dim saveRow As Integer
    saveRow = 5 + formulationIndex * 2
    
    ws.Cells(saveRow, 1).Value = "配方" & formulationIndex
    ws.Cells(saveRow, 2).Value = Worksheets("宏按钮").Range("G14").Value
    ws.Cells(saveRow, 3).Value = Worksheets("宏按钮").Range("H14").Value
    ws.Cells(saveRow, 4).Value = Worksheets("宏按钮").Range("I14").Value
End Sub

' Example of creating plots with custom naming for batch processing
Private Sub CreateCustomNamedPlots(formulationIndex As Integer)
    ' This would be a modified version of CreateLABFormulationPlots
    ' that adds formulation index to chart titles
    
    ' For now, just call the standard function
    ' In a real implementation, you could modify the chart titles
    Call CreateLABFormulationPlots
    
    ' Rename charts to include formulation index
    RenameChartsWithIndex formulationIndex
End Sub

' Helper to rename charts with formulation index
Private Sub RenameChartsWithIndex(formulationIndex As Integer)
    Dim ws As Worksheet
    Set ws = Worksheets("范围")
    
    Dim chartObj As ChartObject
    For Each chartObj In ws.ChartObjects
        If InStr(chartObj.Chart.ChartTitle.Text, "vs") > 0 Then
            chartObj.Chart.ChartTitle.Text = chartObj.Chart.ChartTitle.Text & " (配方" & formulationIndex & ")"
        End If
    Next chartObj
End Sub

' Example 5: Advanced integration with parameter validation
Sub ExampleIntegration_WithValidation()
    ' Comprehensive validation before running
    
    If Not ValidateInputParameters() Then
        MsgBox "输入参数验证失败！请检查数据完整性。", vbCritical
        Exit Sub
    End If
    
    ' Run optimization
    Call RunOptimizationOnly
    
    ' Validate optimization results
    If Not ValidateOptimizationResults() Then
        MsgBox "优化结果验证失败！", vbCritical
        Exit Sub
    End If
    
    ' Create plots
    Call CreateLABFormulationPlots
    
    ' Post-creation validation
    If ValidateCreatedCharts() Then
        MsgBox "所有操作完成并验证成功！", vbInformation
    Else
        MsgBox "图表创建完成，但验证发现问题。请检查结果。", vbExclamation
    End If
End Sub

' Validation functions
Private Function ValidateInputParameters() As Boolean
    ' Check if all required input data is present and valid
    ValidateInputParameters = True
    
    ' Check target LAB values
    If Not ValidateTargetLABValues() Then ValidateInputParameters = False
    
    ' Check fitting coefficients
    If Not ValidateFittingCoefficients() Then ValidateInputParameters = False
    
    ' Add more validations as needed
End Function

Private Function ValidateOptimizationResults() As Boolean
    ' Validate that optimization produced reasonable results
    ValidateOptimizationResults = IsOptimizationSuccessful()
    
    ' Add additional checks for reasonableness of values
    ' e.g., check if values are within expected ranges
End Function

Private Function ValidateCreatedCharts() As Boolean
    ' Check if charts were created successfully
    Dim ws As Worksheet
    Set ws = Worksheets("范围")
    
    Dim chartCount As Integer
    Dim chartObj As ChartObject
    
    For Each chartObj In ws.ChartObjects
        If InStr(chartObj.Chart.ChartTitle.Text, "vs") > 0 Then
            chartCount = chartCount + 1
        End If
    Next chartObj
    
    ValidateCreatedCharts = (chartCount = 9) ' Should have 9 charts
End Function

Private Function ValidateTargetLABValues() As Boolean
    ' Validate target LAB values are present and reasonable
    On Error Resume Next
    
    Dim ws As Worksheet
    Set ws = Worksheets("宏按钮")
    
    Dim l_target As Double, a_target As Double, b_target As Double
    l_target = ws.Range("D17").Value
    a_target = ws.Range("E17").Value
    b_target = ws.Range("F17").Value
    
    If Err.Number <> 0 Then
        ValidateTargetLABValues = False
        Err.Clear
    Else
        ' Check for reasonable ranges (customize as needed)
        ValidateTargetLABValues = (l_target >= 0 And l_target <= 100) And _
                                 (a_target >= -128 And a_target <= 127) And _
                                 (b_target >= -128 And b_target <= 127)
    End If
    
    On Error GoTo 0
End Function

Private Function ValidateFittingCoefficients() As Boolean
    ' Check if fitting coefficients are present
    On Error Resume Next
    
    Dim ws As Worksheet
    Set ws = Worksheets("范围")
    
    ' Check if first few coefficients exist
    Dim coeff1 As Double, coeff2 As Double
    coeff1 = ws.Range("A1").Value
    coeff2 = ws.Range("A2").Value
    
    ValidateFittingCoefficients = (Err.Number = 0) And (coeff1 <> 0 Or coeff2 <> 0)
    
    If Err.Number <> 0 Then Err.Clear
    On Error GoTo 0
End Function