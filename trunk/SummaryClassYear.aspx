<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SummaryClassYear.aspx.vb" Inherits="SummaryClassYear" %>

<%@ Register src="wucMenu.ascx" tagname="wucMenu" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Summary class by controlling unit</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width:100%;">
            <tr>
                <td colspan="3">
                    <uc1:wucMenu ID="wucMenu1" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
    
        <asp:Label ID="lblSummaryclass" runat="server" Text="Summary class by controlling unit" Font-Bold="True" 
            ForeColor="#0000CC"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
    
                    <asp:Label ID="lblYear" runat="server" Font-Bold="True" ForeColor="Red" 
                        Text="Select year: "></asp:Label>
    
        <asp:DropDownList ID="dlYear" runat="server" AutoPostBack="True">
            <asp:ListItem Value="2550">2007</asp:ListItem>
            <asp:ListItem Value="2551">2008</asp:ListItem>
            <asp:ListItem Selected="True" Value="2552">2009</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="lblCustsize" runat="server" Text="Cust.size " 
                        ToolTip="Select Cust.size to view data summary"></asp:Label>
                    <asp:DropDownList ID="dlCustsize" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataId_Custsize" DataTextField="CUSTSIZE" 
                        DataValueField="Id_CUSTSIZE" 
                        ToolTip="Select cust.size to view data summary by cust.size" 
                        BackColor="#66CCFF" Font-Bold="True">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="dsBycusYear" runat="server"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataId_Custsize" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
                        
                        SelectCommand="SELECT Id_CUSTSIZE, CUSTSIZE, CUSTSIZESort FROM Id_Custsize ORDER BY CUSTSIZESort">
                    </asp:SqlDataSource>    
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr valign="top">
                <td>
                    <asp:Label ID="lblm0" runat="server" Text="Last year December" Font-Bold="True" 
                        ForeColor="#0000CC"></asp:Label>
                    <asp:GridView ID="gvSummaryClassM0" runat="server" AutoGenerateColumns="False" 
                        BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
                        CellPadding="3" CellSpacing="1" DataSourceID="SP_SummaryClassM0" 
                        GridLines="None" ShowFooter="True">
                        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                        <RowStyle BackColor="#DEDFDE" ForeColor="Black" Wrap="False" />
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="imbM0" runat="server" CausesValidation="false" 
                                        CommandName="" ImageUrl="~/Images/Preview.gif" Text="Button" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="class" HeaderText="Class" FooterText="Total" >
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="No of cust." ConvertEmptyStringToNull="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblNoOfCustM0" runat="server" 
                                        Text='<%# Bind("NoOfCust", "{0:#,###}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NoOfCust") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumNoOfCustM0" Text='<%# Format(SumNoOfCustM0,"#,##0")%>' runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Principal">
                                <ItemTemplate>
                                    <asp:Label ID="lblprinM0" runat="server" Text='<%# Bind("Prin", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Prin") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumprinM0" Text='<%# Format(SumprinM0,"#,##0")%>' runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Accru">
                                <ItemTemplate>
                                    <asp:Label ID="lblAccruM0" runat="server" Text='<%# Bind("Accru", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Accru") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumaccruM0" Text='<%# Format(SumaccruM0,"#,##0")%>' runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Susp">
                                <ItemTemplate>
                                    <asp:Label ID="lblSuspM0" runat="server" Text='<%# Bind("Susp", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Susp") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumsuspM0" Text='<%# Format(SumsuspM0,"#,##0")%>' runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                        <EmptyDataTemplate>
                            <asp:Label ID="lblnodata" runat="server" Font-Bold="True" ForeColor="Red" 
                                Text="Data not found !!!"></asp:Label>
                        </EmptyDataTemplate>
                        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" 
                            HorizontalAlign="Center" Wrap="False" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SP_SummaryClassM0" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
                        SelectCommand="SP_SummaryClass" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="ROLE" SessionField="ROLE" Type="Byte" />
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
                            <asp:ControlParameter ControlID="dlYear" DefaultValue="" Name="year" 
                                PropertyName="SelectedValue" Type="String" />
                            <asp:Parameter Name="month" Type="String" DefaultValue="01" />
                            <asp:Parameter DefaultValue="0" Name="ThisYear" Type="String" />
                            <asp:ControlParameter ControlID="dlCustsize" Name="CUSTSIZE" 
                                PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr valign="top">
                <td>
                    <asp:Label ID="lblm1" runat="server" Text="January" Font-Bold="True" 
                        ForeColor="#0000CC"></asp:Label>
                    
                    <asp:GridView ID="gvSummaryClassM1" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" DataSourceID="SP_SummaryClassM1" 
                        GridLines="None" ShowFooter="True" ForeColor="#333333">
                        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                        <RowStyle BackColor="#EFF3FB" Wrap="False" />
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="imbM1" runat="server" CausesValidation="false" 
                                        CommandName="" ImageUrl="~/Images/Preview.gif" Text="Button" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="class" HeaderText="Class" FooterText="Total" >
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="No of cust." ConvertEmptyStringToNull="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblNoOfCustM1" runat="server" 
                                        Text='<%# Bind("NoOfCust", "{0:#,###}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("NoOfCust") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumNoOfCustM1" Text='<%# Format(SumNoOfCustM1,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Principal">
                                <ItemTemplate>
                                    <asp:Label ID="lblprinM1" runat="server" Text='<%# Bind("Prin", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Prin") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumprinM1" Text='<%# Format(SumprinM1,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Accru">
                                <ItemTemplate>
                                    <asp:Label ID="lblAccruM1" runat="server" Text='<%# Bind("Accru", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Accru") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumaccruM1" Text='<%# Format(SumaccruM1,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Susp">
                                <ItemTemplate>
                                    <asp:Label ID="lblSuspM1" runat="server" Text='<%# Bind("Susp", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Susp") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumsuspM1" Text='<%# Format(SumsuspM1,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <EmptyDataTemplate>
                            <asp:Label ID="lblnodata" runat="server" Font-Bold="True" ForeColor="Red" 
                                Text="Data not found !!!"></asp:Label>
                        </EmptyDataTemplate>
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" 
                            HorizontalAlign="Center" Wrap="False" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    
                    <asp:SqlDataSource ID="SP_SummaryClassM1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
                        SelectCommand="SP_SummaryClass" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                         <asp:SessionParameter Name="ROLE" SessionField="ROLE" Type="Byte" />
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
<asp:ControlParameter ControlID="dlYear" PropertyName="SelectedValue" Name="year" Type="String" 
                                DefaultValue=""></asp:ControlParameter>
                            <asp:Parameter DefaultValue="01" Name="month" Type="String" />
                            <asp:Parameter DefaultValue="1" Name="ThisYear" Type="String" />
                            <asp:ControlParameter ControlID="dlCustsize" Name="CUSTSIZE" 
                                PropertyName="SelectedValue" Type="String" DefaultValue="" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    <asp:Label ID="lblm2" runat="server" Text="February" Font-Bold="True" 
                        ForeColor="#0000CC"></asp:Label>
                    <asp:GridView ID="gvSummaryClassM2" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" DataSourceID="SP_SummaryClassM2" 
                        GridLines="None" ShowFooter="True" ForeColor="#333333">
                        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                        <RowStyle BackColor="#EFF3FB" Wrap="False" />
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="imbM2" runat="server" CausesValidation="false" 
                                        CommandName="" ImageUrl="~/Images/Preview.gif" Text="Button" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="class" HeaderText="Class" FooterText="Total" >
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="No of cust." ConvertEmptyStringToNull="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblNoOfCustM2" runat="server" 
                                        Text='<%# Bind("NoOfCust", "{0:#,###}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("NoOfCust") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumNoOfCustM2" Text='<%# Format(SumNoOfCustM2,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Principal">
                                <ItemTemplate>
                                    <asp:Label ID="lblprinM2" runat="server" Text='<%# Bind("Prin", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Prin") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumprinM2" Text='<%# Format(SumprinM2,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Accru">
                                <ItemTemplate>
                                    <asp:Label ID="lblAccruM2" runat="server" Text='<%# Bind("Accru", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("Accru") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumaccruM2" Text='<%# Format(SumaccruM2,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Susp">
                                <ItemTemplate>
                                    <asp:Label ID="lblSuspM2" runat="server" Text='<%# Bind("Susp", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("Susp") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumsuspM2" Text='<%# Format(SumsuspM2,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <EmptyDataTemplate>
                            <asp:Label ID="lblnodata" runat="server" Font-Bold="True" ForeColor="Red" 
                                Text="Data not found !!!"></asp:Label>
                        </EmptyDataTemplate>
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" 
                            HorizontalAlign="Center" Wrap="False" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SP_SummaryClassM2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
                        SelectCommand="SP_SummaryClass" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                         <asp:SessionParameter Name="ROLE" SessionField="ROLE" Type="Byte" />
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
                            <asp:ControlParameter ControlID="dlYear" Name="year" 
                                PropertyName="SelectedValue" Type="String" DefaultValue="" />
                            <asp:Parameter DefaultValue="02" Name="month" Type="String" />
                            <asp:Parameter DefaultValue="1" Name="ThisYear" Type="String" />
                            <asp:ControlParameter ControlID="dlCustsize" DefaultValue="" Name="CUSTSIZE" 
                                PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource></td>
                <td>
                      <asp:Label ID="lblm3" runat="server" Text="March" Font-Bold="True" 
                          ForeColor="#0000CC"></asp:Label>
                    <asp:GridView ID="gvSummaryClassM3" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" DataSourceID="SP_SummaryClassM3" 
                        GridLines="None" ShowFooter="True" ForeColor="#333333">
                        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                        <RowStyle BackColor="#EFF3FB" Wrap="False" />
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="imbM3" runat="server" CausesValidation="false" 
                                        CommandName="" ImageUrl="~/Images/Preview.gif" Text="Button" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="class" HeaderText="Class" FooterText="Total" >
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="No of cust." ConvertEmptyStringToNull="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblNoOfCustM3" runat="server" 
                                        Text='<%# Bind("NoOfCust", "{0:#,###}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("NoOfCust") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumNoOfCustM3" Text='<%# Format(SumNoOfCustM3,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Principal">
                                <ItemTemplate>
                                    <asp:Label ID="lblprinM3" runat="server" Text='<%# Bind("Prin", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("Prin") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumprinM3" Text='<%# Format(SumprinM3,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Accru">
                                <ItemTemplate>
                                    <asp:Label ID="lblAccruM3" runat="server" Text='<%# Bind("Accru", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("Accru") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumaccruM3" Text='<%# Format(SumaccruM3,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Susp">
                                <ItemTemplate>
                                    <asp:Label ID="lblSuspM3" runat="server" Text='<%# Bind("Susp", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("Susp") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumsuspM3" Text='<%# Format(SumsuspM3,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <EmptyDataTemplate>
                            <asp:Label ID="lblnodata" runat="server" Font-Bold="True" ForeColor="Red" 
                                Text="Data not found !!!"></asp:Label>
                        </EmptyDataTemplate>
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" 
                            HorizontalAlign="Center" Wrap="False" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SP_SummaryClassM3" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
                        SelectCommand="SP_SummaryClass" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                         <asp:SessionParameter Name="ROLE" SessionField="ROLE" Type="Byte" />
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
                            <asp:ControlParameter ControlID="dlYear" Name="year" 
                                PropertyName="SelectedValue" Type="String" DefaultValue="" />
                            <asp:Parameter DefaultValue="03" Name="month" Type="String" />
                            <asp:Parameter DefaultValue="1" Name="ThisYear" Type="String" />
                            <asp:ControlParameter ControlID="dlCustsize" Name="CUSTSIZE" 
                                PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource></td>
            </tr>
            <tr valign="top">
                <td>
                    <asp:Label ID="lblm4" runat="server" Text="April" Font-Bold="True" 
                        ForeColor="#0000CC"></asp:Label>
                    <asp:GridView ID="gvSummaryClassM4" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" DataSourceID="SP_SummaryClassM4" 
                        GridLines="None" ShowFooter="True" ForeColor="#333333">
                        <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" Wrap="False" />
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="imbM4" runat="server" CausesValidation="false" 
                                        CommandName="" ImageUrl="~/Images/Preview.gif" Text="Button" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="class" HeaderText="Class" FooterText="Total" >
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="No of cust." ConvertEmptyStringToNull="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblNoOfCustM4" runat="server" 
                                        Text='<%# Bind("NoOfCust", "{0:#,###}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("NoOfCust") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumNoOfCustM4" Text='<%# Format(SumNoOfCustM4,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Principal">
                                <ItemTemplate>
                                    <asp:Label ID="lblprinM4" runat="server" Text='<%# Bind("Prin", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox18" runat="server" Text='<%# Bind("Prin") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumprinM4" Text='<%# Format(SumprinM4,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Accru">
                                <ItemTemplate>
                                    <asp:Label ID="lblAccruM4" runat="server" Text='<%# Bind("Accru", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox19" runat="server" Text='<%# Bind("Accru") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumaccruM4" Text='<%# Format(SumaccruM4,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Susp">
                                <ItemTemplate>
                                    <asp:Label ID="lblSuspM4" runat="server" Text='<%# Bind("Susp", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox20" runat="server" Text='<%# Bind("Susp") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumsuspM4" Text='<%# Format(SumsuspM4,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <EmptyDataTemplate>
                            <asp:Label ID="lblnodata" runat="server" Font-Bold="True" ForeColor="Red" 
                                Text="Data not found !!!"></asp:Label>
                        </EmptyDataTemplate>
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                            HorizontalAlign="Center" Wrap="False" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SP_SummaryClassM4" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
                        SelectCommand="SP_SummaryClass" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                         <asp:SessionParameter Name="ROLE" SessionField="ROLE" Type="Byte" />
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
                            <asp:ControlParameter ControlID="dlYear" Name="year" 
                                PropertyName="SelectedValue" Type="String" DefaultValue="" />
                            <asp:Parameter DefaultValue="04" Name="month" Type="String" />
                            <asp:Parameter DefaultValue="1" Name="ThisYear" Type="String" />
                            <asp:ControlParameter ControlID="dlCustsize" DefaultValue="" Name="CUSTSIZE" 
                                PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource></td>
                <td>
                    <asp:Label ID="lblm5" runat="server" Text="May" Font-Bold="True" 
                        ForeColor="#0000CC"></asp:Label>
                    <asp:GridView ID="gvSummaryClassM5" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" DataSourceID="SP_SummaryClassM5" 
                        GridLines="None" ShowFooter="True" ForeColor="#333333">
                        <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" Wrap="False" />
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="imbM5" runat="server" CausesValidation="false" 
                                        CommandName="" ImageUrl="~/Images/Preview.gif" Text="Button" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="class" HeaderText="Class" FooterText="Total" >
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="No of cust." ConvertEmptyStringToNull="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblNoOfCustM5" runat="server" 
                                        Text='<%# Bind("NoOfCust", "{0:#,###}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox21" runat="server" Text='<%# Bind("NoOfCust") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumNoOfCustM5" Text='<%# Format(SumNoOfCustM5,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Principal">
                                <ItemTemplate>
                                    <asp:Label ID="lblprinM5" runat="server" Text='<%# Bind("Prin", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox22" runat="server" Text='<%# Bind("Prin") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumprinM5" Text='<%# Format(SumprinM5,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Accru">
                                <ItemTemplate>
                                    <asp:Label ID="lblAccruM5" runat="server" Text='<%# Bind("Accru", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox23" runat="server" Text='<%# Bind("Accru") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumaccruM5" Text='<%# Format(SumaccruM5,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Susp">
                                <ItemTemplate>
                                    <asp:Label ID="lblSuspM5" runat="server" Text='<%# Bind("Susp", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox24" runat="server" Text='<%# Bind("Susp") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumsuspM5" Text='<%# Format(SumsuspM5,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <EmptyDataTemplate>
                            <asp:Label ID="lblnodata" runat="server" Font-Bold="True" ForeColor="Red" 
                                Text="Data not found !!!"></asp:Label>
                        </EmptyDataTemplate>
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                            HorizontalAlign="Center" Wrap="False" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SP_SummaryClassM5" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
                        SelectCommand="SP_SummaryClass" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                         <asp:SessionParameter Name="ROLE" SessionField="ROLE" Type="Byte" />
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
                            <asp:ControlParameter ControlID="dlYear" Name="year" 
                                PropertyName="SelectedValue" Type="String" DefaultValue="" />
                            <asp:Parameter DefaultValue="05" Name="month" Type="String" />
                            <asp:Parameter DefaultValue="1" Name="ThisYear" Type="String" />
                            <asp:ControlParameter ControlID="dlCustsize" Name="CUSTSIZE" 
                                PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource></td>
                <td>
                    <asp:Label ID="lblm6" runat="server" Text="June" Font-Bold="True" 
                        ForeColor="#0000CC"></asp:Label>
                    <asp:GridView ID="gvSummaryClassM6" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" DataSourceID="SP_SummaryClassM6" 
                        GridLines="None" ShowFooter="True" ForeColor="#333333">
                        <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" Wrap="False" />
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="imbM6" runat="server" CausesValidation="false" 
                                        CommandName="" ImageUrl="~/Images/Preview.gif" Text="Button" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="class" HeaderText="Class" FooterText="Total" >
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="No of cust." ConvertEmptyStringToNull="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblNoOfCustM6" runat="server" 
                                        Text='<%# Bind("NoOfCust", "{0:#,###}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox25" runat="server" Text='<%# Bind("NoOfCust") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumNoOfCustM6" Text='<%# Format(SumNoOfCustM6,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Principal">
                                <ItemTemplate>
                                    <asp:Label ID="lblprinM6" runat="server" Text='<%# Bind("Prin", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox26" runat="server" Text='<%# Bind("Prin") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumprinM6" Text='<%# Format(SumprinM6,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Accru">
                                <ItemTemplate>
                                    <asp:Label ID="lblAccruM6" runat="server" Text='<%# Bind("Accru", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox27" runat="server" Text='<%# Bind("Accru") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumaccruM6" Text='<%# Format(SumaccruM6,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Susp">
                                <ItemTemplate>
                                    <asp:Label ID="lblSuspM6" runat="server" Text='<%# Bind("Susp", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox28" runat="server" Text='<%# Bind("Susp") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumsuspM6" Text='<%# Format(SumsuspM6,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <EmptyDataTemplate>
                            <asp:Label ID="lblnodata" runat="server" Font-Bold="True" ForeColor="Red" 
                                Text="Data not found !!!"></asp:Label>
                        </EmptyDataTemplate>
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                            HorizontalAlign="Center" Wrap="False" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SP_SummaryClassM6" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
                        SelectCommand="SP_SummaryClass" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                         <asp:SessionParameter Name="ROLE" SessionField="ROLE" Type="Byte" />
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
                            <asp:ControlParameter ControlID="dlYear" Name="year" 
                                PropertyName="SelectedValue" Type="String" DefaultValue="" />
                            <asp:Parameter DefaultValue="06" Name="month" Type="String" />
                            <asp:Parameter DefaultValue="1" Name="ThisYear" Type="String" />
                            <asp:ControlParameter ControlID="dlCustsize" DefaultValue="" Name="CUSTSIZE" 
                                PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource></td>
            </tr>
            <tr valign="top">
                <td>
                    <asp:Label ID="lblm7" runat="server" Text="July" Font-Bold="True" 
                        ForeColor="#0000CC"></asp:Label>
                    <asp:GridView ID="gvSummaryClassM7" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" DataSourceID="SP_SummaryClassM7" 
                        GridLines="None" ShowFooter="True" ForeColor="#333333">
                        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                        <RowStyle BackColor="#EFF3FB" Wrap="False" />
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="imbM7" runat="server" CausesValidation="false" 
                                        CommandName="" ImageUrl="~/Images/Preview.gif" Text="Button" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="class" HeaderText="Class" FooterText="Total" >
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="No of cust." ConvertEmptyStringToNull="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblNoOfCustM7" runat="server" 
                                        Text='<%# Bind("NoOfCust", "{0:#,###}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox29" runat="server" Text='<%# Bind("NoOfCust") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumNoOfCustM7" Text='<%# Format(SumNoOfCustM7,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Principal">
                                <ItemTemplate>
                                    <asp:Label ID="lblprinM7" runat="server" Text='<%# Bind("Prin", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox30" runat="server" Text='<%# Bind("Prin") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumprinM7" Text='<%# Format(SumprinM7,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Accru">
                                <ItemTemplate>
                                    <asp:Label ID="lblAccruM7" runat="server" Text='<%# Bind("Accru", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox31" runat="server" Text='<%# Bind("Accru") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumaccruM7" Text='<%# Format(SumaccruM7,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Susp">
                                <ItemTemplate>
                                    <asp:Label ID="lblSuspM7" runat="server" Text='<%# Bind("Susp", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox32" runat="server" Text='<%# Bind("Susp") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumsuspM7" Text='<%# Format(SumsuspM7,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <EmptyDataTemplate>
                            <asp:Label ID="lblnodata" runat="server" Font-Bold="True" ForeColor="Red" 
                                Text="Data not found !!!"></asp:Label>
                        </EmptyDataTemplate>
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" 
                            HorizontalAlign="Center" Wrap="False" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SP_SummaryClassM7" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
                        SelectCommand="SP_SummaryClass" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                         <asp:SessionParameter Name="ROLE" SessionField="ROLE" Type="Byte" />
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
                            <asp:ControlParameter ControlID="dlYear" Name="year" 
                                PropertyName="SelectedValue" Type="String" DefaultValue="" />
                            <asp:Parameter DefaultValue="07" Name="month" Type="String" />
                            <asp:Parameter DefaultValue="1" Name="ThisYear" Type="String" />
                            <asp:ControlParameter ControlID="dlCustsize" Name="CUSTSIZE" 
                                PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    <asp:Label ID="lblm8" runat="server" Text="August" Font-Bold="True" 
                        ForeColor="#0000CC"></asp:Label>
                    <asp:GridView ID="gvSummaryClassM8" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" DataSourceID="SP_SummaryClassM8" 
                        GridLines="None" ShowFooter="True" ForeColor="#333333">
                        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                        <RowStyle BackColor="#EFF3FB" Wrap="False" />
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="imbM8" runat="server" CausesValidation="false" 
                                        CommandName="" ImageUrl="~/Images/Preview.gif" Text="Button" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="class" HeaderText="Class" FooterText="Total" >
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="No of cust." ConvertEmptyStringToNull="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblNoOfCustM8" runat="server" 
                                        Text='<%# Bind("NoOfCust", "{0:#,###}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox33" runat="server" Text='<%# Bind("NoOfCust") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumNoOfCustM8" Text='<%# Format(SumNoOfCustM8,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Principal">
                                <ItemTemplate>
                                    <asp:Label ID="lblprinM8" runat="server" Text='<%# Bind("Prin", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox34" runat="server" Text='<%# Bind("Prin") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumprinM8" Text='<%# Format(SumprinM8,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Accru">
                                <ItemTemplate>
                                    <asp:Label ID="lblAccruM8" runat="server" Text='<%# Bind("Accru", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox35" runat="server" Text='<%# Bind("Accru") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumaccruM8" Text='<%# Format(SumaccruM8,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Susp">
                                <ItemTemplate>
                                    <asp:Label ID="lblSuspM8" runat="server" Text='<%# Bind("Susp", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox36" runat="server" Text='<%# Bind("Susp") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumsuspM8" Text='<%# Format(SumsuspM8,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <EmptyDataTemplate>
                            <asp:Label ID="lblnodata" runat="server" Font-Bold="True" ForeColor="Red" 
                                Text="Data not found !!!"></asp:Label>
                        </EmptyDataTemplate>
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" 
                            HorizontalAlign="Center" Wrap="False" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SP_SummaryClassM8" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
                        SelectCommand="SP_SummaryClass" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                         <asp:SessionParameter Name="ROLE" SessionField="ROLE" Type="Byte" />
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
                            <asp:ControlParameter ControlID="dlYear" DefaultValue="" Name="year" 
                                PropertyName="SelectedValue" Type="String" />
                            <asp:Parameter DefaultValue="08" Name="month" Type="String" />
                            <asp:Parameter DefaultValue="1" Name="ThisYear" Type="String" />
                            <asp:ControlParameter ControlID="dlCustsize" Name="CUSTSIZE" 
                                PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    <asp:Label ID="lblm9" runat="server" Text="September" Font-Bold="True" 
                        ForeColor="#0000CC"></asp:Label>
                    <asp:GridView ID="gvSummaryClassM9" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" DataSourceID="SP_SummaryClassM9" 
                        GridLines="None" ShowFooter="True" ForeColor="#333333">
                        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                        <RowStyle BackColor="#EFF3FB" Wrap="False" />
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="imbM9" runat="server" CausesValidation="false" 
                                        CommandName="" ImageUrl="~/Images/Preview.gif" Text="Button" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="class" HeaderText="Class" FooterText="Total" >
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="No of cust." ConvertEmptyStringToNull="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblNoOfCustM9" runat="server" 
                                        Text='<%# Bind("NoOfCust", "{0:#,###}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox37" runat="server" Text='<%# Bind("NoOfCust") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumNoOfCustM9" Text='<%# Format(SumNoOfCustM9,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Principal">
                                <ItemTemplate>
                                    <asp:Label ID="lblprinM9" runat="server" Text='<%# Bind("Prin", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox38" runat="server" Text='<%# Bind("Prin") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumprinM9" Text='<%# Format(SumprinM9,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Accru">
                                <ItemTemplate>
                                    <asp:Label ID="lblAccruM9" runat="server" Text='<%# Bind("Accru", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox39" runat="server" Text='<%# Bind("Accru") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumaccruM9" Text='<%# Format(SumaccruM9,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Susp">
                                <ItemTemplate>
                                    <asp:Label ID="lblSuspM9" runat="server" Text='<%# Bind("Susp", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox40" runat="server" Text='<%# Bind("Susp") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumsuspM9" Text='<%# Format(SumsuspM9,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <EmptyDataTemplate>
                            <asp:Label ID="lblnodata" runat="server" Font-Bold="True" ForeColor="Red" 
                                Text="Data not found !!!"></asp:Label>
                        </EmptyDataTemplate>
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" 
                            HorizontalAlign="Center" Wrap="False" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SP_SummaryClassM9" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
                        SelectCommand="SP_SummaryClass" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                         <asp:SessionParameter Name="ROLE" SessionField="ROLE" Type="Byte" />
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
                            <asp:ControlParameter ControlID="dlYear" DefaultValue="" Name="year" 
                                PropertyName="SelectedValue" Type="String" />
                            <asp:Parameter DefaultValue="09" Name="month" Type="String" />
                            <asp:Parameter DefaultValue="1" Name="ThisYear" Type="String" />
                            <asp:ControlParameter ControlID="dlCustsize" Name="CUSTSIZE" 
                                PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr valign="top">
                <td>
                    <asp:Label ID="lblm10" runat="server" Text="October" Font-Bold="True" 
                        ForeColor="#0000CC"></asp:Label>
                    <asp:GridView ID="gvSummaryClassM10" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" DataSourceID="SP_SummaryClassM10" 
                        GridLines="None" ShowFooter="True" ForeColor="#333333">
                        <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" Wrap="False" />
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="imbM10" runat="server" CausesValidation="false" 
                                        CommandName="" ImageUrl="~/Images/Preview.gif" Text="Button" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="class" HeaderText="Class" FooterText="Total" >
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="No of cust." ConvertEmptyStringToNull="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblNoOfCustM10" runat="server" 
                                        Text='<%# Bind("NoOfCust", "{0:#,###}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox41" runat="server" Text='<%# Bind("NoOfCust") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumNoOfCustM10" Text='<%# Format(SumNoOfCustM10,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Principal">
                                <ItemTemplate>
                                    <asp:Label ID="lblprinM10" runat="server" Text='<%# Bind("Prin", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox42" runat="server" Text='<%# Bind("Prin") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumprinM10" Text='<%# Format(SumprinM10,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Accru">
                                <ItemTemplate>
                                    <asp:Label ID="lblAccruM10" runat="server" Text='<%# Bind("Accru", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox43" runat="server" Text='<%# Bind("Accru") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumaccruM10" Text='<%# Format(SumaccruM10,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Susp">
                                <ItemTemplate>
                                    <asp:Label ID="lblSuspM10" runat="server" Text='<%# Bind("Susp", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox44" runat="server" Text='<%# Bind("Susp") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumsuspM10" Text='<%# Format(SumsuspM10,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <EmptyDataTemplate>
                            <asp:Label ID="lblnodata" runat="server" Font-Bold="True" ForeColor="Red" 
                                Text="Data not found !!!"></asp:Label>
                        </EmptyDataTemplate>
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                            HorizontalAlign="Center" Wrap="False" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SP_SummaryClassM10" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
                        SelectCommand="SP_SummaryClass" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="ROLE" SessionField="ROLE" Type="Byte" />
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
                            <asp:ControlParameter ControlID="dlYear" DefaultValue="" Name="year" 
                                PropertyName="SelectedValue" Type="String" />
                            <asp:Parameter DefaultValue="10" Name="month" Type="String" />
                            <asp:Parameter DefaultValue="1" Name="ThisYear" Type="String" />
                            <asp:ControlParameter ControlID="dlCustsize" Name="CUSTSIZE" 
                                PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    <asp:Label ID="lblm11" runat="server" Text="November" Font-Bold="True" 
                        ForeColor="#0000CC"></asp:Label>
                    <asp:GridView ID="gvSummaryClassM11" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" DataSourceID="SP_SummaryClassM11" 
                        GridLines="None" ShowFooter="True" ForeColor="#333333">
                        <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" Wrap="False" />
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="imbM11" runat="server" CausesValidation="false" 
                                        CommandName="" ImageUrl="~/Images/Preview.gif" Text="Button" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="class" HeaderText="Class" FooterText="Total" >
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="No of cust." ConvertEmptyStringToNull="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblNoOfCustM11" runat="server" 
                                        Text='<%# Bind("NoOfCust", "{0:#,###}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox45" runat="server" Text='<%# Bind("NoOfCust") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumNoOfCustM11" Text='<%# Format(SumNoOfCustM11,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Principal">
                                <ItemTemplate>
                                    <asp:Label ID="lblprinM11" runat="server" Text='<%# Bind("Prin", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox46" runat="server" Text='<%# Bind("Prin") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumprinM11" Text='<%# Format(SumprinM11,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Accru">
                                <ItemTemplate>
                                    <asp:Label ID="lblAccruM11" runat="server" Text='<%# Bind("Accru", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox47" runat="server" Text='<%# Bind("Accru") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumaccruM11" Text='<%# Format(SumaccruM11,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Susp">
                                <ItemTemplate>
                                    <asp:Label ID="lblSuspM11" runat="server" Text='<%# Bind("Susp", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox48" runat="server" Text='<%# Bind("Susp") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumsuspM11" Text='<%# Format(SumsuspM11,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <EmptyDataTemplate>
                            <asp:Label ID="lblnodata" runat="server" Font-Bold="True" ForeColor="Red" 
                                Text="Data not found !!!"></asp:Label>
                        </EmptyDataTemplate>
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                            HorizontalAlign="Center" Wrap="False" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SP_SummaryClassM11" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
                        SelectCommand="SP_SummaryClass" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="ROLE" SessionField="ROLE" Type="Byte" />
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
                            <asp:ControlParameter ControlID="dlYear" DefaultValue="" Name="year" 
                                PropertyName="SelectedValue" Type="String" />
                            <asp:Parameter DefaultValue="11" Name="month" Type="String" />
                            <asp:Parameter DefaultValue="1" Name="ThisYear" Type="String" />
                            <asp:ControlParameter ControlID="dlCustsize" Name="CUSTSIZE" 
                                PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    <asp:Label ID="lblm12" runat="server" Text="December" Font-Bold="True" 
                        ForeColor="#0000CC"></asp:Label>
                    <asp:GridView ID="gvSummaryClassM12" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" DataSourceID="SP_SummaryClassM12" 
                        GridLines="None" ShowFooter="True" ForeColor="#333333">
                        <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" Wrap="False" />
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="imbM12" runat="server" CausesValidation="false" 
                                        CommandName="" ImageUrl="~/Images/Preview.gif" Text="Button" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="class" HeaderText="Class" FooterText="Total" >
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="No of cust." ConvertEmptyStringToNull="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblNoOfCustM12" runat="server" 
                                        Text='<%# Bind("NoOfCust", "{0:#,###}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox49" runat="server" Text='<%# Bind("NoOfCust") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumNoOfCustM12" Text='<%# Format(SumNoOfCustM12,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Principal">
                                <ItemTemplate>
                                    <asp:Label ID="lblprinM12" runat="server" Text='<%# Bind("Prin", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox50" runat="server" Text='<%# Bind("Prin") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumprinM12" Text='<%# Format(SumprinM12,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Accru">
                                <ItemTemplate>
                                    <asp:Label ID="lblAccruM12" runat="server" Text='<%# Bind("Accru", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox51" runat="server" Text='<%# Bind("Accru") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumaccruM12" Text='<%# Format(SumaccruM12,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Susp">
                                <ItemTemplate>
                                    <asp:Label ID="lblSuspM12" runat="server" Text='<%# Bind("Susp", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox52" runat="server" Text='<%# Bind("Susp") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblSumsuspM12" Text='<%# Format(SumsuspM12,"#,##0")%>' 
                                        runat="server"></asp:Label>
                                </FooterTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <EmptyDataTemplate>
                            <asp:Label ID="lblnodata" runat="server" Font-Bold="True" ForeColor="Red" 
                                Text="Data not found !!!"></asp:Label>
                        </EmptyDataTemplate>
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                            HorizontalAlign="Center" Wrap="False" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SP_SummaryClassM12" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
                        SelectCommand="SP_SummaryClass" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="ROLE" SessionField="ROLE" Type="Byte" />
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
                            <asp:ControlParameter ControlID="dlYear" DefaultValue="" Name="year" 
                                PropertyName="SelectedValue" Type="String" />
                            <asp:Parameter DefaultValue="12" Name="month" Type="String" />
                            <asp:Parameter DefaultValue="1" Name="ThisYear" Type="String" />
                            <asp:ControlParameter ControlID="dlCustsize" Name="CUSTSIZE" 
                                PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
