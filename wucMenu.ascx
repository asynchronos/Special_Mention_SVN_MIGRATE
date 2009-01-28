<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucMenu.ascx.vb" Inherits="wucMenu" %>
<asp:Menu ID="Menu1" runat="server" Orientation="Horizontal" Font-Bold="True">
    <StaticMenuItemStyle BorderWidth="1px" />
    <Items>
        <asp:MenuItem NavigateUrl="~/Summary.aspx" Text="Summary SM" 
            Value="Summary SM">
        </asp:MenuItem>
        <asp:MenuItem NavigateUrl="~/SummaryMovement.aspx" Text="Movement SM" 
            Value="Movement SM"></asp:MenuItem>
        <asp:MenuItem NavigateUrl="~/changePW.aspx" Text="Change password" 
            Value="Change password"></asp:MenuItem>
        <asp:MenuItem NavigateUrl="~/logout.aspx" Text="log out" Value="log out">
        </asp:MenuItem>
    </Items>
</asp:Menu>
