Imports System.Web.Configuration
Imports System.Data
Imports System.Data.SqlClient
Partial Class Summary
    Inherits System.Web.UI.Page
#Region "Parameter"
#Region "Week01"
    'TDR'
    Protected CountNoOfCustW01TDR As Double = 0.0
    Protected sumPrincipalW01TDR As Double = 0.0
    Protected sumAccruW01TDR As Double = 0.0
    Protected sumSuspW01TDR As Double = 0.0
    Protected sumPayML3W01TDR As Double = 0.0
    Protected sumPayML2W01TDR As Double = 0.0
    Protected sumPayMW01TDR As Double = 0.0
    Protected sumSumPayDW01TDR As Double = 0.0
    'NonTDR'
    Protected CountNoOfCustW01NonTDR As Double = 0.0
    Protected sumPrincipalW01NonTDR As Double = 0.0
    Protected sumAccruW01NonTDR As Double = 0.0
    Protected sumSuspW01NonTDR As Double = 0.0
    Protected sumPayML3W01NonTDR As Double = 0.0
    Protected sumPayML2W01NonTDR As Double = 0.0
    Protected sumPayMW01NonTDR As Double = 0.0
    Protected sumSumPayDW01NonTDR As Double = 0.0
#End Region
#Region "Week02"
    'TDR'
    Protected CountNoOfCustW02TDR As Double = 0.0
    Protected sumPrincipalW02TDR As Double = 0.0
    Protected sumAccruW02TDR As Double = 0.0
    Protected sumSuspW02TDR As Double = 0.0
    Protected sumPayML3W02TDR As Double = 0.0
    Protected sumPayML2W02TDR As Double = 0.0
    Protected sumPayMW02TDR As Double = 0.0
    Protected sumSumPayDW02TDR As Double = 0.0
    'NonTDR'
    Protected CountNoOfCustW02NonTDR As Double = 0.0
    Protected sumPrincipalW02NonTDR As Double = 0.0
    Protected sumAccruW02NonTDR As Double = 0.0
    Protected sumSuspW02NonTDR As Double = 0.0
    Protected sumPayML3W02NonTDR As Double = 0.0
    Protected sumPayML2W02NonTDR As Double = 0.0
    Protected sumPayMW02NonTDR As Double = 0.0
    Protected sumSumPayDW02NonTDR As Double = 0.0
#End Region
#Region "Week03"
    'TDR'
    Protected CountNoOfCustW03TDR As Double = 0.0
    Protected sumPrincipalW03TDR As Double = 0.0
    Protected sumAccruW03TDR As Double = 0.0
    Protected sumSuspW03TDR As Double = 0.0
    Protected sumPayML3W03TDR As Double = 0.0
    Protected sumPayML2W03TDR As Double = 0.0
    Protected sumPayMW03TDR As Double = 0.0
    Protected sumSumPayDW03TDR As Double = 0.0
    'NonTDR'
    Protected CountNoOfCustW03NonTDR As Double = 0.0
    Protected sumPrincipalW03NonTDR As Double = 0.0
    Protected sumAccruW03NonTDR As Double = 0.0
    Protected sumSuspW03NonTDR As Double = 0.0
    Protected sumPayML3W03NonTDR As Double = 0.0
    Protected sumPayML2W03NonTDR As Double = 0.0
    Protected sumPayMW03NonTDR As Double = 0.0
    Protected sumSumPayDW03NonTDR As Double = 0.0
#End Region
#Region "Week04"
    'TDR'
    Protected CountNoOfCustW04TDR As Double = 0.0
    Protected sumPrincipalW04TDR As Double = 0.0
    Protected sumAccruW04TDR As Double = 0.0
    Protected sumSuspW04TDR As Double = 0.0
    Protected sumPayML3W04TDR As Double = 0.0
    Protected sumPayML2W04TDR As Double = 0.0
    Protected sumPayMW04TDR As Double = 0.0
    Protected sumSumPayDW04TDR As Double = 0.0
    'NonTDR'
    Protected CountNoOfCustW04NonTDR As Double = 0.0
    Protected sumPrincipalW04NonTDR As Double = 0.0
    Protected sumAccruW04NonTDR As Double = 0.0
    Protected sumSuspW04NonTDR As Double = 0.0
    Protected sumPayML3W04NonTDR As Double = 0.0
    Protected sumPayML2W04NonTDR As Double = 0.0
    Protected sumPayMW04NonTDR As Double = 0.0
    Protected sumSumPayDW04NonTDR As Double = 0.0
#End Region
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
#Region "Week01"
    Protected Sub gvSumWeek01_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvSumWeekTDR1.Init
        CountNoOfCustW01TDR = 0.0
        sumPrincipalW01TDR = 0.0
        sumAccruW01TDR = 0.0
        sumSuspW01TDR = 0.0
    End Sub
    Protected Sub gvSumWeekTDR1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvSumWeekTDR1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            CountNoOfCustW01TDR += CDbl(DirectCast(e.Row.FindControl("lblCountNoOfCust"), Label).Text)
            sumPrincipalW01TDR += CDbl(DirectCast(e.Row.FindControl("lblsumPrincipal"), Label).Text)
            sumAccruW01TDR += CDbl(DirectCast(e.Row.FindControl("lblsumAccru"), Label).Text)
            sumSuspW01TDR += CDbl(DirectCast(e.Row.FindControl("lblsumSusp"), Label).Text)
            If Session("ROLE") <> 7 Then
                If DirectCast(e.Row.FindControl("lblTDR"), Label).Text <> "-" Then
                    Dim imb As New ImageButton
                    imb = e.Row.FindControl("imgLinkWeek01")
                    imb.Attributes.Add("onclick", "javascript:window.open('SummaryLevel01.aspx?Week=01&Id_StatusG=" & e.Row.DataItem("Id_StatusG") & "&TDR=" & e.Row.DataItem("TDR") & "&CUSTSIZE=" & dlCustsize.SelectedValue & "');")
                    'imb.OnClientClick = "window.location.replace('SummaryLevel01.aspx?Week=01&Id_StatusG=" & e.Row.DataItem("Id_StatusG") & "&TDR=" & e.Row.DataItem("TDR") & "');return false;"
                End If
            Else 'ถ้าเป็น AO เปลี่ยน link ไปที่ ByCustomer_SM.aspx
                If DirectCast(e.Row.FindControl("lblTDR"), Label).Text <> "-" Then
                    Dim imb As New ImageButton
                    imb = e.Row.FindControl("imgLinkWeek01")
                    imb.Attributes.Add("onclick", "javascript:window.open('ByCustomer_SM.aspx?Week=01&Id_StatusG=" & e.Row.DataItem("Id_StatusG") & "&TDR=" & e.Row.DataItem("TDR") & "&CUSTSIZE=" & dlCustsize.SelectedValue & "');")
                    'imb.OnClientClick = "window.location.replace('SummaryLevel01.aspx?Week=01&Id_StatusG=" & e.Row.DataItem("Id_StatusG") & "&TDR=" & e.Row.DataItem("TDR") & "');return false;"
                End If
            End If
        End If
    End Sub
    Protected Sub gvSumWeekNonTDR1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvSumWeekNonTDR1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            CountNoOfCustW01NonTDR += CDbl(DirectCast(e.Row.FindControl("lblCountNoOfCust"), Label).Text)
            sumPrincipalW01NonTDR += CDbl(DirectCast(e.Row.FindControl("lblsumPrincipal"), Label).Text)
            sumAccruW01NonTDR += CDbl(DirectCast(e.Row.FindControl("lblsumAccru"), Label).Text)
            sumSuspW01NonTDR += CDbl(DirectCast(e.Row.FindControl("lblsumSusp"), Label).Text)
            If Session("ROLE") <> 7 Then
                If DirectCast(e.Row.FindControl("lblTDR"), Label).Text <> "-" Then
                    Dim imb As New ImageButton
                    imb = e.Row.FindControl("imgLinkWeek01")
                    imb.Attributes.Add("onclick", "javascript:window.open('SummaryLevel01.aspx?Week=01&Id_StatusG=" & e.Row.DataItem("Id_StatusG") & "&TDR=" & e.Row.DataItem("TDR") & "&CUSTSIZE=" & dlCustsize.SelectedValue & "');")
                End If
            Else 'ถ้าเป็น AO เปลี่ยน link ไปที่ ByCustomer_SM.aspx
                If DirectCast(e.Row.FindControl("lblTDR"), Label).Text <> "-" Then
                    Dim imb As New ImageButton
                    imb = e.Row.FindControl("imgLinkWeek01")
                    imb.Attributes.Add("onclick", "javascript:window.open('ByCustomer_SM.aspx?Week=01&Id_StatusG=" & e.Row.DataItem("Id_StatusG") & "&TDR=" & e.Row.DataItem("TDR") & "&CUSTSIZE=" & dlCustsize.SelectedValue & "');")
                    'imb.OnClientClick = "window.location.replace('SummaryLevel01.aspx?Week=01&Id_StatusG=" & e.Row.DataItem("Id_StatusG") & "&TDR=" & e.Row.DataItem("TDR") & "');return false;"
                End If
            End If
        End If
    End Sub
#End Region
#Region "Week02"
    Protected Sub gvSumWeek02_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvSumWeekTDR2.Init
        CountNoOfCustW02TDR = 0.0
        sumPrincipalW02TDR = 0.0
        sumAccruW02TDR = 0.0
        sumSuspW02TDR = 0.0
    End Sub
    Protected Sub gvSumWeekTDR2_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvSumWeekTDR2.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            CountNoOfCustW02TDR += CDbl(DirectCast(e.Row.FindControl("lblCountNoOfCust"), Label).Text)
            sumPrincipalW02TDR += CDbl(DirectCast(e.Row.FindControl("lblsumPrincipal"), Label).Text)
            sumAccruW02TDR += CDbl(DirectCast(e.Row.FindControl("lblsumAccru"), Label).Text)
            sumSuspW02TDR += CDbl(DirectCast(e.Row.FindControl("lblsumSusp"), Label).Text)
            If Session("ROLE") <> 7 Then
                If DirectCast(e.Row.FindControl("lblTDR"), Label).Text <> "-" Then
                    Dim imb As New ImageButton
                    imb = e.Row.FindControl("imgLinkWeek02")
                    imb.Attributes.Add("onclick", "javascript:window.open('SummaryLevel01.aspx?Week=02&Id_StatusG=" & e.Row.DataItem("Id_StatusG") & "&TDR=" & e.Row.DataItem("TDR") & "&CUSTSIZE=" & dlCustsize.SelectedValue & "');")
                    'imb.OnClientClick = "window.location.replace('SummaryLevel02.aspx?Week=02&Id_StatusG=" & e.Row.DataItem("Id_StatusG") & "&TDR=" & e.Row.DataItem("TDR") & "');return false;"
                End If
            Else 'ถ้าเป็น AO เปลี่ยน link ไปที่ ByCustomer_SM.aspx
                If DirectCast(e.Row.FindControl("lblTDR"), Label).Text <> "-" Then
                    Dim imb As New ImageButton
                    imb = e.Row.FindControl("imgLinkWeek02")
                    imb.Attributes.Add("onclick", "javascript:window.open('ByCustomer_SM.aspx?Week=02&Id_StatusG=" & e.Row.DataItem("Id_StatusG") & "&TDR=" & e.Row.DataItem("TDR") & "&CUSTSIZE=" & dlCustsize.SelectedValue & "');")
                    'imb.OnClientClick = "window.location.replace('SummaryLevel02.aspx?Week=02&Id_StatusG=" & e.Row.DataItem("Id_StatusG") & "&TDR=" & e.Row.DataItem("TDR") & "');return false;"
                End If
            End If
        End If
    End Sub
    Protected Sub gvSumWeekNonTDR2_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvSumWeekNonTDR2.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            CountNoOfCustW02NonTDR += CDbl(DirectCast(e.Row.FindControl("lblCountNoOfCust"), Label).Text)
            sumPrincipalW02NonTDR += CDbl(DirectCast(e.Row.FindControl("lblsumPrincipal"), Label).Text)
            sumAccruW02NonTDR += CDbl(DirectCast(e.Row.FindControl("lblsumAccru"), Label).Text)
            sumSuspW02NonTDR += CDbl(DirectCast(e.Row.FindControl("lblsumSusp"), Label).Text)
            If Session("ROLE") <> 7 Then
                If DirectCast(e.Row.FindControl("lblTDR"), Label).Text <> "-" Then
                    Dim imb As New ImageButton
                    imb = e.Row.FindControl("imgLinkWeek02")
                    imb.Attributes.Add("onclick", "javascript:window.open('SummaryLevel01.aspx?Week=02&Id_StatusG=" & e.Row.DataItem("Id_StatusG") & "&TDR=" & e.Row.DataItem("TDR") & "&CUSTSIZE=" & dlCustsize.SelectedValue & "');")
                End If
            Else 'ถ้าเป็น AO เปลี่ยน link ไปที่ ByCustomer_SM.aspx
                If DirectCast(e.Row.FindControl("lblTDR"), Label).Text <> "-" Then
                    Dim imb As New ImageButton
                    imb = e.Row.FindControl("imgLinkWeek02")
                    imb.Attributes.Add("onclick", "javascript:window.open('ByCustomer_SM.aspx?Week=02&Id_StatusG=" & e.Row.DataItem("Id_StatusG") & "&TDR=" & e.Row.DataItem("TDR") & "&CUSTSIZE=" & dlCustsize.SelectedValue & "');")
                    'imb.OnClientClick = "window.location.replace('SummaryLevel02.aspx?Week=02&Id_StatusG=" & e.Row.DataItem("Id_StatusG") & "&TDR=" & e.Row.DataItem("TDR") & "');return false;"
                End If
            End If
        End If
    End Sub
#End Region
#Region "Week03"
    Protected Sub gvSumWeek03_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvSumWeekTDR2.Init
        CountNoOfCustW03TDR = 0.0
        sumPrincipalW03TDR = 0.0
        sumAccruW03TDR = 0.0
        sumSuspW03TDR = 0.0
    End Sub
    Protected Sub gvSumWeekTDR3_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvSumWeekTDR3.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            CountNoOfCustW03TDR += CDbl(DirectCast(e.Row.FindControl("lblCountNoOfCust"), Label).Text)
            sumPrincipalW03TDR += CDbl(DirectCast(e.Row.FindControl("lblsumPrincipal"), Label).Text)
            sumAccruW03TDR += CDbl(DirectCast(e.Row.FindControl("lblsumAccru"), Label).Text)
            sumSuspW03TDR += CDbl(DirectCast(e.Row.FindControl("lblsumSusp"), Label).Text)
            If Session("ROLE") <> 7 Then
                If DirectCast(e.Row.FindControl("lblTDR"), Label).Text <> "-" Then
                    Dim imb As New ImageButton
                    imb = e.Row.FindControl("imgLinkWeek03")
                    imb.Attributes.Add("onclick", "javascript:window.open('SummaryLevel01.aspx?Week=03&Id_StatusG=" & e.Row.DataItem("Id_StatusG") & "&TDR=" & e.Row.DataItem("TDR") & "&CUSTSIZE=" & dlCustsize.SelectedValue & "');")
                    'imb.OnClientClick = "window.location.replace('SummaryLevel03.aspx?Week=03&Id_StatusG=" & e.Row.DataItem("Id_StatusG") & "&TDR=" & e.Row.DataItem("TDR") & "');return false;"
                End If
            Else 'ถ้าเป็น AO เปลี่ยน link ไปที่ ByCustomer_SM.aspx
                If DirectCast(e.Row.FindControl("lblTDR"), Label).Text <> "-" Then
                    Dim imb As New ImageButton
                    imb = e.Row.FindControl("imgLinkWeek03")
                    imb.Attributes.Add("onclick", "javascript:window.open('Bycustomer_SM.aspx?Week=03&Id_StatusG=" & e.Row.DataItem("Id_StatusG") & "&TDR=" & e.Row.DataItem("TDR") & "&CUSTSIZE=" & dlCustsize.SelectedValue & "');")
                    'imb.OnClientClick = "window.location.replace('SummaryLevel03.aspx?Week=03&Id_StatusG=" & e.Row.DataItem("Id_StatusG") & "&TDR=" & e.Row.DataItem("TDR") & "');return false;"
                End If
            End If
        End If
    End Sub
    Protected Sub gvSumWeekNonTDR3_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvSumWeekNonTDR3.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            CountNoOfCustW03NonTDR += CDbl(DirectCast(e.Row.FindControl("lblCountNoOfCust"), Label).Text)
            sumPrincipalW03NonTDR += CDbl(DirectCast(e.Row.FindControl("lblsumPrincipal"), Label).Text)
            sumAccruW03NonTDR += CDbl(DirectCast(e.Row.FindControl("lblsumAccru"), Label).Text)
            sumSuspW03NonTDR += CDbl(DirectCast(e.Row.FindControl("lblsumSusp"), Label).Text)
            If Session("ROLE") <> 7 Then
                If DirectCast(e.Row.FindControl("lblTDR"), Label).Text <> "-" Then
                    Dim imb As New ImageButton
                    imb = e.Row.FindControl("imgLinkWeek03")
                    imb.Attributes.Add("onclick", "javascript:window.open('SummaryLevel01.aspx?Week=03&Id_StatusG=" & e.Row.DataItem("Id_StatusG") & "&TDR=" & e.Row.DataItem("TDR") & "&CUSTSIZE=" & dlCustsize.SelectedValue & "');")
                End If
            Else 'ถ้าเป็น AO เปลี่ยน link ไปที่ ByCustomer_SM.aspx
                If DirectCast(e.Row.FindControl("lblTDR"), Label).Text <> "-" Then
                    Dim imb As New ImageButton
                    imb = e.Row.FindControl("imgLinkWeek03")
                    imb.Attributes.Add("onclick", "javascript:window.open('Bycustomer_SM.aspx?Week=03&Id_StatusG=" & e.Row.DataItem("Id_StatusG") & "&TDR=" & e.Row.DataItem("TDR") & "&CUSTSIZE=" & dlCustsize.SelectedValue & "');")
                    'imb.OnClientClick = "window.location.replace('SummaryLevel03.aspx?Week=03&Id_StatusG=" & e.Row.DataItem("Id_StatusG") & "&TDR=" & e.Row.DataItem("TDR") & "');return false;"
                End If
            End If
        End If
    End Sub
#End Region
#Region "Week04"
    Protected Sub gvSumWeek04_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvSumWeekTDR2.Init
        CountNoOfCustW04TDR = 0.0
        sumPrincipalW04TDR = 0.0
        sumAccruW04TDR = 0.0
        sumSuspW04TDR = 0.0
    End Sub
    Protected Sub gvSumWeekTDR4_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvSumWeekTDR4.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            CountNoOfCustW04TDR += CDbl(DirectCast(e.Row.FindControl("lblCountNoOfCust"), Label).Text)
            sumPrincipalW04TDR += CDbl(DirectCast(e.Row.FindControl("lblsumPrincipal"), Label).Text)
            sumAccruW04TDR += CDbl(DirectCast(e.Row.FindControl("lblsumAccru"), Label).Text)
            sumSuspW04TDR += CDbl(DirectCast(e.Row.FindControl("lblsumSusp"), Label).Text)
            If Session("ROLE") <> 7 Then
                If DirectCast(e.Row.FindControl("lblTDR"), Label).Text <> "-" Then
                    Dim imb As New ImageButton
                    imb = e.Row.FindControl("imgLinkWeek04")
                    imb.Attributes.Add("onclick", "javascript:window.open('SummaryLevel01.aspx?Week=04&Id_StatusG=" & e.Row.DataItem("Id_StatusG") & "&TDR=" & e.Row.DataItem("TDR") & "&CUSTSIZE=" & dlCustsize.SelectedValue & "');")
                    'imb.OnClientClick = "window.location.replace('SummaryLevel04.aspx?Week=04&Id_StatusG=" & e.Row.DataItem("Id_StatusG") & "&TDR=" & e.Row.DataItem("TDR") & "');return false;"
                End If
            Else 'ถ้าเป็น AO เปลี่ยน link ไปที่ ByCustomer_SM.aspx
                If DirectCast(e.Row.FindControl("lblTDR"), Label).Text <> "-" Then
                    Dim imb As New ImageButton
                    imb = e.Row.FindControl("imgLinkWeek04")
                    imb.Attributes.Add("onclick", "javascript:window.open('Bycustomer_SM.aspx?Week=04&Id_StatusG=" & e.Row.DataItem("Id_StatusG") & "&TDR=" & e.Row.DataItem("TDR") & "&CUSTSIZE=" & dlCustsize.SelectedValue & "');")
                    'imb.OnClientClick = "window.location.replace('SummaryLevel03.aspx?Week=03&Id_StatusG=" & e.Row.DataItem("Id_StatusG") & "&TDR=" & e.Row.DataItem("TDR") & "');return false;"
                End If
            End If
        End If
    End Sub
    Protected Sub gvSumWeekNonTDR4_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvSumWeekNonTDR4.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            CountNoOfCustW04NonTDR += CDbl(DirectCast(e.Row.FindControl("lblCountNoOfCust"), Label).Text)
            sumPrincipalW04NonTDR += CDbl(DirectCast(e.Row.FindControl("lblsumPrincipal"), Label).Text)
            sumAccruW04NonTDR += CDbl(DirectCast(e.Row.FindControl("lblsumAccru"), Label).Text)
            sumSuspW04NonTDR += CDbl(DirectCast(e.Row.FindControl("lblsumSusp"), Label).Text)
            If Session("ROLE") <> 7 Then
                If DirectCast(e.Row.FindControl("lblTDR"), Label).Text <> "-" Then
                    Dim imb As New ImageButton
                    imb = e.Row.FindControl("imgLinkWeek04")
                    imb.Attributes.Add("onclick", "javascript:window.open('SummaryLevel01.aspx?Week=04&Id_StatusG=" & e.Row.DataItem("Id_StatusG") & "&TDR=" & e.Row.DataItem("TDR") & "&CUSTSIZE=" & dlCustsize.SelectedValue & "');")
                End If
            Else 'ถ้าเป็น AO เปลี่ยน link ไปที่ ByCustomer_SM.aspx
                If DirectCast(e.Row.FindControl("lblTDR"), Label).Text <> "-" Then
                    Dim imb As New ImageButton
                    imb = e.Row.FindControl("imgLinkWeek03")
                    imb.Attributes.Add("onclick", "javascript:window.open('Bycustomer_SM.aspx?Week=04&Id_StatusG=" & e.Row.DataItem("Id_StatusG") & "&TDR=" & e.Row.DataItem("TDR") & "&CUSTSIZE=" & dlCustsize.SelectedValue & "');")
                    'imb.OnClientClick = "window.location.replace('SummaryLevel03.aspx?Week=03&Id_StatusG=" & e.Row.DataItem("Id_StatusG") & "&TDR=" & e.Row.DataItem("TDR") & "');return false;"
                End If
            End If
        End If
    End Sub
#End Region
#End Region
#Region "Show View"
    Protected Sub btShowW1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btShowW1.Click
        mvWeek.ActiveViewIndex = 0
    End Sub
    Protected Sub btShowW2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btShowW2.Click
        mvWeek.ActiveViewIndex = 1
    End Sub
    Protected Sub btShowW3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btShowW3.Click
        mvWeek.ActiveViewIndex = 2
    End Sub
    Protected Sub btShowW4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btShowW4.Click
        mvWeek.ActiveViewIndex = 3
    End Sub
#End Region
    Protected Sub imbRefreash_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbRefreash.Click
        '== Refresh Week 1
        SqlDataTDRWeek1.DataBind()
        SqlDataNonTDRWeek1.DataBind()
        gvSumWeekTDR1.DataBind()
        gvSumWeekNonTDR1.DataBind()
        '== Refresh Week 2
        SqlDataTDRWeek2.DataBind()
        SqlDataNonTDRWeek2.DataBind()
        gvSumWeekTDR2.DataBind()
        gvSumWeekNonTDR2.DataBind()
        '== Refresh Week 3
        SqlDataTDRWeek3.DataBind()
        SqlDataNonTDRWeek3.DataBind()
        gvSumWeekTDR3.DataBind()
        gvSumWeekNonTDR3.DataBind()
        '== Refresh Week 4
        SqlDataTDRWeek4.DataBind()
        SqlDataNonTDRWeek4.DataBind()
        gvSumWeekTDR4.DataBind()
        gvSumWeekNonTDR4.DataBind()
    End Sub
    Protected Sub ImbLogout_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImbLogout.Click
        Response.Redirect("logout.aspx")
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ChkSession()
        If Not Me.IsPostBack Then
            mvWeek.ActiveViewIndex = 0
            lblDasofW1.Text = Session("DasofW1")
            lblDasofW2.Text = Session("DasofW2")
            lblDasofW3.Text = Session("DasofW3")
            lblDasofW4.Text = Session("DasofW4")
        End If
    End Sub
End Class
