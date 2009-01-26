
Partial Class SummaryMovement
    Inherits System.Web.UI.Page
#Region "Parameter"
#Region "SummaryMovement"
    Protected sum1 As Double = 0.0
    Protected sum2 As Double = 0.0
    Protected sum3 As Double = 0.0
#End Region
#End Region
#Region "Sum Footter"
    Protected Sub gvSummaryMovement_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvSummaryMovement.Init
        sum1 = 0.0
        sum2 = 0.0
        sum3 = 0.0
    End Sub
    Protected Sub gvSummaryMovement_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvSummaryMovement.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            'MsgBox(DirectCast(e.Row.FindControl("lbl1"), HyperLink).Text)
            sum1 += CDbl(DirectCast(e.Row.FindControl("lbl1"), HyperLink).Text)
            sum2 += CDbl(DirectCast(e.Row.FindControl("lbl2"), HyperLink).Text)
            sum3 += CDbl(DirectCast(e.Row.FindControl("lbl3"), HyperLink).Text)

            'Pass => SM 30+
            Dim lbl1 As New HyperLink
            lbl1 = e.Row.FindControl("lbl1")
            lbl1.NavigateUrl = "javascript:void(0);"
            lbl1.Attributes.Add("onclick", "javascript:window.open('ByAccMovement.aspx?YearMonthEng=" & e.Row.DataItem("YearMonthEng") & _
                "&Result=" & gvSummaryMovement.Columns(2).HeaderText() & _
                "&BaySize=" & e.Row.DataItem("BaySize") & _
                "&Exp1=" & e.Row.DataItem("Exp1") & _
                "&Exp2=" & e.Row.DataItem("Exp2") & _
                "','mywindow2','location=0,status=1,scrollbars=1,menubar=0,resizable=1,width=790,height=590');return false;")

            '==============
            'SM 30+ => SM 60+
            Dim lbl2 As New HyperLink
            lbl2 = e.Row.FindControl("lbl2")
            lbl2.NavigateUrl = "javascript:void(0);"
            lbl2.Attributes.Add("onclick", "javascript:window.open('ByAccMovement.aspx?YearMonthEng=" & e.Row.DataItem("YearMonthEng") & _
            "&Result=" & gvSummaryMovement.Columns(3).HeaderText() & _
            "&BaySize=" & e.Row.DataItem("BaySize") & _
            "&Exp1=" & e.Row.DataItem("Exp3") & _
            "&Exp2=" & e.Row.DataItem("Exp4") & _
            "','mywindow2','location=0,status=1,scrollbars=1,menubar=0,resizable=1,width=790,height=590');return false;")
            '==============
            'SM 60+ => NPL
            Dim lbl3 As New HyperLink
            lbl3 = e.Row.FindControl("lbl3")
            lbl3.NavigateUrl = "javascript:void(0);"
            lbl3.Attributes.Add("onclick", "javascript:window.open('ByAccMovement.aspx?YearMonthEng=" & e.Row.DataItem("YearMonthEng") & _
                "&Result=" & gvSummaryMovement.Columns(3).HeaderText() & _
                "&BaySize=" & e.Row.DataItem("BaySize") & _
                "&Exp1=" & e.Row.DataItem("Exp5") & _
                "&Exp2=" & e.Row.DataItem("Exp6") & _
                "','mywindow2','location=0,status=1,scrollbars=1,menubar=0,resizable=1,width=790,height=590');return false;")
            '==============
            lblDasof.Text = "(Data as of(yyyy/mm): " & Left(e.Row.DataItem("YearMonthEng").ToString, 4) & _
            "/" & Right(e.Row.DataItem("YearMonthEng").ToString, 2) & ")"
        End If
    End Sub
#End Region

    Protected Sub lbl1_Prerender(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim lbl1 As HyperLink = DirectCast(sender, HyperLink)

        If lbl1.Text = "0" Then
            lbl1.NavigateUrl = ""
            lbl1.Attributes.Add("onclick", "return false;")
        End If
    End Sub
    Protected Sub lbl2_Prerender(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim lbl2 As HyperLink = DirectCast(sender, HyperLink)

        If lbl2.Text = "0" Then
            lbl2.NavigateUrl = ""
            lbl2.Attributes.Add("onclick", "return false;")
        End If
    End Sub
    Protected Sub lbl3_Prerender(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim lbl3 As HyperLink = DirectCast(sender, HyperLink)

        If lbl3.Text = "0" Then
            lbl3.NavigateUrl = ""
            lbl3.Attributes.Add("onclick", "return false;")
        End If
    End Sub
End Class
