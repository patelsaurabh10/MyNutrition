﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewProvidedPlans.aspx.cs" Inherits="WebApplication1.WebForm2" %>
 
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server" >
   
    <link href="Content/viewProvidedPlans.css" rel="stylesheet" />
    
    <br />



     
  


     <div id="center">



    


    

    <br /><div style="color:darkred; width:1050px;text-align:center; font-weight:bold">
    Plan Description:
    <asp:Label ID="lblPlanDesc" runat="server" Text="Plan Description Here"></asp:Label>
    </div><br />
      
    <p style="color:darkred; width:1050px;text-align:center;font-weight:bold">Monday:</p>
    <asp:Table ID="TableMonday" runat="server" >
        <asp:TableHeaderRow runat="server">
            <asp:TableCell runat="server" ><em><strong>Breakfast:</strong></em></asp:TableCell>            
            <asp:TableCell runat="server" ><em><strong>Lunch:</strong></em></asp:TableCell>            
            <asp:TableCell runat="server" ><em><strong>Dinner:</strong></em></asp:TableCell>
        </asp:TableHeaderRow>
        <asp:TableRow runat="server" VerticalAlign="top">
            <asp:TableCell ID="TableCell1" runat="server">
                <asp:GridView ID="GridViewMonBreak" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" >
                     <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    
                    <Columns>
                        <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName"  HeaderStyle-CssClass="gv" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-CssClass="gvCell" HeaderStyle-CssClass="gv"/>
                        <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" HeaderStyle-CssClass="gv"/>
                        <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" HeaderStyle-CssClass="gv"/>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Monday') AND (Meal.MealType = 'Breakfast')">
                    <SelectParameters>
                         <asp:QueryStringParameter DefaultValue="0" Name="PlanID" QueryStringField="PlanID" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:TableCell>
           
            <asp:TableCell ID="TableCell2" runat="server" VerticalAlign="Top">
                <asp:GridView ID="GridViewMonLunch" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                     <Columns>
                        <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" HeaderStyle-CssClass="gv"/>
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-CssClass="gvCell" HeaderStyle-CssClass="gv"/>
                        <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" HeaderStyle-CssClass="gv"/>
                        <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" HeaderStyle-CssClass="gv"/>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Monday') AND (Meal.MealType = 'Lunch')">
                    <SelectParameters>
                         <asp:QueryStringParameter DefaultValue="0" Name="PlanID" QueryStringField="PlanID" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:TableCell>
            
            <asp:TableCell ID="TableCell3" runat="server" VerticalAlign="Top">
                <asp:GridView ID="GridViewMonDinner" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                     <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    <Columns>
                        <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" HeaderStyle-CssClass="gv"/>
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-CssClass="gvCell" HeaderStyle-CssClass="gv"/>
                        <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" HeaderStyle-CssClass="gv"/>
                        <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" HeaderStyle-CssClass="gv"/>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Monday') AND (Meal.MealType = 'Dinner')">
                    <SelectParameters>
                         <asp:QueryStringParameter DefaultValue="0" Name="PlanID" QueryStringField="PlanID" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell ID="TableCell61" runat="server"><em><strong>Snack1:</strong></em></asp:TableCell>
            <asp:TableCell ID="TableCell62" runat="server"><em><strong>Snack2:</strong></em></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell ID="TableCell63" runat="server">
                <asp:GridView ID="GridViewMonSnack1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource22" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                     <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    <Columns>
                        <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" HeaderStyle-CssClass="gv"/>
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-CssClass="gvCell" HeaderStyle-CssClass="gv"/>
                        <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" HeaderStyle-CssClass="gv"/>
                        <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" HeaderStyle-CssClass="gv"/>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource22" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Monday') AND (Meal.MealType = 'Snack1')">
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="0" Name="PlanID" QueryStringField="PlanID" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:TableCell>
         
         <asp:TableCell ID="TableCell64" runat="server">
                <asp:GridView ID="GridViewMonSnack2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource23" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                     <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    <Columns>
                        <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" HeaderStyle-CssClass="gv"/>
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-CssClass="gvCell" HeaderStyle-CssClass="gv"/>
                        <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" HeaderStyle-CssClass="gv"/>
                        <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" HeaderStyle-CssClass="gv"/>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource23" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Monday') AND (Meal.MealType = 'Snack2')">
                    <SelectParameters>
                         <asp:QueryStringParameter DefaultValue="0" Name="PlanID" QueryStringField="PlanID" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:TableCell>
            <asp:TableCell ID="TableCell41" runat="server" style="text-align:center; color:darkblue; font-weight:bold">
            Summary Calories:
            
                <asp:Label ID="lblMonSumCalorie" runat="server" Text=" "></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="TableRow13" runat="server">
            
            
        </asp:TableRow>
    </asp:Table>
    <br />
    <br />
    <br />
    <div style="color:darkred; width:1050px;text-align:center; font-weight:bold">Tuesday:</div>
     <asp:Table ID="TableTuesday" runat="server">
         <asp:TableHeaderRow ID="TableHeaderRow1" runat="server">
            <asp:TableCell ID="TableCell4" runat="server"><em><strong>Breakfast:</strong></em></asp:TableCell>            
            <asp:TableCell ID="TableCell6" runat="server"><em><strong>Lunch:</strong></em></asp:TableCell>
            <asp:TableCell ID="TableCell78" runat="server"><em><strong>Dinner:</strong></em></asp:TableCell>
        </asp:TableHeaderRow>
         <asp:TableRow ID="TableRow2" runat="server"  VerticalAlign="top">
             <asp:TableCell ID="TableCell7" runat="server">
                 <asp:GridView ID="GridViewTueBreak" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                      <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                     <Columns>
                         <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" HeaderStyle-CssClass="gv"/>
                         <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-CssClass="gvCell" HeaderStyle-CssClass="gv"/>
                         <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" HeaderStyle-CssClass="gv"/>
                         <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" HeaderStyle-CssClass="gv"/>
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Tuesday') AND (Meal.MealType = 'Breakfast')">
                     <SelectParameters>
                          <asp:QueryStringParameter DefaultValue="0" Name="PlanID" QueryStringField="PlanID" Type="String" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </asp:TableCell>
              
             <asp:TableCell ID="TableCell8" runat="server" VerticalAlign="Top">
                 <asp:GridView ID="GridViewTueLunch" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource5" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                      <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                     <Columns>
                         <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" HeaderStyle-CssClass="gv"/>
                         <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-CssClass="gvCell" HeaderStyle-CssClass="gv"/>
                         <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" HeaderStyle-CssClass="gv"/>
                         <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" HeaderStyle-CssClass="gv"/>
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Tuesday') AND (Meal.MealType = 'Lunch')">
                     <SelectParameters>
                          <asp:QueryStringParameter DefaultValue="0" Name="PlanID" QueryStringField="PlanID" Type="String" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </asp:TableCell>
             
             <asp:TableCell ID="TableCell9" runat="server" VerticalAlign="Top">
                 <asp:GridView ID="GridViewTueDinner" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource6" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                      <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                     <Columns>
                         <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" HeaderStyle-CssClass="gv"/>
                         <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-CssClass="gvCell" HeaderStyle-CssClass="gv"/>
                         <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" HeaderStyle-CssClass="gv"/>
                         <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" HeaderStyle-CssClass="gv"/>
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Tuesday') AND (Meal.MealType = 'Dinner')">
                     <SelectParameters>
                          <asp:QueryStringParameter DefaultValue="0" Name="PlanID" QueryStringField="PlanID" Type="String" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </asp:TableCell>
         </asp:TableRow>
         <asp:TableHeaderRow>             
            <asp:TableCell ID="TableCell5" runat="server"><em><strong>Snack1:</strong></em></asp:TableCell>
            <asp:TableCell ID="TableCell77" runat="server"><em><strong>Snack2:</strong></em></asp:TableCell>
         </asp:TableHeaderRow>
         <asp:TableRow ID="TableRow15" runat="server">
             <asp:TableCell ID="TableCell65" runat="server">
                <asp:GridView ID="GridViewTueSnack1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource24" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                     <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    <Columns>
                        <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" HeaderStyle-CssClass="gv"/>
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-CssClass="gvCell" HeaderStyle-CssClass="gv"/>
                        <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" HeaderStyle-CssClass="gv"/>
                        <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" HeaderStyle-CssClass="gv"/>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource24" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Tuesday') AND (Meal.MealType = 'Snack1')">
                    <SelectParameters>
                         <asp:QueryStringParameter DefaultValue="0" Name="PlanID" QueryStringField="PlanID" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:TableCell>
             <asp:TableCell ID="TableCell71" runat="server">
                <asp:GridView ID="GridViewTueSnack2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource30" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                     <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    <Columns>
                        <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" HeaderStyle-CssClass="gv"/>
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-CssClass="gvCell" HeaderStyle-CssClass="gv"/>
                        <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" HeaderStyle-CssClass="gv"/>
                        <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" HeaderStyle-CssClass="gv"/>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource30" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Tuesday') AND (Meal.MealType = 'Snack2')">
                    <SelectParameters>
                         <asp:QueryStringParameter DefaultValue="0" Name="PlanID" QueryStringField="PlanID" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:TableCell>
             <asp:TableCell ID="TableCell44" runat="server" style="text-align:center; color:darkblue; font-weight:bold">
                 Summary Calories:
                 <asp:Label ID="lblTueSumCalorie" runat="server" Text=" "></asp:Label>
             </asp:TableCell>
             <asp:TableCell ID="TableCell45" runat="server"></asp:TableCell>
         </asp:TableRow>
     </asp:Table>
    <br />
    <br />
    <div style="color:darkred; width:1050px;text-align:center; font-weight:bold">Wendesday:</div>
     <asp:Table ID="TableWendesday" runat="server">
          <asp:TableHeaderRow ID="TableHeaderRow2" runat="server">
            <asp:TableCell ID="TableCell10" runat="server"><em><strong>Breakfast:</strong></em></asp:TableCell>            
            <asp:TableCell ID="TableCell12" runat="server"><em><strong>Lunch:</strong></em></asp:TableCell>
            <asp:TableCell ID="TableCell80" runat="server"><em><strong>Dinner:</strong></em></asp:TableCell>
        </asp:TableHeaderRow>
         <asp:TableRow ID="TableRow4" runat="server"  VerticalAlign="top">
             <asp:TableCell ID="TableCell13" runat="server">
                 <asp:GridView ID="GridViewWedBreak" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource7" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                      <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                     <Columns>
                         <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-CssClass="gvCell" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" HeaderStyle-CssClass="gv" />
                     </Columns>
                 </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Wednesday') AND (Meal.MealType = 'Breakfast')">
                     <SelectParameters>
                          <asp:QueryStringParameter DefaultValue="0" Name="PlanID" QueryStringField="PlanID" Type="String" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </asp:TableCell>
              
             <asp:TableCell ID="TableCell14" runat="server" VerticalAlign="Top">
                 <asp:GridView ID="GridViewWedLunch" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource8" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                      <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                     <Columns>
                         <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-CssClass="gvCell" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" HeaderStyle-CssClass="gv" />
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Wednesday') AND (Meal.MealType = 'Lunch')">
                     <SelectParameters>
                          <asp:QueryStringParameter DefaultValue="0" Name="PlanID" QueryStringField="PlanID" Type="String" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </asp:TableCell>
             
             <asp:TableCell ID="TableCell15" runat="server" VerticalAlign="Top">
                 <asp:GridView ID="GridViewWedDinner" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource9" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                      <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                     <Columns>
                         <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-CssClass="gvCell" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" HeaderStyle-CssClass="gv" />
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Wednesday') AND (Meal.MealType = 'Dinner')">
                     <SelectParameters>
                          <asp:QueryStringParameter DefaultValue="0" Name="PlanID" QueryStringField="PlanID" Type="String" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </asp:TableCell>
         </asp:TableRow>
         <asp:TableHeaderRow>             
            <asp:TableCell ID="TableCell11" runat="server"><em><strong>Snack1:</strong></em></asp:TableCell>
            <asp:TableCell ID="TableCell79" runat="server"><em><strong>Snack2:</strong></em></asp:TableCell>
         </asp:TableHeaderRow>
         <asp:TableRow ID="TableRow16" runat="server">
             <asp:TableCell ID="TableCell66" runat="server">
                <asp:GridView ID="GridViewWedSnack1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource25" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                     <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    <Columns>
                        <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" HeaderStyle-CssClass="gv" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-CssClass="gvCell" HeaderStyle-CssClass="gv" />
                        <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" HeaderStyle-CssClass="gv" />
                        <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" HeaderStyle-CssClass="gv" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource25" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Wednesday') AND (Meal.MealType = 'Snack1')">
                    <SelectParameters>
                         <asp:QueryStringParameter DefaultValue="0" Name="PlanID" QueryStringField="PlanID" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:TableCell>
             <asp:TableCell ID="TableCell72" runat="server">
                <asp:GridView ID="GridViewWedSnack2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource31" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                     <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    <Columns>
                        <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" HeaderStyle-CssClass="gv" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-CssClass="gvCell" HeaderStyle-CssClass="gv" />
                        <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" HeaderStyle-CssClass="gv" />
                        <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" HeaderStyle-CssClass="gv" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource31" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Wednesday') AND (Meal.MealType = 'Snack2')">
                    <SelectParameters>
                         <asp:QueryStringParameter DefaultValue="0" Name="PlanID" QueryStringField="PlanID" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:TableCell>
             <asp:TableCell ID="TableCell47" runat="server" style="text-align:center; color:darkblue; font-weight:bold">
                 Summary Calories:
                 <asp:Label ID="lblWesSumCalorie" runat="server" Text=" "></asp:Label>
             </asp:TableCell>
             <asp:TableCell ID="TableCell48" runat="server"></asp:TableCell>
         </asp:TableRow>
     </asp:Table>

    <br />
    <br />
    <div style="color:darkred; width:1050px;text-align:center; font-weight:bold">Thursday:</div>
     <asp:Table ID="TableThursday" runat="server">
         <asp:TableHeaderRow ID="TableHeaderRow3" runat="server">
            <asp:TableCell ID="TableCell16" runat="server"><em><strong>Breakfast:</strong></em></asp:TableCell>
            <asp:TableCell ID="TableCell18" runat="server"><em><strong>Lunch:</strong></em></asp:TableCell>            
            <asp:TableCell ID="TableCell82" runat="server"><em><strong>Dinner:</strong></em></asp:TableCell>
        </asp:TableHeaderRow>
         <asp:TableRow ID="TableRow6" runat="server"  VerticalAlign="top">
             <asp:TableCell ID="TableCell19" runat="server">
                 <asp:GridView ID="GridViewThurBreak" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource10" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                      <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                     <Columns>
                         <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-CssClass="gvCell" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" HeaderStyle-CssClass="gv" />
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Thursday') AND (Meal.MealType = 'Breakfast')">
                     <SelectParameters>
                          <asp:QueryStringParameter DefaultValue="0" Name="PlanID" QueryStringField="PlanID" Type="String" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </asp:TableCell>
              
             <asp:TableCell ID="TableCell20" runat="server" VerticalAlign="Top">
                 <asp:GridView ID="GridViewThurLunch" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource11" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                      <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                     <Columns>
                         <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-CssClass="gvCell" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" HeaderStyle-CssClass="gv" />
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Thursday') AND (Meal.MealType = 'Lunch')">
                     <SelectParameters>
                          <asp:QueryStringParameter DefaultValue="0" Name="PlanID" QueryStringField="PlanID" Type="String" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </asp:TableCell>
             
                
             <asp:TableCell ID="TableCell21" runat="server" VerticalAlign="Top">
                 <asp:GridView ID="GridViewThurDinner" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource12" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                      <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                     <Columns>
                         <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-CssClass="gvCell" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" HeaderStyle-CssClass="gv" />
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Thursday') AND (Meal.MealType = 'Dinner')">
                     <SelectParameters>
                          <asp:QueryStringParameter DefaultValue="0" Name="PlanID" QueryStringField="PlanID" Type="String" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </asp:TableCell>
         </asp:TableRow>
         <asp:TableHeaderRow>
             <asp:TableCell ID="TableCell17" runat="server"><em><strong>Snack1:</strong></em></asp:TableCell>
            <asp:TableCell ID="TableCell81" runat="server"><em><strong>Snack2:</strong></em></asp:TableCell>
         </asp:TableHeaderRow>         
         <asp:TableRow ID="TableRow17" runat="server">
             <asp:TableCell ID="TableCell67" runat="server">
                <asp:GridView ID="GridViewThurSnack1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource26" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                     <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    <Columns>
                        <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" HeaderStyle-CssClass="gv" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-CssClass="gvCell" HeaderStyle-CssClass="gv" />
                        <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" HeaderStyle-CssClass="gv" />
                        <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" HeaderStyle-CssClass="gv" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource26" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Thursday') AND (Meal.MealType = 'Snack1')">
                    <SelectParameters>
                         <asp:QueryStringParameter DefaultValue="0" Name="PlanID" QueryStringField="PlanID" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:TableCell>
             <asp:TableCell ID="TableCell73" runat="server">
             <asp:GridView ID="GridViewThurSnack2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource32" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                     <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    <Columns>
                        <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" HeaderStyle-CssClass="gv" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-CssClass="gvCell" HeaderStyle-CssClass="gv" />
                        <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" HeaderStyle-CssClass="gv" />
                        <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" HeaderStyle-CssClass="gv" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource32" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Thursday') AND (Meal.MealType = 'Snack2')">
                    <SelectParameters>
                         <asp:QueryStringParameter DefaultValue="0" Name="PlanID" QueryStringField="PlanID" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:TableCell>
             <asp:TableCell ID="TableCell50" runat="server" style="text-align:center; color:darkblue; font-weight:bold">
                 Summary Calories:
                 <asp:Label ID="lblThurSumCalorie" runat="server" Text=" "></asp:Label>
             </asp:TableCell>
             <asp:TableCell ID="TableCell51" runat="server"></asp:TableCell>
         </asp:TableRow>
     </asp:Table>

    <br />
    <br />
    <div style="color:darkred; width:1050px;text-align:center; font-weight:bold">Friday:</div>
     <asp:Table ID="TableFriday" runat="server">
         <asp:TableHeaderRow ID="TableHeaderRow4" runat="server">
            <asp:TableCell ID="TableCell22" runat="server"><em><strong>Breakfast:</strong></em></asp:TableCell>            
            <asp:TableCell ID="TableCell24" runat="server"><em><strong>Lunch:</strong></em></asp:TableCell>             
            <asp:TableCell ID="TableCell84" runat="server"><em><strong>Dinner:</strong></em></asp:TableCell>
        </asp:TableHeaderRow>
         <asp:TableRow ID="TableRow8" runat="server"  VerticalAlign="top">
             <asp:TableCell ID="TableCell25" runat="server">
                 <asp:GridView ID="GridViewFriBreak" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource13" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                      <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                     <Columns>
                         <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-CssClass="gvCell" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" HeaderStyle-CssClass="gv" />
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Friday') AND (Meal.MealType = 'Breakfast')">
                     <SelectParameters>
                          <asp:QueryStringParameter DefaultValue="0" Name="PlanID" QueryStringField="PlanID" Type="String" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </asp:TableCell>
              
             <asp:TableCell ID="TableCell26" runat="server" VerticalAlign="Top">
                 <asp:GridView ID="GridViewFriLunch" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource14" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                      <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                     <Columns>
                         <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-CssClass="gvCell" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" HeaderStyle-CssClass="gv" />
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource14" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Friday') AND (Meal.MealType = 'Lunch')">
                     <SelectParameters>
                          <asp:QueryStringParameter DefaultValue="0" Name="PlanID" QueryStringField="PlanID" Type="String" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </asp:TableCell>
             
             <asp:TableCell ID="TableCell27" runat="server" VerticalAlign="Top">
                 <asp:GridView ID="GridViewFriDinner" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource15" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                      <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                     <Columns>
                         <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-CssClass="gvCell" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" HeaderStyle-CssClass="gv" />
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource15" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Friday') AND (Meal.MealType = 'Dinner')">
                     <SelectParameters>
                          <asp:QueryStringParameter DefaultValue="0" Name="PlanID" QueryStringField="PlanID" Type="String" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </asp:TableCell>
         </asp:TableRow>
         <asp:TableHeaderRow>
             <asp:TableCell ID="TableCell23" runat="server"><em><strong>Snack1:</strong></em></asp:TableCell>
            <asp:TableCell ID="TableCell83" runat="server"><em><strong>Snack2:</strong></em></asp:TableCell>
         </asp:TableHeaderRow>
         <asp:TableRow ID="TableRow18" runat="server">
             <asp:TableCell ID="TableCell68" runat="server">
                <asp:GridView ID="GridViewFriSnack1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource27" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                     <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    <Columns>
                        <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" HeaderStyle-CssClass="gv" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-CssClass="gvCell" HeaderStyle-CssClass="gv" />
                        <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" HeaderStyle-CssClass="gv" />
                        <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" HeaderStyle-CssClass="gv" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource27" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Friday') AND (Meal.MealType = 'Snack1')">
                    <SelectParameters>
                         <asp:QueryStringParameter DefaultValue="0" Name="PlanID" QueryStringField="PlanID" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:TableCell>
             <asp:TableCell ID="TableCell74" runat="server">
                <asp:GridView ID="GridViewFriSnack2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource33" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                     <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    <Columns>
                        <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" HeaderStyle-CssClass="gv" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-CssClass="gvCell" HeaderStyle-CssClass="gv" />
                        <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" HeaderStyle-CssClass="gv" />
                        <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" HeaderStyle-CssClass="gv" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource33" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Friday') AND (Meal.MealType = 'Snack2')">
                    <SelectParameters>
                         <asp:QueryStringParameter DefaultValue="0" Name="PlanID" QueryStringField="PlanID" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:TableCell>
             <asp:TableCell ID="TableCell53" runat="server" style="text-align:center; color:darkblue; font-weight:bold">
                 Summary Calories:
                 <asp:Label ID="lblFriSumCalorie" runat="server" Text=" "></asp:Label>
             </asp:TableCell>
             <asp:TableCell ID="TableCell54" runat="server"></asp:TableCell>
         </asp:TableRow>
     </asp:Table>

    <br />
    <br />
    <div style="color:darkred; width:1050px;text-align:center; font-weight:bold">Saturday:</div>
     <asp:Table ID="TableSaturday" runat="server">
         <asp:TableHeaderRow ID="TableHeaderRow5" runat="server">
            <asp:TableCell ID="TableCell28" runat="server"><em><strong>Breakfast:</strong></em></asp:TableCell>            
            <asp:TableCell ID="TableCell30" runat="server"><em><strong>Lunch:</strong></em></asp:TableCell>             
            <asp:TableCell ID="TableCell86" runat="server"><em><strong>Dinner:</strong></em></asp:TableCell>
        </asp:TableHeaderRow>
         <asp:TableRow ID="TableRow10" runat="server"  VerticalAlign="top">
             <asp:TableCell ID="TableCell31" runat="server">
                 <asp:GridView ID="GridViewSatBreak" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource16" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                      <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                     <Columns>
                         <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-CssClass="gvCell" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" HeaderStyle-CssClass="gv" />
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource16" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Saturday') AND (Meal.MealType = 'Breakfast')">
                     <SelectParameters>
                          <asp:QueryStringParameter DefaultValue="0" Name="PlanID" QueryStringField="PlanID" Type="String" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </asp:TableCell>
              
             <asp:TableCell ID="TableCell32" runat="server" VerticalAlign="Top">
                 <asp:GridView ID="GridViewSatLunch" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource17" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                      <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                     <Columns>
                         <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-CssClass="gvCell" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" HeaderStyle-CssClass="gv" />
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource17" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Saturday') AND (Meal.MealType = 'Lunch')">
                     <SelectParameters>
                          <asp:QueryStringParameter DefaultValue="0" Name="PlanID" QueryStringField="PlanID" Type="String" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </asp:TableCell>
             
             <asp:TableCell ID="TableCell33" runat="server" VerticalAlign="Top">
                 <asp:GridView ID="GridViewSatDinner" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource18" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                      <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                     <Columns>
                         <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-CssClass="gvCell" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" HeaderStyle-CssClass="gv" />
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource18" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Saturday') AND (Meal.MealType = 'Dinner')">
                     <SelectParameters>
                          <asp:QueryStringParameter DefaultValue="0" Name="PlanID" QueryStringField="PlanID" Type="String" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </asp:TableCell>
         </asp:TableRow>
         <asp:TableHeaderRow>
             <asp:TableCell ID="TableCell29" runat="server"><em><strong>Snack1:</strong></em></asp:TableCell>
            <asp:TableCell ID="TableCell85" runat="server"><em><strong>Snack2:</strong></em></asp:TableCell>
         </asp:TableHeaderRow>
         <asp:TableRow ID="TableRow19" runat="server">
             <asp:TableCell ID="TableCell69" runat="server">
                <asp:GridView ID="GridViewSatSnack1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource28" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                     <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    <Columns>
                        <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" HeaderStyle-CssClass="gv"/>
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-CssClass="gvCell" HeaderStyle-CssClass="gv" />
                        <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" HeaderStyle-CssClass="gv" />
                        <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" HeaderStyle-CssClass="gv" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource28" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Saturday') AND (Meal.MealType = 'Snack1')">
                    <SelectParameters>
                         <asp:QueryStringParameter DefaultValue="0" Name="PlanID" QueryStringField="PlanID" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:TableCell>
             <asp:TableCell ID="TableCell75" runat="server">
                <asp:GridView ID="GridViewSatSnack2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource34" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                     <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    <Columns>
                        <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" HeaderStyle-CssClass="gv" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-CssClass="gvCell" HeaderStyle-CssClass="gv" />
                        <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" HeaderStyle-CssClass="gv" />
                        <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" HeaderStyle-CssClass="gv" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource34" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Saturday') AND (Meal.MealType = 'Snack2')">
                    <SelectParameters>
                         <asp:QueryStringParameter DefaultValue="0" Name="PlanID" QueryStringField="PlanID" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:TableCell>
             <asp:TableCell ID="TableCell56" runat="server" style="text-align:center; color:darkblue; font-weight:bold">
                 Summary Calories:
                 <asp:Label ID="lblSatSumCalorie" runat="server" Text=" "></asp:Label>
             </asp:TableCell>
             <asp:TableCell ID="TableCell57" runat="server"></asp:TableCell>
         </asp:TableRow>
     </asp:Table>

    <br />
    <br />
    <div style="color:darkred; width:1050px;text-align:center; font-weight:bold">Sunday:</div>
     <asp:Table ID="Table1" runat="server">
         <asp:TableHeaderRow ID="TableHeaderRow6" runat="server">
            <asp:TableCell ID="TableCell34" runat="server"><em><strong>Breakfast:</strong></em></asp:TableCell>            
            <asp:TableCell ID="TableCell36" runat="server"><em><strong>Lunch:</strong></em></asp:TableCell>             
            <asp:TableCell ID="TableCell88" runat="server"><em><strong>Dinner:</strong></em></asp:TableCell>
        </asp:TableHeaderRow>
         <asp:TableRow ID="TableRow12" runat="server" VerticalAlign="Top">
             <asp:TableCell ID="TableCell37" runat="server">
                 <asp:GridView ID="GridViewSunBreak" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource19" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                      <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                     <Columns>
                         <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-CssClass="gvCell" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" HeaderStyle-CssClass="gv" />
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource19" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Sunday') AND (Meal.MealType = 'Breakfast')">
                     <SelectParameters>
                          <asp:QueryStringParameter DefaultValue="0" Name="PlanID" QueryStringField="PlanID" Type="String" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </asp:TableCell>
              
             <asp:TableCell ID="TableCell38" runat="server" VerticalAlign="Top">
                 <asp:GridView ID="GridViewSunLunch" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource20" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                      <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                     <Columns>
                         <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-CssClass="gvCell" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" HeaderStyle-CssClass="gv" />
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource20" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Sunday') AND (Meal.MealType = 'Lunch')">
                     <SelectParameters>
                          <asp:QueryStringParameter DefaultValue="0" Name="PlanID" QueryStringField="PlanID" Type="String" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </asp:TableCell>
             
             <asp:TableCell ID="TableCell39" runat="server" VerticalAlign="Top">
                 <asp:GridView ID="GridViewSunDinner" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource21" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                      <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                     <Columns>
                         <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-CssClass="gvCell" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" HeaderStyle-CssClass="gv" />
                         <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" HeaderStyle-CssClass="gv" />
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource21" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Sunday') AND (Meal.MealType = 'Dinner')">
                     <SelectParameters>
                          <asp:QueryStringParameter DefaultValue="0" Name="PlanID" QueryStringField="PlanID" Type="String" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </asp:TableCell>
         </asp:TableRow>
         <asp:TableHeaderRow>
             <asp:TableCell ID="TableCell35" runat="server"><em><strong>Snack1:</strong></em></asp:TableCell>
            <asp:TableCell ID="TableCell87" runat="server"><em><strong>Snack2:</strong></em></asp:TableCell>
         </asp:TableHeaderRow>
         <asp:TableRow ID="TableRow20" runat="server">
             <asp:TableCell ID="TableCell70" runat="server">
                <asp:GridView ID="GridViewSunSnack1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource29" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                     <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    <Columns>
                        <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" HeaderStyle-CssClass="gv" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-CssClass="gvCell" HeaderStyle-CssClass="gv" />
                        <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" HeaderStyle-CssClass="gv" />
                        <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" HeaderStyle-CssClass="gv" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource29" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Sunday') AND (Meal.MealType = 'Snack1')">
                    <SelectParameters>
                         <asp:QueryStringParameter DefaultValue="0" Name="PlanID" QueryStringField="PlanID" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:TableCell>
             <asp:TableCell ID="TableCell76" runat="server">
                <asp:GridView ID="GridViewSunSnack2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource35" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                     <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    <Columns>
                        <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" HeaderStyle-CssClass="gv" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-CssClass="gvCell" HeaderStyle-CssClass="gv" />
                        <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" HeaderStyle-CssClass="gv" />
                        <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" HeaderStyle-CssClass="gv" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource35" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Sunday') AND (Meal.MealType = 'Snack2')">
                    <SelectParameters>
                         <asp:QueryStringParameter DefaultValue="0" Name="PlanID" QueryStringField="PlanID" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:TableCell>
             <asp:TableCell ID="TableCell59" runat="server" style="text-align:center; color:darkblue; font-weight:bold">
                 Summary Calories:
                 <asp:Label ID="lblSunSumCalorie" runat="server" Text=" "></asp:Label>
             </asp:TableCell>
             <asp:TableCell ID="TableCell60" runat="server"></asp:TableCell>
         </asp:TableRow>
     </asp:Table>

    <br />         
    <asp:Button ID="btnConvertPlan" runat="server" OnClick="btnConvertPlan_Click" Text="Save Plan" />
    <asp:Button ID="btnView" runat="server" OnClick="Button1_Click" Text="Go back to choose another plan" style="height: 26px" />
         <br />
    <asp:Label ID="lblPlanName" runat="server" Text="Enter your plan name: " Visible="False"></asp:Label>
    <asp:TextBox ID="txbPlanName" runat="server" Visible="False"></asp:TextBox>
    <br />

    <asp:Button ID="btnCopy" runat="server" OnClick="btnCopy_Click" Text="Copy this plan to your own" Visible="False" />
&nbsp;<asp:Label ID="lblCopyResult" runat="server" />
<br />
         <asp:PlaceHolder runat="server" ID="PlaceHolder1" Visible="false">
    &nbsp;You can
         <asp:Button ID="btnManagePlan" runat="server" OnClick="btnManagePlan_Click" Text="Manage your plan" />
&nbsp;now!</asp:PlaceHolder>
             </div>
    </asp:Content>
