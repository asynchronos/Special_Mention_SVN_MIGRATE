<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SummaryMovement.aspx.vb" Inherits="SummaryMovement" %>

<%@ Register src="wucMenu.ascx" tagname="wucMenu" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Summary movement</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:wucMenu ID="wucMenu1" runat="server" />
        <br />
        <asp:Label ID="lblYearMonthEng" runat="server" Text="Select month(yyyy/mm): " 
            Font-Bold="True" ForeColor="Red"></asp:Label>
        <asp:DropDownList ID="dlYearMonthEng" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataYearMonthEng" DataTextField="YearMonthEngtxt" 
            DataValueField="YearMonthEng">
        </asp:DropDownList>
        <br />
        <asp:Label ID="lblSummarySMmovement" runat="server" 
            Text="Summary data special mention movement" Font-Bold="True" 
            ForeColor="Blue"></asp:Label>
        <asp:Label ID="lblDasof" runat="server"></asp:Label>
        <asp:GridView ID="gvSummaryMovement" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="SqlDataSummaryMovement" ForeColor="Black" 
            GridLines="Vertical" ShowFooter="True" BackColor="White" 
            BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px">
        <FooterStyle BackColor="#CCCC99" />
        <RowStyle BackColor="#F7F7DE" Wrap="False" />
        <Columns>
            <asp:BoundField DataField="BAYSIZE" HeaderText="Cust.Size" 
                SortExpression="BAYSIZE" />
            <asp:TemplateField HeaderText="Pass =&gt; SM 30+">
                <ItemTemplate>
                    <asp:HyperLink ID="lbl1" runat="server" 
                        Text='<%#Format(Eval("1"),"#,##0.##") %>' OnPreRender="lbl1_PreRender"></asp:HyperLink>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Label ID="lblSum1" runat="server" text='<%# Format(sum1,"#,##0")%>'></asp:Label>
                </FooterTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SM 30+ =&gt; SM 60+" SortExpression="2">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("2") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:Label ID="lblSum2" text='<%# Format(sum2,"#,##0")%>'  runat="server"></asp:Label>
                </FooterTemplate>
                <ItemTemplate>
                   <asp:HyperLink ID="lbl2" runat="server"
                        Text='<%#Format(Eval("2"),"#,##0.##") %>' OnPreRender="lbl2_PreRender"></asp:HyperLink>
                </ItemTemplate>
                <ItemStyle Wrap="False" HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SM 60+ =&gt; NPL" SortExpression="3">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("3") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:Label ID="lblSum3" text='<%# Format(sum3,"#,##0")%>' runat="server"></asp:Label>
                </FooterTemplate>
                <ItemTemplate>
                  <asp:HyperLink ID="lbl3" runat="server" 
                        Text='<%#Format(Eval("3"),"#,##0.##") %>' OnPreRender="lbl3_PreRender"></asp:HyperLink>
                </ItemTemplate>
                <ItemStyle Wrap="False" HorizontalAlign="Right" />
            </asp:TemplateField>
        </Columns>
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <EmptyDataTemplate>
                <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Red" 
                    Text="Data not found !!!"></asp:Label>
            </EmptyDataTemplate>
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSummaryMovement" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
            SelectCommand="SP_MOV_Summary" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="ROLE" SessionField="ROLE" 
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
                <asp:ControlParameter ControlID="dlYearMonthEng" Name="YearMonthEng" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>      
        <asp:SqlDataSource ID="SqlDataYearMonthEng" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
            SelectCommand="SELECT YearMonthEng, LEFT (YearMonthEng, 4) + '/' + RIGHT (YearMonthEng, 2) AS YearMonthEngtxt FROM ByAcc_Movement GROUP BY YearMonthEng ORDER BY YearMonthEng DESC">
        </asp:SqlDataSource>
    </div>
    
    </form>
</body>
</html>
