<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <link href="Content/Default.css" rel="stylesheet" />
    <br />
    <section class="featured">

        <div style="width:300px; margin: 0 auto 0 auto;">
            <hgroup class="title">
                
                <h1>Welcome to My Nutrition!</h1>

        
            
            </hgroup>
            </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <br /><div class="content-wrapper" style="width:180px; margin: 0 auto 0 auto;">
    
       <asp:Label ID="lblLogin" runat="server" Text="Login Page:" /><br />
        <asp:Label ID="Label1" runat="server" Text="Username:"/>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br />
    
  
        <asp:Label ID="Label2" runat="server" Text="Password:"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox><br />
        <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Log in" />
        </div>
    

        
   
</asp:Content>
