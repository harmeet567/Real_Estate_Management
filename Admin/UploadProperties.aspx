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
        .auto-style10 {
            width: 234px;
            height: 15px;
            text-align: right;
        }
        .auto-style11 {
            width: 18px;
            height: 15px;
        }
        .auto-style12 {
            height: 15px;
        }
        .auto-style13 {
            width: 234px;
            height: 19px;
            text-align: right;
        }
        .auto-style14 {
            width: 18px;
            height: 19px;
        }
        .auto-style15 {
            height: 19px;
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
                <td class="auto-style9">Address</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtAddress" runat="server" Height="36px" Width="196px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">Bedrooms</td>
                <td class="auto-style11">
                    <asp:DropDownList ID="DropDown_Beds" runat="server" Height="25px" Width="204px">
                        <asp:ListItem Selected="True" Value="1"></asp:ListItem>
                        <asp:ListItem Value="2"></asp:ListItem>
                        <asp:ListItem Value="3"></asp:ListItem>
                        <asp:ListItem Value="4"></asp:ListItem>
                        <asp:ListItem Value="5"></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style12"></td>
            </tr>
            <tr>
                <td class="auto-style9">Bathrooms</td>
                <td class="auto-style2">
                    <asp:DropDownList ID="DropDown_Bath" runat="server" Height="25px" Width="204px">
                        <asp:ListItem Selected="True" Value="1"></asp:ListItem>
                        <asp:ListItem Value="2"></asp:ListItem>
                        <asp:ListItem Value="3"></asp:ListItem>
                        <asp:ListItem Value="4"></asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style13">Area&nbsp; (in Sq.Ft )</td>
                <td class="auto-style14">
                    <asp:TextBox ID="txtAreaInSft" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td class="auto-style15"></td>
            </tr>
            <tr>
                <td class="auto-style9">Price (in CAD)</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtPrice" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style9">Region</td>
                <td class="auto-style2">
                    <asp:DropDownList ID="DropDown_Region" runat="server" AutoPostBack="true" DataTextField="Region_Name" DataValueField="Region_Id" Height="25px" Width="204px" OnSelectedIndexChanged="DropDown_Region_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style9">Sub-Region</td>
                <td class="auto-style2">
                    <asp:DropDownList ID="DropDown_SubRegion" runat="server" DataTextField="SubRegion_Name" DataValueField="SubRegion_Id" Height="25px" Width="204px">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style9">Purpose</td>
                <td class="auto-style2">
                    <asp:DropDownList ID="DropDown_Purpose" runat="server" Height="25px" Width="204px">
                        <asp:ListItem Value="Rent"></asp:ListItem>
                        <asp:ListItem Value="Buy"></asp:ListItem>
                        <asp:ListItem Value="Lease"></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
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
                <td class="auto-style9">Image of Property </td>
                <td class="auto-style2">
                    <asp:FileUpload ID="BrowseImage" runat="server" style="margin-left: 0px" Width="208px" />
                </td>
                <td>&nbsp;</td>
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
