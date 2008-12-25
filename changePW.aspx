<%@ Page Language="VB" AutoEventWireup="false" CodeFile="changePW.aspx.vb" Inherits="changePW" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Login Customer Special Mention (SM : ง) Class By Account</title>
            <META http-equiv=Content-Type content="text/html; charset=windows-874">
     <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
     &nbsp;<br />&nbsp;<br />&nbsp;<br />&nbsp;<br />&nbsp;&nbsp;<br />&nbsp;<br />
        <table border="0" cellpadding="0" cellspacing="0" style="width:350px" align="center" >
            <tr>
                <td align="center" colspan="4" style="height: 20px; text-align: right">
                    <asp:ImageButton ID="ibBack" runat="server" ImageUrl="~/Images/btnBack.gif" /></td>
            </tr>
           <tr >
                <td colspan="4" align="center" style="height: 20px" >
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/images/login2.gif" />&nbsp;</td>
            </tr>
            <!--   <tr bgcolor="activecaption">
                <td colspan="4" align="center" height="20" >
                    <strong><span style="color: #ffffff">LOGIN</span> </strong>
                </td>
            </tr> --> 
            <tr>
                <td align="left" colspan="4" style="height: 34px; text-align: center;">
                    <strong><span style="font-size: 16pt; color: #ff3366">Change Password</span></strong></td>
            </tr>
            <tr>
                <td align="right" style="width: 162px; height: 34px">
                    <strong>Password :</strong></td>
                <td align="right" style="width: 5px; height: 34px">
                    <asp:TextBox ID="txtPW" runat="server" BorderStyle="Solid" BorderWidth="1px"
                        TextMode="Password">dtom</asp:TextBox></td>
                <td align="right" style="height: 34px">
                </td>
                <td align="left" height="22" style="width: 64px">
                </td>
            </tr>
            <tr  >
                <td  style="height: 23px; width: 162px;" align="right">          
                    <strong>Confirm Password :</strong></td>
                <td style="width: 5px; height: 23px;" align="right"  >             <asp:TextBox ID="txtConfirmPW" runat="server" TextMode="Password" BorderStyle="Solid" BorderWidth="1px" >dtom</asp:TextBox></td>
                <td style="height: 23px" align="right" >
                </td>
                <td align="left" style="width: 64px; height: 23px;" valign="middle" >
                  <asp:ImageButton ID="imbSubmit" runat="server" ImageUrl="~/Images/btnsubmit.gif" Height="24px" Width="62px"/></td>
            </tr>
            <tr>
                <td align="right" colspan="4" style="height: 34px">
                    <asp:Label ID="lblComment" runat="server" ForeColor="Blue" Text="โปรดตรวจสอบ Caps Lock และ ภาษา ก่อน Submit"></asp:Label></td>
            </tr>
            <tr  >
                <td  style="height: 34px; width: 162px;" align="right"> </td>
                <td style="width: 5px; height: 34px;" align="right"  > 
                    <asp:HyperLink ID="LinkRegister" runat="server" Visible="False">Register</asp:HyperLink></td>
                <td style="height: 34px" align="right" >     </td>
                <td align="left" height="22" style="text-align: left; width: 64px;" >
                    <asp:HyperLink ID="hplforgot" runat="server" Font-Underline="True" NavigateUrl="~/forgot.aspx" Visible="False">ลืมรหัสผ่าน</asp:HyperLink></td>
            </tr>
            <tr>
                <td colspan="4" style="height: 14px" >
                    &nbsp;
                    <br />
                    </td>
            </tr>
        </table>
        &nbsp; &nbsp;&nbsp;
        <br />
        <table style="height: 300px" align="center">
            <tr>
                <td style="height: 65px; text-align: right;" colspan="3" valign="top">
                    &nbsp;<br />
                    <br />
        <asp:Label ID="lblResult" runat="server" ForeColor="Red"></asp:Label>
        </td>
            </tr>
            <tr>
                <td colspan="3" style="text-align: left">
</td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
                <td style="width: 100px">
                    &nbsp;</td>
                <td style="width: 100px">
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
