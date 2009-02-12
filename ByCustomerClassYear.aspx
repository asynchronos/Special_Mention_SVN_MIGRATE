<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ByCustomerClassYear.aspx.vb" Inherits="ByCustomerClassYear" %>

<%@ Register src="ExportControl/ExportControl.ascx" tagname="ExportControl" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer class by controlling unit</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript">
 function ShowHidefilterExp(sender,target,target2,target3,target4,target5,e){
    var listFilter = sender;
    var divfiltertextBox = target;
    var divdlControllingUnit = target2;
    var divId_CustSize = target3;
    var divSBC = target4;
    var divLendingSubT = target5;
    
    //alert(dlId_Status.options[dlId_Status.selectedIndex].value+":"+dlId_Status.options[dlId_Status.selectedIndex].text);
    
    if (listFilter.options[listFilter.selectedIndex].value == "DepTranT"){
        changeDisplay(divdlControllingUnit.id,"inline");
        changeDisplay(divfiltertextBox.id,"none");
        changeDisplay(divSBC.id,"none");
        changeDisplay(divId_CustSize.id,"none");
        changeDisplay(divLendingSubT.id,"none");
    }else if (listFilter.options[listFilter.selectedIndex].value == "Baysize"){
        changeDisplay(divfiltertextBox.id,"none");
        changeDisplay(divdlControllingUnit.id,"none");
        changeDisplay(divSBC.id,"none");
        changeDisplay(divId_CustSize.id,"inline");
        changeDisplay(divLendingSubT.id,"none");
    }else if (listFilter.options[listFilter.selectedIndex].value == "Hub_Name_T"){
        changeDisplay(divfiltertextBox.id,"none");
        changeDisplay(divdlControllingUnit.id,"none");
        changeDisplay(divSBC.id,"inline");
        changeDisplay(divId_CustSize.id,"none");
        changeDisplay(divLendingSubT.id,"none");
    }else if (listFilter.options[listFilter.selectedIndex].value == "LendingSubT"){
        changeDisplay(divfiltertextBox.id,"none");
        changeDisplay(divdlControllingUnit.id,"none");
        changeDisplay(divSBC.id,"none");
        changeDisplay(divId_CustSize.id,"none");
        changeDisplay(divLendingSubT.id,"inline");
    }else{
        changeDisplay(divfiltertextBox.id,"inline");
        changeDisplay(divdlControllingUnit.id,"none");
        changeDisplay(divSBC.id,"none");
        changeDisplay(divId_CustSize.id,"none");
        changeDisplay(divLendingSubT.id,"none");
    }
 }
</script>
    <style type="text/css">
        .style1
        {
            height: 4px;
        }
        .style4
        {
            color: #0000CC;
            background-color: #FFFFCC;
        }
        .style5
        {
            color: #FF0000;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="lblByCustomer" runat="server" 
            Text="Customer class by controlling unit" Font-Bold="True" 
            ForeColor="#0000CC"></asp:Label>
        <asp:Label ID="lblCountByCus" runat="server"></asp:Label>
        <asp:Label ID="lblByCusPage" runat="server"></asp:Label>
        <br />
        <table>
        <tr>
                <td valign="top">
         Filter :<asp:DropDownList ID="listFilter" runat="server" onchange="ShowHidefilterExp(this,ele('divfiltertextBox'),ele('divdlControllingUnit'),ele('divId_CustSize'),ele('divSBC'),ele('divLendingSubT'),event);">
                  <asp:ListItem>CIF</asp:ListItem>
                  <asp:ListItem Value="NAME">Name</asp:ListItem>
                  <asp:ListItem Value="LendingSubT">สายงาน</asp:ListItem>
                  <asp:ListItem Value="Hub_Name_T">SBC</asp:ListItem>
                   <asp:ListItem Value="DepTranT">Controlling Unit</asp:ListItem>
                   <asp:ListItem Value="Baysize">Cust.size</asp:ListItem>
                    </asp:DropDownList>      
        </td><td valign="top">
               <div id="divfiltertextBox" runat="server" style="display:inline;">
            <asp:TextBox ID="filterTextBox" runat="server"></asp:TextBox>
       </div>
       <div id="divdlControllingUnit" runat="server" style="display:inline;">
       <asp:DropDownList ID="dlControllingUnit" runat="server" 
            DataSourceID="SqlDataByCustomerControllingUnit" DataTextField="DepTranT" 
            DataValueField="DepTranT">
            </asp:DropDownList>
       </div>
              <div id="divSBC" runat="server" style="display:inline;">
      <asp:DropDownList ID="dlSBC" runat="server" 
            DataSourceID="SqlDataByCustomerSBC" DataTextField="Hub_Name_T" 
            DataValueField="Hub_Name_T">
            </asp:DropDownList>
       </div>
       <div id="divId_CustSize" runat="server" style="display:inline;">
       <asp:DropDownList ID="dlId_CustSize" runat="server" 
               DataSourceID="DS_ByCustomerClassCistsize" DataTextField="Baysize" 
               DataValueField="Baysize">
            </asp:DropDownList>
       </div>
              <div id="divLendingSubT" runat="server" style="display:inline;">
       <asp:DropDownList ID="dlLendingSubT" runat="server"
                   DataSourceID="SqlDataByCustomerLendingSubT" DataTextField="LendingSubT" 
            DataValueField="LendingSubT">
            </asp:DropDownList>
       </div>
       </td><td valign="top">
                <asp:Button ID="setFilterButton" runat="server" Text="Filter" />               
                <asp:Button ID="clearFilterButton" runat="server" Text="Clear Filter" />
                        
        </td>
        </tr>
        <tr>
                <td valign="top" colspan="3">
                    <uc1:ExportControl ID="ExportControl1" runat="server" 
                        controlName="gvByCustomer" filename="ByCustomerClass" />
               </td>
        </tr>
        </table>

    </div>
    <asp:GridView ID="gvByCustomer" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" DataSourceID="DsSP_BycustomerClass" 
        ForeColor="#333333" GridLines="None" PageSize="20" AllowSorting="True">
        <PagerSettings Mode="NumericFirstLast" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:BoundField DataField="Cif" HeaderText="CIF" SortExpression="CIF">
                <ItemStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name">
                <ItemStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField DataField="Class" HeaderText="Class" SortExpression="Class">
                <ItemStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField DataField="Aging" DataFormatString="{0:n}" HeaderText="Aging" 
                SortExpression="Aging">
                <ItemStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField DataField="Principal" DataFormatString="{0:n}" 
                HeaderText="Principal" SortExpression="Principal">
                <ItemStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField DataField="Accru" DataFormatString="{0:n}" HeaderText="Accru" 
                SortExpression="Accru">
                <ItemStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField DataField="Susp" DataFormatString="{0:n}" HeaderText="Susp" 
                SortExpression="Susp">
                <ItemStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField DataField="LendingSubT" HeaderText="สายงาน" 
                SortExpression="LendingSubT">
                <ItemStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField DataField="Hub_Name_T" HeaderText="SBC" 
                SortExpression="Hub_Name_T">
                <ItemStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField DataField="CUS_DEPT_TRAN" HeaderText="Controlling unit code" 
                SortExpression="CUS_DEPT_TRAN">
                <ItemStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField DataField="DepTranT" HeaderText="Controlling Unit" 
                SortExpression="DepTranT">
                <ItemStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField DataField="BaySize" HeaderText="Cust.size" 
                SortExpression="BaySize">
                <ItemStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField DataField="YM" DataFormatString="{0:####/##}" 
                HeaderText="DASOF" SortExpression="YM" />
        </Columns>
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="DsSP_BycustomerClass" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
        SelectCommand="SP_BycustomerClass" SelectCommandType="StoredProcedure">
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
            <asp:QueryStringParameter Name="ym" QueryStringField="ym" Type="String" />
            <asp:QueryStringParameter Name="Class" QueryStringField="Class" Type="String" />
            <asp:QueryStringParameter Name="CUSTSIZE" QueryStringField="CUSTSIZE" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    
        <asp:SqlDataSource ID="SqlDataByCustomerLendingSubT" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
            SelectCommand="SP_ByCustomerClassLendingSub" 
        SelectCommandType="StoredProcedure">
            <SelectParameters>
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
                <asp:QueryStringParameter Name="ym" QueryStringField="ym" Type="String" />
                <asp:QueryStringParameter Name="Class" QueryStringField="Class" 
                    Type="String" />
                <asp:QueryStringParameter DefaultValue="" Name="CUSTSIZE" 
                    QueryStringField="CUSTSIZE" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <asp:SqlDataSource ID="SqlDataByCustomerControllingUnit" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
            SelectCommand="SP_ByCustomerClassControllingUnit" 
            SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="" Name="ROLE" SessionField="ROLE" 
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
                <asp:QueryStringParameter Name="ym" QueryStringField="ym" Type="String" />
                <asp:QueryStringParameter Name="Class" QueryStringField="Class" 
                    Type="String" />
                <asp:QueryStringParameter Name="CUSTSIZE" QueryStringField="CUSTSIZE" 
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <asp:SqlDataSource ID="SqlDataByCustomerSBC" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
            SelectCommand="SP_ByCustomerClassSBC" 
        SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="ROLE" SessionField="ROLE" Type="Byte" 
                    DefaultValue="0" />
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
                <asp:QueryStringParameter Name="ym" QueryStringField="ym" Type="String" 
                    DefaultValue="" />
                <asp:QueryStringParameter Name="Class" QueryStringField="Class" 
                    Type="String" />
                <asp:QueryStringParameter DefaultValue="" Name="CUSTSIZE" 
                    QueryStringField="CUSTSIZE" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="DS_ByCustomerClassCistsize" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
        SelectCommand="SP_ByCustomerClassCustsize" SelectCommandType="StoredProcedure">
     <SelectParameters>
                <asp:SessionParameter Name="ROLE" SessionField="ROLE" Type="Byte" 
                    DefaultValue="0" />
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
                <asp:QueryStringParameter Name="ym" QueryStringField="ym" Type="String" 
                    DefaultValue="" />
                <asp:QueryStringParameter Name="Class" QueryStringField="Class" 
                    Type="String" />
                <asp:QueryStringParameter DefaultValue="" Name="CUSTSIZE" 
                    QueryStringField="CUSTSIZE" Type="String" />
            </SelectParameters>
    </asp:SqlDataSource>
    
    </form>
</body>
</html>
