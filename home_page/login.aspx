<%@ Page Title="" Language="C#" MasterPageFile="~/home_page/homePage.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="RealEstateDemo.home_page.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table style="width: 58%; height: 147px; align-self:center; position:inherit; margin-left: 311px;">
         <tr><td class="auto-style7" colspan="3">
             <h1 style="width: 423px"> Please enter your login details:</h1> </td></tr>  
          <tr>
                <td class="auto-style2" style="width: 93px; height: 45px; color: #FF6803; font-size: 11pt;">UserName</td>
                <td class="auto-style4" style="height: 45px">
                    <asp:TextBox ID="txtUname" runat="server" Width="180px"></asp:TextBox>
                &nbsp; <asp:RequiredFieldValidator ID="UserName" runat="server" ControlToValidate="txtUname" ErrorMessage="UserName is required" style="color: #CC0000">*</asp:RequiredFieldValidator>
                </td>
                
            </tr>
            <tr>
                <td class="auto-style6" style="width: 93px; height: 53px; font-size: 11pt; color: #FF6803;">Password</td>
                <td class="auto-style9" style="height: 53px">
                    <asp:TextBox ID="txtPasswd" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                &nbsp;
                    <asp:RequiredFieldValidator ID="Passwordvalidator" runat="server" ControlToValidate="txtPasswd" ErrorMessage="Password is required" style="text-align: left; color: #FF0000;">*</asp:RequiredFieldValidator>
                </td>
                
            </tr>
            <tr>
                <td class="auto-style7" style="width: 93px; height: 55px;"></td>
                <td class="auto-style8" style="height: 55px">
                    <asp:Button ID="BtnSignin" runat="server" ForeColor="Maroon" OnClick="Button1_Click" Text="Sign in" Width="180px" />
                </td>
                <td style="height: 55px"></td>
            </tr>
         <tr><td class="auto-style10" style="width: 93px"></td><td class="auto-style11">
             <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#FF6803" NavigateUrl="~/home_page/resetpassword.aspx">Forget Password?</asp:HyperLink>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:HyperLink ID="HyperLink2" runat="server" ForeColor="#FF6803" NavigateUrl="~/home_page/registeruser.aspx">SIGNUP</asp:HyperLink>
             </td></tr>

         <tr><td class="auto-style7" style="width: 93px"></td><td class="auto-style8"><asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" style="color: #FF6803" />
             <asp:ScriptManager ID="ScriptManager1" runat="server">
             </asp:ScriptManager>
             </td></tr>
        </table>


</asp:Content>
