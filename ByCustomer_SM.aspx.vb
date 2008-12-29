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
    Sub Switchview()
        If MultiView1.ActiveViewIndex = 0 Then
            MultiView1.ActiveViewIndex = 1
        Else
            MultiView1.ActiveViewIndex = 0
        End If
    End Sub
#End Region
    Protected Sub form1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles form1.Load
        ChkSession()
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
End Class
