<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="WebApplication1.reserved_by_neo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="Content/MainPage.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1
        {
            width: 124px;
            height: 144px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div id="center">
        <br />
        <br />
        <div id="paragraph">
    <em><strong><asp:Label ID="lblDailyTip" runat="server" Text="Label">Daily Tips</asp:Label></strong></em>
        </div>           
        <br />
    <asp:Label ID="lblWelcome" runat="server" Text="Welcome back," Font-Bold="True"></asp:Label>
        <br />
        <br />
    <asp:Table ID="Table2" runat="server" CellSpacing="15">
            <asp:TableRow runat="server">
                <asp:TableCell runat="server"><asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="Images/MainPageButtons/BMR.png" class="auto-style1" OnClick="btnRMRCal_Click"/></asp:TableCell>
                <asp:TableCell runat="server"><em><strong>BMR Calculator</strong></em>
                    <br />The Basal Metabolic Rate (BMR) Calculator estimates your basal metabolic rate—the amount of energy expended while at rest in a neutrally temperate environment, 
                and in a post-absorptive state (meaning that the digestive system is inactive, which requires about 12 hours of fasting). 
                This calculator is based on the Mifflin - St Jeor equation.</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server"><asp:ImageButton ID="ImageButton2"  runat="server" ImageUrl="Images/MainPageButtons/Plan.png" class="auto-style1" OnClick="btnPlan_Click"/></asp:TableCell>
                <asp:TableCell runat="server"><em><strong>Diet Plan</strong></em>
                    <br />You can have a big impact on your health — and your budget — just by eating at home more often. 
                With menu planning you know what your meals will look like and what you need to buy. 
                That makes grocery shopping more efficient and cuts down on unplanned trips to buy one or two items. 
                And with a grocery list in hand — a byproduct of good menu planning — it's easier to resist impulse purchases.</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server"><asp:ImageButton ID="ImageButton3"  runat="server" ImageUrl="Images/MainPageButtons/DailyLog.png" class="auto-style1" OnClick="btnDailyLog_Click"/></asp:TableCell>
                <asp:TableCell runat="server"><em><strong>Daily Log</strong></em>
                    <br />Everybody wants to be more productive, and you can find loads of tools and systems designed to help you do just that.
                 But how do you measure your productivity in any given day? That's where a daily log comes in handy.</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server"><asp:ImageButton ID="ImageButton4"  runat="server" ImageUrl="Images/MainPageButtons/report.png" class="auto-style1" OnClick="btnReport_Click"/></asp:TableCell>
                <asp:TableCell runat="server"><em><strong>Reports</strong></em>
                    <br />Create weekly, monthly, or yearly report for your diet history</asp:TableCell>
            </asp:TableRow>
    </asp:Table>
        <br />
   
    
    </div>
    </asp:Content>
