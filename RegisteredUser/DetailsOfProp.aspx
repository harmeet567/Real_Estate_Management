<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetailsOfProp.aspx.cs" Inherits="RealEstateDemo.RegisteredUser.DetailsOfProp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 1px;
        }
        .auto-style3 {
            width: 108px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <asp:Panel ID="Panel1" runat="server">
        <table class="auto-style1">
            
            <tr>
                <td rowspan="6">
                    &nbsp;</td>
                <td class="auto-style3">Bedrooms</td>
                <td>
                    <asp:TextBox ID="txtBed" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Bathrooms</td>
                <td>
                    <asp:TextBox ID="txtBath" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Indore Parking</td>
                <td>
                    <asp:TextBox ID="txtParking" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Swimming Pool</td>
                <td>
                    <asp:TextBox ID="txtPool" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Child Play</td>
                <td>
                    <asp:TextBox ID="txtChildPlay" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Gym</td>
                <td>
                    <asp:TextBox ID="txtGym" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
    </asp:Panel>
    </div>
        
        
    </form>
</body>
</html>
