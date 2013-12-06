<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="weeklyreport.aspx.cs" Inherits="WebApplication1.weeklyreport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Chart ID="ChrtWeekly" runat="server">
        <Series>
            <asp:Series Name="Followed"></asp:Series>
            <asp:Series ChartArea="ChartArea1" Name="Unfollowed">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
    <asp:Button ID="btWeekreport" runat="server" OnClick="btWeekreport_Click" Text="View Weekly Report" />
</asp:Content>
