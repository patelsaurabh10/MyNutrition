<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AnualReport.aspx.cs" Inherits="WebApplication1.AnualReport" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Chart ID="chrtAnual" runat="server" OnLoad="Chart1_Load" Width="581px" Palette="Pastel">
    <series>
        <asp:Series Name="Followed">
        </asp:Series>
        <asp:Series BorderColor="Yellow" ChartArea="ChartArea1" Name="Unfollowed">
        </asp:Series>
    </series>
    <chartareas>
        <asp:ChartArea Name="ChartArea1">
        </asp:ChartArea>
    </chartareas>
</asp:Chart>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="View Anual Report" />
    <br />
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

</asp:Content>
