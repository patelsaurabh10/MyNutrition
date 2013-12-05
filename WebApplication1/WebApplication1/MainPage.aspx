<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="WebApplication1.reserved_by_neo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <asp:Label ID="lblWelcome" runat="server" Text="Welcome back" Font-Bold="True"></asp:Label>
        <br />
   
        <br />
   
    
   
    <asp:Table ID="Table1" runat="server">
        <asp:TableRow runat="server">
            <asp:TableCell><asp:Button ID="btnRMRCal" runat="server" Text="BMR Calculator" Width="110px" BackColor="#0066FF" OnClick="btnRMRCal_Click" /></asp:TableCell>
            <asp:TableCell>The Basal Metabolic Rate (BMR) Calculator estimates your basal metabolic rate—the amount of energy expended while at rest in a neutrally temperate environment, 
                and in a post-absorptive state (meaning that the digestive system is inactive, which requires about 12 hours of fasting). 
                This calculator is based on the Mifflin - St Jeor equation.
                <br />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
              <asp:TableCell><asp:Button ID="btnPlan" runat="server" Text="My Plan" Width="110px" BackColor="#0066FF" OnClick="btnPlan_Click"/></asp:TableCell>
            <asp:TableCell>You can have a big impact on your health — and your budget — just by eating at home more often. 
                With menu planning you know what your meals will look like and what you need to buy. 
                That makes grocery shopping more efficient and cuts down on unplanned trips to buy one or two items. 
                And with a grocery list in hand — a byproduct of good menu planning — it's easier to resist impulse purchases.
                <br />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
              <asp:TableCell><asp:Button ID="btnDailyLog" runat="server" BackColor="#0066FF" OnClick="btnDailyLog_Click" Text="Daily Log" Width="110px" />
 </asp:TableCell>
            <asp:TableCell>Everybody wants to be more productive, and you can find loads of tools and systems designed to help you do just that.
                 But how do you measure your productivity in any given day? That's where a daily log comes in handy.
                <br />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
              <asp:TableCell><asp:Button ID="btnReport" runat="server" BackColor="#0066FF" OnClick="btnReport_Click" Text="Report" Width="110px" />
 </asp:TableCell>
            <asp:TableCell>Create weekly, monthly, or yearly report for your diet history
                <br />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <div align="center">
    <h1 >
        <asp:Label ID="Label1" runat="server" Text="Daily Log" ></asp:Label></h1>
    </div>
    <div align="center">  <asp:Label ID="lblDailyTip" runat="server" Text="Label">Daily Tips</asp:Label></div>
 
    </asp:Content>
