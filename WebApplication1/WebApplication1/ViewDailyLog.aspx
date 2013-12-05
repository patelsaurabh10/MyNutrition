<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewDailyLog.aspx.cs" Inherits="WebApplication1.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:DropDownList ID="ddlCustomer" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCustomer_SelectedIndexChanged">
    </asp:DropDownList>
    <br />
    <br />
    <asp:GridView ID="gvDailyLog" runat="server">
        <Columns>
        <asp:TemplateField>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkStatus" runat="server" />
                           
                    </ItemTemplate>                    
                </asp:TemplateField>

        </Columns>
    </asp:GridView>
    <asp:TextBox ID="txtFoodName" runat="server"></asp:TextBox>
    
    <asp:TextBox ID="txtCalorie" runat="server"></asp:TextBox>
</asp:Content>
