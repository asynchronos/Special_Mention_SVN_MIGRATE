<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Summary.aspx.vb" Inherits="Summary" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Special Mention(SM:ชั้นหนี้ ง) สรุปข้อมูลแบ่งตามสถานะ</title>
    </head>
<link href="StyleSheet.css" rel="stylesheet" type="text/css" />
<body>
    <form id="form1" runat="server">
    <div> 
        <table style="width:100%;">
            <tr>
                <td>
    
        <asp:LinkButton ID="LinkChangePW" runat="server" Font-Bold="True" 
            Font-Underline="True" ForeColor="Blue" PostBackUrl="~/changePW.aspx" 
                        style="color: #FF0000">Change 
        Password</asp:LinkButton>
                </td>
                <td>
                    <asp:ImageButton ID="ImbLogout" runat="server" 
                        ImageUrl="~/Images/btnlogout.gif" style="height: 10px" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblMain" runat="server" 
                        Text="Summary data customer special mention by status" Font-Size="11pt" 
                        style="font-weight: 700; color: #0000CC; text-decoration: underline"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblCustsize" runat="server" Text="Select Cust.Size "></asp:Label>
                    <asp:DropDownList ID="dlCustsize" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataId_Custsize" DataTextField="CUSTSIZE" 
                        DataValueField="CUSTSIZEtxt" 
                        ToolTip="Select cust.size to view data summary by cust.size">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataId_Custsize" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
                        SelectCommand="SELECT [CUSTSIZE], [CUSTSIZEtxt], [CUSTSIZESort] FROM [Id_Custsize] ORDER BY [CUSTSIZESort]">
                    </asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
        <asp:Button ID="btShowW1" runat="server" Text="Week 1" 
                        ToolTip="Click to view data summary week 1" />    
        <asp:Button ID="btShowW2" runat="server" Text="Week 2" 
                        ToolTip="Click to view data summary week 2" />
        <asp:Button ID="btShowW3" runat="server" Text="Week 3" 
                        ToolTip="Click to view data summary week 3" />
        <asp:Button ID="btShowW4" runat="server" Text="Week 4" 
                        ToolTip="Click to view data summary week 4" />
        <asp:ImageButton ID="imbRefreash" runat="server" style="width: 43px" 
            AlternateText="Refreash data" ImageUrl="~/Images/refreash_icon.jpg" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <asp:MultiView ID="mvWeek" runat="server">
            <asp:View ID="vWeek01" runat="server">
                <asp:Label ID="lblW01" runat="server" 
                    style="font-weight: 700; text-decoration: underline; color: #0000CC" 
                    Text="Week 1"></asp:Label>
                <asp:Label ID="lblLabelDasofW1" runat="server" Text="Data as of : "></asp:Label>
                <asp:Label ID="lblDasofW1" runat="server"></asp:Label>
                <br />
            <asp:Label ID="lblSumTDRW1" runat="server" Text="TDR" ForeColor="Red"></asp:Label>
        <asp:GridView ID="gvSumWeekTDR1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataTDRWeek1" BackColor="White" BorderColor="#E7E7FF" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" 
            ShowFooter="True">
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <FooterTemplate>
                        <asp:Label ID="lblAllCountNoOfCust" runat="server"></asp:Label>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:ImageButton ID="imgLinkWeek01" runat="server" CausesValidation="false" 
                            CommandName="" ImageUrl="~/Images/Preview.gif" Text="Button" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="StatusG_ENG" HeaderText="Definition Type" 
                    SortExpression="StatusG_ENG" />
                <asp:BoundField DataField="StatusG_Thai" HeaderText="Definition Type(Thai)" 
                    SortExpression="StatusG_Thai" />
                <asp:TemplateField HeaderText="TDR" SortExpression="TDR">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("TDR") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblTDR" runat="server" Text='<%# Bind("TDR") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="No.of Cust" SortExpression="NoofCust">
                    <EditItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("NoofCust") %>'></asp:Label>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:Label ID="lblAllCountNoOfCust" Text='<%# Format(CountNoOfCustW01TDR,"#,##0")%>' runat="server"></asp:Label>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblCountNoOfCust" runat="server" 
                            Text='<%# Eval("NoofCust", "{0}") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterStyle HorizontalAlign="Right" />
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="SumPrincipal" SortExpression="SumPrincipal">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("SumPrincipal") %>'></asp:Label>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:Label ID="lblAllSumPrincipal" Text='<%# Format(SumPrincipalW01TDR,"#,##0.00")%>' runat="server"></asp:Label>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblSumPrincipal" runat="server" 
                            Text='<%# Bind("SumPrincipal", "{0:N}") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterStyle HorizontalAlign="Right" />
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="SumAccru" SortExpression="SumAccru">
                    <EditItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("SumAccru") %>'></asp:Label>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:Label ID="lblAllSumAccru" Text='<%# Format(SumAccruW01TDR,"#,##0.0")%>' runat="server"></asp:Label>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblSumAccru" runat="server" 
                            Text='<%# Bind("SumAccru", "{0:N}") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterStyle HorizontalAlign="Right" />
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="SumSusp" SortExpression="SumSusp">
                    <EditItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("SumSusp") %>'></asp:Label>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:Label ID="lblAllSumSusp" runat="server" Text='<%# Format(SumSuspW01TDR,"#,##0.00")%>'></asp:Label>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblSumSusp" runat="server" 
                            Text='<%# Bind("SumSusp", "{0:N}") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterStyle HorizontalAlign="Right" />
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
            </Columns>
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <EmptyDataTemplate>
                <span class="style1">No data customer !!! </span>
            </EmptyDataTemplate>
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <AlternatingRowStyle BackColor="#F7F7F7" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataTDRWeek1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
            SelectCommand="SP_SummaryWeek" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="01" Name="Week" Type="String" />
                <asp:Parameter DefaultValue="TDR" Name="TDR" Type="String" />
                <asp:SessionParameter DefaultValue="0" Name="ROLE" SessionField="ROLE" 
                    Type="Byte" />
                <asp:SessionParameter DefaultValue="0" Name="REGION" SessionField="REGION" 
                    Type="String" />
                <asp:SessionParameter DefaultValue="0" Name="BRANCH" SessionField="BRANCH" 
                    Type="String" />
                <asp:SessionParameter DefaultValue="0" Name="DEPT" SessionField="DEPT" 
                    Type="String" />
                <asp:SessionParameter DefaultValue="0" Name="USER_ID" SessionField="USER_ID" 
                    Type="String" />
                <asp:SessionParameter DefaultValue="0" Name="HUB" SessionField="HUB" 
                    Type="String" />
                <asp:ControlParameter ControlID="dlCustsize" DefaultValue="" Name="CUSTSIZE" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <asp:Label ID="lblSumNonTDRW1" runat="server" Text="Non TDR" 
            ForeColor="#0000CC"></asp:Label>
        <br />
        <asp:GridView ID="gvSumWeekNonTDR1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataNonTDRWeek1" BackColor="White" BorderColor="#E7E7FF" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" 
            ShowFooter="True">
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <FooterTemplate>
                        <asp:Label ID="lblAllCountNoOfCust" runat="server"></asp:Label>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:ImageButton ID="imgLinkWeek01" runat="server" CausesValidation="false" 
                            CommandName="" ImageUrl="~/Images/Preview.gif" Text="Button" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="StatusG_ENG" HeaderText="Definition Type" 
                    SortExpression="StatusG_ENG" />
                <asp:BoundField DataField="StatusG_Thai" HeaderText="Definition Type(Thai)" 
                    SortExpression="StatusG_Thai" />
                <asp:TemplateField HeaderText="TDR" SortExpression="TDR">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("TDR") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblTDR" runat="server" Text='<%# Bind("TDR") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="No.of Cust" SortExpression="NoofCust">
                    <EditItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("NoofCust") %>'></asp:Label>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:Label ID="lblAllCountNoOfCust" 
                            Text='<%# Format(CountNoOfCustW01NonTDR,"#,##0")%>' runat="server"></asp:Label>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblCountNoOfCust" runat="server" 
                            Text='<%# Eval("NoofCust", "{0}") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterStyle HorizontalAlign="Right" />
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="SumPrincipal" SortExpression="SumPrincipal">
                    <EditItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("SumPrincipal") %>'></asp:Label>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:Label ID="lblAllSumPrincipal" 
                            Text='<%# Format(SumPrincipalW01NonTDR,"#,##0.00")%>' runat="server"></asp:Label>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblSumPrincipal" runat="server" 
                            Text='<%# Bind("SumPrincipal", "{0:N}") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterStyle HorizontalAlign="Right" />
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="SumAccru" SortExpression="SumAccru">
                    <EditItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("SumAccru") %>'></asp:Label>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:Label ID="lblAllSumAccru" Text='<%# Format(SumAccruW01NonTDR,"#,##0.0")%>' 
                            runat="server"></asp:Label>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblSumAccru" runat="server" 
                            Text='<%# Bind("SumAccru", "{0:N}") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterStyle HorizontalAlign="Right" />
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="SumSusp" SortExpression="SumSusp">
                    <EditItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("SumSusp") %>'></asp:Label>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:Label ID="lblAllSumSusp" runat="server" 
                            Text='<%# Format(SumSuspW01NonTDR,"#,##0.00")%>'></asp:Label>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblSumSusp" runat="server" 
                            Text='<%# Bind("SumSusp", "{0:N}") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterStyle HorizontalAlign="Right" />
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
            </Columns>
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <EmptyDataTemplate>
                <span class="style1">No data customer !!! </span>
            </EmptyDataTemplate>
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <AlternatingRowStyle BackColor="#F7F7F7" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataNonTDRWeek1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
            SelectCommand="SP_SummaryWeek" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="01" Name="Week" Type="String" />
                <asp:Parameter DefaultValue="NonTDR" Name="TDR" Type="String" />
                <asp:SessionParameter DefaultValue="0" Name="ROLE" SessionField="ROLE" 
                    Type="Byte" />
                <asp:SessionParameter DefaultValue="0" Name="REGION" SessionField="REGION" 
                    Type="String" />
                <asp:SessionParameter DefaultValue="0" Name="BRANCH" SessionField="BRANCH" 
                    Type="String" />
                <asp:SessionParameter DefaultValue="0" Name="DEPT" SessionField="DEPT" 
                    Type="String" />
                <asp:SessionParameter DefaultValue="0" Name="USER_ID" SessionField="USER_ID" 
                    Type="String" />
                <asp:SessionParameter DefaultValue="0" Name="HUB" SessionField="HUB" 
                    Type="String" />
                <asp:ControlParameter ControlID="dlCustsize" DefaultValue="" Name="CUSTSIZE" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
            </asp:View>
            <asp:View ID="vWeek02" runat="server">
                <asp:Label ID="lblW2" runat="server" 
                    style="font-weight: 700; text-decoration: underline; color: #0000CC" 
                    Text="Week 2"></asp:Label>
                <asp:Label ID="lblLabelDasofW2" runat="server" Text="Data as of : "></asp:Label>
                <asp:Label ID="lblDasofW2" runat="server"></asp:Label>
                <br />
                <asp:Label ID="lblSumTDRW2" runat="server" ForeColor="Red" Text="TDR"></asp:Label><br />
                <asp:GridView ID="gvSumWeekTDR2" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3" DataSourceID="SqlDataTDRWeek2" GridLines="Horizontal" 
                    ShowFooter="True">
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <FooterTemplate>
                                <asp:Label ID="lblAllCountNoOfCust" runat="server"></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                       <asp:ImageButton ID="imgLinkWeek02" runat="server" CausesValidation="false" 
                                    CommandName="" ImageUrl="~/Images/Preview.gif" Text="Button" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="StatusG_ENG" HeaderText="Definition Type" 
                            SortExpression="StatusG_ENG" />
                        <asp:BoundField DataField="StatusG_Thai" HeaderText="Definition Type(Thai)" 
                            SortExpression="StatusG_Thai" />
                        <asp:TemplateField HeaderText="TDR" SortExpression="TDR">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("TDR") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblTDR" runat="server" Text='<%# Bind("TDR") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="No.of Cust" SortExpression="NoofCust">
                            <EditItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("NoofCust") %>'></asp:Label>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="lblAllCountNoOfCust" runat="server" 
                                    Text='<%# Format(CountNoOfCustW02TDR,"#,##0")%>'></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblCountNoOfCust" runat="server" 
                                    Text='<%# Eval("NoofCust", "{0}") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="SumPrincipal" SortExpression="SumPrincipal">
                            <EditItemTemplate>
                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("SumPrincipal") %>'></asp:Label>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="lblAllSumPrincipal" runat="server" 
                                    Text='<%# Format(SumPrincipalW02TDR,"#,##0.00")%>'></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblSumPrincipal" runat="server" 
                                    Text='<%# Bind("SumPrincipal", "{0:N}") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="SumAccru" SortExpression="SumAccru">
                            <EditItemTemplate>
                                <asp:Label ID="Label11" runat="server" Text='<%# Eval("SumAccru") %>'></asp:Label>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="lblAllSumAccru" runat="server" 
                                    Text='<%# Format(SumAccruW02TDR,"#,##0.0") %>'></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblSumAccru" runat="server" 
                                    Text='<%# Bind("SumAccru", "{0:N}") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="SumSusp" SortExpression="SumSusp">
                            <EditItemTemplate>
                                <asp:Label ID="Label12" runat="server" Text='<%# Eval("SumSusp") %>'></asp:Label>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="lblAllSumSusp" runat="server" 
                                    Text='<%# Format(SumSuspW02TDR,"#,##0.00") %>'></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblSumSusp" runat="server" 
                                    Text='<%# Bind("SumSusp", "{0:N}") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <EmptyDataTemplate>
                        <span class="style1">No data customer !!! </span>
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataTDRWeek2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
                    SelectCommand="SP_SummaryWeek" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="02" Name="Week" Type="String" />
                        <asp:Parameter DefaultValue="TDR" Name="TDR" Type="String" />
                        <asp:SessionParameter DefaultValue="0" Name="ROLE" SessionField="ROLE" 
                            Type="Byte" />
                        <asp:SessionParameter DefaultValue="0" Name="REGION" SessionField="REGION" 
                            Type="String" />
                        <asp:SessionParameter DefaultValue="0" Name="BRANCH" SessionField="BRANCH" 
                            Type="String" />
                        <asp:SessionParameter DefaultValue="0" Name="DEPT" SessionField="DEPT" 
                            Type="String" />
                        <asp:SessionParameter DefaultValue="0" Name="USER_ID" SessionField="USER_ID" 
                            Type="String" />
                        <asp:SessionParameter DefaultValue="0" Name="HUB" SessionField="HUB" 
                            Type="String" />
                        <asp:ControlParameter ControlID="dlCustsize" DefaultValue="" Name="CUSTSIZE" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:Label ID="lblSumNonTDRW2" runat="server" ForeColor="#0000CC" 
                    Text="Non TDR"></asp:Label>
                <asp:GridView ID="gvSumWeekNonTDR2" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3" DataSourceID="SqlDataNonTDRWeek2" GridLines="Horizontal" 
                    ShowFooter="True">
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <FooterTemplate>
                                <asp:Label ID="lblAllCountNoOfCust" runat="server"></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:ImageButton ID="imgLinkWeek02" runat="server" CausesValidation="false" 
                                    CommandName="" ImageUrl="~/Images/Preview.gif" Text="Button" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="StatusG_ENG" HeaderText="Definition Type" 
                            SortExpression="StatusG_ENG" />
                        <asp:BoundField DataField="StatusG_Thai" HeaderText="Definition Type(Thai)" 
                            SortExpression="StatusG_Thai" />
                        <asp:TemplateField HeaderText="TDR" SortExpression="TDR">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("TDR") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblTDR" runat="server" Text='<%# Bind("TDR") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="No.of Cust" SortExpression="NoofCust">
                            <EditItemTemplate>
                                <asp:Label ID="Label13" runat="server" Text='<%# Eval("NoofCust") %>'></asp:Label>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="lblAllCountNoOfCust" runat="server" 
                                    Text='<%# Format(CountNoOfCustW02NonTDR,"#,##0")%>'></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblCountNoOfCust" runat="server" 
                                    Text='<%# Eval("NoofCust", "{0}") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="SumPrincipal" SortExpression="SumPrincipal">
                            <EditItemTemplate>
                                <asp:Label ID="Label14" runat="server" Text='<%# Eval("SumPrincipal") %>'></asp:Label>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="lblAllSumPrincipal" runat="server" 
                                    Text='<%# Format(SumPrincipalW02NonTDR,"#,##0.00")%>'></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblSumPrincipal" runat="server" 
                                    Text='<%# Bind("SumPrincipal", "{0:N}") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="SumAccru" SortExpression="SumAccru">
                            <EditItemTemplate>
                                <asp:Label ID="Label15" runat="server" Text='<%# Eval("SumAccru") %>'></asp:Label>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="lblAllSumAccru" runat="server" 
                                    Text='<%# Format(SumAccruW02NonTDR,"#,##0.0")%>'></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblSumAccru" runat="server" 
                                    Text='<%# Bind("SumAccru", "{0:N}") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="SumSusp" SortExpression="SumSusp">
                            <EditItemTemplate>
                                <asp:Label ID="Label16" runat="server" Text='<%# Eval("SumSusp") %>'></asp:Label>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="lblAllSumSusp" runat="server" 
                                    Text='<%# Format(SumSuspW02NonTDR,"#,##0.00")%>'></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblSumSusp" runat="server" 
                                    Text='<%# Bind("SumSusp", "{0:N}") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <EmptyDataTemplate>
                        <span class="style1">No data customer !!! </span>
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataNonTDRWeek2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
                    SelectCommand="SP_SummaryWeek" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="02" Name="Week" Type="String" />
                        <asp:Parameter DefaultValue="NonTDR" Name="TDR" Type="String" />
                        <asp:SessionParameter DefaultValue="0" Name="ROLE" SessionField="ROLE" 
                            Type="Byte" />
                        <asp:SessionParameter DefaultValue="0" Name="REGION" SessionField="REGION" 
                            Type="String" />
                        <asp:SessionParameter DefaultValue="0" Name="BRANCH" SessionField="BRANCH" 
                            Type="String" />
                        <asp:SessionParameter DefaultValue="0" Name="DEPT" SessionField="DEPT" 
                            Type="String" />
                        <asp:SessionParameter DefaultValue="0" Name="USER_ID" SessionField="USER_ID" 
                            Type="String" />
                        <asp:SessionParameter DefaultValue="0" Name="HUB" SessionField="HUB" 
                            Type="String" />
                        <asp:ControlParameter ControlID="dlCustsize" DefaultValue="" Name="CUSTSIZE" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:View>
            <asp:View ID="vWeek03" runat="server">
                <asp:Label ID="lblW3" runat="server" 
                    style="font-weight: 700; text-decoration: underline; color: #0000CC" 
                    Text="Week 3"></asp:Label>
                <asp:Label ID="lblLabelDasofW3" runat="server" Text="Data as of : "></asp:Label>
                <asp:Label ID="lblDasofW3" runat="server"></asp:Label>
                <br />
                <asp:Label ID="lblSumTDRW3" runat="server" ForeColor="Red" Text="TDR"></asp:Label><br />
                <asp:GridView ID="gvSumWeekTDR3" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3" DataSourceID="SqlDataTDRWeek3" GridLines="Horizontal" 
                    ShowFooter="True">
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <FooterTemplate>
                                <asp:Label ID="lblAllCountNoOfCust" runat="server"></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                       <asp:ImageButton ID="imgLinkWeek03" runat="server" CausesValidation="false" 
                                    CommandName="" ImageUrl="~/Images/Preview.gif" Text="Button" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="StatusG_ENG" HeaderText="Definition Type" 
                            SortExpression="StatusG_ENG" />
                        <asp:BoundField DataField="StatusG_Thai" HeaderText="Definition Type(Thai)" 
                            SortExpression="StatusG_Thai" />
                        <asp:TemplateField HeaderText="TDR" SortExpression="TDR">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("TDR") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblTDR" runat="server" Text='<%# Bind("TDR") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="No.of Cust" SortExpression="NoofCust">
                            <EditItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("NoofCust") %>'></asp:Label>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="lblAllCountNoOfCust" runat="server" 
                                    Text='<%# Format(CountNoOfCustW03TDR,"#,##0")%>'></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblCountNoOfCust" runat="server" 
                                    Text='<%# Eval("NoofCust", "{0}") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="SumPrincipal" SortExpression="SumPrincipal">
                            <EditItemTemplate>
                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("SumPrincipal") %>'></asp:Label>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="lblAllSumPrincipal" runat="server" 
                                    Text='<%# Format(SumPrincipalW03TDR,"#,##0.00")%>'></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblSumPrincipal" runat="server" 
                                    Text='<%# Bind("SumPrincipal", "{0:N}") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="SumAccru" SortExpression="SumAccru">
                            <EditItemTemplate>
                                <asp:Label ID="Label11" runat="server" Text='<%# Eval("SumAccru") %>'></asp:Label>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="lblAllSumAccru" runat="server" 
                                    Text='<%# Format(SumAccruW03TDR,"#,##0.0") %>'></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblSumAccru" runat="server" 
                                    Text='<%# Bind("SumAccru", "{0:N}") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="SumSusp" SortExpression="SumSusp">
                            <EditItemTemplate>
                                <asp:Label ID="Label12" runat="server" Text='<%# Eval("SumSusp") %>'></asp:Label>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="lblAllSumSusp" runat="server" 
                                    Text='<%# Format(SumSuspW03TDR,"#,##0.00") %>'></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblSumSusp" runat="server" 
                                    Text='<%# Bind("SumSusp", "{0:N}") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <EmptyDataTemplate>
                        <span class="style1">No data customer !!! </span>
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataTDRWeek3" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
                    SelectCommand="SP_SummaryWeek" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="03" Name="Week" Type="String" />
                        <asp:Parameter DefaultValue="TDR" Name="TDR" Type="String" />
                        <asp:SessionParameter DefaultValue="0" Name="ROLE" SessionField="ROLE" 
                            Type="Byte" />
                        <asp:SessionParameter DefaultValue="0" Name="REGION" SessionField="REGION" 
                            Type="String" />
                        <asp:SessionParameter DefaultValue="0" Name="BRANCH" SessionField="BRANCH" 
                            Type="String" />
                        <asp:SessionParameter DefaultValue="0" Name="DEPT" SessionField="DEPT" 
                            Type="String" />
                        <asp:SessionParameter DefaultValue="0" Name="USER_ID" SessionField="USER_ID" 
                            Type="String" />
                        <asp:SessionParameter DefaultValue="0" Name="HUB" SessionField="HUB" 
                            Type="String" />
                        <asp:ControlParameter ControlID="dlCustsize" DefaultValue="" Name="CUSTSIZE" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:Label ID="lblSumNonTDRW3" runat="server" ForeColor="#0000CC" 
                    Text="Non TDR"></asp:Label>
                <asp:GridView ID="gvSumWeekNonTDR3" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3" DataSourceID="SqlDataNonTDRWeek3" GridLines="Horizontal" 
                    ShowFooter="True">
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <FooterTemplate>
                                <asp:Label ID="lblAllCountNoOfCust" runat="server"></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:ImageButton ID="imgLinkWeek03" runat="server" CausesValidation="false" 
                                    CommandName="" ImageUrl="~/Images/Preview.gif" Text="Button" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="StatusG_ENG" HeaderText="Definition Type" 
                            SortExpression="StatusG_ENG" />
                        <asp:BoundField DataField="StatusG_Thai" HeaderText="Definition Type(Thai)" 
                            SortExpression="StatusG_Thai" />
                        <asp:TemplateField HeaderText="TDR" SortExpression="TDR">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("TDR") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblTDR" runat="server" Text='<%# Bind("TDR") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="No.of Cust" SortExpression="NoofCust">
                            <EditItemTemplate>
                                <asp:Label ID="Label13" runat="server" Text='<%# Eval("NoofCust") %>'></asp:Label>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="lblAllCountNoOfCust" runat="server" 
                                    Text='<%# Format(CountNoOfCustW03NonTDR,"#,##0")%>'></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblCountNoOfCust" runat="server" 
                                    Text='<%# Eval("NoofCust", "{0}") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="SumPrincipal" SortExpression="SumPrincipal">
                            <EditItemTemplate>
                                <asp:Label ID="Label14" runat="server" Text='<%# Eval("SumPrincipal") %>'></asp:Label>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="lblAllSumPrincipal" runat="server" 
                                    Text='<%# Format(SumPrincipalW03NonTDR,"#,##0.00")%>'></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblSumPrincipal" runat="server" 
                                    Text='<%# Bind("SumPrincipal", "{0:N}") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="SumAccru" SortExpression="SumAccru">
                            <EditItemTemplate>
                                <asp:Label ID="Label15" runat="server" Text='<%# Eval("SumAccru") %>'></asp:Label>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="lblAllSumAccru" runat="server" 
                                    Text='<%# Format(SumAccruW03NonTDR,"#,##0.0")%>'></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblSumAccru" runat="server" 
                                    Text='<%# Bind("SumAccru", "{0:N}") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="SumSusp" SortExpression="SumSusp">
                            <EditItemTemplate>
                                <asp:Label ID="Label16" runat="server" Text='<%# Eval("SumSusp") %>'></asp:Label>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="lblAllSumSusp" runat="server" 
                                    Text='<%# Format(SumSuspW03NonTDR,"#,##0.00")%>'></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblSumSusp" runat="server" 
                                    Text='<%# Bind("SumSusp", "{0:N}") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <EmptyDataTemplate>
                        <span class="style1">No data customer !!! </span>
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataNonTDRWeek3" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
                    SelectCommand="SP_SummaryWeek" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="03" Name="Week" Type="String" />
                        <asp:Parameter DefaultValue="NonTDR" Name="TDR" Type="String" />
                        <asp:SessionParameter DefaultValue="0" Name="ROLE" SessionField="ROLE" 
                            Type="Byte" />
                        <asp:SessionParameter DefaultValue="0" Name="REGION" SessionField="REGION" 
                            Type="String" />
                        <asp:SessionParameter DefaultValue="0" Name="BRANCH" SessionField="BRANCH" 
                            Type="String" />
                        <asp:SessionParameter DefaultValue="0" Name="DEPT" SessionField="DEPT" 
                            Type="String" />
                        <asp:SessionParameter DefaultValue="0" Name="USER_ID" SessionField="USER_ID" 
                            Type="String" />
                        <asp:SessionParameter DefaultValue="0" Name="HUB" SessionField="HUB" 
                            Type="String" />
                        <asp:ControlParameter ControlID="dlCustsize" DefaultValue="" Name="CUSTSIZE" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:View>
            <asp:View ID="vWeek04" runat="server">
                <asp:Label ID="Label17" runat="server" 
                    style="font-weight: 700; text-decoration: underline; color: #0000CC" 
                    Text="Week 4"></asp:Label>
                <asp:Label ID="lblLabelDasofW4" runat="server" Text="Data as of : "></asp:Label>
                <asp:Label ID="lblDasofW4" runat="server"></asp:Label>
                <br />
                <asp:Label ID="Label18" runat="server" ForeColor="Red" Text="TDR"></asp:Label><br />
                <asp:GridView ID="gvSumWeekTDR4" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3" DataSourceID="SqlDataTDRWeek4" GridLines="Horizontal" 
                    ShowFooter="True">
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <FooterTemplate>
                                <asp:Label ID="lblAllCountNoOfCust" runat="server"></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                       <asp:ImageButton ID="imgLinkWeek04" runat="server" CausesValidation="false" 
                                    CommandName="" ImageUrl="~/Images/Preview.gif" Text="Button" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="StatusG_ENG" HeaderText="Definition Type" 
                            SortExpression="StatusG_ENG" />
                        <asp:BoundField DataField="StatusG_Thai" HeaderText="Definition Type(Thai)" 
                            SortExpression="StatusG_Thai" />
                        <asp:TemplateField HeaderText="TDR" SortExpression="TDR">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("TDR") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblTDR" runat="server" Text='<%# Bind("TDR") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="No.of Cust" SortExpression="NoofCust">
                            <EditItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("NoofCust") %>'></asp:Label>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="lblAllCountNoOfCust" runat="server" 
                                    Text='<%# Format(CountNoOfCustW04TDR,"#,##0")%>'></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblCountNoOfCust" runat="server" 
                                    Text='<%# Eval("NoofCust", "{0}") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="SumPrincipal" SortExpression="SumPrincipal">
                            <EditItemTemplate>
                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("SumPrincipal") %>'></asp:Label>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="lblAllSumPrincipal" runat="server" 
                                    Text='<%# Format(SumPrincipalW04TDR,"#,##0.00")%>'></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblSumPrincipal" runat="server" 
                                    Text='<%# Bind("SumPrincipal", "{0:N}") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="SumAccru" SortExpression="SumAccru">
                            <EditItemTemplate>
                                <asp:Label ID="Label11" runat="server" Text='<%# Eval("SumAccru") %>'></asp:Label>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="lblAllSumAccru" runat="server" 
                                    Text='<%# Format(SumAccruW04TDR,"#,##0.0") %>'></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblSumAccru" runat="server" 
                                    Text='<%# Bind("SumAccru", "{0:N}") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="SumSusp" SortExpression="SumSusp">
                            <EditItemTemplate>
                                <asp:Label ID="Label12" runat="server" Text='<%# Eval("SumSusp") %>'></asp:Label>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="lblAllSumSusp" runat="server" 
                                    Text='<%# Format(SumSuspW04TDR,"#,##0.00") %>'></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblSumSusp" runat="server" 
                                    Text='<%# Bind("SumSusp", "{0:N}") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <EmptyDataTemplate>
                        <span class="style1">No data customer !!! </span>
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataTDRWeek4" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
                    SelectCommand="SP_SummaryWeek" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="04" Name="Week" Type="String" />
                        <asp:Parameter DefaultValue="TDR" Name="TDR" Type="String" />
                        <asp:SessionParameter DefaultValue="0" Name="ROLE" SessionField="ROLE" 
                            Type="Byte" />
                        <asp:SessionParameter DefaultValue="0" Name="REGION" SessionField="REGION" 
                            Type="String" />
                        <asp:SessionParameter DefaultValue="0" Name="BRANCH" SessionField="BRANCH" 
                            Type="String" />
                        <asp:SessionParameter DefaultValue="0" Name="DEPT" SessionField="DEPT" 
                            Type="String" />
                        <asp:SessionParameter DefaultValue="0" Name="USER_ID" SessionField="USER_ID" 
                            Type="String" />
                        <asp:SessionParameter DefaultValue="0" Name="HUB" SessionField="HUB" 
                            Type="String" />
                        <asp:ControlParameter ControlID="dlCustsize" DefaultValue="" Name="CUSTSIZE" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:Label ID="Label19" runat="server" ForeColor="#0000CC" 
                    Text="Non TDR"></asp:Label>
                <asp:GridView ID="gvSumWeekNonTDR4" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3" DataSourceID="SqlDataNonTDRWeek4" GridLines="Horizontal" 
                    ShowFooter="True">
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <FooterTemplate>
                                <asp:Label ID="lblAllCountNoOfCust" runat="server"></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:ImageButton ID="imgLinkWeek05" runat="server" CausesValidation="false" 
                                    CommandName="" ImageUrl="~/Images/Preview.gif" Text="Button" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="StatusG_ENG" HeaderText="Definition Type" 
                            SortExpression="StatusG_ENG" />
                        <asp:BoundField DataField="StatusG_Thai" HeaderText="Definition Type(Thai)" 
                            SortExpression="StatusG_Thai" />
                        <asp:TemplateField HeaderText="TDR" SortExpression="TDR">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("TDR") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblTDR" runat="server" Text='<%# Bind("TDR") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="No.of Cust" SortExpression="NoofCust">
                            <EditItemTemplate>
                                <asp:Label ID="Label13" runat="server" Text='<%# Eval("NoofCust") %>'></asp:Label>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="lblAllCountNoOfCust" runat="server" 
                                    Text='<%# Format(CountNoOfCustW04NonTDR,"#,##0")%>'></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblCountNoOfCust" runat="server" 
                                    Text='<%# Eval("NoofCust", "{0}") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="SumPrincipal" SortExpression="SumPrincipal">
                            <EditItemTemplate>
                                <asp:Label ID="Label14" runat="server" Text='<%# Eval("SumPrincipal") %>'></asp:Label>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="lblAllSumPrincipal" runat="server" 
                                    Text='<%# Format(SumPrincipalW04NonTDR,"#,##0.00")%>'></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblSumPrincipal" runat="server" 
                                    Text='<%# Bind("SumPrincipal", "{0:N}") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="SumAccru" SortExpression="SumAccru">
                            <EditItemTemplate>
                                <asp:Label ID="Label15" runat="server" Text='<%# Eval("SumAccru") %>'></asp:Label>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="lblAllSumAccru" runat="server" 
                                    Text='<%# Format(SumAccruW04NonTDR,"#,##0.0")%>'></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblSumAccru" runat="server" 
                                    Text='<%# Bind("SumAccru", "{0:N}") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="SumSusp" SortExpression="SumSusp">
                            <EditItemTemplate>
                                <asp:Label ID="Label16" runat="server" Text='<%# Eval("SumSusp") %>'></asp:Label>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="lblAllSumSusp" runat="server" 
                                    Text='<%# Format(SumSuspW04NonTDR,"#,##0.00")%>'></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblSumSusp" runat="server" 
                                    Text='<%# Bind("SumSusp", "{0:N}") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <EmptyDataTemplate>
                        <span class="style1">No data customer !!! </span>
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataNonTDRWeek4" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
                    SelectCommand="SP_SummaryWeek" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="04" Name="Week" Type="String" />
                        <asp:Parameter DefaultValue="NonTDR" Name="TDR" Type="String" />
                        <asp:SessionParameter DefaultValue="0" Name="ROLE" SessionField="ROLE" 
                            Type="Byte" />
                        <asp:SessionParameter DefaultValue="0" Name="REGION" SessionField="REGION" 
                            Type="String" />
                        <asp:SessionParameter DefaultValue="0" Name="BRANCH" SessionField="BRANCH" 
                            Type="String" />
                        <asp:SessionParameter DefaultValue="0" Name="DEPT" SessionField="DEPT" 
                            Type="String" />
                        <asp:SessionParameter DefaultValue="0" Name="USER_ID" SessionField="USER_ID" 
                            Type="String" />
                        <asp:SessionParameter DefaultValue="0" Name="HUB" SessionField="HUB" 
                            Type="String" />
                        <asp:ControlParameter ControlID="dlCustsize" DefaultValue="" Name="CUSTSIZE" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:View>
        </asp:MultiView>
        <br />      
    </div>
    </form>
</body>
</html>
