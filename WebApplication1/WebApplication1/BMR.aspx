<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BMR.aspx.cs" Inherits="WebApplication1.BMR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/BMICalculation.css" rel="stylesheet" />
    <link href="Content/ChoosePlan.css" rel="stylesheet" />
    <br />
   
    <p id="paragraph">If you've noticed that every year, it becomes harder to eat whatever you want and stay slim, you've also learnt that your BMR decreases as you age. Likewise, depriving yourself of food in hopes of losing weight also decreases your BMR, a foil to your intentions. However, a regular routine of cardiovascular exercise can increase your BMR, improving your health and fitness when your body's ability to burn energy gradually slows down.</p>
    <div id="centerBMR">
        <fieldset>
            <legend>BMR Calculator</legend>
    <form action="BMR.aspx" method="post" id="frmBMR">
 <asp:table runat="server" style="margin: 0 auto 0 auto;">
     <asp:TableRow>
         <asp:TableCell style="text-align:right;">
      Height:</asp:TableCell><asp:TableCell style="text-align:left"><asp:TextBox ID="txtHeightcm" runat="server"></asp:TextBox><asp:DropDownList ID="DropDownList1" runat="server"><asp:ListItem>inches</asp:ListItem>
            <asp:ListItem>cm</asp:ListItem></asp:DropDownList></asp:TableCell>
 </asp:TableRow>
          <asp:TableRow>
         <asp:TableCell style="text-align:right;">
        Weight:</asp:TableCell><asp:TableCell style="text-align:left">
      <asp:TextBox ID="txtWeight" runat="server"></asp:TextBox><asp:DropDownList ID="DropDownList2" runat="server"><asp:ListItem>lb</asp:ListItem>
            <asp:ListItem>kg</asp:ListItem></asp:DropDownList></asp:TableCell>
 </asp:TableRow>
     <asp:TableRow>
         <asp:TableCell style="text-align:right;">
        Age:</asp:TableCell><asp:TableCell style="text-align:left"><asp:TextBox ID="txtAge" runat="server"></asp:TextBox></asp:TableCell>
 </asp:TableRow>
        <asp:TableRow>
         <asp:TableCell style="text-align:right;">
        Gender:</asp:TableCell><asp:TableCell style="text-align:left"><asp:DropDownList ID="DropListGender" runat="server">
            <asp:ListItem>Male</asp:ListItem>
            <asp:ListItem>Female</asp:ListItem>
        </asp:DropDownList></asp:TableCell>
           
 </asp:TableRow>
      <asp:TableRow>
         <asp:TableCell style="text-align:right;">
        Activity:</asp:TableCell><asp:TableCell style="text-align:left"><asp:DropDownList ID="DropDownList3" runat="server">
            <asp:ListItem>No exercise</asp:ListItem>
            <asp:ListItem>Light exsercise (1-3 days per week)</asp:ListItem>
            <asp:ListItem>Moderate exercise (3–5 days per week)</asp:ListItem>
            <asp:ListItem>Heavy exercise (6–7 days per week)</asp:ListItem>
            <asp:ListItem>Very heavy exercise (twice per day, extra heavy workouts)</asp:ListItem>
        </asp:DropDownList></asp:TableCell>
           
 </asp:TableRow>
     </asp:table>
      <div style="margin-top:5px;">
        <asp:Button ID="submit" runat="server" Text="Calculate" onclick="BMRCal_Click" /></div>
      
      
        Your BMR will be:<asp:TextBox ID="txtResult" runat="server"></asp:TextBox>
  
      <br />
     </form>

    <br />
    <asp:Label ID="Label1" runat="server" Text="Choose a plan now"></asp:Label>
&nbsp;<asp:Button ID="btnConfirm" runat="server" OnClick="btnConfirm_Click" Text="Confirm" />

            <asp:Panel ID="choosePlanPanel" runat="server" visible="false" >
                <div style="width:280px;margin:0 auto 0 auto">
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
               </div></div>
        </asp:Panel>
            </fieldset>
        </div>

    

    <br />
    <link href="ChoosePlan.css" rel="stylesheet" />
    <br />
    
    &nbsp;
</asp:Content>
