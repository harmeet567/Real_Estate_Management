<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="RealEstateDemo.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SearchContentPlaceHolder" runat="server">
    &nbsp;<asp:Panel ID="SearchPanel" runat="server" BackColor="White" BorderColor="#66FFFF" BorderStyle="Solid" Height="248px" style="margin-top: 0px" Width="779px">
        <br />
        <asp:DropDownList ID="RegionsList" runat="server" AutoPostBack="true" BackColor="White" DataTextField="Region_Name" DataValueField="Region_Id" Height="16px" OnSelectedIndexChanged="RegionsList_SelectedIndexChanged1" Width="180px">
        </asp:DropDownList>
        <asp:DropDownList ID="SubRegionsList" runat="server" DataTextField="SubRegion_Name" DataValueField="SubRegion_Id" Height="17px" style="margin-left: 27px" Width="180px">
        </asp:DropDownList>
        <asp:DropDownList ID="Purpose" runat="server" Height="17px" style="margin-left: 17px" Width="183px">
            <asp:ListItem Value="For Rent"></asp:ListItem>
            <asp:ListItem Value="For Sale"></asp:ListItem>
            <asp:ListItem Value="For Lease"></asp:ListItem>
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br /><br /><asp:DropDownList ID="PropertyTypeList" runat="server" DataTextField="Property_Type" Height="16px" style="margin-left: 0px; margin-top: 0px" Width="182px">
        </asp:DropDownList>
        <asp:DropDownList ID="Bedrooms" runat="server" DataTextField="No_Of_Bedrooms" Height="16px" style="margin-left: 27px" Width="135px">
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:ImageButton ID="BedButton" runat="server" Height="27px" ImageUrl="~/Images/Bed1.jpg" style="margin-left: 0px; margin-top: 4px" Width="18px" />
        &nbsp;
        <asp:DropDownList ID="Bathrooms" runat="server" DataTextField="No_Of_Bathrooms" Height="16px" style="margin-left: 20px" Width="183px">
        </asp:DropDownList>
        <br />
        <br />
        <asp:DropDownList ID="LowerPriceLimit" runat="server" DataTextField="Price" Height="16px" TabIndex="-1" Width="181px">
        </asp:DropDownList>
        <asp:DropDownList ID="UpperPriceLimit" runat="server" DataTextField="Price" Height="16px" style="margin-left: 30px" Width="176px">
        </asp:DropDownList>
        <asp:TextBox ID="txtCalendarValue" runat="server" style="margin-left: 22px" Width="139px"></asp:TextBox>
        <asp:ImageButton ID="CalendarIcon" runat="server" ImageUrl="~/Images/Calendar.jpg" OnClick="CalendarIcon_Click" style="margin-left: 10px" Width="20px" />
        <br />
        <br />
        <asp:CheckBox ID="Schools" runat="server"  Text="School" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:CheckBox ID="Shopping" runat="server"  Text="Shopping" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:CheckBox ID="CheckBox2" runat="server" Text="Hospital" />
        &nbsp;<br />
        <br />
        <asp:Button ID="Search" runat="server" OnClick="Search_Click" style="margin-left: 96px" Text="Search" Width="174px" />
        <asp:Calendar ID="Calendar1" runat="server" BorderStyle="Double" Caption="Listed Since" OnSelectionChanged="Calendar1_SelectionChanged" style="margin-left: 411px" Width="196px">
            <DayHeaderStyle BackColor="#66FFFF" ForeColor="Black" />
        </asp:Calendar>
        <br />
        <br />
        <br />
        <br />
        <br />
    </asp:Panel>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br />
<br />
    <br />
    <br />
    <br />
<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br />
<br />
<br />
<br />
</asp:Content>
