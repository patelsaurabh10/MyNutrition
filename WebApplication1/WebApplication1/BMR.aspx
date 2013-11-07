<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BMR.aspx.cs" Inherits="WebApplication1.BMR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        BMR CaLculator
    </h2>
<p>You use energy no matter what you're doing, even when sleeping. The <b>BMR Calculator</b> will calculate your Basal Metabolic Rate (BMR); the number of calories you'd burn if you stayed in bed all day.</p>

<p>If you've noticed that every year, it becomes harder to eat whatever you want and stay slim, you've also learnt that your BMR decreases as you age. Likewise, depriving yourself of food in hopes of losing weight also decreases your BMR, a foil to your intentions. However, a regular routine of cardiovascular exercise can increase your BMR, improving your health and fitness when your body's ability to burn energy gradually slows down.</p>

    <form action="" method=post id="frmBMR">
    To get your BMR:<br />
    Height:<asp:TextBox 
        ID="txtHeightcm" runat="server"></asp:TextBox>
    cm<br />
    Weight:<asp:TextBox ID="txtWeight" runat="server"></asp:TextBox>
    lbs<br />
    Age:<asp:TextBox ID="txtAge" runat="server"></asp:TextBox>
    <br />
    Gender:<asp:DropDownList ID="DropListGender" runat="server">
        <asp:ListItem>Female</asp:ListItem>
        <asp:ListItem>Male</asp:ListItem>
    </asp:DropDownList>
    <br />
    <asp:Button ID="submit" runat="server" Text="Calculate" onclick="calculate_BMR" />
    <br />
    <br />
    Your BMR will be:<asp:TextBox ID="txtResult" runat="server"></asp:TextBox>

    <br />
    </form>
</asp:Content>
