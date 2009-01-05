<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SummaryLevel01.aspx.vb" Inherits="SummaryLevel01" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Special Mention(SM:ชั้นหนี้ ง) สรุปข้อมูลแบ่งตามสายงาน</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="Div_Summarylending" runat="server">
    
        <asp:Label ID="lbl_G_ByLending" runat="server" CssClass="font1h" 
            Text="สรุปข้อมูลแบ่งตามสายงาน"></asp:Label>                
        <asp:GridView ID="gvLendingSub" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            DataKeyNames="Id_LendingSub" DataSourceID="SqlDataLevel01" ForeColor="Black" 
            GridLines="Vertical">
            <FooterStyle BackColor="#CCCC99" />
            <RowStyle BackColor="#F7F7DE" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Deptflag" HeaderText="Deptflag" />
                <asp:BoundField DataField="LendingSubT" HeaderText="Region" 
                    SortExpression="Id_LendingSub" />
                <asp:BoundField DataField="FlagHub" HeaderText="flag SBC" 
                    SortExpression="FlagHub" />
                <asp:BoundField DataField="StatusG_Eng" HeaderText="Definition Type" 
                    SortExpression="Id_StatusG" />
                <asp:BoundField DataField="TDR" HeaderText="TDR" SortExpression="TDR" />
                <asp:BoundField DataField="NoOfCust" HeaderText="No.of Cust" 
                    SortExpression="NoOfCust" />
                <asp:BoundField DataField="SumPrincipal" HeaderText="SumPrincipal" 
                    SortExpression="SumPrincipal" DataFormatString="{0:n}" >
                    <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="SumAccru" HeaderText="SumAccru" 
                    SortExpression="SumAccru" DataFormatString="{0:n}" />
                <asp:BoundField DataField="SumSusp" HeaderText="SumSusp" 
                    SortExpression="SumSusp" DataFormatString="{0:n}" />
            </Columns>
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataLevel01" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
            SelectCommand="SP_SummaryWeekLevel01" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="Week" QueryStringField="Week" Type="String" />
                <asp:QueryStringParameter Name="TDR" QueryStringField="TDR" Type="String" />
                <asp:SessionParameter DefaultValue="0" Name="ROLE" SessionField="ROLE" 
                    Type="Byte" />
                <asp:SessionParameter DefaultValue="0" Name="REGION" SessionField="REGION" 
                    Type="String" />
                <asp:SessionParameter DefaultValue="0" Name="BRANCH" SessionField="BRANCH" 
                    Type="String" />
                <asp:SessionParameter DefaultValue="0" Name="DEPT" SessionField="DEPT" 
                    Type="String" />
                <asp:QueryStringParameter DefaultValue="0" Name="Id_StatusG" 
                    QueryStringField="Id_StatusG" Type="String" />
                <asp:QueryStringParameter Name="CUSTSIZE" QueryStringField="CUSTSIZE" 
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>   
    </div>
    <div id="Div_SummaryLengingControlling"  runat="server">
            <asp:Label ID="lbl_G_ByDeptTran" runat="server" CssClass="font1h" 
            Text="สรุปข้อมูลตาม Controlling Unit ภายใต้สายงาน "></asp:Label>
&nbsp;<asp:Label ID="lblRegionSelect" runat="server" CssClass="font1h" ForeColor="Blue"></asp:Label>
    <asp:GridView ID="gvLendingSubBR" runat="server" 
        DataSourceID="SqlDataLevel01BR" AllowSorting="True" 
        AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" 
        BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
        GridLines="Vertical">
        <FooterStyle BackColor="#CCCC99" />
        <RowStyle BackColor="#F7F7DE" />
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:ImageButton ID="ImbControlling" runat="server" CausesValidation="false" 
                        CommandName="" ImageUrl="~/Images/Preview.gif" Text="Button" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="DeptFlag" HeaderText="Deptflag" 
                SortExpression="DeptFlag" />
            <asp:BoundField DataField="Id_DepTran" HeaderText="Controlling Unit Code" 
                SortExpression="Id_DepTran" />
            <asp:BoundField DataField="DepTranT" HeaderText="Controlling Unit" 
                SortExpression="DepTranT" />
            <asp:BoundField DataField="Hub_Name_T" HeaderText="SBC" 
                SortExpression="Hub_Name_T" />
            <asp:BoundField DataField="TDR" HeaderText="TDR" SortExpression="TDR" />
            <asp:BoundField DataField="NoOfCust" HeaderText="No.of Cust" 
                SortExpression="NoOfCust" />
            <asp:BoundField DataField="SumPrincipal" HeaderText="SumPrincipal" 
                SortExpression="SumPrincipal" DataFormatString="{0:n}" />
            <asp:BoundField DataField="SumAccru" HeaderText="SumAccru" 
                SortExpression="SumAccru" DataFormatString="{0:n}" />
            <asp:BoundField DataField="SumSusp" HeaderText="SumSusp" 
                SortExpression="SumSusp" DataFormatString="{0:n}" />
        </Columns>
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataLevel01BR" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
        SelectCommand="SP_SummaryWeekLevel01_BR" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="Week" QueryStringField="Week" 
                Type="String" />
            <asp:QueryStringParameter DefaultValue="0" Name="TDR" QueryStringField="TDR" 
                Type="String" />
            <asp:QueryStringParameter DefaultValue="0" Name="Id_StatusG" 
                QueryStringField="Id_StatusG" Type="String" />
            <asp:ControlParameter ControlID="gvLendingSub" DefaultValue="0" 
                Name="Id_LendingSub" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="txtgvLendingSub_FlagHub" DefaultValue="0" Name="FlagHub" 
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtgvLendingSub_Deptflag" DefaultValue="0" 
                Name="Deptflag" PropertyName="Text" Type="String" />
            <asp:QueryStringParameter DefaultValue="" Name="CUSTSIZE" 
                QueryStringField="CUSTSIZE" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:TextBox ID="txtgvLendingSub_FlagHub" runat="server" Visible="False"></asp:TextBox>
    <asp:TextBox ID="txtgvLendingSub_Deptflag" runat="server" Visible="False"></asp:TextBox>    
        <br /> 
     </div>      
     <div id="Div_SummaryControlling"  runat="server">
        <asp:Label ID="lbl_G_ByDeptTran0" runat="server" CssClass="font1h" 
            Text="สรุปข้อมูลตาม Controlling Unit"></asp:Label>
    
        <asp:GridView ID="gvControllingUnit" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            DataKeyNames="Id_Deptran" DataSourceID="SqlDataLevel02" ForeColor="Black" 
            GridLines="Vertical">
            <FooterStyle BackColor="#CCCC99" />
            <RowStyle BackColor="#F7F7DE" />
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:ImageButton ID="ImbControlling" runat="server" CausesValidation="false" 
                            CommandName="" ImageUrl="~/Images/Preview.gif" Text="Button" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Deptflag" HeaderText="Deptflag" />
                <asp:BoundField DataField="DepTrant" HeaderText="Controlling Unit" 
                    SortExpression="DepTrant" />
                <asp:BoundField DataField="FlagHub" HeaderText="flag SBC" 
                    SortExpression="FlagHub" />
                <asp:BoundField DataField="Hub_Name_T" HeaderText="SBC" 
                    SortExpression="Hub_Name_T" />
                <asp:BoundField DataField="StatusG_Eng" HeaderText="Definition Type" 
                    SortExpression="Id_StatusG" />
                <asp:BoundField DataField="TDR" HeaderText="TDR" SortExpression="TDR" />
                <asp:BoundField DataField="NoOfCust" HeaderText="No.of Cust" 
                    SortExpression="NoOfCust" />
                <asp:BoundField DataField="SumPrincipal" HeaderText="SumPrincipal" 
                    SortExpression="SumPrincipal" DataFormatString="{0:n}" />
                <asp:BoundField DataField="SumAccru" HeaderText="SumAccru" 
                    SortExpression="SumAccru" DataFormatString="{0:n}" />
                <asp:BoundField DataField="SumSusp" HeaderText="SumSusp" 
                    SortExpression="SumSusp" DataFormatString="{0:n}" />
            </Columns>
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
    <asp:SqlDataSource ID="SqlDataLevel02" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
        SelectCommand="SP_SummaryWeekLevel02" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="Week" QueryStringField="Week" 
                Type="String" />
            <asp:QueryStringParameter DefaultValue="0" Name="TDR" QueryStringField="TDR" 
                Type="String" />
            <asp:SessionParameter DefaultValue="0" Name="ROLE" SessionField="ROLE" 
                Type="Byte" />
            <asp:SessionParameter DefaultValue="0" Name="REGION" SessionField="REGION" 
                Type="String" />
            <asp:SessionParameter DefaultValue="0" Name="BRANCH" SessionField="BRANCH" 
                Type="String" />
            <asp:SessionParameter DefaultValue="0" Name="DEPT" SessionField="DEPT" 
                Type="String" />
            <asp:QueryStringParameter DefaultValue="0" Name="Id_StatusG" 
                QueryStringField="id_StatusG" Type="String" />
            <asp:SessionParameter DefaultValue="0" Name="HUB" SessionField="HUB" 
                Type="String" />
            <asp:QueryStringParameter DefaultValue="" Name="CUSTSIZE" 
                QueryStringField="CUSTSIZE" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
