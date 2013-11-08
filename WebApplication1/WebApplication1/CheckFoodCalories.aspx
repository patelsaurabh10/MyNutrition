<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CheckFoodCalories.aspx.cs" Inherits="WebApplication1.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
 <!--AMIR -->
        <asp:Label ID="Label1" runat="server" Text="Food Category"></asp:Label>
        &nbsp;<asp:DropDownList ID="ddlFoodCategory" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="FoodCategory" DataValueField="FoodCategory" OnSelectedIndexChanged="ddlFoodCategory_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT DISTINCT [FoodCategory] FROM [Food]"></asp:SqlDataSource>
        <br />
        Food Name&nbsp;&nbsp;
        <asp:DropDownList ID="ddlFoodName" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="FoodName" DataValueField="FoodName" OnSelectedIndexChanged="ddlFoodName_SelectedIndexChanged">
            <asp:ListItem Selected="True"></asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT [FoodName] FROM [Food] WHERE ([FoodCategory] = @FoodCategory)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlFoodCategory" DefaultValue="Fruit" Name="FoodCategory" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
&nbsp;<asp:RadioButton ID="rbtnWeight" runat="server" GroupName="Unit" Text="Weight" Width="70px" Enabled="False" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RadioButton ID="rbtnQuantity" runat="server" GroupName="Unit" OnCheckedChanged="RadioButton1_CheckedChanged" Text="Quantity" Width="71px" Enabled="False" />
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="tbxQuantity" runat="server" Width="74px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddlUnit" runat="server" AutoPostBack="True">
            <asp:ListItem>g</asp:ListItem>
            <asp:ListItem>oz</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:Button ID="btnCheck" runat="server" OnClick="btnCheck_Click" Text="Check" />
        <br />
        Result<br />
        Food Name:
        <asp:Label ID="lblFoodName" runat="server"></asp:Label>
        <br />
        Quantity/Weight:<asp:Label ID="lblQuantityResult" runat="server"></asp:Label>
        <br />
        Calories:<asp:Label ID="lblCalories" runat="server"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT [FoodCalorie] FROM [Food] WHERE ([FoodName] = @FoodName)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlFoodName" Name="FoodName" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />

      
</asp:Content>
