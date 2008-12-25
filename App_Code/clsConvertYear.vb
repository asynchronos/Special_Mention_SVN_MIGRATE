Option Explicit On
Option Strict On

Imports Microsoft.VisualBasic

Public Class clsConvertYear
    ''' <summary>
    ''' Function ใช้สำหรับแสดง Convert Date(String Value) ปี พ.ศ. แปลงเป็น คศ.
    ''' </summary>
    ''' <param name="xDate">Object ที่ต้องการแปลง</param>
    ''' <returns>ค่า วันที่เดือนปีคศ ddmmyyyy</returns>
    ''' <remarks>ค่า Default ของ xDate คือ StringValue</remarks>
    Public Function ConvertYear(ByVal xDate As String) As String
        Dim yearKS As String
        If Left(Right(xDate, 4), 2) <> "20" Then 'ตรวจสอบ DatePromise ว่าใช่ คศ. หรือไม่
            yearKS = CStr(CDbl((Right(xDate, 4))) - 543)
            xDate = Mid(xDate, 1, (Len(xDate) - 4)) & yearKS
        End If
        Return xDate
    End Function
End Class
