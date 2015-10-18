<%@ Page Title="" Language="C#" MasterPageFile="RegisteredUser.Master" AutoEventWireup="true" CodeBehind="ViewOfferStatus.aspx.cs" Inherits="RealEstateDemo.RegisteredUser.ViewOfferStatus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT [Property_Id], [Property_Address], [Offer_Status],[Offer_QuotedDate], [Offer_AcceptedDate] FROM [Offers_Made] WHERE ([UserName] = @UserName)">
        <SelectParameters>
            <asp:SessionParameter Name="UserName" SessionField="UserName" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="Double" BorderWidth="2px" CellPadding="3" CellSpacing="2" DataSourceID="SqlDataSource1" Font-Names="Book Antiqua" Height="210px">
        <Columns>
             <asp:BoundField DataField="Property_Id" HeaderText="Property Id" SortExpression="Property_Id" ItemStyle-Width="100px" >
<ItemStyle Width="100px"></ItemStyle> </asp:BoundField>
             <asp:ImageField HeaderText="Property" DataImageUrlField="Property_Address" ControlStyle-Width="300"
        ControlStyle-Height = "150">
         </asp:ImageField>
            
            <asp:BoundField DataField="Offer_Status" HeaderText="Status" SortExpression="Offer_Status" ItemStyle-Width="300px" >
<ItemStyle Width="300px"></ItemStyle> </asp:BoundField>
            <asp:BoundField DataField="Offer_QuotedDate" HeaderText="OfferMade Date"   HtmlEncode="False" 
           DataFormatString = "{0:d}" ItemStyle-Width="150px" >
<ItemStyle Width="150px"></ItemStyle> </asp:BoundField>
            <asp:BoundField DataField="Offer_AcceptedDate" HeaderText="Decision Date" HtmlEncode="False" 
           DataFormatString = "{0:d}" SortExpression="Offer_AcceptedDate" ItemStyle-Width="170px" >
<ItemStyle Width="170px"></ItemStyle> </asp:BoundField>

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

</asp:Content>
