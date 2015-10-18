<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AptUpload.aspx.cs" Inherits="RealEstateDemo.AptUpload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <asp:Panel ID="ApartmentUpload" runat="server">
            <asp:Label ID="Label1" runat="server" Text="Apartment Name"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"  style="margin-left: 37px"></asp:TextBox>
            <br />
            <br />
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:Button ID="Button1" runat="server" Height="23px" OnClick="Button1_Click" style="margin-left: 37px; margin-top: 1px" Text="Insert" Width="96px" />
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(localdb)\ProjectsV12;Initial Catalog=RealEstate;Integrated Security=True" InsertCommand="INSERT INTO Image_Test(ImageName, Image) VALUES (@i1,@i2)" ProviderName="System.Data.SqlClient">
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBox1" DefaultValue="TextBox1.Text" Name="i1" PropertyName="Text" />
                    <asp:ControlParameter ControlID="FileUpload1" DefaultValue="" Name="i2" PropertyName="FileBytes" />
                </InsertParameters>
            </asp:SqlDataSource>
            <br />
        </asp:Panel>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <asp:Panel ID="RetrieveApartment" runat="server">
            <br />
            <asp:TextBox ID="TextBox2" runat="server" Height="16px" Width="85px"></asp:TextBox>
            <asp:Button ID="Button2" runat="server" Height="24px" OnClick="Button2_Click" style="margin-left: 60px" Text="DisplayAptDetails" Width="133px" />
            <br />
            <br />
            <br />
            <asp:Image ID="Image1" runat="server" />
            <br />
        </asp:Panel>
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
