Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration
'Imports System.Globalization

Partial Class ByCustomer_SM
    Inherits System.Web.UI.Page
    Public Enum xcol
        gvByCustomerCIF = 1
        gvByCustomerName = 2
        gvByAccountACCNO = 1
        gvByAccountDASOFtxt = 2
        gvByAccountAPP_ID = 3
    End Enum
#Region "Sub Procedure"
    Sub ChkSession()
        If Session("USER_ID") Is Nothing _
        Or Session("ROLE") Is Nothing _
        Or Session("REGION") Is Nothing _
        Or Session("BRANCH") Is Nothing _
        Or Session("HUB") Is Nothing _
        Or Session("DEPT") Is Nothing Then
            Response.Redirect("logout.aspx")
        End If
    End Sub
    Sub ClearData()
        lblCIF.Text = ""
        lblName.Text = ""
        lblAccount.Text = ""
        lblDASOFtxt.Text = ""
        lblAPP_ID.Text = ""
    End Sub
    Sub ClearAccount()
        lblAccount.Text = ""
        lblDASOFtxt.Text = ""
        lblAPP_ID.Text = ""
    End Sub
    Sub Switchview()
        If MultiView1.ActiveViewIndex = 0 Then
            MultiView1.ActiveViewIndex = 1
        Else
            MultiView1.ActiveViewIndex = 0
        End If
    End Sub
#Region "Filter"
    Protected Sub SetFilter()
        'ChkRole()
        Dim filterExpression As String = ""
        If Me.filterTextBox.Text <> "" Then ' ถ้า ไม่คีย์เงื่อนไข จะไม่ทำเลย
            If listFilter.SelectedValue = "CIF" Then
                If IsNumeric(Me.filterTextBox.Text) Then
                    filterExpression = listFilter.SelectedValue & "=" & Me.filterTextBox.Text & ""
                    Response.Write("<font size=3 color=red>Filter expression in effect is: " & filterExpression & "</font>")
                Else
                    Response.Write("<font size=3 color=red>CIF ที่ Filter ต้องเป็นตัวเลข</font>")
                    Exit Sub
                End If
            Else
                If listFilter.SelectedValue = "FlagHub" Then
                    filterExpression = listFilter.SelectedValue & "='" & Replace(Me.filterTextBox.Text, "'", "''") & "'"
                Else
                    filterExpression = listFilter.SelectedValue & " like '%" & Replace(Me.filterTextBox.Text, "'", "''") & "%'"
                End If

                Response.Write("<font size=3 color=red>Filter expression in effect is: " & filterExpression & "</font>")
            End If
        Else
            Exit Sub
        End If
        Me.SqlDataByCustomer.FilterExpression = filterExpression
    End Sub
    Protected Sub setFilterButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles setFilterButton.Click
        Me.SetFilter()
    End Sub
    Protected Sub clearFilterButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles clearFilterButton.Click
        Me.filterTextBox.Text = ""
        Me.listFilter.SelectedIndex = 0
        'ChkRole()
        Me.SetFilter()
        gvByCustomer.DataBind()
    End Sub
#End Region
#End Region
    Protected Sub form1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles form1.Load
        ChkSession()
    End Sub
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
    Protected Sub gvByCustomer_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvByCustomer.SelectedIndexChanged
        ClearData()
        MultiView1.ActiveViewIndex = 1
        lblCIF.Text = gvByCustomer.Rows(gvByCustomer.SelectedIndex).Cells(xcol.gvByCustomerCIF).Text
        lblName.Text = gvByCustomer.Rows(gvByCustomer.SelectedIndex).Cells(xcol.gvByCustomerName).Text
    End Sub
    Protected Sub SqlDataByCustomer_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataByCustomer.Selected
        lblCountByCus.Text = "(จำนวนลูกค้าทั้งหมด: " & e.AffectedRows & " ราย)"
    End Sub
    Protected Sub SqlDataByAccount_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataByAccount.Selected
        lblCountByAcc.Text = "(จำนวนบัญชี: " & e.AffectedRows & " บัญชี)"
    End Sub
    Protected Sub gvByAccount_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvByAccount.DataBound
        If gvByAccount.Rows.Count <> 0 Then
            lblByAccPage.Text = "(Page " & gvByAccount.PageIndex + 1 & " / " & gvByAccount.PageCount.ToString & ")"
        Else
            lblByAccPage.Text = ""
        End If
    End Sub
    Protected Sub gvByAccount_PageIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvByAccount.PageIndexChanged
        ClearAccount()
    End Sub
    Protected Sub gvByAccount_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvByAccount.RowDataBound
        If e.Row.RowType = DataControlRowType.Header Or e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Cells(0).Style("Position") = "relative"
            e.Row.Cells(1).Style("Position") = "relative"
            e.Row.Cells(2).Style("Position") = "relative"
            e.Row.Cells(3).Style("Position") = "relative"
        End If
    End Sub
    Protected Sub gvByAccount_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvByAccount.SelectedIndexChanged
        MultiView1.ActiveViewIndex = 1
        lblAccount.Text = ""
        lblAccount.Text = gvByAccount.Rows(gvByAccount.SelectedIndex).Cells(xcol.gvByAccountACCNO).Text
        lblDASOFtxt.Text = ""
        lblDASOFtxt.Text = gvByAccount.Rows(gvByAccount.SelectedIndex).Cells(xcol.gvByAccountDASOFtxt).Text
        lblAPP_ID.Text = ""
        lblAPP_ID.Text = gvByAccount.Rows(gvByAccount.SelectedIndex).Cells(xcol.gvByAccountAPP_ID).Text
    End Sub
    Protected Sub btAddStatus_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btAddStatus.Click
        Dim connectUpdate As String
        Dim clsx As New cls
        connectUpdate = WebConfigurationManager.ConnectionStrings("Special_MentionConnectionString").ConnectionString.ToString
        Dim cnt As SqlConnection = New SqlConnection(connectUpdate)
        Dim cmSQLInsert As New SqlCommand
        Dim strSQLUpdate As String
        cnt.Open()
        cmSQLInsert.Connection = cnt

        Try
            Dim CIF As String = lblCIF.Text.Trim
            Dim ACCNO As String = lblAccount.Text.Trim
            Dim APP_ID As String = lblAPP_ID.Text.Trim
            Dim DASOFtxt As String = lblDASOFtxt.Text.Trim
            Dim Id_Status As String = dlId_Status.SelectedValue
            Dim Id_AbilityToPay As String = dlId_Abilitytopay.SelectedValue
            Dim DatePromise As String = txtDatePromise.Text.Trim
            If Id_Status = "31" Or Id_Status = "43" Then 'Id_Status = สัญญาว่าจะจ่าย หรือ ขอปรับปรุงโครงสร้างหนี้ & สัญญาว่าจะจ่าย

                DatePromise = clsx.ConvertYear(DatePromise)
                DatePromise = "',CONVERT(DATETIME,'" + DatePromise + "',103),'"
            Else
                DatePromise = "',NULL,'"
            End If
            Dim Comment As String = clsx.StringUpdate(txtComment.Text.Trim)
            Dim EMP_DT As String = Session("USER_ID")


            strSQLUpdate = "INSERT INTO Account_Status" & _
            "(CIF, ACCNO, APP_ID, DASOFtxt, DASOF, Id_Status, DatePromise, COMMENT, Id_AbilityToPay,UP_DT, EMP_DT)" & _
            "VALUES(" + CIF + ",'" + ACCNO + "','" + APP_ID + "','" + DASOFtxt + "',getdate(),'" + Id_Status + DatePromise + Comment + "','" + Id_AbilityToPay + "',getdate(),'" + EMP_DT + "')"

            'MsgBox(strSQLUpdate)
            cmSQLInsert.CommandText = strSQLUpdate
            cmSQLInsert.ExecuteNonQuery()

            ' ResultUpdate.Text = "Suscess Update Data"
            Response.Write("<Script>alert('Finnished Insert Status Account: " + ACCNO + "')</Script>")
            MultiView1.ActiveViewIndex = 1
        Catch ex As Exception
            Response.Write("<Script>alert('Error: Can''t Not Insert')</Script>")
        Finally
            If cnt.State = ConnectionState.Open Then
                cnt.Close()
                SqlDataAccount_Status.DataBind()
                gvAccount_Status.DataBind()
                SqlDataByAccount.DataBind()
                gvByAccount.DataBind()
                'SqlDataByCustomer.DataBind()
                'gvByCustomer.DataBind()
            End If
        End Try
    End Sub
    Protected Sub btAddNewStatus_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btAddNewStatus.Click
        Switchview()
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            MultiView1.ActiveViewIndex = 1
        End If
    End Sub
    Protected Sub btCancle_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btCancle.Click
        Switchview()
    End Sub
    Protected Sub gvByCustomer_Sorted(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvByCustomer.Sorted
        SetFilter()
    End Sub
End Class
