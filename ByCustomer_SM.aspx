<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ByCustomer_SM.aspx.vb" Inherits="ByCustomer_SM" uiCulture="th-TH" Culture="th-TH" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register src="ExportControl/ExportControl.ascx" tagname="ExportControl" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Special Mention(SM:ชั้นหนี้ ง) รายลูกค้าและรายบัญชี</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript">
function chkaccountselect()
{if(document.getElementById("lblAccount").innerHTML=="")
{alert("Please Select Account");
        return false;           
}
}

 function chkDataInput()
 {var r=confirm("Are you sure to insert new status account " + document.getElementById("lblAccount").innerHTML + " ?");
 if (r==true)
 {
    if(document.getElementById("lblAccount").innerHTML=="")
    {
        alert("Please Select Account");
        return false;         
    }else if (document.getElementById("dlId_Status").options[document.getElementById("dlId_Status").selectedIndex].value == "31" && document.getElementById("txtDatePromise").value==""){
        alert("Please Input Promise Date(วันที่ลูกค้าสัญญาว่าจะจ่าย) ");        
        return false;   
    }else if (document.getElementById("dlId_Status").options[document.getElementById("dlId_Status").selectedIndex].value == "43" && document.getElementById("txtDatePromise").value==""){
        alert("Please Input Promise Date(วันที่ลูกค้าสัญญาว่าจะจ่าย) ");        
        return false;           
    }else{
    }
  }else{
        return false;
  }
 } 
 function showHideDivDatePromise(sender,target,e){
    var dlId_Status = sender;
    var divDatePromise = target;
    
    //alert(dlId_Status.options[dlId_Status.selectedIndex].value+":"+dlId_Status.options[dlId_Status.selectedIndex].text);
    
    if (dlId_Status.options[dlId_Status.selectedIndex].value == "31" || dlId_Status.options[dlId_Status.selectedIndex].value == "43"){
        changeDisplay(divDatePromise.id,"inline");
    }else{
        changeDisplay(divDatePromise.id,"none");
    }
 }
 
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
    }else if (listFilter.options[listFilter.selectedIndex].value == "CUSTSIZE"){
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
    
        <asp:Label ID="lblMainPage" runat="server" 
            Text="Data Customer Special Mention(SM : ง) " 
            style="font-weight: 700; color: #0000CC"></asp:Label>
        <br />
        <asp:Label ID="lblByCustomer" runat="server" Text="Customer" Font-Bold="True" 
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
                   <asp:ListItem Value="Office_Name">Emp.Name</asp:ListItem>
                   <asp:ListItem Value="CUSTSIZE">Cust.size</asp:ListItem>
                    </asp:DropDownList>      
        </td><td valign="top">
               <div id="divfiltertextBox" runat="server" style="display:inline;">
            <asp:TextBox ID="filterTextBox" runat="server"></asp:TextBox>
       </div>
       <div id="divdlControllingUnit" runat="server" style="display:inline;">
       <asp:DropDownList ID="dlControllingUnit" runat="server" 
            DataSourceID="SqlDataByCustomerControllingUnit" DataTextField="DepTrant" 
            DataValueField="DepTrant">
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
                   DataSourceID="SqlDataId_CustSize" DataTextField="Custsize" 
            DataValueField="id_CustSize">
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
        </table>

                    <uc1:ExportControl ID="expByCustomer" runat="server" 
            controlName="gvByCustomer" filename="ByCustomer" />
                    <asp:Panel ID="pnByCustomer" runat="server" ScrollBars="Auto" Width="790px" 
            Height="260px">
            <asp:GridView ID="gvByCustomer" runat="server" DataSourceID="SqlDataByCustomer" 
            AutoGenerateColumns="False" CellPadding="3" 
            GridLines="Horizontal" AllowPaging="True" 
            DataKeyNames="CIF" BackColor="White" BorderColor="#E7E7FF" BorderStyle="Double" 
            BorderWidth="1px" CellSpacing="1" PageSize="5" AllowSorting="True">
                            <PagerSettings Mode="NumericFirstLast" />
                            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" Wrap="False" />
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="CIF" HeaderText="CIF" SortExpression="CIF" >
                                    <ItemStyle Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" >
                                    <ItemStyle Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="TEL_HOME" HeaderText="home tel" 
                    SortExpression="TEL_HOME" >
                                    <ItemStyle Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="TEL_OFF" HeaderText="office tel" 
                    SortExpression="TEL_OFF" >
                                    <ItemStyle Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="StatusG_Eng" HeaderText="Status Cust." 
                    SortExpression="Id_StatusG" >
                                    <ItemStyle Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="TDR" HeaderText="TDR" SortExpression="TDR" >
                                    <ItemStyle Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="AGINGCUS" HeaderText="Aging" 
                    SortExpression="AGINGCUS" DataFormatString="{0:n}" >
                                    <ItemStyle Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="CLASSCUS" HeaderText="Class" 
                    SortExpression="CLASSCUS" >
                                    <ItemStyle Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="PrincipalCus" HeaderText="Principal" 
                    SortExpression="PrincipalCus" DataFormatString="{0:n}" >
                                    <ItemStyle HorizontalAlign="Right" Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="AccruCus" HeaderText="Accru" 
                    SortExpression="AccruCus" DataFormatString="{0:n}" >
                                    <ItemStyle HorizontalAlign="Right" Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="SuspCus" HeaderText="Susp" 
                    SortExpression="SuspCus" DataFormatString="{0:n}" >
                                    <ItemStyle HorizontalAlign="Right" Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="PayML3CUS" HeaderText="Payment(2 Month ago)" 
                    SortExpression="PayML2CUS" DataFormatString="{0:n}" >
                                    <ItemStyle HorizontalAlign="Right" Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="PayMCUS" HeaderText="Payment(Last Month)" 
                    SortExpression="PayMCUS" DataFormatString="{0:n}" >
                                    <ItemStyle HorizontalAlign="Right" Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="PayDCUS" 
                    HeaderText="Payment(This Month)" SortExpression="PayDCUS" 
                    DataFormatString="{0:n}" >
                                    <ItemStyle HorizontalAlign="Right" Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ORGDUEPMT" DataFormatString="{0:n}" 
                                    HeaderText="เงื่อนไขที่ต้องชำระ" />
                                <asp:BoundField DataField="TOTPASTDUE" DataFormatString="{0:n}" 
                                    HeaderText="ยอดค้างชำระที่ผ่านมา" />
                                <asp:BoundField DataField="PAYAMT" DataFormatString="{0:n}" 
                                    HeaderText="ยอดที่ต้องจ่ายในเดือนนี้" />
                                <asp:BoundField DataField="LendingSubT" HeaderText="สายงาน" 
                    SortExpression="Id_LendingSub" >
                                    <ItemStyle Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Hub_Name_T" HeaderText="SBC" 
                    SortExpression="Hub_Name_T" >
                                    <ItemStyle Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="DepTranT" HeaderText="Controlling Unit" 
                    SortExpression="DepTranT" >
                                    <ItemStyle Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Office_Name" HeaderText="Emp. Name" 
                    SortExpression="Office_Name" >
                                    <ItemStyle Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="CUSTSIZE" HeaderText="Cust. size" 
                    SortExpression="CUSTSIZE" >
                                    <ItemStyle Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="DASOFtxt" HeaderText="DASOF" 
                                    SortExpression="DASOFtxt">
                                    <ItemStyle Wrap="False" />
                                </asp:BoundField>
                            </Columns>
                            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                            <EmptyDataTemplate>
                                <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="#FF3300" 
                    Text="Data customer not found !!"></asp:Label>
                            </EmptyDataTemplate>
                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" 
                Font-Size="Small" />
                            <AlternatingRowStyle BackColor="#F7F7F7" />
                        </asp:GridView>
        </asp:Panel>
        <asp:SqlDataSource ID="SqlDataByCustomer" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
            SelectCommand="SP_ByCustomer" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="Week" QueryStringField="Week" 
                    Type="String" />
                <asp:QueryStringParameter DefaultValue="0" Name="Id_StatusG" 
                    QueryStringField="Id_StatusG" Type="String" />
                <asp:QueryStringParameter DefaultValue="0" Name="TDR" QueryStringField="TDR" 
                    Type="String" />
                <asp:SessionParameter DefaultValue="0" Name="ROLE" SessionField="ROLE" 
                    Type="Byte" />
                <asp:SessionParameter DefaultValue="0" Name="USER_ID" SessionField="USER_ID" 
                    Type="String" />
                <asp:SessionParameter Name="HUB" SessionField="HUB" Type="String" 
                    DefaultValue="0" />
                <asp:SessionParameter Name="REGION" SessionField="REGION" Type="String" 
                    DefaultValue="0" />
                <asp:SessionParameter Name="BRANCH" SessionField="BRANCH" Type="String" 
                    DefaultValue="0" />
                <asp:SessionParameter Name="DEPT" SessionField="DEPT" Type="String" 
                    DefaultValue="0" />
                <asp:QueryStringParameter DefaultValue="" Name="CUSTSIZE" 
                    QueryStringField="CUSTSIZE" Type="String" />
                <asp:QueryStringParameter DefaultValue="" Name="AgingGroup" 
                    QueryStringField="AgingGroup" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <asp:SqlDataSource ID="SqlDataByCustomerControllingUnit" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
            SelectCommand="SP_ByCustomerControllingUnit" 
            SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="Week" QueryStringField="Week" Type="String" />
                <asp:QueryStringParameter Name="Id_StatusG" QueryStringField="Id_StatusG" 
                    Type="String" />
                <asp:QueryStringParameter Name="TDR" QueryStringField="TDR" Type="String" />
                <asp:SessionParameter DefaultValue="" Name="ROLE" SessionField="ROLE" 
                    Type="Byte" />
                <asp:SessionParameter DefaultValue="0" Name="USER_ID" SessionField="USER_ID" 
                    Type="String" />
                <asp:SessionParameter DefaultValue="0" Name="HUB" SessionField="HUB" 
                    Type="String" />
                <asp:SessionParameter DefaultValue="0" Name="REGION" SessionField="REGION" 
                    Type="String" />
                <asp:SessionParameter DefaultValue="0" Name="BRANCH" SessionField="BRANCH" 
                    Type="String" />
                <asp:SessionParameter DefaultValue="0" Name="DEPT" SessionField="DEPT" 
                    Type="String" />
                <asp:QueryStringParameter Name="CUSTSIZE" QueryStringField="CUSTSIZE" 
                    Type="String" />
                <asp:QueryStringParameter DefaultValue="" Name="AgingGroup" 
                    QueryStringField="AgingGroup" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <asp:SqlDataSource ID="SqlDataId_CustSize" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
            
            SelectCommand="SELECT Id_CUSTSIZE, CUSTSIZE FROM Id_Custsize WHERE (Id_CUSTSIZE &lt;&gt; '0')">
        </asp:SqlDataSource>
    
        <asp:SqlDataSource ID="SqlDataByCustomerSBC" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
            SelectCommand="SP_ByCustomerSBC" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="Week" QueryStringField="Week" Type="String" />
                <asp:QueryStringParameter Name="Id_StatusG" QueryStringField="Id_StatusG" 
                    Type="String" />
                <asp:QueryStringParameter Name="TDR" QueryStringField="TDR" Type="String" />
                <asp:SessionParameter Name="ROLE" SessionField="ROLE" Type="Byte" 
                    DefaultValue="0" />
                <asp:SessionParameter DefaultValue="0" Name="USER_ID" SessionField="USER_ID" 
                    Type="String" />
                <asp:SessionParameter DefaultValue="0" Name="HUB" SessionField="HUB" 
                    Type="String" />
                <asp:SessionParameter DefaultValue="0" Name="REGION" SessionField="REGION" 
                    Type="String" />
                <asp:SessionParameter DefaultValue="0" Name="BRANCH" SessionField="BRANCH" 
                    Type="String" />
                <asp:SessionParameter DefaultValue="0" Name="DEPT" SessionField="DEPT" 
                    Type="String" />
                <asp:QueryStringParameter DefaultValue="" Name="CUSTSIZE" 
                    QueryStringField="CUSTSIZE" Type="String" />
                <asp:QueryStringParameter Name="AgingGroup" QueryStringField="AgingGroup" 
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <asp:SqlDataSource ID="SqlDataByCustomerLendingSubT" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
            SelectCommand="SP_ByCustomerLendingSub" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="Week" QueryStringField="Week" Type="String" />
                <asp:QueryStringParameter Name="Id_StatusG" QueryStringField="Id_StatusG" 
                    Type="String" />
                <asp:QueryStringParameter Name="TDR" QueryStringField="TDR" Type="String" />
                <asp:SessionParameter DefaultValue="0" Name="ROLE" SessionField="ROLE" 
                    Type="Byte" />
                <asp:SessionParameter DefaultValue="0" Name="USER_ID" SessionField="USER_ID" 
                    Type="String" />
                <asp:SessionParameter DefaultValue="0" Name="HUB" SessionField="HUB" 
                    Type="String" />
                <asp:SessionParameter DefaultValue="0" Name="REGION" SessionField="REGION" 
                    Type="String" />
                <asp:SessionParameter DefaultValue="0" Name="BRANCH" SessionField="BRANCH" 
                    Type="String" />
                <asp:SessionParameter DefaultValue="0" Name="DEPT" SessionField="DEPT" 
                    Type="String" />
                <asp:QueryStringParameter DefaultValue="" Name="CUSTSIZE" 
                    QueryStringField="CUSTSIZE" Type="String" />
                <asp:QueryStringParameter Name="AgingGroup" QueryStringField="AgingGroup" 
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    <asp:Label ID="lblByAccount_All" runat="server" Font-Bold="True" 
        ForeColor="#0000CC" Text="Export all accounts"></asp:Label>
    <uc1:ExportControl ID="expByAccount_All" runat="server" 
        controlName="gvByAccount_All" filename="ByAccount_All" />
    <asp:Label ID="lblByAccount" runat="server" Text="Detail Account CIF: " 
        style="font-weight: 700; color: #0000CC"></asp:Label>
    <asp:Label ID="lblCIF" runat="server" style="font-weight: 700; color: #0000CC"></asp:Label>
    <asp:Label ID="lblName" runat="server" style="font-weight: 700; color: #0000CC"></asp:Label>
    <br />
    <asp:Label ID="lblCountByAcc" runat="server"></asp:Label>
    <asp:Label ID="lblByAccPage" runat="server"></asp:Label>
                    <uc1:ExportControl ID="expByAccount" runat="server" 
            controlName="gvByAccount" filename="ByAccount" />
    <asp:GridView ID="gvByAccount" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="ACCNO" DataSourceID="SqlDataByAccount" 
        ForeColor="#333333" GridLines="None" AllowPaging="True" 
        AllowSorting="True" CellSpacing="1" PageSize="5">
        <PagerSettings Mode="NumericFirstLast" />
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" Wrap="False" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" >
                <ItemStyle Wrap="False" />
            </asp:CommandField>
            <asp:BoundField DataField="ACCNO" HeaderText="ACCNO" SortExpression="ACCNO" 
                DataFormatString="{0:000000000000#}" >
                <ItemStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField DataField="DASOFtxt" HeaderText="DASOF" 
                SortExpression="DASOFtxt" >
                <ItemStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField DataField="APP_ID" HeaderText="APP_ID" 
                SortExpression="APP_ID" >
                <ItemStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField DataField="Status_Eng" HeaderText="Status Eng" 
                SortExpression="Id_Status" >
                <ItemStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField DataField="COMMENT" HeaderText="Comment" 
                SortExpression="COMMENT" />
            <asp:BoundField DataField="Id_Branch" HeaderText="Branch code" 
                SortExpression="Id_Branch">
                <ItemStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField DataField="Branch_T" HeaderText="Branch" 
                SortExpression="Branch_T">
                <ItemStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField DataField="AgingACC" DataFormatString="{0:n}" 
                HeaderText="Aging" SortExpression="AgingACC" >
                <ItemStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField DataField="PRINCIPALACC" HeaderText="Principal" 
                SortExpression="PRINCIPALACC" DataFormatString="{0:N}" >
                <ItemStyle HorizontalAlign="Right" Wrap="False" />
            </asp:BoundField>
            <asp:BoundField DataField="ACCRUACC" HeaderText="Accru" 
                SortExpression="ACCRUACC" DataFormatString="{0:N}" >
                <ItemStyle HorizontalAlign="Right" Wrap="False" />
            </asp:BoundField>
            <asp:BoundField DataField="SUSPACC" HeaderText="Susp" 
                SortExpression="SUSPACC" DataFormatString="{0:N}" >
                <ItemStyle HorizontalAlign="Right" Wrap="False" />
            </asp:BoundField>
            <asp:BoundField DataField="PayML2ACC" DataFormatString="{0:n}" 
                HeaderText="Payment(2 Month ago)" SortExpression="PayML2ACC" >
                <ItemStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField DataField="PayMACC" DataFormatString="{0:n}" 
                HeaderText="Payment(Last Month)" SortExpression="PayMACC" >
                <ItemStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField DataField="PayDACC" DataFormatString="{0:n}" 
                HeaderText="Payment(This Month)" SortExpression="PayDACC" >
                <ItemStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField DataField="ORGDUEPMT" DataFormatString="{0:n}" 
                HeaderText="เงื่อนไขที่ต้องชำระ" SortExpression="ORGDUEPMT" />
            <asp:BoundField DataField="TOTPASTDUE" DataFormatString="{0:n}" 
                HeaderText="ยอดค้างชำระที่ผ่านมา" SortExpression="TOTPASTDUE" />
            <asp:BoundField DataField="PAYAMT" DataFormatString="{0:n}" 
                HeaderText="ยอดที่ต้องจ่ายในเดือนนี้" SortExpression="PAYAMT" />
        </Columns>
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
            Font-Size="Small" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
        <asp:SqlDataSource ID="SqlDataByAccount" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
        SelectCommand="SP_ByAccount" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="Week" QueryStringField="Week" 
                Type="String" />
            <asp:ControlParameter ControlID="gvByCustomer" DefaultValue="0" Name="CIF" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Label ID="lblSelectAccount" runat="server" Text="Account selected :" 
        style="font-weight: 700; text-decoration: underline; color: #0000CC"></asp:Label>
    <asp:Label ID="lblAccount" runat="server" 
        style="color: #FF0000; font-weight: 700"></asp:Label>
    <asp:Label ID="lblDASOFtxt" runat="server" 
        style="font-weight: 700; color: #FF0000"></asp:Label>
    <asp:Label ID="lblAPP_ID" runat="server" 
        style="font-weight: 700; color: #FF0000"></asp:Label>
    <br />
   
    <table style="width: 100%;">
        <tr>
        <td valign="top">
            &nbsp;</td>
        <td valign="top">
           <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server">
                    <table style="width: 50%;">
                        <tr>
                            <td class="style4">
                                Status
                            </td>
                            <td class="style4">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="2" valign="top">
                                <asp:DropDownList ID="dlId_Status" runat="server" 
                                    DataSourceID="SqlDataId_Status" DataTextField="Status" 
                                    DataValueField="Id_Status" 
                                                                        onchange="showHideDivDatePromise(this,ele('divDatePromise'),event);">
                                </asp:DropDownList>
                                <span class="style5">*</span></td>
                        </tr>
                        <tr>
                            <td class="style4" valign="top">
                                Promise date &nbsp;</td>
                            <td valign="top">
                                <div ID="divDatePromise" runat="server" style="display:none;">
                                    <asp:TextBox ID="txtDatePromise" runat="server" onFocus="this.blur();"></asp:TextBox>
                                    <cc1:CalendarExtender ID="calDatePromise" runat="server" Format="dd/MM/yyyy" 
                                        PopupButtonID="imbDatePromise" TargetControlID="txtDatePromise"></cc1:CalendarExtender>
                                    <asp:ImageButton ID="imbDatePromise" runat="server" 
                                        ImageUrl="~/Images/Calendar-Logo-16x16-32.ico" />
                                    <span class="style5">*</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="style4" valign="top">
                                Comment</td>
                            <td valign="top">
                                <asp:TextBox ID="txtComment" runat="server" Height="79px" TextMode="MultiLine" 
                                    Width="286px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style4" valign="top">
                                Ability to pay</td>
                            <td valign="top">
                                <asp:DropDownList ID="dlId_Abilitytopay" runat="server" 
                                    DataSourceID="SqlDataId_Abilitytopay" DataTextField="AbilityToPay" 
                                    DataValueField="Id_AbilityToPay">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataId_Abilitytopay" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
                                    SelectCommand="SELECT Id_AbilityToPay, AbilityToPay_Thai, AbilityToPay_Eng,AbilityToPay_Eng + '(' + AbilityToPay_Thai + ')'  as AbilityToPay FROM Id_AbilityToPay">
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td class="style1" valign="top" colspan="2">
                                <asp:Button ID="btAddStatus" runat="server" 
                                    OnClientClick="return chkDataInput();" Text="Insert status" />&nbsp;
                                <asp:Button ID="btCancle" runat="server" Text="Cancle" />
                            </td>
                        </tr>
                    </table>
                </asp:View>
                <asp:View ID="View2" runat="server">
                                    <asp:Button ID="btAddNewStatus" runat="server" Text="Add New Status" OnClientClick="return chkaccountselect();"/>
                                    <br />
                                    <asp:Label ID="lblHistoryStatus" runat="server" 
                        style="color: #0000CC; font-weight: 700; text-decoration: underline;" 
                        Text="Account status history (ประวัติสถานะบัญชีที่เลือก สถานะล่าสุดอยู่บนสุด)"></asp:Label>
                    <asp:GridView ID="gvAccount_Status" runat="server" AllowPaging="True" 
                        AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
                        BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                        DataSourceID="SqlDataAccount_Status" GridLines="Horizontal">
                        <PagerSettings Mode="NumericFirstLast" />
                        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                        <Columns>
                            <asp:BoundField DataField="UP_DT" HeaderText="Add date" 
                                SortExpression="UP_DT" />
                            <asp:BoundField DataField="Status_ENG" HeaderText="Status_ENG" 
                                SortExpression="Status_ENG" />
                            <asp:BoundField DataField="Status_Thai" HeaderText="Status_Thai" 
                                SortExpression="Status_Thai" />
                            <asp:BoundField DataField="DatePromise" HeaderText="Promise Date" 
                                SortExpression="DatePromise" />
                            <asp:BoundField DataField="COMMENT" HeaderText="COMMENT" 
                                SortExpression="COMMENT" />
                            <asp:BoundField DataField="AbilityToPay_Eng" HeaderText="Ability to pay" 
                                SortExpression="AbilityToPay_Eng" />
                            <asp:BoundField DataField="EMP_DT" HeaderText="Emp. Id Update" 
                                SortExpression="EMP_DT" />
                            <asp:BoundField DataField="EMPNAME" HeaderText="Name Emp.  Update" 
                                SortExpression="EMPNAME" />
                        </Columns>
                        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                        <EmptyDataTemplate>
                            <asp:Label ID="lbEmptydata" runat="server" ForeColor="Red" 
                                Text="Data account status history not found !!"></asp:Label>
                        </EmptyDataTemplate>
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" Font-Size="Small" 
                            ForeColor="#F7F7F7" />
                        <AlternatingRowStyle BackColor="#F7F7F7" />
                    </asp:GridView>

                </asp:View>
                 <asp:View ID="View3" runat="server">
                 
                     <asp:GridView ID="gvByAccount_All" runat="server" AllowPaging="True" 
                         AutoGenerateColumns="False" DataKeyNames="ACCNO" 
                         DataSourceID="SqlDataByAccount_Role" PageSize="2">
                         <RowStyle Wrap="False" />
                         <Columns>
                             <asp:BoundField DataField="CIF" HeaderText="CIF" />
                             <asp:BoundField DataField="Name" HeaderText="Name" />
                             <asp:BoundField DataField="ACCNO" HeaderText="ACCNO" SortExpression="ACCNO">
                                 <ItemStyle Wrap="False" />
                             </asp:BoundField>
                             <asp:BoundField DataField="APP_ID" HeaderText="APP_ID" SortExpression="APP_ID">
                                 <ItemStyle Wrap="False" />
                             </asp:BoundField>
                             <asp:BoundField DataField="DASOFtxt" HeaderText="DASOF" 
                                 SortExpression="DASOFtxt">
                                 <ItemStyle Wrap="False" />
                             </asp:BoundField>
                             <asp:BoundField DataField="StatusG_Eng" HeaderText="Status Cus">
                                 <ItemStyle Wrap="False" />
                             </asp:BoundField>
                             <asp:BoundField DataField="Status_Eng" HeaderText="Status Acc" 
                                 SortExpression="Id_Status" />
                             <asp:BoundField DataField="DatePromise" DataFormatString="{0:dd/MM/yyyy}" 
                                 HeaderText="DatePromise" SortExpression="DatePromise" />
                             <asp:BoundField DataField="COMMENT" HeaderText="Comment" 
                                 SortExpression="COMMENT" />
                             <asp:BoundField DataField="Id_Branch" HeaderText="Branch code" 
                                 SortExpression="Id_Branch">
                                 <ItemStyle Wrap="False" />
                             </asp:BoundField>
                             <asp:BoundField DataField="Branch_T" HeaderText="Branch" 
                                 SortExpression="Branch_T">
                                 <ItemStyle Wrap="False" />
                             </asp:BoundField>
                             <asp:BoundField DataField="AgingACC" DataFormatString="{0:n}" 
                                 HeaderText="Aging" SortExpression="AgingACC">
                                 <ItemStyle Wrap="False" />
                             </asp:BoundField>
                             <asp:BoundField DataField="PRINCIPALACC" DataFormatString="{0:N}" 
                                 HeaderText="Principal" SortExpression="PRINCIPALACC">
                                 <ItemStyle HorizontalAlign="Right" Wrap="False" />
                             </asp:BoundField>
                             <asp:BoundField DataField="ACCRUACC" DataFormatString="{0:N}" 
                                 HeaderText="Accru" SortExpression="ACCRUACC">
                                 <ItemStyle HorizontalAlign="Right" Wrap="False" />
                             </asp:BoundField>
                             <asp:BoundField DataField="SUSPACC" DataFormatString="{0:N}" HeaderText="Susp" 
                                 SortExpression="SUSPACC">
                                 <ItemStyle HorizontalAlign="Right" Wrap="False" />
                             </asp:BoundField>
                             <asp:BoundField DataField="PayML2ACC" DataFormatString="{0:n}" 
                                 HeaderText="Payment(2 Month ago)" SortExpression="PayML2ACC">
                                 <ItemStyle Wrap="False" />
                             </asp:BoundField>
                             <asp:BoundField DataField="PayMACC" DataFormatString="{0:n}" 
                                 HeaderText="Payment(Last Month)" SortExpression="PayMACC">
                                 <ItemStyle Wrap="False" />
                             </asp:BoundField>
                             <asp:BoundField DataField="PayDACC" DataFormatString="{0:n}" 
                                 HeaderText="Payment(This Month)" SortExpression="PayDACC">
                                 <ItemStyle Wrap="False" />
                             </asp:BoundField>
                             <asp:BoundField DataField="ORGDUEPMT" HeaderText="เงื่อนไขที่ต้องชำระ" 
                                 SortExpression="ORGDUEPMT" DataFormatString="{0:n}" />
                             <asp:BoundField DataField="TOTPASTDUE" HeaderText="ยอดค้างชำระที่ผ่านมา" 
                                 SortExpression="TOTPASTDUE" DataFormatString="{0:n}" />
                             <asp:BoundField DataField="PAYAMT" HeaderText="ยอดที่ต้องจ่ายในเดือนนี้" 
                                 SortExpression="PAYAMT" DataFormatString="{0:n}" />
                             <asp:BoundField DataField="LendingSubT" HeaderText="สายงาน">
                                 <ItemStyle Wrap="False" />
                             </asp:BoundField>
                             <asp:BoundField DataField="Hub_Name_T" HeaderText="SBC">
                                 <ItemStyle Wrap="False" />
                             </asp:BoundField>
                             <asp:BoundField DataField="DeptFlag" HeaderText="Dept Flag">
                                 <ItemStyle Wrap="False" />
                             </asp:BoundField>
                             <asp:BoundField DataField="Id_DepTran" HeaderText="Controlling Unit Code">
                                 <ItemStyle Wrap="False" />
                             </asp:BoundField>
                             <asp:BoundField DataField="DepTranT" HeaderText="Controlling Unit">
                                 <ItemStyle Wrap="False" />
                             </asp:BoundField>
                         </Columns>
                         <HeaderStyle Font-Size="Small" />
                     </asp:GridView>
                 
                 </asp:View>
            </asp:MultiView>
        </td>
        <td valign="top">
            &nbsp;</td>
        </tr>
    </table>    
    
    
    <asp:SqlDataSource ID="SqlDataId_Status" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
        
            
        SelectCommand="SELECT [Id_Status], [Status_Thai], [Status_Eng], [id_StatusG], [StatusG_Thai], [StatusG_Eng], [Status] FROM [V_Id_Status] WHERE ([Id_Status] &lt;&gt; @Id_Status)">
        <SelectParameters>
            <asp:Parameter DefaultValue="99" Name="Id_Status" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataAccount_Status" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
        
        
            SelectCommand="SELECT SeqNO, CIF, ACCNO, APP_ID, DASOFtxt, DASOF, Id_StatusG, StatusG_Thai, StatusG_Eng, Id_Status, Status_Thai, Status_Eng, DatePromise, COMMENT, Id_AbilityToPay, AbilityToPay_Thai, AbilityToPay_Eng, UP_DT, EMP_DT, EMPNAME FROM V_Account_Status_ALL WHERE (ACCNO = @ACCNO) AND (APP_ID = @APP_ID) ORDER BY SeqNO DESC">
        <SelectParameters>
            <asp:ControlParameter ControlID="gvByAccount" Name="ACCNO" PropertyName="SelectedValue" 
                DefaultValue="0" Type="String" />
            <asp:ControlParameter ControlID="lblAPP_ID" Name="APP_ID" 
                PropertyName="Text" DefaultValue="" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
        <asp:SqlDataSource ID="SqlDataByAccount_Role" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Special_MentionConnectionString %>" 
        SelectCommand="SP_ByAccount_ROLE" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="Week" QueryStringField="Week" Type="String" />
                <asp:QueryStringParameter Name="Id_StatusG" QueryStringField="Id_StatusG" 
                    Type="String" />
                <asp:QueryStringParameter Name="TDR" QueryStringField="TDR" Type="String" />
                <asp:SessionParameter DefaultValue="" Name="ROLE" SessionField="ROLE" 
                    Type="Byte" />
                <asp:SessionParameter DefaultValue="" Name="USER_ID" SessionField="USER_ID" 
                    Type="String" />
                <asp:SessionParameter DefaultValue="0" Name="HUB" SessionField="HUB" 
                    Type="String" />
                <asp:SessionParameter DefaultValue="0" Name="REGION" SessionField="REGION" 
                    Type="String" />
                <asp:SessionParameter DefaultValue="0" Name="BRANCH" SessionField="BRANCH" 
                    Type="String" />
                <asp:SessionParameter DefaultValue="0" Name="DEPT" SessionField="DEPT" 
                    Type="String" />
                <asp:QueryStringParameter DefaultValue="0" Name="CUSTSIZE" 
                    QueryStringField="CUSTSIZE" Type="String" />
                <asp:QueryStringParameter DefaultValue="0" Name="AgingGroup" 
                    QueryStringField="AgingGroup" Type="String" />
            </SelectParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
