Imports System.Web.Configuration
Imports System.Data
Imports System.Data.SqlClient

Partial Class changePW
    Inherits System.Web.UI.Page

    Sub ChkSession()
        If Session("USERNAME") Is Nothing _
        Or Session("NAME") Is Nothing _
        Or Session("ROLE") Is Nothing _
        Or Session("REGION") Is Nothing _
        Or Session("BRANCH") Is Nothing _
        Or Session("DEPT") Is Nothing Then
            Response.Redirect("logout.aspx")
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ChkSession()
    End Sub

    Protected Sub imbSubmit_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSubmit.Click
        Dim connect As String

        connect = WebConfigurationManager.ConnectionStrings("Special_MentionConnectionString").ConnectionString.ToString
        Dim cnt As SqlConnection = New SqlConnection(connect)
        Dim cmSQL As New SqlCommand
        Dim strSQL As String
        cnt.Open()
        cmSQL.Connection = cnt
        Dim PWD1 As String = txtPW.Text.Trim.ToString
        Dim PWD2 As String = txtConfirmPW.Text.Trim.ToString

        If PWD1 = "" Then
            lblResult.Text = "Don't use blank password"
            Exit Sub
        End If

        If PWD1 <> PWD2 Then
            lblResult.Text = "Password และ Confirm Password ไม่ตรงกัน"
            Exit Sub
        End If
        Try

            strSQL = "UPDATE  ADM_USERS SET " & _
            "PASSWD ='" & PWD1 & "'" & _
                "WHERE  (USERNAME ='" & Session("USERNAME") & "')"

            cmSQL.CommandText = strSQL
            cmSQL.ExecuteNonQuery()

            Response.Write("<Script>alert('Suscess Change Password(เปลี่ยนรหัสผ่านเรียบร้อยแล้ว)');</Script>")

            ' Response.Redirect("login.aspx")

        Catch ex As Exception
            lblResult.Text = ex.Message.ToString
        Finally
            If cnt.State = ConnectionState.Open Then
                cnt.Close()
            End If
        End Try
    End Sub

    Protected Sub ibBack_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles ibBack.Load
        If Session("Role") = 7 Then
            'ibBack.OnClientClick = "window.location.replace('" + Page.ResolveUrl("~/Sm_Cus.aspx") + "');return false;"
        Else
            ibBack.OnClientClick = "window.location.replace('" + Page.ResolveUrl("~/Summary.aspx") + "');return false;"
        End If
    End Sub
End Class
