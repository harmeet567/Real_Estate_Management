<%@ Page Title="" Language="C#" MasterPageFile="RegisteredUser.Master" AutoEventWireup="true" CodeBehind="UserPage.aspx.cs" Inherits="RealEstateDemo.UserPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 </asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<asp:Label ID="Label1" runat="server" Text="Label" ForeColor="Brown" Font-Size="Medium" Font-Names="string" ></asp:Label>

    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 107px;
        }
        .auto-style2 {
            width: 199px;
        }
        .auto-style3 {
            width: 200px;
        }
        .auto-style4 {
            width: 399px;
        }
    </style>
    <br />

            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:DropDownList ID="DropDown_Region" runat="server" AutoPostBack="true" BackColor="White" DataTextField="Region_Name" DataValueField="Region_Id" OnSelectedIndexChanged="RegionsList_SelectedIndexChanged1" Height="16px" Width="190px">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style3">
                        <asp:DropDownList ID="DropDown_SubRegion" DataTextField="SubRegion_Name" DataValueField="SubRegion_Id"  runat="server" Height="16px" Width="190px">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style4">
                        <asp:DropDownList ID="DropDown_Purpose"   runat="server" AutoPostBack="true" Height="16px" Width="190px" OnSelectedIndexChanged="DropDown_Purpose_SelectedIndexChanged">
                            <asp:ListItem Value="-1">Select Purpose</asp:ListItem>
                            <asp:ListItem>Rent</asp:ListItem>
                            <asp:ListItem>Buy</asp:ListItem>
                            <asp:ListItem>Lease</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:DropDownList ID="DropDown_PropType" runat="server"  DataTextField="Property_Type" Height="16px" Width="190px">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style3">
                        <asp:DropDownList ID="DropDown_NoOfBedRooms" DataTextField="No_Of_Bedrooms" runat="server" Height="16px" Width="190px">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style4">
                        <asp:DropDownList ID="DropDown_NoOfBathRooms" DataTextField="No_Of_BathRooms" runat="server" Height="16px" Width="190px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:DropDownList ID="DropDown_LowerPriceLimit"  DataTextField="Price" runat="server" Height="16px" Width="190px">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style3">
                        <asp:DropDownList ID="DropDown_UpperPriceLimit"  DataTextField="Price"  runat="server" Height="16px" Width="190px">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style4">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2"></td>
                    <td class="auto-style3">
                        <asp:Button ID="SearchButton" runat="server" OnClick="Search_Click" style="margin-left: 27px" Text="Search" Width="147px" />
                    </td>
                    <td class="auto-style4"></td>
                </tr>
            </table>--%>
</asp:Content>
