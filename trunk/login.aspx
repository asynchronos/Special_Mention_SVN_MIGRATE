<%@ Page Language="VB" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Customer Special Mention (SM : ง) Class By Account</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
     &nbsp;<br />&nbsp;<br />&nbsp;<br />&nbsp;<br />&nbsp;&nbsp;<br />&nbsp;<br />
        <table border="0" cellpadding="0" cellspacing="0" style="width: 280px" align="center" >
           <tr >
                <td colspan="4" align="center" style="height: 20px" >
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/images/login2.gif" />&nbsp;</td>
            </tr>
            <tr >
                <td  align="right" style="width: 90px;height: 34px;" > 
                    <strong>user :</strong></td>
                <td >   <asp:textbox ID="txtUsername" runat=server BorderStyle="Solid" BorderWidth="1px" MaxLength="6" ></asp:textbox></td>
                <td  colspan="2" align="right" >                </td>
            </tr>
            <tr  >
                <td  style="height: 34px; width: 90px;" align="right">          
                    <strong>Password:</strong></td>
                <td style="width: 5px; height: 34px;" align="right"  >             <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" BorderStyle="Solid" BorderWidth="1px" >dtom</asp:TextBox></td>
                <td style="height: 34px" align="right" >
                </td>
                <td align="right" height="22" style="width: 64px" >
                    &nbsp;<asp:ImageButton ID="imbLogin" runat="server" ImageUrl="images/btnlogin.gif"/></td>
            </tr>
            <tr>
                <td align="right" colspan="4" style="height: 34px">
                    <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="** กรณีเข้าระบบครั้งแรก รหัสผ่านใส่เลขที่บัตรประชาชน **" Visible="False"></asp:Label></td>
            </tr>
            <tr  >
                <td  style="height: 34px; width: 90px;" align="right"> </td>
                <td style="width: 5px; height: 34px;" align="right"  > 
                    <asp:HyperLink ID="LinkRegister" runat="server" Visible="False">Register</asp:HyperLink></td>
                <td style="height: 34px" align="right" >     </td>
                <td align="right" height="22" style="text-align: left; width: 64px;" >
                    <asp:HyperLink ID="hplforgot" runat="server" Font-Underline="True" NavigateUrl="~/forgot.aspx" Visible="False">ลืมรหัสผ่าน</asp:HyperLink></td>
            </tr>
        </table>
        <br /> 
        <table align="center">
                    <tr>
                <td>                
                    <asp:HyperLink ID="hldownloadManual" runat="server" 
                        NavigateUrl="~/Downloads/คู่มือวิธีการกรอกSpecialMention.ppt">Download 
                    คุ่มือการใช้งานระบบ Customer special mention</asp:HyperLink><br /><br />
                   -หากต้องการขอ user ใหม่<br /> 
                     พนักงาน SME และศูนย์ SME ติดต่อ 3198 (คุณสมศักดิ์) (lotusnote:Somsak Wongsupaluck/BAY@BAY)<br />  
                   -กรณีมีปัญหาในการใช้งาน ติดต่อ 1745 (กนกศักดิ์) (lotusnote: jkanoksa)<br />                    
                    <br />
                    </td>
            </tr>
        </table>
        <table style="height: 300px" align="center">
            <tr>
                <td style="height: 65px; text-align: right;" colspan="3" valign="top">
                    &nbsp;<br />
                    <br />
        <asp:Label ID="lblIDCARD" runat="server" ForeColor="Red"></asp:Label>
        <asp:Label ID="lblInvalid" runat="server" ForeColor="Red"></asp:Label></td>
            </tr>
            <tr>
                <td colspan="3" style="text-align: left" valign="top">
                    &nbsp;</td>
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
