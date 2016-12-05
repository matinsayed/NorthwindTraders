<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="NorthwindTraders._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>CATEGORIES</h1>
<p>
    <asp:DataList ID="DataList1" runat="server" CellPadding="4" DataKeyField="CategoryID" DataSourceID="SqlDataSource1" ForeColor="#333333" RepeatColumns="3" RepeatDirection="Horizontal" Width="100%">
        <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <ItemTemplate>
            CategoryID:
            <asp:Label ID="CategoryIDLabel" runat="server" Text='<%# Eval("CategoryID") %>' />
            <br />
            CategoryName:
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "products.aspx?cid=" + Eval("CategoryID") %>' Text='<%# Eval("CategoryName") %>'></asp:HyperLink>
            <br />
            Description:
            <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
<%--            <br />
            Image :
            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Picture") %>' />--%>
<br />
        </ItemTemplate>
        <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" SelectCommand="SELECT [CategoryID], [CategoryName], [Description], [Picture] FROM [Categories]"></asp:SqlDataSource>
</p>
</asp:Content>
