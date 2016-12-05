<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="myshopping.aspx.cs" Inherits="NorthwindTraders.MyCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Shopping Cart</h3>
    <p>
        <asp:Label ID="Label1" runat="server" BorderColor="Green" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Size="14px" Visible="False" Width="100%"></asp:Label>
    </p>
    <asp:GridView ID="CartList" runat="server" AutoGenerateColumns="False"
        ShowFooter="True" CellPadding="4" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" Width="833px">
        <Columns>
            <asp:BoundField DataField="CartItemID" HeaderText="ID" SortExpression="CartItemID" />
            <asp:BoundField DataField="ProductName" HeaderText="Name" ItemStyle-Width="400px">
                <ItemStyle Width="400px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="UnitPrice" HeaderText="Price (each)" DataFormatString="{0:c}" />
            <asp:TemplateField HeaderText="Quantity">
                <FooterTemplate>
                    Order Total :
                </FooterTemplate>
                <ItemTemplate>
                    <asp:TextBox ID="PurchaseQuantity" Width="40px" runat="server" Text='<%# Eval("Quantity") %>' TextMode="Number"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="LineTotal">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("LineTotal") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <strong>
                        <asp:Label ID="lblTotal" runat="server" EnableViewState="false"></asp:Label>
                    </strong>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("LineTotal", "{0:c}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Remove Item">
                <ItemTemplate>
                    <asp:CheckBox ID="Remove" runat="server"></asp:CheckBox>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            No Products added in the shopping cart.<br />
            <a href="products.aspx">click here</a> to shopping.
        </EmptyDataTemplate>
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#330099" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <SortedAscendingCellStyle BackColor="#FEFCEB" />
        <SortedAscendingHeaderStyle BackColor="#AF0101" />
        <SortedDescendingCellStyle BackColor="#F6F0C0" />
        <SortedDescendingHeaderStyle BackColor="#7E0000" />
    </asp:GridView>
    <div>
        <p>
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Update Cart Details" />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" OnClientClick="confirm('Are you sure to remove the cart items which is selected ?');" Text="Remove Selected" />
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            <asp:Button ID="Button3" runat="server" Text="Check Out" OnClick="Button3_Click" />
        </p>
    </div>
    <br />
</asp:Content>
