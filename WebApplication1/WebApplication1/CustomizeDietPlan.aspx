<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomizeDietPlan.aspx.cs" Inherits="WebApplication1.CustomizeDietPlan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    Enter new item here:
    <br />
    Choose Day:&nbsp;&nbsp;&nbsp; <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
        <asp:ListItem>Monday</asp:ListItem>
        <asp:ListItem>Tuesday</asp:ListItem>
        <asp:ListItem>Wendesday</asp:ListItem>
        <asp:ListItem>Thursday</asp:ListItem>
        <asp:ListItem>Friday</asp:ListItem>
        <asp:ListItem>Saturday</asp:ListItem>
        <asp:ListItem>Sunday</asp:ListItem>
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSourceDay" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT DISTINCT [Day] FROM [Meal] WHERE ([PlanID] = @PlanID)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="PlanID" SessionField="PlanID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    Choose Meal Type:&nbsp;&nbsp;&nbsp; <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceMealType" DataTextField="MealType" DataValueField="MealType"></asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSourceMealType" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT DISTINCT [MealType] FROM [Meal] WHERE ([PlanID] = @PlanID)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="PlanID" SessionField="PlanID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceMealDetail" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT [MealType], [MealID] FROM [Meal] WHERE ([Day] = @Day)">
         <SelectParameters>
             <asp:QueryStringParameter DefaultValue="Monday" Name="Day" QueryStringField="day" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Table ID="Table1" runat="server">
        <asp:TableRow runat="server">
        </asp:TableRow>
        <asp:TableRow runat="server">
        </asp:TableRow>
        <asp:TableRow runat="server">
        </asp:TableRow>
        <asp:TableRow runat="server">
        </asp:TableRow>
    </asp:Table>
  
    <br />
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="ADD " OnClick="Button1_Click" />
    <asp:Button ID="Button2" runat="server" Text="Modify " />
    <br />
    <br />
    <br />

    <br />
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT [MealType], [Day], [MealID] FROM [Meal]" DeleteCommand="DELETE FROM [Meal] WHERE [MealID] = @MealID" InsertCommand="INSERT INTO [Meal] ([MealType], [Day]) VALUES (@MealType, @Day)" UpdateCommand="UPDATE [Meal] SET [MealType] = @MealType, [Day] = @Day WHERE [MealID] = @MealID">
          <DeleteParameters>
              <asp:Parameter Name="MealID" Type="Int32" />
          </DeleteParameters>
          <InsertParameters>
              <asp:Parameter Name="MealType" Type="String" />
              <asp:Parameter Name="Day" Type="String" />
          </InsertParameters>
          <UpdateParameters>
              <asp:Parameter Name="MealType" Type="String" />
              <asp:Parameter Name="Day" Type="String" />
              <asp:Parameter Name="MealID" Type="Int32" />
          </UpdateParameters>
    </asp:SqlDataSource>
    &nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource23" AllowPaging="True" AllowSorting="True">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                        <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
                        <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" />
                    </Columns>
                </asp:GridView>
      <!--updateComman and deleteCommand undone-->
           <!--also the parameters-->
     <asp:SqlDataSource ID="SqlDataSource23" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" 
         SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Monday') AND (Meal.MealType = 'Breakfast')"
          DeleteCommand="DELETE Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Monday') AND (Meal.MealType = 'Breakfast')"
         UpdateCommand="UPDATE Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie SET Food.FoodName = @FoodName, FoodDetail.Quantity = @Quantity,FoodDetail.Weight = @Weight, Food.FoodCalorie = @FoodCalorie WHERE [MealID] = @MealID">

          <SelectParameters>
                        <asp:SessionParameter Name="PlanID" SessionField="PlanID" DefaultValue="0" Type="Int32" />
                    </SelectParameters>
          <DeleteParameters>
            <asp:SessionParameter Name="PlanID" SessionField="PlanID" DefaultValue="0" Type="Int32" />
        </DeleteParameters>
                </asp:SqlDataSource>
    <br />
    <br />
    <br />
    <br />
    <br />
    Monday:<asp:Table ID="TableMonday" runat="server">
        <asp:TableRow runat="server">
            <asp:TableCell runat="server">Breakfast:</asp:TableCell>
            <asp:TableCell runat="server">Lunch:</asp:TableCell>
            <asp:TableCell runat="server">Dinner:</asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell ID="TableCell1" runat="server">
                <asp:GridView ID="GridViewMonBreak" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource22" AllowPaging="True" AllowSorting="True">
                    <Columns>
                        <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                        <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
                        <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource22" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Monday') AND (Meal.MealType = 'Breakfast')">
                    <SelectParameters>
                        <asp:SessionParameter Name="PlanID" SessionField="PlanID" DefaultValue="0" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:TableCell>
            <asp:TableCell ID="TableCell2" runat="server" VerticalAlign="Top">
                <asp:GridView ID="GridViewMonLunch" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True">
                    <Columns>
                        <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                        <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
                        <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Monday') AND (Meal.MealType = 'Lunch')">
                    <SelectParameters>
                        <asp:SessionParameter Name="PlanID" SessionField="PlanID" DefaultValue="0" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:TableCell>
            <asp:TableCell ID="TableCell3" runat="server" VerticalAlign="Top">
                <asp:GridView ID="GridViewMonDinner" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" AllowPaging="True" AllowSorting="True">
                    <Columns>
                        <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                        <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
                        <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Monday') AND (Meal.MealType = 'Dinner')">
                    <SelectParameters>
                        <asp:SessionParameter Name="PlanID" SessionField="PlanID" DefaultValue="0" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="TableRow13" runat="server">
            <asp:TableCell ID="TableCell40" runat="server" HorizontalAlign="right">Summary Calories:</asp:TableCell>
            <asp:TableCell ID="TableCell41" runat="server">
                <asp:Label ID="lblMonSumCalorie" runat="server" Text=" "></asp:Label>
            </asp:TableCell>
            <asp:TableCell ID="TableCell42" runat="server"></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <br />
    <br />
    Tuesday:
    <asp:Table ID="TableTuesday" runat="server">
        <asp:TableRow ID="TableRow1" runat="server">
            <asp:TableCell ID="TableCell4" runat="server">Breakfast:</asp:TableCell>
            <asp:TableCell ID="TableCell5" runat="server">Lunch:</asp:TableCell>
            <asp:TableCell ID="TableCell6" runat="server">Dinner:</asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="TableRow2" runat="server">
            <asp:TableCell ID="TableCell7" runat="server">
                 <asp:GridView ID="GridViewTueBreak" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" AllowPaging="True" AllowSorting="True">
                     <Columns>
                         <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" />
                         <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                         <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
                         <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" />
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Tuesday') AND (Meal.MealType = 'Breakfast')">
                     <SelectParameters>
                         <asp:SessionParameter Name="PlanID" SessionField="PlanID" DefaultValue="0" Type="Int32" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </asp:TableCell>
            <asp:TableCell ID="TableCell8" runat="server" VerticalAlign="Top">
                 <asp:GridView ID="GridViewTueLunch" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource5" AllowPaging="True" AllowSorting="True">
                     <Columns>
                         <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" />
                         <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                         <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
                         <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" />
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Tuesday') AND (Meal.MealType = 'Lunch')">
                     <SelectParameters>
                         <asp:SessionParameter Name="PlanID" SessionField="PlanID" DefaultValue="0" Type="Int32" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </asp:TableCell>
            <asp:TableCell ID="TableCell9" runat="server" VerticalAlign="Top">
                 <asp:GridView ID="GridViewTueDinner" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource6" AllowPaging="True" AllowSorting="True">
                     <Columns>
                         <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" />
                         <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                         <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
                         <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" />
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Tuesday') AND (Meal.MealType = 'Dinner')">
                     <SelectParameters>
                         <asp:SessionParameter Name="PlanID" SessionField="PlanID" DefaultValue="0" Type="Int32" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="TableRow15" runat="server">
            <asp:TableCell ID="TableCell43" runat="server" HorizontalAlign="right">Summary Calories:</asp:TableCell>
            <asp:TableCell ID="TableCell44" runat="server">
                 <asp:Label ID="lblTueSumCalorie" runat="server" Text=" "></asp:Label>
             </asp:TableCell>
            <asp:TableCell ID="TableCell45" runat="server"></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <br />
    Wendesday:
    <asp:Table ID="TableWendesday" runat="server">
        <asp:TableRow ID="TableRow3" runat="server">
            <asp:TableCell ID="TableCell10" runat="server">Breakfast:</asp:TableCell>
            <asp:TableCell ID="TableCell11" runat="server">Lunch:</asp:TableCell>
            <asp:TableCell ID="TableCell12" runat="server">Dinner:</asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="TableRow4" runat="server">
            <asp:TableCell ID="TableCell13" runat="server">
                 <asp:GridView ID="GridViewWedBreak" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource7" AllowPaging="True" AllowSorting="True">
                     <Columns>
                         <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" />
                         <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                         <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
                         <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" />
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Wendesday') AND (Meal.MealType = 'Breakfast')">
                     <SelectParameters>
                         <asp:SessionParameter Name="PlanID" SessionField="PlanID" DefaultValue="0" Type="Int32" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </asp:TableCell>
            <asp:TableCell ID="TableCell14" runat="server" VerticalAlign="Top">
                 <asp:GridView ID="GridViewWedLunch" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource8" AllowPaging="True" AllowSorting="True">
                     <Columns>
                         <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" />
                         <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                         <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
                         <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" />
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Wendesday') AND (Meal.MealType = 'Lunch')">
                     <SelectParameters>
                         <asp:SessionParameter Name="PlanID" SessionField="PlanID" DefaultValue="0" Type="Int32" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </asp:TableCell>
            <asp:TableCell ID="TableCell15" runat="server" VerticalAlign="Top">
                 <asp:GridView ID="GridViewWedDinner" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource9" AllowPaging="True" AllowSorting="True">
                     <Columns>
                         <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" />
                         <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                         <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
                         <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" />
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Wendesday') AND (Meal.MealType = 'Dinner')">
                     <SelectParameters>
                         <asp:SessionParameter Name="PlanID" SessionField="PlanID" DefaultValue="0" Type="Int32" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="TableRow16" runat="server">
            <asp:TableCell ID="TableCell46" runat="server" HorizontalAlign="right">Summary Calories:</asp:TableCell>
            <asp:TableCell ID="TableCell47" runat="server">
                 <asp:Label ID="lblWesSumCalorie" runat="server" Text=" "></asp:Label>
             </asp:TableCell>
            <asp:TableCell ID="TableCell48" runat="server"></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <br />
    Thursday:
    <asp:Table ID="TableThursday" runat="server">
        <asp:TableRow ID="TableRow5" runat="server">
            <asp:TableCell ID="TableCell16" runat="server">Breakfast:</asp:TableCell>
            <asp:TableCell ID="TableCell17" runat="server">Lunch:</asp:TableCell>
            <asp:TableCell ID="TableCell18" runat="server">Dinner:</asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="TableRow6" runat="server">
            <asp:TableCell ID="TableCell19" runat="server">
                 <asp:GridView ID="GridViewThurBreak" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource10" AllowPaging="True" AllowSorting="True">
                     <Columns>
                         <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" />
                         <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                         <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
                         <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" />
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Thursday') AND (Meal.MealType = 'Breakfast')">
                     <SelectParameters>
                         <asp:SessionParameter Name="PlanID" SessionField="PlanID" DefaultValue="0" Type="Int32" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </asp:TableCell>
            <asp:TableCell ID="TableCell20" runat="server" VerticalAlign="Top">
                 <asp:GridView ID="GridViewThurLunch" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource11" AllowPaging="True" AllowSorting="True">
                     <Columns>
                         <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" />
                         <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                         <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
                         <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" />
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Thursday') AND (Meal.MealType = 'Lunch')">
                     <SelectParameters>
                         <asp:SessionParameter Name="PlanID" SessionField="PlanID" DefaultValue="0" Type="Int32" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </asp:TableCell>
            <asp:TableCell ID="TableCell21" runat="server" VerticalAlign="Top">
                 <asp:GridView ID="GridViewThurDinner" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource12" AllowPaging="True" AllowSorting="True">
                     <Columns>
                         <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" />
                         <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                         <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
                         <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" />
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Thursday') AND (Meal.MealType = 'Dinner')">
                     <SelectParameters>
                         <asp:SessionParameter Name="PlanID" SessionField="PlanID" DefaultValue="0" Type="Int32" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="TableRow17" runat="server">
            <asp:TableCell ID="TableCell49" runat="server" HorizontalAlign="right">Summary Calories:</asp:TableCell>
            <asp:TableCell ID="TableCell50" runat="server">
                 <asp:Label ID="lblThurSumCalorie" runat="server" Text=" "></asp:Label>
             </asp:TableCell>
            <asp:TableCell ID="TableCell51" runat="server"></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <br />
    Friday:
    <asp:Table ID="TableFriday" runat="server">
        <asp:TableRow ID="TableRow7" runat="server">
            <asp:TableCell ID="TableCell22" runat="server">Breakfast:</asp:TableCell>
            <asp:TableCell ID="TableCell23" runat="server">Lunch:</asp:TableCell>
            <asp:TableCell ID="TableCell24" runat="server">Dinner:</asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="TableRow8" runat="server">
            <asp:TableCell ID="TableCell25" runat="server">
                 <asp:GridView ID="GridViewFriBreak" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource13" AllowPaging="True" AllowSorting="True">
                     <Columns>
                         <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" />
                         <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                         <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
                         <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" />
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Friday') AND (Meal.MealType = 'Breakfast')">
                     <SelectParameters>
                         <asp:SessionParameter Name="PlanID" SessionField="PlanID" DefaultValue="0" Type="Int32" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </asp:TableCell>
            <asp:TableCell ID="TableCell26" runat="server" VerticalAlign="Top">
                 <asp:GridView ID="GridViewFriLunch" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource14" AllowPaging="True" AllowSorting="True">
                     <Columns>
                         <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" />
                         <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                         <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
                         <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" />
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource14" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Friday') AND (Meal.MealType = 'Lunch')">
                     <SelectParameters>
                         <asp:SessionParameter Name="PlanID" SessionField="PlanID" DefaultValue="0" Type="Int32" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </asp:TableCell>
            <asp:TableCell ID="TableCell27" runat="server" VerticalAlign="Top">
                 <asp:GridView ID="GridViewFriDinner" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource15" AllowPaging="True" AllowSorting="True">
                     <Columns>
                         <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" />
                         <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                         <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
                         <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" />
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource15" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Friday') AND (Meal.MealType = 'Dinner')">
                     <SelectParameters>
                         <asp:SessionParameter Name="PlanID" SessionField="PlanID" DefaultValue="0" Type="Int32" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="TableRow18" runat="server">
            <asp:TableCell ID="TableCell52" runat="server" HorizontalAlign="right">Summary Calories:</asp:TableCell>
            <asp:TableCell ID="TableCell53" runat="server">
                 <asp:Label ID="lblFriSumCalorie" runat="server" Text=" "></asp:Label>
             </asp:TableCell>
            <asp:TableCell ID="TableCell54" runat="server"></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <br />
    Saturday:
    <asp:Table ID="TableSaturday" runat="server">
        <asp:TableRow ID="TableRow9" runat="server">
            <asp:TableCell ID="TableCell28" runat="server">Breakfast:</asp:TableCell>
            <asp:TableCell ID="TableCell29" runat="server">Lunch:</asp:TableCell>
            <asp:TableCell ID="TableCell30" runat="server">Dinner:</asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="TableRow10" runat="server">
            <asp:TableCell ID="TableCell31" runat="server">
                 <asp:GridView ID="GridViewSatBreak" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource16" AllowPaging="True" AllowSorting="True">
                     <Columns>
                         <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" />
                         <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                         <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
                         <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" />
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource16" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Saturday') AND (Meal.MealType = 'Breakfast')">
                     <SelectParameters>
                         <asp:SessionParameter Name="PlanID" SessionField="PlanID" DefaultValue="0" Type="Int32" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </asp:TableCell>
            <asp:TableCell ID="TableCell32" runat="server" VerticalAlign="Top">
                 <asp:GridView ID="GridViewSatLunch" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource17" AllowPaging="True" AllowSorting="True">
                     <Columns>
                         <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" />
                         <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                         <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
                         <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" />
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource17" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Saturday') AND (Meal.MealType = 'Lunch')">
                     <SelectParameters>
                         <asp:SessionParameter Name="PlanID" SessionField="PlanID" DefaultValue="0" Type="Int32" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </asp:TableCell>
            <asp:TableCell ID="TableCell33" runat="server" VerticalAlign="Top">
                 <asp:GridView ID="GridViewSatDinner" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource18" AllowPaging="True" AllowSorting="True">
                     <Columns>
                         <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" />
                         <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                         <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
                         <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" />
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource18" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Saturday') AND (Meal.MealType = 'Dinner')">
                     <SelectParameters>
                         <asp:SessionParameter Name="PlanID" SessionField="PlanID" DefaultValue="0" Type="Int32" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="TableRow19" runat="server">
            <asp:TableCell ID="TableCell55" runat="server" HorizontalAlign="right">Summary Calories:</asp:TableCell>
            <asp:TableCell ID="TableCell56" runat="server">
                 <asp:Label ID="lblSatSumCalorie" runat="server" Text=" "></asp:Label>
             </asp:TableCell>
            <asp:TableCell ID="TableCell57" runat="server"></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <br />
    Sunday:
    <asp:Table ID="Table2" runat="server">
        <asp:TableRow ID="TableRow11" runat="server">
            <asp:TableCell ID="TableCell34" runat="server">Breakfast:</asp:TableCell>
            <asp:TableCell ID="TableCell35" runat="server">Lunch:</asp:TableCell>
            <asp:TableCell ID="TableCell36" runat="server">Dinner:</asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="TableRow12" runat="server">
            <asp:TableCell ID="TableCell37" runat="server">
                 <asp:GridView ID="GridViewSunBreak" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource19" AllowPaging="True" AllowSorting="True">
                     <Columns>
                         <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" />
                         <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                         <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
                         <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" />
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource19" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Sunday') AND (Meal.MealType = 'Breakfast')">
                     <SelectParameters>
                         <asp:SessionParameter Name="PlanID" SessionField="PlanID" DefaultValue="0" Type="Int32" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </asp:TableCell>
            <asp:TableCell ID="TableCell38" runat="server" VerticalAlign="Top">
                 <asp:GridView ID="GridViewSunLunch" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource20" AllowPaging="True" AllowSorting="True">
                     <Columns>
                         <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" />
                         <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                         <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
                         <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" />
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource20" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Sunday') AND (Meal.MealType = 'Lunch')">
                     <SelectParameters>
                         <asp:SessionParameter Name="PlanID" SessionField="PlanID" DefaultValue="0" Type="Int32" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </asp:TableCell>
            <asp:TableCell ID="TableCell39" runat="server" VerticalAlign="Top">
                 <asp:GridView ID="GridViewSunDinner" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource21" AllowPaging="True" AllowSorting="True">
                     <Columns>
                         <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" />
                         <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                         <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
                         <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" />
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource21" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = 'Sunday') AND (Meal.MealType = 'Dinner')">
                     <SelectParameters>
                         <asp:SessionParameter Name="PlanID" SessionField="PlanID" DefaultValue="0" Type="Int32" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="TableRow20" runat="server">
            <asp:TableCell ID="TableCell58" runat="server" HorizontalAlign="right">Summary Calories:</asp:TableCell>
            <asp:TableCell ID="TableCell59" runat="server">
                 <asp:Label ID="lblSunSumCalorie" runat="server" Text=" "></asp:Label>
             </asp:TableCell>
            <asp:TableCell ID="TableCell60" runat="server"></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>
