<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChoosePlan.aspx.cs" Inherits="WebApplication1.ChoosePlan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div><br /><br />
    <asp:Button ID="BtnLoose" runat="server" Text="Loose" OnClick="BtnLoose_Click" />
    <asp:Button ID="BtnMaintain" runat="server" Text="Maintain" OnClick="BtnMaintain_Click" />
    <asp:Button ID="BtnGain" runat="server" Text="Gain" OnClick="BtnGain_Click" />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged" TextMode="Number">0</asp:TextBox>
        </div>
</asp:Content>
