<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CalculateEMI.aspx.cs" Inherits="RealEstateDemo.CalculateEMI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            width: 261px;
            text-align: right;
        }
    </style>
</head>
<body>
<form id="form1" runat="server">

    <table class="auto-style1">
        <tr>
            <td class="auto-style3">Loan Amount</td>
            <td>
                <asp:TextBox ID="txtLoanAmount" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Loan Tenure (In Years)</td>
            <td>
                <asp:TextBox ID="txtTenure" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Interest</td>
            <td>
                <asp:TextBox ID="txtInterest" runat="server" > </asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" OnClick="button1_Click" Text="Calculate" Width="109px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style3">EMI</td>
            <td>
                <asp:TextBox ID="txtEMIAmount" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>

</form>
</body>
</html>
