<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminUser.Master" AutoEventWireup="true" CodeBehind="ViewOffers.aspx.cs" Inherits="RealEstateDemo.Admin.ViewOffers" %>


    

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="server">
    

        
    <style type="text/css">
        .TableCSS 
        { 
            border-style:none; 
            background-color:#BF8E32; 
            width: 850px; 
        } 
        .TableHeader 
        { 
            /*background-color:#66CCFF; 
            background-color: brown;*/
            background-color:Orange; 
            color:#0066FF; 
            font-size:large; 
            font-family:Verdana; 
            }     
        .TableData 
        { 
            /*background-color:#82C13E;*/
            background-color: Orange;
            color:#fff; 
            font-family:Courier New; 
            font-size:medium; 
            font-weight:bold; 
        }
   
    </style>
    


        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        <asp:ListView ID="ListView_Offers" runat="server" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="ListView1_SelectedIndexChanged">
<LayoutTemplate> 
                <table id="Table1" runat="server" class="TableCSS"> 
                    <tr id="Tr1" runat="server" class="TableHeader"> 
                        <td id="Td1" runat="server">Details</td> 
                        <td id="Td2" runat="server">PropertyId</td> 
                        <td id="Td3" runat="server">UserName</td> 
                        <td id="Td4" runat="server">Actual Price</td> 
                        <td id="Td5" runat="server">Offered Price</td> 
                        <td id="Td6" runat="server">Offered Date</td>
                        <td id="Td7" runat="server">Decision</td>
                    </tr> 
                    <tr id="ItemPlaceholder" runat="server"> 
                    </tr> 
                    <tr id="Tr2" runat="server"> 
                        <td id="Td8" runat="server" colspan="2"> 
                            <asp:DataPager ID="DataPager1" runat="server"> 
                                <Fields> 
                                    <asp:NextPreviousPagerField ButtonType="Link" /> 
                                    <asp:NumericPagerField /> 
                                    <asp:NextPreviousPagerField ButtonType="Link" /> 
                                </Fields> 
                            </asp:DataPager> 
                        </td> 
                    </tr> 
                </table> 
            </LayoutTemplate> 
            <ItemTemplate> 
                <tr class="TableData"> 
                      <td> 
                        <asp:Image  
                            ID="Label1" 
                            Height="100px"
                            width="200px"
                            runat="server" 
                            ImageUrl='<%# Bind("Property_Address", "{0}") %>'>
                         </asp:Image>
                    </td> 
                    <td> 
                        <asp:Label  
                            ID="Label2" 
                            runat="server" 
                            Text='<%# Eval("Property_Id")%>' 
                            > 
                        </asp:Label> 
                    </td> 
                    <td> 
                        <asp:Label  
                            ID="Label3" 
                            runat="server" 
                            Text='<%# Eval("UserName")%>'> 
                        </asp:Label> 
                    </td>
                    <td> 
                        <asp:Label  
                            ID="Label4" 
                            runat="server" 
                            Text='<%# Eval("Actual_Price")%>'> 
                        </asp:Label> 
                    </td>
                    <td> 
                        <asp:Label  
                            ID="Label5" 
                            runat="server" 
                            Text='<%# Eval("Offer_Price")%>'> 
                        </asp:Label> 
                    </td>
                    <td> 
                        <asp:Label  
                            ID="Label6" 
                            HtmlEncode="False"
                            DataFormatString = "{0:d}"
                            runat="server" 
                            Text='<%# Eval("Offer_Date")%>'> 
                        </asp:Label> 
                    </td>
                    <td>
                        <asp:Button
                          ButtonType="button"
                          CommandArgument='<%# Container.DataItemIndex %>'
                          runat="server"
                          CommandName="AcceptOffer" 
                          HeaderText="Accept Offer" Text="Accept Offer" />
                    </td>
                </tr>                 
            </ItemTemplate> 
        </asp:ListView>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT Property_Address,Property_Id,UserName,Actual_Price,Offer_Price,Offer_Date FROM [Offers_Made] ORDER BY [Property_Id]"></asp:SqlDataSource>
    </p>
</asp:Content>
