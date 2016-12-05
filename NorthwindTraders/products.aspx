<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="NorthwindTraders.products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Products</h1>
    <p>
        <asp:Label Width="100%" Visible="false" ForeColor="Green" BorderStyle="Solid" BorderWidth="1px" ID="Label1" runat="server" Font-Bold="True"></asp:Label>
    </p>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="ProductID" DataSourceID="SqlDataSource1" RepeatColumns="3" RepeatDirection="Horizontal" Width="100%" OnItemCommand="DataList1_ItemCommand">
        <ItemTemplate>
            ProductID:
            <asp:Label ID="ProductIDLabel" runat="server" Text='<%# Eval("ProductID") %>' />
            <br />
            ProductName:
            <asp:Label ID="ProductNameLabel" runat="server" Text='<%# Eval("ProductName") %>' />
            <br />
            UnitPrice:
            <asp:Label ID="UnitPriceLabel" runat="server" Text='<%# String.Format("{0:C}", Eval("UnitPrice") ) %>' />
            <br />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" CommandName="AddToCart" Text="Add to Cart" />
            <br />
            <br />
            <br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" SelectCommand="SELECT [ProductID], [ProductName], [UnitPrice] FROM [Products] WHERE ([CategoryID] = @CategoryID)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="1" Name="CategoryID" QueryStringField="cid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
