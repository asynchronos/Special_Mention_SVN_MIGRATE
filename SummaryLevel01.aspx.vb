
Partial Class SummaryLevel01
    Inherits System.Web.UI.Page
    Public Enum xcol
        Deptflag = 1
        RegionSelect = 2
        FlagHub = 3
    End Enum
#Region "Level01 view lengingsub"
    Protected Sub gvLendingSub_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvLendingSub.SelectedIndexChanged
        txtgvLendingSub_Deptflag.Text = ""
        txtgvLendingSub_Deptflag.Text = gvLendingSub.Rows(gvLendingSub.SelectedIndex).Cells(xcol.Deptflag).Text
        txtgvLendingSub_FlagHub.Text = ""
        txtgvLendingSub_FlagHub.Text = gvLendingSub.Rows(gvLendingSub.SelectedIndex).Cells(xcol.FlagHub).Text
        lblRegionSelect.Text = ""
        lblRegionSelect.Text = gvLendingSub.Rows(gvLendingSub.SelectedIndex).Cells(xcol.RegionSelect).Text
    End Sub
    Protected Sub gvLendingSubBR_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvLendingSubBR.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            '========= Add Attrib In ImageButton For Open NewWindows
            Dim Imb As New ImageButton
            Imb = e.Row.FindControl("ImbControlling")
            Imb.Attributes.Add("onclick", "javascript:window.open('ByCustomer_SM.aspx?" & _
            "Week=" & e.Row.DataItem("Week") & _
            "&Id_StatusG=" & e.Row.DataItem("Id_StatusG") & _
            "&DEPTFLAG=" & e.Row.DataItem("DEPTFLAG") & _
            "&Id_DepTran=" & e.Row.DataItem("Id_DepTran") & _
            "&TDR=" & e.Row.DataItem("TDR") & _
            "&CUSTSIZE=" & Request.QueryString("CUSTSIZE") & _
            "','mywindow','location=0,status=1,scrollbars=1,menubar=0,resizable=1,width=790,height=590');")
            '========= Add Attrib In ImageButton For Open NewWindows
        End If
    End Sub
#End Region
#Region "Level02 view controlling unit"
    Protected Sub gvControllingUnit_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvControllingUnit.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            '========= Add Attrib In ImageButton For Open NewWindows
            Dim Imb As New ImageButton
            Imb = e.Row.FindControl("ImbControlling")
            Imb.Attributes.Add("onclick", "javascript:window.open('ByCustomer_SM.aspx?" & _
            "Week=" & e.Row.DataItem("Week") & _
            "&Id_StatusG=" & e.Row.DataItem("Id_StatusG") & _
            "&DEPTFLAG=" & e.Row.DataItem("DEPTFLAG") & _
            "&Id_DepTran=" & e.Row.DataItem("Id_DepTran") & _
            "&TDR=" & e.Row.DataItem("TDR") & _
            "&CUSTSIZE=" & Request.QueryString("CUSTSIZE") & _
            "','mywindow','location=0,status=1,scrollbars=1,menubar=0,resizable=1,width=790,height=590');")
            '========= Add Attrib In ImageButton For Open NewWindows
        End If
    End Sub
#End Region
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
    Sub ChkRole()
        If Session("ROLE") = 2 Then 'ผู้จัดการ ดูได้ทั้งหมด
            Div_SummaryControlling.Visible = False
        ElseIf Session("ROLE") = 5 Then 'หัวหน้ากลุ่ม SME และ หัวหน้าทีมSME
            Div_SummaryControlling.Visible = False
        ElseIf Session("ROLE") = 6 Then 'หัวหน้าทีมSME
            'เห็นหมด
        ElseIf Session("ROLE") = 7 Then 'AO
            'ไม่เข้าหน้านี้
        ElseIf Session("ROLE") = 11 Then 'หัวหน้ากลุ่ม
            Div_Summarylending.Visible = False
            Div_SummaryLengingControlling.Visible = False
        ElseIf Session("ROLE") = 24 Then 'ผู้จัดการฝ่าย
            Div_SummaryControlling.Visible = False
        ElseIf Session("ROLE") = 21 Or Session("ROLE") = 71 Then 'รหัสสาขา
            Div_Summarylending.Visible = False
            Div_SummaryLengingControlling.Visible = False
        ElseIf Session("ROLE") = 41 Or Session("ROLE") = 43 Then 'หัวหน้าประจำศูนย์ SME,พนักงานประจะศูนย์ SME
            Div_Summarylending.Visible = False
            Div_SummaryLengingControlling.Visible = False
        ElseIf Session("ROLE") = 72 Then 'ดูแลทั้งฝ่ายงาน และ สาขา(เพลินจิต(6500,001),พระราม3(1700,777)
            'เห็นหมด
        ElseIf Session("ROLE") = 23 Or Session("ROLE") = 26 Then 'รหัสภาค'
            Div_SummaryControlling.Visible = False
        ElseIf Session("ROLE") = 24 Then 'ผู้จัดการฝ่าย
            Div_SummaryControlling.Visible = False
        Else
            Response.Redirect("login.aspx")
        End If
    End Sub
#End Region
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ChkSession()
        If Not Me.IsPostBack Then
            ChkRole()
        End If
    End Sub
End Class
