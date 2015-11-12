<%@ Page Title="" Language="C#" MasterPageFile="~/RegisteredUser/RegisteredUser.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="RealEstateDemo.RegisteredUser.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function basicPopup() {
            popupWindow = window.open("CalculateEMI.aspx", 'popUpWindow', 'height=300,width=400,left=100,top=30,resizable=No,scrollbars=No,toolbar=no,menubar=no,location=no,directories=no, status=No');
        }
</script>
    <style type="text/css">
.gridview th
{
    font-size: large;
    font-weight: bold;
    color: floralwhite;
    border: 1px solid black;
    padding: 8px;
}
/* the style for the normal table cells */
.gridview td
{
    padding: 8px;
    border: 1px solid black;
}
</style>

<br /> 

    <asp:GridView ID="gvPropertyList" runat="server" AutoGenerateColumns = "False" HorizontalAlign="Center" CssClass="gridview" AllowSorting="True"
       Font-Names = "Arial" BackColor="#DEBA84" BorderColor="#BF8E32" BorderStyle="Double" BorderWidth="1px" CellPadding="3" CellSpacing="2"   OnSorting="gvPropertyList_Sorting" OnRowCommand="gvPropertyList_RowCommand"  OnRowDataBound="gvPropertyList_RowDataBound" >
    <Columns>
       <asp:BoundField HeaderText="ID" DataField = "Id" ItemStyle-Width="50" >
<ItemStyle Width="50px"></ItemStyle>
        </asp:BoundField>
       <asp:ImageField HeaderText="Property" DataImageUrlField="Image" ControlStyle-Width="150"
        ControlStyle-Height = "150">
<ControlStyle Height="150px" Width="150px"></ControlStyle>
       </asp:ImageField>
       <asp:BoundField HeaderText="Address" DataField="Property_Address" ItemStyle-Width="150px" >
<ItemStyle Width="150px"></ItemStyle>
        </asp:BoundField>
       <asp:BoundField HeaderText="Price (CAD)" DataField="Price" ItemStyle-Width="100px" SortExpression="Price" >
<ItemStyle Width="100px"></ItemStyle>
        </asp:BoundField>
       <asp:BoundField HeaderText="DateListed" DataField="PostedDate" HtmlEncode="False" SortExpression="PostedDate" 
           DataFormatString = "{0:d}" ItemStyle-Width="100px" >
<ItemStyle Width="100px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField HeaderText="Status" DataField="Property_Status" ItemStyle-Width="100px" >
<ItemStyle Width="100px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField HeaderText="Purpose" DataField="Purpose_Type" ItemStyle-Width="100px" SortExpression="Purpose_Type"  >
<ItemStyle Width="100px"></ItemStyle>
        </asp:BoundField>
        <asp:TemplateField HeaderText="Quote Offer Price">
       <ItemTemplate>
            <asp:TextBox  ID="txtOffer" runat="server" width=50px Text=" " ></asp:TextBox>
            <asp:Button   ID="CheckEMI" runat="server"  Text="EMI" OnClientClick="basicPopup();return false;"></asp:Button>
        </ItemTemplate>
    </asp:TemplateField>
     <asp:ButtonField ButtonType="button" CommandName="MakeOffer" HeaderText="Submit Offer" Text="Submit your Offer" />
        
       
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
