<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucMenu.ascx.vb" Inherits="wucMenu" %>
<asp:Menu ID="Menu1" runat="server" Orientation="Horizontal" Font-Bold="True">
    <StaticMenuStyle BorderWidth="1px" />
    <StaticSelectedStyle BorderWidth="1px" />
    <StaticMenuItemStyle BorderWidth="1px" />
    <StaticHoverStyle BorderWidth="1px" />
    <Items>
        <asp:MenuItem Text="Special Mention(SM)" 
            Value="Special Mention" Selectable="False">
            <asp:MenuItem NavigateUrl="~/Summary.aspx" Text="Summary SM" Value="Summary SM">
            </asp:MenuItem>
            <asp:MenuItem NavigateUrl="~/SummaryMovement.aspx" Text="Movement SM" 
                Value="Movement SM"></asp:MenuItem>
        </asp:MenuItem>
        <asp:MenuItem Text="Loans portfolio" 
            Value="Summary Class" Selectable="False">
            <asp:MenuItem NavigateUrl="~/SummaryClassYear.aspx" Text="Summary class by controlling unit" 
                Value="Summary by class"></asp:MenuItem>
        </asp:MenuItem>
        <asp:MenuItem NavigateUrl="~/changePW.aspx" Text="Change password" 
            Value="Change password"></asp:MenuItem>
        <asp:MenuItem NavigateUrl="~/logout.aspx" Text="log out" Value="log out">
        </asp:MenuItem>
    </Items>
</asp:Menu>
