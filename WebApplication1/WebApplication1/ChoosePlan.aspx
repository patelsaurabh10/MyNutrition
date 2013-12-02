<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChoosePlan.aspx.cs" Inherits="WebApplication1.ChoosePlan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <link href="ChoosePlan.css" rel="stylesheet" />
    <br />
   <div class="button aqua">
            <div class="glare">
               
            </div>
    <asp:Button class="button" ID="BtnLoose" runat="server" Text="Loose" OnClick="BtnLoose_Click" />
       </div><div class="button aqua">
            <div class="glare">
               
            </div>
            
    <asp:Button ID="BtnMaintain" class="button" runat="server" Text="Maintain" OnClick="BtnMaintain_Click" />
           </div><div class="button aqua">
            <div class="glare">
            </div>
    <asp:Button ID="BtnGain" class="button" runat="server" Text="Gain" OnClick="BtnGain_Click" />
               <br />
               </div>

    View the plan now: 
    <asp:Button ID="btnView" runat="server" OnClick="btnView_Click" Text="View" />
</asp:Content>

