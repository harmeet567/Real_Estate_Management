<%@ Page Title="" Language="C#" MasterPageFile="~/home_page/homePage.Master" AutoEventWireup="true" CodeBehind="registeruser.aspx.cs" Inherits="RealEstateDemo.home_page.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="//code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function ShowHideDiv() {
            //Get dropdown selected value
            var SelectedValue = $('#<%= ddlUserType.ClientID %> option:selected').val();

            // check selected value.
            if (SelectedValue == 0) {
                //If cash is selected then hide the Div
                $('#dvShowHide').css("display", "block");
                $('#<%=txtAdminPwd.ClientID %>').val('');
                //or you can simply use jQuery hide method to hide the Div as below:
                //$('#dvShowHide').hide();           
            }
            else if (SelectedValue == 1) {
                $('#dvShowHide').css("display", "none");
                //If Cheque is selected then show the Div
                //or you can simply use jQuery show method to show the Div as below:
                //$('#dvShowHide').show();
                //Clear textboxes
                //Set focus in bank name textbox
            }
        }
    </script>


    <style type="text/css">
        .auto-style2 {
        width: 130px;
        text-align: right;
    }
        .auto-style3 {
            text-align: left;
            height: 26px;
            color: #E46B1A;
            font-size: large;
        }
        .auto-style4 {
            height: 19px;
            width: 145px;
            text-align: left;
        }
        .auto-style5 {
            text-align: left;
            width: 93px;
        }
        .auto-style6 {
            height: 19px;
            text-align: left;
            width: 93px;
        }
        .auto-style9 {
            text-align: left;
            width: 93px;
            height: 29px;
        }
        .auto-style12 {
        width: 130px;
        text-align: right;
        height: 30px;
        color: #E46B1A;
        font-size: 11pt;
    }
        .auto-style13 {
            text-align: justify;
            width: 93px;
            height:19px;
        }
        .auto-style14 {
            height: 30px;
            width: 145px;
            text-align: left;
        }
        #Reset1 {
            width: 75px;
        }
        .auto-style16 {
            width: 145px;
            text-align: left;
        }
        .auto-style18 {
            height: 29px;
            width: 145px;
            text-align: left;
        }
    .auto-style20 {
            text-align: justify;
            width: 93px;
        }
        .auto-style21 {
            width: 130px;
            text-align: right;
            color: #E46B1A;
            font-size: 11pt;
        }
        .auto-style22 {
            color: #E46B1A;
        }
    .auto-style23 {
        width: 130px;
        text-align: right;
        height: 19px;
        color: #E46B1A;
        font-size: 11pt;
    }
    .auto-style24 {
        width: 145px;
    }
    </style>

    <table style="width:99%; height: 241px; margin-left: 160px;">

        <tr>
            <td class="auto-style3" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Create Your Account<br />
            </td>
        </tr>

        <tr>
            <td class="auto-style23">User Name</td>
            <td class="auto-style6">
                <asp:TextBox ID="txtUserName" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td class="auto-style4">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName" ErrorMessage="UserName is Required" ForeColor="#CC0000" style="text-align: left" CssClass="auto-style22">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style23">E-Mail</td>
            <td class="auto-style9">
                <asp:TextBox ID="txtEmail" runat="server" Width="179px" CausesValidation="True" Height="19px"></asp:TextBox>
                 </td>
            <td class="auto-style18">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail" ErrorMessage="E-Mail is Required" ForeColor="#CC0000" Display="Dynamic" CssClass="auto-style22">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter a valid EMail " ForeColor="#CC0000" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="auto-style22">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
           <td class="auto-style21">Password</td>
            <td class="auto-style5">
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="180px" ></asp:TextBox>
            </td>
            <td class="auto-style16">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required" ForeColor="#CC0000" CssClass="auto-style22">*</asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td class="auto-style12">Confirm Password</td>
            <td class="auto-style13">
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" Height="20px" Width="180px"></asp:TextBox>
             </td>


            <td class="auto-style14">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtConfirmPassword" ErrorMessage="Confirm Password Requried" ForeColor="#CC0000" CssClass="auto-style22">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Both Passwords must be same" ForeColor="#CC0000" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" CssClass="auto-style22">*</asp:CompareValidator>
            </td>

           
        </tr>
        <tr>
            <td class="auto-style12">&nbsp;</td>
            <td class="auto-style13">
                <asp:DropDownList ID="ddlUserType" runat="server" Height="18px" Width="186px" onchange="ShowHideDiv();">
                    <asp:ListItem Value="-1">Select UserType</asp:ListItem>
                    <asp:ListItem Value="0">Admin</asp:ListItem>
                    <asp:ListItem Value="1">User</asp:ListItem>
                </asp:DropDownList>
                
                &nbsp;</td>
            <td class="auto-style24"> </td>
        </tr>
        <tr>
            <td class="auto-style12">&nbsp;</td>
            <td class="auto-style13">
                <div id="dvShowHide" style="display:none;">
                 Admin Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtAdminPwd" TextMode="Password" runat="server" Height="18px" Width="181px"></asp:TextBox>
                </div>
                &nbsp;</td>
            <td class="auto-style24"> &nbsp;</td>
        </tr>
        <tr>
            
<%--            <td class="auto-style13">
                
                <div id="dvShowHide" style="display:none;">
                 Admin Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtAdminPwd" TextMode="Password" runat="server" Height="18px" Width="181px"></asp:TextBox>
                </div>
            </td>--%>
          
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style20">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" Width="76px" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <input id="Reset1" type="reset" value="reset" />
            </td>
            <td class="auto-style24">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style20">
                
                <asp:ValidationSummary ID="ValidationSummary1" Forecolor="Red" runat="server" Height="16px" Width="221px" />
            </td>
            <td class="auto-style24">&nbsp;</td>
        </tr>
        </table>


</asp:Content>
