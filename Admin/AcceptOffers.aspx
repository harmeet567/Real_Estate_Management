<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminUser.Master" AutoEventWireup="true" CodeBehind="AcceptOffers.aspx.cs" Inherits="RealEstateDemo.Admin.AcceptOffers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="server">

        <asp:GridView ID="gvAcceptOffers" runat="server" AutoGenerateColumns = "False" HorizontalAlign="Center" CssClass="gridview"
       Font-Names = "Arial" BackColor="#DEBA84" BorderColor="#BF8E32" BorderStyle="Double" BorderWidth="1px" CellPadding="3" CellSpacing="2"  OnRowCommand="gvAcceptOffers_RowCommand" AllowSorting="True" DataKeyNames="Property_Id,UserName" DataSourceID="SqlDataSource1" >
    <Columns>

        <asp:ImageField HeaderText="Details" DataImageUrlField="Property_Address" ControlStyle-Width="200"
        ControlStyle-Height = "150"> <ControlStyle Height="150px" Width="200px"> </ControlStyle>
       </asp:ImageField>

       <asp:BoundField HeaderText="PropertyId" DataField="Property_Id" ItemStyle-Width="100px" ReadOnly="True" >
        </asp:BoundField>
       <asp:BoundField HeaderText="UserName"  DataField="UserName" ItemStyle-Width="100px" ReadOnly="True" >
        </asp:BoundField>
       <asp:BoundField HeaderText="Status"  DataField="Offer_Status" ItemStyle-Width="100px" ReadOnly="True" >
        </asp:BoundField>
       <asp:BoundField HeaderText="ActualPrice" DataField="Actual_Price" ItemStyle-Width="100px">
        </asp:BoundField>
        <asp:BoundField HeaderText="OfferedPrice" DataField="Offer_Price" ItemStyle-Width="100px">
        </asp:BoundField>

        <asp:BoundField HeaderText="OfferedDate" DataField="Offer_QuotedDate"   HtmlEncode="False" 
           DataFormatString = "{0:d}">  
        </asp:BoundField>
        <asp:ButtonField ButtonType="button" CommandName="AcceptOffer" HeaderText="Decision" Text="Accept Offer" />
       
    </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RealEstateConnectionString %>" SelectCommand="SELECT [Property_Address], [Property_Id], [UserName],[Offer_Status], [Actual_Price], [Offer_Price], [Offer_QuotedDate] FROM [Offers_Made] WHERE  Offer_QuotedDate >= DATEADD(day,-3,GETDATE())    ORDER BY [Property_Id]"></asp:SqlDataSource>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
</asp:Content>
