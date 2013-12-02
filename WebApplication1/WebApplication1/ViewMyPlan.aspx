<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewMyPlan.aspx.cs" Inherits="WebApplication1.ViewMyPlan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <asp:DropDownList ID="ddlCustomer" runat="server" OnSelectedIndexChanged="ddlCustomer_SelectedIndexChanged" AutoPostBack="true" EnableViewState="true">
    </asp:DropDownList>
    <br />
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="true">
        
    </asp:GridView>
    <br />
    <br />
    <hr />

    <br />
    Edit Plan:<br />
    <asp:Label ID="lblPlanID" runat="server" Text="Enter your planID"></asp:Label>
    <asp:TextBox ID="txbPlanID" runat="server"></asp:TextBox>
    (will be replace by passed value(PlanID) after deploy)<br />
    <asp:Button ID="btnDeletePlan" runat="server" OnClick="btnDeletePlan_Click" Text="Delete Plan" />

    <asp:Button ID="btnTrack" runat="server" OnClick="btnTrack_Click" Text="Track Plan" />
    <asp:Label ID="lbltest" runat="server" Text="Label"></asp:Label>

</asp:Content>
