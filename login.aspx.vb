Imports System.Web.Configuration
Imports System.Data
Imports System.Data.SqlClient

Partial Class login
    Inherits System.Web.UI.Page
    Sub PullDateAsOf()
        Dim strConnection As String = WebConfigurationManager.ConnectionStrings("Special_MentionConnectionString").ConnectionString.ToString
        Dim objConnection As New SqlConnection(strConnection)
        Try

            Dim strSQDasof As String = "SELECT SeqDataInput, YM, DASOFtxtW1, DASOFtxtW2, DASOFtxtW3, DASOFtxtW4 " & _
            "FROM DASOF " & _
            "WHERE SeqDataInput =(SELECT MAX(tmp.SeqDataInput) FROM DASOF tmp)"

            Dim objCommandDasof As New SqlCommand(strSQDasof, objConnection)

            Dim DBAdapter As SqlDataAdapter = New SqlDataAdapter(strSQDasof, strConnection)
            Dim DBDataSet As DataSet = New DataSet
            DBAdapter.Fill(DBDataSet, "TBDasof")

            Session("DasofW1") = DBDataSet.Tables("TBDasof").Rows(0).Item("DASOFtxtW1").ToString
            Session("DasofW2") = DBDataSet.Tables("TBDasof").Rows(0).Item("DASOFtxtW2").ToString
            Session("DasofW3") = DBDataSet.Tables("TBDasof").Rows(0).Item("DASOFtxtW3").ToString
            Session("DasofW4") = DBDataSet.Tables("TBDasof").Rows(0).Item("DASOFtxtW4").ToString

        Finally
            '    erMsg = erMsg & " ปิดท้ายด้วย Finally<BR/>"
        End Try
        '      lblInvalid.Text = erMsg
    End Sub
    Protected Sub imbLogin_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbLogin.Click
        Dim strConnection As String
        Dim UserCount As Integer

        strConnection = WebConfigurationManager.ConnectionStrings("Special_MentionConnectionString").ConnectionString.ToString
        Dim objConnection As New SqlConnection(strConnection)

        Dim Username As String
        Dim Password As String

        Username = txtUsername.Text
        Password = txtPassword.Text


        Dim strSQL As String = "SELECT COUNT(*) FROM [ADM_USERS] WHERE (([USERNAME] = '" & Username & "') AND ([PASSWD] ='" & Password & "'))"
        Dim objCommand As New SqlCommand(strSQL, objConnection)
        objConnection.Open()
        UserCount = objCommand.ExecuteScalar()
        objConnection.Close()

        If UserCount > 0 Then  'ถ้า login ถูก
            '        Dim erMsg As String
            Try

                Session("loginpass") = True   'Check  UserOK   
                Session("Username") = txtUsername.Text
                Session("Password") = txtPassword.Text

                '       Dim strSQLrole As String = "SELECT * FROM [EMPLOYEE] WHERE (([USERNAME] = '" & Username & "') AND ([PASSWD] ='" & Password & "'))"

                Dim strSQLrole As String = "SELECT * FROM ADM_USERS " & _
                "WHERE (([USERNAME] = '" & Username & "') AND ([PASSWD] ='" & Password & "'))"

                Dim objCommandrole As New SqlCommand(strSQL, objConnection)

                Dim DBAdapter As SqlDataAdapter = New SqlDataAdapter(strSQLrole, strConnection)
                Dim DBDataSet As DataSet = New DataSet
                DBAdapter.Fill(DBDataSet, "EMPDESC")

                Session("USER_ID") = DBDataSet.Tables("EMPDESC").Rows(0).Item("USER_ID").ToString
                Session("USERNAME") = DBDataSet.Tables("EMPDESC").Rows(0).Item("USERNAME").ToString
                Session("NAME") = DBDataSet.Tables("EMPDESC").Rows(0).Item("NAME").ToString & " " & DBDataSet.Tables("EMPDESC").Rows(0).Item("SURNAME").ToString
                Session("ROLE") = DBDataSet.Tables("EMPDESC").Rows(0).Item("ROLE").ToString
                Session("REGION") = DBDataSet.Tables("EMPDESC").Rows(0).Item("REGION").ToString
                Session("BRANCH") = DBDataSet.Tables("EMPDESC").Rows(0).Item("BRANCH").ToString
                Session("DEPT") = DBDataSet.Tables("EMPDESC").Rows(0).Item("DEPT").ToString
                Session("HUB") = DBDataSet.Tables("EMPDESC").Rows(0).Item("HUB").ToString

                If Session("ROLE") = 2 Then 'ผู้จัดการ ดูได้ทั้งหมด
                    Response.Redirect("Summary.aspx")
                ElseIf Session("ROLE") = 5 Then 'หัวหน้ากลุ่ม SME
                    Response.Redirect("Summary.aspx")
                ElseIf Session("ROLE") = 6 Then 'หัวหน้าทีมกลุ่ม SME
                    Response.Redirect("Summary.aspx")
                ElseIf Session("ROLE") = 7 Then 'AO
                    Response.Redirect("Summary.aspx")
                ElseIf Session("ROLE") = 11 Then 'หัวหน้ากลุ่ม corp ใช่อยู่ จับรหัสจาก id_deptran
                    Response.Redirect("Summary.aspx")
                ElseIf Session("ROLE") = 12 Then 'หัวหน้าทีม corp ใช่อยู่ จับรหัสจาก id_deptran
                    Response.Redirect("Summary.aspx")
                ElseIf Session("ROLE") = 21 Then 'ผู้จัดการสาขา
                    Response.Redirect("Summary.aspx")
                ElseIf Session("ROLE") = 41 Then 'หัวหน้าประจำศูนย์ SME SBC
                    Response.Redirect("Summary.aspx")
                ElseIf Session("ROLE") = 43 Then 'พนักงานประจะศูนย์ SME SBC
                    Response.Redirect("Summary.aspx")
                ElseIf Session("ROLE") = 23 Then 'ผู้จัดการภาค
                    Response.Redirect("Summary.aspx")
                ElseIf Session("ROLE") = 24 Then 'ผู้จัดการฝ่าย
                    Response.Redirect("Summary.aspx")
                ElseIf Session("ROLE") = 26 Then 'รองภาค
                    Response.Redirect("Summary.aspx")
                ElseIf Session("ROLE") = 71 Then 'ผู้จัดการสาขา ดูแลมากกว่า 1 สาขา
                    Response.Redirect("Summary.aspx")
                ElseIf Session("ROLE") = 72 Then 'ดูแลทั้งฝ่ายงาน และ สาขา(เพลินจิต(6500,001),พระราม3(1700,777)
                    Response.Redirect("Summary.aspx")
                Else
                    Response.Redirect("login.aspx")
                End If

            Finally
                '    erMsg = erMsg & " ปิดท้ายด้วย Finally<BR/>"
            End Try
            '      lblInvalid.Text = erMsg
        Else

            '         If CheckPassword(txtUsername.Text.Trim, txtPassword.Text.Trim()) Then
            'ถ้า Password เป็น interger 13 หลัก
            'Session("Username") = txtUsername.Text
            'Session("IDCARD") = txtPassword.Text
            'Response.Redirect("loginEntrance.aspx")
            ' End If
            lblInvalid.Text = "* รหัสพนักงาน,รหัสผ่าน ไม่ถูกต้อง !!!"
            Session("loginpass") = False 'Check UserNot OK
            '         If Session("Err") <> "" Then lblInvalid.Text = Session("Err")

        End If
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            PullDateAsOf()
        End If
    End Sub
End Class
