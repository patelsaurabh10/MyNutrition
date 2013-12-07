<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <link href="Content/Default.css" rel="stylesheet" />
    <br />
    <section class="featured">
<<<<<<< HEAD
        <div style="width:300px; margin: 0 auto 0 auto;">
            <hgroup class="title">
                
                <h1>Welcome to My Nutrition!</h1>
=======
        <div id ="center">
            <hgroup class="title">
                <br />
                <h1><%: Title %>Welcome to My Nutrition!</h1>
>>>>>>> dbf7be3997806716156482379c0b22babaf83093
            </hgroup>
            </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
<<<<<<< HEAD
    <br /><div class="content-wrapper" style="width:180px; margin: 0 auto 0 auto;">
    
       <asp:Label ID="lblLogin" runat="server" Text="Login Page:" /><br />
        <asp:Label ID="Label1" runat="server" Text="Username:"/>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br />
    
  
        <asp:Label ID="Label2" runat="server" Text="Password:"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox><br />
        <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Log in" />
        </div>
    
=======
        <div id ="center">
    <br />
    <p>
        Login Page:</p>
    <p>
        <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Log in" />
    </p>
        </div>
>>>>>>> dbf7be3997806716156482379c0b22babaf83093
</asp:Content>
