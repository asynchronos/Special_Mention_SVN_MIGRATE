<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ByAccMovement.aspx.vb" Inherits="ByAccMovement" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Data Account</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="lblFormula" runat="server" Text="Formula :"></asp:Label>
        <asp:Label ID="lblResultReq" runat="server" Font-Bold="True" 
            ForeColor="#CC9900"></asp:Label>
        =<asp:Label ID="lblFormulaReqExp1" runat="server" Font-Bold="True" 
            ForeColor="#0000CC"></asp:Label>
        -<asp:Label ID="lblFormulaReqExp2" runat="server" Font-Bold="True" 
            ForeColor="Red"></asp:Label>
        <br />
       <asp:Label ID="lbl1" runat="server" Text="Data account:"></asp:Label>
        <asp:Label ID="lblExp1" runat="server" Font-Bold="True" ForeColor="#0000CC"></asp:Label>
        <asp:Label ID="lblCountgvExp1" runat="server"></asp:Label>
         <asp:Panel ID="pnExp1" runat="server" ScrollBars="Auto" Width="790px" 
            Height="350px">
            <asp:GridView ID="gvExp1" runat="server" AllowPaging="True" AllowSorting="True" 
            AutoGenerateColumns="False" CellPadding="4" 
            DataKeyNames="Cif,YearMonthEng,Loan,APP_ID,ACCNO" DataSourceID="SqlDataExp1" 
            ForeColor="#333333" GridLines="None">
            <PagerSettings Mode="NumericFirstLast" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#EFF3FB" Wrap="False" />
            <Columns>
                <asp:BoundField DataField="Cif" HeaderText="Cif" ReadOnly="True" 
                    SortExpression="Cif" >
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" >
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="APP_ID" HeaderText="APP_ID" ReadOnly="True" 
                    SortExpression="APP_ID" >
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="ACCNO" HeaderText="ACCNO" ReadOnly="True" 
                    SortExpression="ACCNO" >
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="Flag_SM" HeaderText="Flag_SM" 
                    SortExpression="Flag_SM" >
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="ADJCLASS_Last" HeaderText="Class_Last" 
                    SortExpression="ADJCLASS_Last" >
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="ADJCLASS" HeaderText="Class" 
                    SortExpression="ADJCLASS" >
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="ADJCLASSE" HeaderText="Class Eng." 
                    SortExpression="ADJCLASSE" >
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="Principal" HeaderText="Principal" 
                    SortExpression="Principal" DataFormatString="{0:n}" >
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="LendingSubT" HeaderText="สายงาน" 
                    SortExpression="LendingSubT" >
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="Hub_Name_T" HeaderText="SBC" 
                    SortExpression="Hub_Name_T" >
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="DepTranT" HeaderText="Controlling unit" 
                    SortExpression="DepTranT" >
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="BaySize" HeaderText="Cust. Size" 
                    SortExpression="BaySize" >
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="YearMonthEng" HeaderText="Dasof" ReadOnly="True" 
                    SortExpression="YearMonthEng" >
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
            </Columns>
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Left" />
            <EmptyDataTemplate>
                <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Red" 
                    Text="Data not found ! ! !"></asp:Label>
            </EmptyDataTemplate>
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataExp1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
            SelectCommand="SP_MOV_ByAccExp1" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="" Name="ROLE" SessionField="ROLE" 
                    Type="Byte" />
                <asp:SessionParameter DefaultValue="0" Name="REGION" SessionField="REGION" 
                    Type="String" />
                <asp:SessionParameter DefaultValue="0" Name="BRANCH" SessionField="BRANCH" 
                    Type="String" />
                <asp:SessionParameter DefaultValue="0" Name="DEPT" SessionField="DEPT" 
                    Type="String" />
                <asp:SessionParameter DefaultValue="" Name="USER_ID" SessionField="USER_ID" 
                    Type="String" />
                <asp:SessionParameter DefaultValue="0" Name="HUB" SessionField="HUB" 
                    Type="String" />
                <asp:QueryStringParameter Name="BaySize" QueryStringField="BaySize" 
                    Type="String" />
                <asp:QueryStringParameter DefaultValue="" Name="YearMonthEng" 
                    QueryStringField="YearMonthEng" Type="String" />
                <asp:QueryStringParameter DefaultValue="" Name="Exp1" QueryStringField="Exp1" 
                    Type="String" />
                <asp:QueryStringParameter Name="Exp2" QueryStringField="Exp2" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
            </asp:Panel>
        <asp:Label ID="lbl2" runat="server" Text="Data account:"></asp:Label>
        <asp:Label ID="lblExp2" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
        <asp:Label ID="lblCountgvExp2" runat="server"></asp:Label>
        <asp:Panel ID="pnExp2" runat="server" ScrollBars="Auto" Width="790px" 
            Height="350px">
            <asp:GridView ID="gvExp2" runat="server" AllowPaging="True" AllowSorting="True" 
            AutoGenerateColumns="False" CellPadding="4" 
            DataKeyNames="Cif,YearMonthEng,Loan,APP_ID,ACCNO" DataSourceID="SqlDataExp2" 
            ForeColor="#333333" GridLines="None">
            <PagerSettings Mode="NumericFirstLast" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#EFF3FB" Wrap="False" />
            <Columns>
                <asp:BoundField DataField="Cif" HeaderText="Cif" ReadOnly="True" 
                    SortExpression="Cif" >
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" >
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="APP_ID" HeaderText="APP_ID" ReadOnly="True" 
                    SortExpression="APP_ID" >
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="ACCNO" HeaderText="ACCNO" ReadOnly="True" 
                    SortExpression="ACCNO" >
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="Flag_SM" HeaderText="Flag_SM" 
                    SortExpression="Flag_SM" >
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="ADJCLASS_Last" HeaderText="Class_Last" 
                    SortExpression="ADJCLASS_Last" >
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="ADJCLASS" HeaderText="Class" 
                    SortExpression="ADJCLASS" >
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="ADJCLASSE" HeaderText="Class Eng." 
                    SortExpression="ADJCLASSE" >
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="Principal" HeaderText="Principal" 
                    SortExpression="Principal" DataFormatString="{0:n}" >
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="LendingSubT" HeaderText="สายงาน" 
                    SortExpression="LendingSubT" >
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="Hub_Name_T" HeaderText="SBC" 
                    SortExpression="Hub_Name_T" >
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="DepTranT" HeaderText="Controlling unit" 
                    SortExpression="DepTranT" >
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="BaySize" HeaderText="Cust. Size" 
                    SortExpression="BaySize" >
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="YearMonthEng" HeaderText="Dasof" ReadOnly="True" 
                    SortExpression="YearMonthEng" >
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
            </Columns>
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Left" />
            <EmptyDataTemplate>
                <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Red" 
                    Text="Data not found ! ! !"></asp:Label>
            </EmptyDataTemplate>
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataExp2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
            SelectCommand="SP_MOV_ByAccExp2" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="" Name="ROLE" SessionField="ROLE" 
                    Type="Byte" />
                <asp:SessionParameter DefaultValue="0" Name="REGION" SessionField="REGION" 
                    Type="String" />
                <asp:SessionParameter DefaultValue="0" Name="BRANCH" SessionField="BRANCH" 
                    Type="String" />
                <asp:SessionParameter DefaultValue="0" Name="DEPT" SessionField="DEPT" 
                    Type="String" />
                <asp:SessionParameter DefaultValue="" Name="USER_ID" SessionField="USER_ID" 
                    Type="String" />
                <asp:SessionParameter DefaultValue="0" Name="HUB" SessionField="HUB" 
                    Type="String" />
                <asp:QueryStringParameter Name="BaySize" QueryStringField="BaySize" 
                    Type="String" />
                <asp:QueryStringParameter Name="YearMonthEng" QueryStringField="YearMonthEng" 
                    Type="String" />
                <asp:QueryStringParameter Name="Exp1" QueryStringField="Exp1" Type="String" />
                <asp:QueryStringParameter Name="Exp2" QueryStringField="Exp2" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
            </asp:Panel>
    </div>
    </form>
</body>
</html>
