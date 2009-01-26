
Partial Class ByAccMovement
    Inherits System.Web.UI.Page
    Protected Sub lblExp1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles lblExp1.Load
        lblExp1.Text = "(" & Request.QueryString("Exp1") & ")"
    End Sub

    Protected Sub lblExp2_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles lblExp2.Load
        lblExp2.Text = "(" & Request.QueryString("Exp2") & ")"
    End Sub

    Protected Sub SqlDataExp1_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataExp1.Selected
        lblCountgvExp1.Text = "(จำนวนบัญชีทั้งหมด: " & e.AffectedRows & " บัญชี)"
    End Sub

    Protected Sub SqlDataExp2_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataExp2.Selected
        lblCountgvExp2.Text = "(จำนวนบัญชีทั้งหมด: " & e.AffectedRows & " บัญชี)"
    End Sub

    Protected Sub lblResultReq_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles lblResultReq.Load
        lblResultReq.Text = "(" & Request.QueryString("Result") & ")"
    End Sub

    Protected Sub lblFormulaReqExp1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles lblFormulaReqExp1.Load
        lblFormulaReqExp1.Text = "(" & Request.QueryString("Exp1") & ")"
    End Sub

    Protected Sub lblFormulaReqExp2_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles lblFormulaReqExp2.Load
        lblFormulaReqExp2.Text = "(" & Request.QueryString("Exp2") & ")"
    End Sub
    Protected Sub gvExp1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvExp1.RowDataBound
        If e.Row.RowType = DataControlRowType.Header Or e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Cells(0).Style("Position") = "relative"
            e.Row.Cells(1).Style("Position") = "relative"
            e.Row.Cells(2).Style("Position") = "relative"
            e.Row.Cells(3).Style("Position") = "relative"
            e.Row.Cells(4).Style("Position") = "relative"
        End If
    End Sub

    Protected Sub gvExp2_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvExp2.RowDataBound
        If e.Row.RowType = DataControlRowType.Header Or e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Cells(0).Style("Position") = "relative"
            e.Row.Cells(1).Style("Position") = "relative"
            e.Row.Cells(2).Style("Position") = "relative"
            e.Row.Cells(3).Style("Position") = "relative"
            e.Row.Cells(4).Style("Position") = "relative"
        End If
    End Sub
    Protected Sub form1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles form1.Load
        If Not Me.IsPostBack Then
            Me.Title = "Data account: (" & Request.QueryString("Result") & ")"
        End If
    End Sub
End Class
