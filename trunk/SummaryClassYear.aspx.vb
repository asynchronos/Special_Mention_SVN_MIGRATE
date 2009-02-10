
Partial Class SummaryClassYear
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
#Region "M0"
#Region "ParameterM0"
    Protected prinM0 As Double = 0.0
    Protected SumNoOfCustM0 As Double = 0.0
    Protected SumprinM0 As Double = 0.0
    Protected SumaccruM0 As Double = 0.0
    Protected SumSuspM0 As Double = 0.0
#End Region
    Protected Sub gvSummaryClassM0_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvSummaryClassM0.Init
        prinM0 = 0.0
        SumNoOfCustM0 = 0.0
        SumprinM0 = 0.0
        SumaccruM0 = 0.0
        SumSuspM0 = 0.0
    End Sub
    Protected Sub gvSummaryClassM0_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvSummaryClassM0.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            SumNoOfCustM0 += CDbl(DirectCast(e.Row.FindControl("lblNoOfCustM0"), Label).Text)
            SumprinM0 += CDbl(DirectCast(e.Row.FindControl("lblprinM0"), Label).Text)
            SumaccruM0 += CDbl(DirectCast(e.Row.FindControl("lblaccruM0"), Label).Text)
            SumSuspM0 += CDbl(DirectCast(e.Row.FindControl("lblSuspM0"), Label).Text)

            Dim imb As New ImageButton
            imb = e.Row.FindControl("imbM0")
            imb.Attributes.Add("onclick", "javascript:window.open('ByCustomerClassYear.aspx?custsize=" & e.Row.DataItem("custsize") & "&ym=" & e.Row.DataItem("ym") & "&class=" & e.Row.DataItem("class") & "','bycusclass','location=0,status=1,scrollbars=1,menubar=0,resizable=1,width=790,height=590');return false;")

        End If
    End Sub
#End Region
#Region "M1"
#Region "ParameterM1"
    Protected prinM1 As Double = 0.0
    Protected SumNoOfCustM1 As Double = 0.0
    Protected SumprinM1 As Double = 0.0
    Protected SumaccruM1 As Double = 0.0
    Protected SumSuspM1 As Double = 0.0
#End Region
    Protected Sub gvSummaryClassM1_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvSummaryClassM1.Init
        prinM1 = 0.0
        SumNoOfCustM1 = 0.0
        SumprinM1 = 0.0
        SumaccruM1 = 0.0
        SumSuspM1 = 0.0
    End Sub
    Protected Sub gvSummaryClassM1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvSummaryClassM1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            SumNoOfCustM1 += CDbl(DirectCast(e.Row.FindControl("lblNoOfCustM1"), Label).Text)
            SumprinM1 += CDbl(DirectCast(e.Row.FindControl("lblprinM1"), Label).Text)
            SumaccruM1 += CDbl(DirectCast(e.Row.FindControl("lblaccruM1"), Label).Text)
            SumSuspM1 += CDbl(DirectCast(e.Row.FindControl("lblSuspM1"), Label).Text)

            Dim imb As New ImageButton
            imb = e.Row.FindControl("imbM1")
            imb.Attributes.Add("onclick", "javascript:window.open('ByCustomerClassYear.aspx?custsize=" & e.Row.DataItem("custsize") & "&ym=" & e.Row.DataItem("ym") & "&class=" & e.Row.DataItem("class") & "','bycusclass','location=0,status=1,scrollbars=1,menubar=0,resizable=1,width=790,height=590');return false;")

        End If
    End Sub
#End Region
#Region "M2"
#Region "ParameterM2"
    Protected prinM2 As Double = 0.0
    Protected SumNoOfCustM2 As Double = 0.0
    Protected SumprinM2 As Double = 0.0
    Protected SumaccruM2 As Double = 0.0
    Protected SumSuspM2 As Double = 0.0
#End Region
    Protected Sub gvSummaryClassM2_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvSummaryClassM2.Init
        prinM2 = 0.0
        SumNoOfCustM2 = 0.0
        SumprinM2 = 0.0
        SumaccruM2 = 0.0
        SumSuspM2 = 0.0
    End Sub
    Protected Sub gvSummaryClassM2_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvSummaryClassM2.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            SumNoOfCustM2 += CDbl(DirectCast(e.Row.FindControl("lblNoOfCustM2"), Label).Text)
            SumprinM2 += CDbl(DirectCast(e.Row.FindControl("lblprinM2"), Label).Text)
            SumaccruM2 += CDbl(DirectCast(e.Row.FindControl("lblaccruM2"), Label).Text)
            SumSuspM2 += CDbl(DirectCast(e.Row.FindControl("lblSuspM2"), Label).Text)

            Dim imb As New ImageButton
            imb = e.Row.FindControl("imbM2")
            imb.Attributes.Add("onclick", "javascript:window.open('ByCustomerClassYear.aspx?custsize=" & e.Row.DataItem("custsize") & "&ym=" & e.Row.DataItem("ym") & "&class=" & e.Row.DataItem("class") & "','bycusclass','location=0,status=1,scrollbars=1,menubar=0,resizable=1,width=790,height=590');return false;")

        End If
    End Sub
#End Region
#Region "M3"
#Region "ParameterM3"
    Protected prinM3 As Double = 0.0
    Protected SumNoOfCustM3 As Double = 0.0
    Protected SumprinM3 As Double = 0.0
    Protected SumaccruM3 As Double = 0.0
    Protected SumSuspM3 As Double = 0.0
#End Region
    Protected Sub gvSummaryClassM3_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvSummaryClassM3.Init
        prinM3 = 0.0
        SumNoOfCustM3 = 0.0
        SumprinM3 = 0.0
        SumaccruM3 = 0.0
        SumSuspM3 = 0.0
    End Sub
    Protected Sub gvSummaryClassM3_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvSummaryClassM3.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            SumNoOfCustM3 += CDbl(DirectCast(e.Row.FindControl("lblNoOfCustM3"), Label).Text)
            SumprinM3 += CDbl(DirectCast(e.Row.FindControl("lblprinM3"), Label).Text)
            SumaccruM3 += CDbl(DirectCast(e.Row.FindControl("lblaccruM3"), Label).Text)
            SumSuspM3 += CDbl(DirectCast(e.Row.FindControl("lblSuspM3"), Label).Text)

            Dim imb As New ImageButton
            imb = e.Row.FindControl("imbM3")
            imb.Attributes.Add("onclick", "javascript:window.open('ByCustomerClassYear.aspx?custsize=" & e.Row.DataItem("custsize") & "&ym=" & e.Row.DataItem("ym") & "&class=" & e.Row.DataItem("class") & "','bycusclass','location=0,status=1,scrollbars=1,menubar=0,resizable=1,width=790,height=590');return false;")

        End If
    End Sub
#End Region
#Region "M4"
#Region "ParameterM4"
    Protected prinM4 As Double = 0.0
    Protected SumNoOfCustM4 As Double = 0.0
    Protected SumprinM4 As Double = 0.0
    Protected SumaccruM4 As Double = 0.0
    Protected SumSuspM4 As Double = 0.0
#End Region
    Protected Sub gvSummaryClassM4_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvSummaryClassM4.Init
        prinM4 = 0.0
        SumNoOfCustM4 = 0.0
        SumprinM4 = 0.0
        SumaccruM4 = 0.0
        SumSuspM4 = 0.0
    End Sub
    Protected Sub gvSummaryClassM4_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvSummaryClassM4.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            SumNoOfCustM4 += CDbl(DirectCast(e.Row.FindControl("lblNoOfCustM4"), Label).Text)
            SumprinM4 += CDbl(DirectCast(e.Row.FindControl("lblprinM4"), Label).Text)
            SumaccruM4 += CDbl(DirectCast(e.Row.FindControl("lblaccruM4"), Label).Text)
            SumSuspM4 += CDbl(DirectCast(e.Row.FindControl("lblSuspM4"), Label).Text)

            Dim imb As New ImageButton
            imb = e.Row.FindControl("imbM4")
            imb.Attributes.Add("onclick", "javascript:window.open('ByCustomerClassYear.aspx?custsize=" & e.Row.DataItem("custsize") & "&ym=" & e.Row.DataItem("ym") & "&class=" & e.Row.DataItem("class") & "','bycusclass','location=0,status=1,scrollbars=1,menubar=0,resizable=1,width=790,height=590');return false;")

        End If
    End Sub
#End Region
#Region "M5"
#Region "ParameterM5"
    Protected prinM5 As Double = 0.0
    Protected SumNoOfCustM5 As Double = 0.0
    Protected SumprinM5 As Double = 0.0
    Protected SumaccruM5 As Double = 0.0
    Protected SumSuspM5 As Double = 0.0
#End Region
    Protected Sub gvSummaryClassM5_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvSummaryClassM5.Init
        prinM5 = 0.0
        SumNoOfCustM5 = 0.0
        SumprinM5 = 0.0
        SumaccruM5 = 0.0
        SumSuspM5 = 0.0
    End Sub
    Protected Sub gvSummaryClassM5_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvSummaryClassM5.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            SumNoOfCustM5 += CDbl(DirectCast(e.Row.FindControl("lblNoOfCustM5"), Label).Text)
            SumprinM5 += CDbl(DirectCast(e.Row.FindControl("lblprinM5"), Label).Text)
            SumaccruM5 += CDbl(DirectCast(e.Row.FindControl("lblaccruM5"), Label).Text)
            SumSuspM5 += CDbl(DirectCast(e.Row.FindControl("lblSuspM5"), Label).Text)

            Dim imb As New ImageButton
            imb = e.Row.FindControl("imbM5")
            imb.Attributes.Add("onclick", "javascript:window.open('ByCustomerClassYear.aspx?custsize=" & e.Row.DataItem("custsize") & "&ym=" & e.Row.DataItem("ym") & "&class=" & e.Row.DataItem("class") & "','bycusclass','location=0,status=1,scrollbars=1,menubar=0,resizable=1,width=790,height=590');return false;")

        End If
    End Sub
#End Region
#Region "M6"
#Region "ParameterM6"
    Protected prinM6 As Double = 0.0
    Protected SumNoOfCustM6 As Double = 0.0
    Protected SumprinM6 As Double = 0.0
    Protected SumaccruM6 As Double = 0.0
    Protected SumSuspM6 As Double = 0.0
#End Region
    Protected Sub gvSummaryClassM6_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvSummaryClassM6.Init
        prinM6 = 0.0
        SumNoOfCustM6 = 0.0
        SumprinM6 = 0.0
        SumaccruM6 = 0.0
        SumSuspM6 = 0.0
    End Sub
    Protected Sub gvSummaryClassM6_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvSummaryClassM6.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            SumNoOfCustM6 += CDbl(DirectCast(e.Row.FindControl("lblNoOfCustM6"), Label).Text)
            SumprinM6 += CDbl(DirectCast(e.Row.FindControl("lblprinM6"), Label).Text)
            SumaccruM6 += CDbl(DirectCast(e.Row.FindControl("lblaccruM6"), Label).Text)
            SumSuspM6 += CDbl(DirectCast(e.Row.FindControl("lblSuspM6"), Label).Text)

            Dim imb As New ImageButton
            imb = e.Row.FindControl("imbM6")
            imb.Attributes.Add("onclick", "javascript:window.open('ByCustomerClassYear.aspx?custsize=" & e.Row.DataItem("custsize") & "&ym=" & e.Row.DataItem("ym") & "&class=" & e.Row.DataItem("class") & "','bycusclass','location=0,status=1,scrollbars=1,menubar=0,resizable=1,width=790,height=590');return false;")

        End If
    End Sub
#End Region
#Region "M7"
#Region "ParameterM7"
    Protected prinM7 As Double = 0.0
    Protected SumNoOfCustM7 As Double = 0.0
    Protected SumprinM7 As Double = 0.0
    Protected SumaccruM7 As Double = 0.0
    Protected SumSuspM7 As Double = 0.0
#End Region
    Protected Sub gvSummaryClassM7_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvSummaryClassM7.Init
        prinM7 = 0.0
        SumNoOfCustM7 = 0.0
        SumprinM7 = 0.0
        SumaccruM7 = 0.0
        SumSuspM7 = 0.0
    End Sub
    Protected Sub gvSummaryClassM7_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvSummaryClassM7.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            SumNoOfCustM7 += CDbl(DirectCast(e.Row.FindControl("lblNoOfCustM7"), Label).Text)
            SumprinM7 += CDbl(DirectCast(e.Row.FindControl("lblprinM7"), Label).Text)
            SumaccruM7 += CDbl(DirectCast(e.Row.FindControl("lblaccruM7"), Label).Text)
            SumSuspM7 += CDbl(DirectCast(e.Row.FindControl("lblSuspM7"), Label).Text)

            Dim imb As New ImageButton
            imb = e.Row.FindControl("imbM7")
            imb.Attributes.Add("onclick", "javascript:window.open('ByCustomerClassYear.aspx?custsize=" & e.Row.DataItem("custsize") & "&ym=" & e.Row.DataItem("ym") & "&class=" & e.Row.DataItem("class") & "','bycusclass','location=0,status=1,scrollbars=1,menubar=0,resizable=1,width=790,height=590');return false;")

        End If
    End Sub
#End Region
#Region "M8"
#Region "ParameterM8"
    Protected prinM8 As Double = 0.0
    Protected SumNoOfCustM8 As Double = 0.0
    Protected SumprinM8 As Double = 0.0
    Protected SumaccruM8 As Double = 0.0
    Protected SumSuspM8 As Double = 0.0
#End Region
    Protected Sub gvSummaryClassM8_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvSummaryClassM8.Init
        prinM8 = 0.0
        SumNoOfCustM8 = 0.0
        SumprinM8 = 0.0
        SumaccruM8 = 0.0
        SumSuspM8 = 0.0
    End Sub
    Protected Sub gvSummaryClassM8_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvSummaryClassM8.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            SumNoOfCustM8 += CDbl(DirectCast(e.Row.FindControl("lblNoOfCustM8"), Label).Text)
            SumprinM8 += CDbl(DirectCast(e.Row.FindControl("lblprinM8"), Label).Text)
            SumaccruM8 += CDbl(DirectCast(e.Row.FindControl("lblaccruM8"), Label).Text)
            SumSuspM8 += CDbl(DirectCast(e.Row.FindControl("lblSuspM8"), Label).Text)

            Dim imb As New ImageButton
            imb = e.Row.FindControl("imbM8")
            imb.Attributes.Add("onclick", "javascript:window.open('ByCustomerClassYear.aspx?custsize=" & e.Row.DataItem("custsize") & "&ym=" & e.Row.DataItem("ym") & "&class=" & e.Row.DataItem("class") & "','bycusclass','location=0,status=1,scrollbars=1,menubar=0,resizable=1,width=790,height=590');return false;")

        End If
    End Sub
#End Region
#Region "M9"
#Region "ParameterM9"
    Protected prinM9 As Double = 0.0
    Protected SumNoOfCustM9 As Double = 0.0
    Protected SumprinM9 As Double = 0.0
    Protected SumaccruM9 As Double = 0.0
    Protected SumSuspM9 As Double = 0.0
#End Region
    Protected Sub gvSummaryClassM9_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvSummaryClassM9.Init
        prinM9 = 0.0
        SumNoOfCustM9 = 0.0
        SumprinM9 = 0.0
        SumaccruM9 = 0.0
        SumSuspM9 = 0.0
    End Sub
    Protected Sub gvSummaryClassM9_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvSummaryClassM9.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            SumNoOfCustM9 += CDbl(DirectCast(e.Row.FindControl("lblNoOfCustM9"), Label).Text)
            SumprinM9 += CDbl(DirectCast(e.Row.FindControl("lblprinM9"), Label).Text)
            SumaccruM9 += CDbl(DirectCast(e.Row.FindControl("lblaccruM9"), Label).Text)
            SumSuspM9 += CDbl(DirectCast(e.Row.FindControl("lblSuspM9"), Label).Text)

            Dim imb As New ImageButton
            imb = e.Row.FindControl("imbM9")
            imb.Attributes.Add("onclick", "javascript:window.open('ByCustomerClassYear.aspx?custsize=" & e.Row.DataItem("custsize") & "&ym=" & e.Row.DataItem("ym") & "&class=" & e.Row.DataItem("class") & "','bycusclass','location=0,status=1,scrollbars=1,menubar=0,resizable=1,width=790,height=590');return false;")

        End If
    End Sub
#End Region
#Region "M10"
#Region "ParameterM10"
    Protected prinM10 As Double = 0.0
    Protected SumNoOfCustM10 As Double = 0.0
    Protected SumprinM10 As Double = 0.0
    Protected SumaccruM10 As Double = 0.0
    Protected SumSuspM10 As Double = 0.0
#End Region
    Protected Sub gvSummaryClassM10_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvSummaryClassM10.Init
        prinM10 = 0.0
        SumNoOfCustM10 = 0.0
        SumprinM10 = 0.0
        SumaccruM10 = 0.0
        SumSuspM10 = 0.0
    End Sub
    Protected Sub gvSummaryClassM10_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvSummaryClassM10.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            SumNoOfCustM10 += CDbl(DirectCast(e.Row.FindControl("lblNoOfCustM10"), Label).Text)
            SumprinM10 += CDbl(DirectCast(e.Row.FindControl("lblprinM10"), Label).Text)
            SumaccruM10 += CDbl(DirectCast(e.Row.FindControl("lblaccruM10"), Label).Text)
            SumSuspM10 += CDbl(DirectCast(e.Row.FindControl("lblSuspM10"), Label).Text)

            Dim imb As New ImageButton
            imb = e.Row.FindControl("imbM10")
            imb.Attributes.Add("onclick", "javascript:window.open('ByCustomerClassYear.aspx?custsize=" & e.Row.DataItem("custsize") & "&ym=" & e.Row.DataItem("ym") & "&class=" & e.Row.DataItem("class") & "','bycusclass','location=0,status=1,scrollbars=1,menubar=0,resizable=1,width=790,height=590');return false;")

        End If
    End Sub
#End Region
#Region "M11"
#Region "ParameterM11"
    Protected prinM11 As Double = 0.0
    Protected SumNoOfCustM11 As Double = 0.0
    Protected SumprinM11 As Double = 0.0
    Protected SumaccruM11 As Double = 0.0
    Protected SumSuspM11 As Double = 0.0
#End Region
    Protected Sub gvSummaryClassM11_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvSummaryClassM11.Init
        prinM11 = 0.0
        SumNoOfCustM11 = 0.0
        SumprinM11 = 0.0
        SumaccruM11 = 0.0
        SumSuspM11 = 0.0
    End Sub
    Protected Sub gvSummaryClassM11_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvSummaryClassM11.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            SumNoOfCustM11 += CDbl(DirectCast(e.Row.FindControl("lblNoOfCustM11"), Label).Text)
            SumprinM11 += CDbl(DirectCast(e.Row.FindControl("lblprinM11"), Label).Text)
            SumaccruM11 += CDbl(DirectCast(e.Row.FindControl("lblaccruM11"), Label).Text)
            SumSuspM11 += CDbl(DirectCast(e.Row.FindControl("lblSuspM11"), Label).Text)

            Dim imb As New ImageButton
            imb = e.Row.FindControl("imbM11")
            imb.Attributes.Add("onclick", "javascript:window.open('ByCustomerClassYear.aspx?custsize=" & e.Row.DataItem("custsize") & "&ym=" & e.Row.DataItem("ym") & "&class=" & e.Row.DataItem("class") & "','bycusclass','location=0,status=1,scrollbars=1,menubar=0,resizable=1,width=790,height=590');return false;")

        End If
    End Sub
#End Region
#Region "M12"
#Region "ParameterM12"
    Protected prinM12 As Double = 0.0
    Protected SumNoOfCustM12 As Double = 0.0
    Protected SumprinM12 As Double = 0.0
    Protected SumaccruM12 As Double = 0.0
    Protected SumSuspM12 As Double = 0.0
#End Region
    Protected Sub gvSummaryClassM12_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvSummaryClassM12.Init
        prinM12 = 0.0
        SumNoOfCustM12 = 0.0
        SumprinM12 = 0.0
        SumaccruM12 = 0.0
        SumSuspM12 = 0.0
    End Sub
    Protected Sub gvSummaryClassM12_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvSummaryClassM12.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            SumNoOfCustM12 += CDbl(DirectCast(e.Row.FindControl("lblNoOfCustM12"), Label).Text)
            SumprinM12 += CDbl(DirectCast(e.Row.FindControl("lblprinM12"), Label).Text)
            SumaccruM12 += CDbl(DirectCast(e.Row.FindControl("lblaccruM12"), Label).Text)
            SumSuspM12 += CDbl(DirectCast(e.Row.FindControl("lblSuspM12"), Label).Text)

            Dim imb As New ImageButton
            imb = e.Row.FindControl("imbM12")
            imb.Attributes.Add("onclick", "javascript:window.open('ByCustomerClassYear.aspx?custsize=" & e.Row.DataItem("custsize") & "&ym=" & e.Row.DataItem("ym") & "&class=" & e.Row.DataItem("class") & "','bycusclass','location=0,status=1,scrollbars=1,menubar=0,resizable=1,width=790,height=590');return false;")

        End If
    End Sub
#End Region
End Class
