<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewProvidedPlans.aspx.cs" Inherits="WebApplication1.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    This is Plan
    <asp:TextBox ID="txbPlanID" runat="server" Width="16px"></asp:TextBox>
&nbsp;:
    <asp:Label ID="lblPlanDesc" runat="server" Text=" "></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="MealID" HeaderText="MealID" SortExpression="MealID" />
            <asp:BoundField DataField="MealType" HeaderText="MealType" SortExpression="MealType" />
            <asp:BoundField DataField="Day" HeaderText="Day" SortExpression="Day" />
            <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
            <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
            <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT FoodDetail.MealID, Meal.MealType, Meal.Day, Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="txbPlanID" DefaultValue="0" Name="PlanID" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Button ID="btnView" runat="server" OnClick="Button1_Click" Text="View Plan" />
</asp:Content>
