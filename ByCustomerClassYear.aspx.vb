
Partial Class ByCustomerClassYear
    Inherits System.Web.UI.Page
    Sub checknoneinline()
        'ตรวจสอบ filter
        If listFilter.SelectedValue = "DepTranT" Then
            divdlControllingUnit.Style("display") = "inline"
            divfiltertextBox.Style("display") = "none"
            divSBC.Style("display") = "none"
            divId_CustSize.Style("display") = "none"
            divLendingSubT.Style("display") = "none"
        ElseIf listFilter.SelectedValue = "Baysize" Then
            divdlControllingUnit.Style("display") = "none"
            divfiltertextBox.Style("display") = "none"
            divSBC.Style("display") = "none"
            divId_CustSize.Style("display") = "inline"
            divLendingSubT.Style("display") = "none"
        ElseIf listFilter.SelectedValue = "Hub_Name_T" Then
            divdlControllingUnit.Style("display") = "none"
            divfiltertextBox.Style("display") = "none"
            divSBC.Style("display") = "inline"
            divId_CustSize.Style("display") = "none"
            divLendingSubT.Style("display") = "none"
        ElseIf listFilter.SelectedValue = "LendingSubT" Then
            divdlControllingUnit.Style("display") = "none"
            divfiltertextBox.Style("display") = "none"
            divSBC.Style("display") = "none"
            divId_CustSize.Style("display") = "none"
            divLendingSubT.Style("display") = "inline"
        Else
            divdlControllingUnit.Style("display") = "none"
            divfiltertextBox.Style("display") = "inline"
            divSBC.Style("display") = "none"
            divId_CustSize.Style("display") = "none"
            divLendingSubT.Style("display") = "none"
        End If
    End Sub
#Region "Filter"
    Protected Sub SetFilter()
        'ChkRole()
        Dim filterExpression As String = ""
        If listFilter.SelectedValue = "DepTranT" Then
            filterExpression = listFilter.SelectedValue & "='" & Me.dlControllingUnit.SelectedValue & "'"
        ElseIf listFilter.SelectedValue = "CUSTSIZE" Then
            filterExpression = listFilter.SelectedValue & "='" & Me.dlId_CustSize.SelectedValue & "'"
        ElseIf listFilter.SelectedValue = "Hub_Name_T" Then
            filterExpression = listFilter.SelectedValue & "='" & Me.dlSBC.SelectedValue & "'"
        ElseIf listFilter.SelectedValue = "LendingSubT" Then
            filterExpression = listFilter.SelectedValue & "='" & Me.dlLendingSubT.SelectedValue & "'"
        Else
            If Me.filterTextBox.Text <> "" Then
                If listFilter.SelectedValue = "CIF" Then
                    If IsNumeric(Me.filterTextBox.Text) Then
                        filterExpression = listFilter.SelectedValue & "=" & Me.filterTextBox.Text & ""
                    Else
                        Response.Write("<font size=3 color=red>CIF ที่ Filter ต้องเป็นตัวเลข</font>")
                        Exit Sub
                    End If
                ElseIf listFilter.SelectedValue = "FlagHub" Then
                    filterExpression = listFilter.SelectedValue & "='" & Replace(Me.filterTextBox.Text, "'", "''") & "'"
                Else
                    filterExpression = listFilter.SelectedValue & " like '%" & Replace(Me.filterTextBox.Text, "'", "''") & "%'"
                End If
            Else 'กรณีไม่คีย์ที่ค้นหา
                Exit Sub
            End If
        End If
        Response.Write("<font size=3 color=red>Filter expression in effect is: " & filterExpression & "</font>")
        Me.DsSP_BycustomerClass.FilterExpression = filterExpression
    End Sub
    Protected Sub setFilterButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles setFilterButton.Click
        Me.SetFilter()
    End Sub
    Protected Sub clearFilterButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles clearFilterButton.Click
        Me.filterTextBox.Text = ""
        Me.listFilter.SelectedIndex = 0
        checknoneinline()
        'ChkRole()
        Me.SetFilter()
        gvByCustomer.DataBind()
    End Sub
#End Region
    Protected Sub gvByCustomer_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvByCustomer.DataBound
        If gvByCustomer.Rows.Count <> 0 Then
            lblByCusPage.Text = "(Page " & gvByCustomer.PageIndex + 1 & " / " & gvByCustomer.PageCount.ToString & ")"
        Else
            lblByCusPage.Text = ""
        End If
    End Sub
    Protected Sub gvByCustomer_PageIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvByCustomer.PageIndexChanged
        SetFilter()
    End Sub
    Protected Sub gvByCustomer_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvByCustomer.RowDataBound
        If e.Row.RowType = DataControlRowType.Header Or e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Cells(0).Style("Position") = "relative"
            e.Row.Cells(1).Style("Position") = "relative"
            e.Row.Cells(2).Style("Position") = "relative"
        End If
    End Sub
    Protected Sub gvByCustomer_Sorted(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvByCustomer.Sorted
        SetFilter()
    End Sub
    Protected Sub DsSP_BycustomerClass_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles DsSP_BycustomerClass.Selected
        lblCountByCus.Text = "(จำนวนลูกค้าทั้งหมด: " & e.AffectedRows & " ราย)"
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        checknoneinline()
    End Sub


End Class
