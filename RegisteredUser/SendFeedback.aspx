<%@ Page Title="" Language="C#" MasterPageFile="RegisteredUser.Master" AutoEventWireup="true" CodeFile="SendFeedback.aspx.cs" Inherits="RealEstateDemo.RegisteredUser.SendFeedback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            text-align: right;
            width: 265px;
        }
        .auto-style3 {
            width: 210px;
        }
        .auto-style5 {
            text-align: right;
            width: 199px;
            color: rgb(0, 0, 0);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style5">First&nbsp; Name</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtFirstName" runat="server" Width="199px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="FirstNameValidator" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First Name is required" ForeColor="#990000">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">Last&nbsp; Name</td>
                <td>
                    <asp:TextBox ID="txtLastName" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="LastNameValidator" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last Name is required" ForeColor="#990000">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">Email</td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required" ForeColor="#990000">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is not valid" ForeColor="#990000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">Comments</td>
                <td>
                    <asp:TextBox ID="txtComments" runat="server" Height="87px" Width="201px" TextMode="MultiLine" ></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtComments" ErrorMessage="Comments required for feedback" ForeColor="#990000">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td colspan="2">
                    <asp:Button ID="btnSubmitFeedback" runat="server" style="margin-left: 37px" Text="Submit" Width="115px" OnClick="btnSubmitFeedback_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td colspan="2">
                    <asp:ValidationSummary ID="Submit_ValidationSummary" runat="server" ForeColor="Maroon" />
                </td>
            </tr>
        </table>
    </p>
    <p>
    </p>
</asp:Content>
