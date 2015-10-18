<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminUser.Master" AutoEventWireup="true" CodeBehind="UploadProperties.aspx.cs" Inherits="RealEstateDemo.Admin.UploadProperties" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
     table, th, td {
         /*border: 1px solid black;*/
         color: brown;
         font-family:Verdana;
         font-size:medium;
       }
        .auto-style2 {
            width: 18px;
        }
        .auto-style5 {
            width: 18px;
            height: 22px;
        }
        .auto-style6 {
            height: 22px;
        }
        .auto-style8 {
            text-align: right;
        }
        .auto-style9 {
            width: 234px;
            text-align: right;
        }
        .auto-style16 {
            width: 234px;
            text-align: right;
            height: 30px;
        }
        .auto-style17 {
            width: 18px;
            height: 30px;
        }
        .auto-style18 {
            height: 30px;
        }
        .auto-style19 {
            width: 234px;
            text-align: right;
            height: 36px;
        }
        .auto-style20 {
            width: 18px;
            height: 36px;
        }
        .auto-style21 {
            height: 36px;
        }
        .auto-style22 {
            width: 234px;
            height: 21px;
            text-align: right;
        }
        .auto-style23 {
            width: 18px;
            height: 21px;
        }
        .auto-style24 {
            height: 21px;
        }
        .auto-style25 {
            width: 234px;
            text-align: right;
            height: 32px;
        }
        .auto-style26 {
            width: 18px;
            height: 32px;
        }
        .auto-style27 {
            height: 32px;
        }
        .auto-style28 {
            width: 234px;
            text-align: right;
            height: 50px;
        }
        .auto-style29 {
            width: 18px;
            height: 50px;
        }
        .auto-style30 {
            height: 50px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="server">
    <p>
        <br />
    </p>
    <asp:Panel ID="PropertyUploadPanel" runat="server" Height="340px">
        <table style="width: 100%;">
            <tr>
                <td class="auto-style28">Address</td>
                <td class="auto-style29">
                    <asp:TextBox ID="txtAddress" runat="server" Height="36px" Width="196px"></asp:TextBox>
                </td>
                <td class="auto-style30"></td>
            </tr>
            <tr>
                <td class="auto-style22">Bedrooms</td>
                <td class="auto-style23">
                    <asp:DropDownList ID="DropDown_Beds" runat="server" Height="25px" Width="204px">
                        <asp:ListItem Selected="True" Value="1"></asp:ListItem>
                        <asp:ListItem Value="2"></asp:ListItem>
                        <asp:ListItem Value="3"></asp:ListItem>
                        <asp:ListItem Value="4"></asp:ListItem>
                        <asp:ListItem Value="5"></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style24"></td>
            </tr>
            <tr>
                <td class="auto-style19">Bathrooms</td>
                <td class="auto-style20">
                    <asp:DropDownList ID="DropDown_Bath" runat="server" Height="25px" Width="204px">
                        <asp:ListItem Selected="True" Value="1"></asp:ListItem>
                        <asp:ListItem Value="2"></asp:ListItem>
                        <asp:ListItem Value="3"></asp:ListItem>
                        <asp:ListItem Value="4"></asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style21"></td>
            </tr>
            <tr>
                <td class="auto-style16">Area&nbsp; (in Sq.Ft )</td>
                <td class="auto-style17">
                    <asp:TextBox ID="txtAreaInSft" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td class="auto-style18"></td>
            </tr>
            <tr>
                <td class="auto-style25">Price (in CAD)</td>
                <td class="auto-style26">
                    <asp:TextBox ID="txtPrice" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td class="auto-style27"></td>
            </tr>
            <tr>
                <td class="auto-style16">Region</td>
                <td class="auto-style17">
                    <asp:DropDownList ID="DropDown_Region" runat="server" AutoPostBack="true" DataTextField="Region_Name" DataValueField="Region_Id" Height="25px" Width="204px" OnSelectedIndexChanged="DropDown_Region_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
                <td class="auto-style18"></td>
            </tr>
            <tr>
                <td class="auto-style19">Sub-Region</td>
                <td class="auto-style20">
                    <asp:DropDownList ID="DropDown_SubRegion" runat="server" DataTextField="SubRegion_Name" DataValueField="SubRegion_Id" Height="25px" Width="204px">
                    </asp:DropDownList>
                </td>
                <td class="auto-style21"></td>
            </tr>
            <tr>
                <td class="auto-style16">Purpose</td>
                <td class="auto-style17">
                    <asp:DropDownList ID="DropDown_Purpose" runat="server" Height="25px" Width="204px">
                        <asp:ListItem Value="Rent"></asp:ListItem>
                        <asp:ListItem Value="Buy"></asp:ListItem>
                        <asp:ListItem Value="Lease"></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style18"></td>
            </tr>
            <tr>
                <td class="auto-style8">Property Type</td>
                <td class="auto-style5">
                    <asp:DropDownList ID="DropDown_PropType" runat="server" Height="25px" Width="204px">
                        <asp:ListItem Value="Residential"></asp:ListItem>
                        <asp:ListItem Value="Condo"></asp:ListItem>
                        <asp:ListItem Value="Villa"></asp:ListItem>
                        <asp:ListItem Value="Commercial"></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style6">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style16">Image of Property </td>
                <td class="auto-style17">
                    <asp:FileUpload ID="BrowseImage" runat="server" style="margin-left: 0px" Width="208px" />
                </td>
                <td class="auto-style18"></td>
            </tr>
            <tr>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style2">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" Width="205px" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </asp:Panel>

</asp:Content>
