<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewMyPlan.aspx.cs" Inherits="WebApplication1.ViewMyPlan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    Select a plan you want to view:
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="planDesc1" Visible="False" />
    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="planDesc2" Visible="False" />
    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="planDesc3" Visible="False" />
    <br />
    <br />

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
    
<br />
    <asp:Button ID="btnDeletePlan" runat="server" OnClick="btnDeletePlan_Click" Text="Delete Plan" OnClientClick = "return confirm('Are you sure you want to delete?');"/>

    <asp:Button ID="btnTrack" runat="server" OnClick="btnTrack_Click" Text="Track Plan" />
    <asp:Label ID="lbltest" runat="server" Text="Label"></asp:Label>

</asp:Content>
