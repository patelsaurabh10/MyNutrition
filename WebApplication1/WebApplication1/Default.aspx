<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <link href="Content/Default.css" rel="stylesheet" />
    <br />
    <section class="featured">
        <div id ="center">
            <hgroup class="title">
                <br />
                <h1><%: Title %>Welcome to My Nutrition!</h1>
            </hgroup>
            </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
        <div id ="center">
    <br />
    <p>
        Login Page:</p>
    <p>
        <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Log in" />
    </p>
        </div>
</asp:Content>
