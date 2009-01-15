Option Explicit On
Option Strict On

Partial Class Controls_ExportControl_ExportControl
    Inherits System.Web.UI.UserControl

    Private Const excelContentType As String = "application/vnd.xls; charset=utf-8"
    Private Const wordContentType As String = "application/vnd.word; charset=utf-8"

    Private _filename As String = String.Empty
    Private _controlName As String = String.Empty

#Region "Properties"

    Property filename() As String
        Get
            Return _filename
        End Get
        Set(ByVal value As String)
            _filename = value
        End Set
    End Property

    Property controlName() As String
        Get
            Return _controlName
        End Get
        Set(ByVal value As String)
            _controlName = value
        End Set
    End Property

#End Region

#Region "My Method"

    Protected Sub PrepareControlForExport(ByVal cont As Control)
        Dim l As New Literal
        Dim name As String = String.Empty

        For i As Integer = 0 To cont.Controls.Count - 1

            Dim iButt As IButtonControl = Nothing
            Dim listCon As ListControl = Nothing
            Dim iCheckBox As ICheckBoxControl = Nothing

            'Try
            iButt = TryCast(cont.Controls(i), IButtonControl)
            'Catch ex As InvalidCastException
            'Try
            listCon = TryCast(cont.Controls(i), ListControl)
            'Catch ex2 As InvalidCastException
            'Try
            iCheckBox = TryCast(cont.Controls(i), ICheckBoxControl)
            'Catch ex3 As InvalidCastException
            ' can't cast to anything in list
            ' use oiginal type of that control
            'End Try
            'End Try
            'End Try

            If Not IsNothing(iButt) Then
                l.Text = iButt.Text
                cont.Controls.Remove(cont.Controls(i))
                cont.Controls.AddAt(i, l)

                Dim linkButt As LinkButton = Nothing

                If l.Text.Equals("Select") Then
                    cont.Controls(i).Visible = False
                End If

            ElseIf Not IsNothing(listCon) Then
                l.Text = listCon.SelectedItem.Text
                cont.Controls.Remove(cont.Controls(i))
                cont.Controls.AddAt(i, l)
            ElseIf Not IsNothing(iCheckBox) Then
                l.Text = If(iCheckBox.Checked, "True", "False")
                cont.Controls.Remove(cont.Controls(i))
                cont.Controls.AddAt(i, l)
            End If

            'If cont.Controls(i).GetType Is GetType(IButtonControl) Then
            '    l.Text = TryCast(cont.Controls(i), IButtonControl).Text
            '    cont.Controls.Remove(cont.Controls(i))
            '    cont.Controls.AddAt(i, l)
            '    cont.Controls(i).Visible = False
            'ElseIf cont.Controls(i).[GetType]() Is GetType(DropDownList) Then
            '    l.Text = TryCast(cont.Controls(i), DropDownList).SelectedItem.Text
            '    cont.Controls.Remove(cont.Controls(i))
            '    cont.Controls.AddAt(i, l)
            'ElseIf cont.Controls(i).[GetType]() Is GetType(CheckBox) Then
            '    l.Text = If(TryCast(cont.Controls(i), CheckBox).Checked, "True", "False")
            '    cont.Controls.Remove(cont.Controls(i))
            '    cont.Controls.AddAt(i, l)
            'End If

            If cont.Controls(i).HasControls() Then
                PrepareControlForExport(cont.Controls(i))
            End If
        Next
    End Sub

    Protected Sub ExportData(ByVal _contentType As String, ByVal filename As String)
        Response.ClearContent()
        Response.AddHeader("content-disposition", "attachment;filename=" + filename)
        Response.Cache.SetCacheability(HttpCacheability.NoCache)
        Response.ContentType = _contentType
        Response.ContentEncoding = System.Text.Encoding.UTF8

        Dim sw As New IO.StringWriter()
        Dim htw As New HtmlTextWriter(sw)
        Dim frm As New HtmlForm()

        Dim cont As GridView = DirectCast(Me.Parent.FindControl(controlName), GridView)

        'เก็บค่า allowPaging ของ control ไว้
        Dim pagingTemp As Boolean = cont.AllowPaging
        'เปลี่ยน paging เป็น false
        cont.AllowPaging = False
        'bind ใหม่
        cont.DataBind()

        PrepareControlForExport(cont)

        frm.Attributes("runat") = "server"
        frm.Controls.Add(cont)

        cont.RenderControl(htw)
        Response.Write(sw.ToString())
        Response.End()

        'เปลี่ยนค่า paging กลับเหมือนเดิม
        cont.AllowPaging = pagingTemp

    End Sub

#End Region


    Protected Sub ExportButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ExportButton.Click
        Select Case RadioButtonList1.SelectedIndex
            Case 0
                'Exporting datagrid to Excel
                ExportData(excelContentType, filename + ".xls")
            Case 1
                'Exporting datagrid to Word
                ExportData(wordContentType, filename + ".doc")
            Case Else
                'Exporting datagrid to Excel
                ExportData(excelContentType, filename + ".xls")
        End Select
    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If filename.Equals(String.Empty) Then
            filename = "FileName"
        End If
    End Sub
End Class
