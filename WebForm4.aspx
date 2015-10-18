<%@ Page Language="C#"  AutoEventWireup="true"  CodeBehind="WebForm4.aspx.cs" Inherits="RealEstateDemo.WebForm4" %>

<!DOCTYPE html>

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


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>

<body>
    <form id="form1" runat="server">
    
    <table style="font-family:Arial; width: 915px;">
    <tr>
        <td colspan="2" style="width:1400px; height: 80px; background-color: #FFFFFF;  text-align: center">
             <h1>
                 &nbsp;<asp:Image ID="Image1" runat="server" Height="160px" ImageUrl="~/Images/Montreal real estate.jpg" Width="530px" style="margin-bottom: 0px" />
             </h1>
             
        </td>
    </tr>
    </table>

    <div>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:GridView ID="gvPropertyList" runat="server" AutoGenerateColumns = "False" HorizontalAlign="Center" CssClass="gridview"
       Font-Names = "Arial" BackColor="#DEBA84" BorderColor="#BF8E32" BorderStyle="Double" BorderWidth="1px" CellPadding="3" CellSpacing="2"   OnSorting="gvPropertyList_Sorting" OnRowCommand="gvPropertyList_RowCommand" AllowSorting="True" OnRowDataBound="gvPropertyList_RowDataBound" OnSelectedIndexChanged="gvPropertyList_SelectedIndexChanged" >
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
       <asp:BoundField HeaderText="DateListed" DataField="PostedDate" HtmlEncode="False" 
           DataFormatString = "{0:d}" ItemStyle-Width="100px" >
<ItemStyle Width="100px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField HeaderText="Status" DataField="Property_Status" ItemStyle-Width="100px" >
<ItemStyle Width="100px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField HeaderText="Purpose" DataField="Purpose_Type" ItemStyle-Width="100px" >
<ItemStyle Width="100px"></ItemStyle>
        </asp:BoundField>
        <asp:TemplateField HeaderText="Quote Offer Price">
        <ItemTemplate>
            <asp:TextBox  ID="txtOffer" runat="server" Text=" "></asp:TextBox>
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
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
            
    </div>

    </form>
 
</body>
</html>
