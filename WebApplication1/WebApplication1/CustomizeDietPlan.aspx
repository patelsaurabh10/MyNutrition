<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomizeDietPlan.aspx.cs" Inherits="WebApplication1.CustomizeDietPlan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/CustomizeDietPlan.css" rel="stylesheet" />

   <br />
        <div id="center">
            <fieldset><legend>Customize Diet Plan</legend>
        <asp:Table ID="Table1" runat="server" Width="339px" >
                <asp:TableRow ID="TableRow21" runat="server">
            <asp:TableCell style="text-align:right">Choose Day:</asp:TableCell>
            <asp:TableCell style="text-align:left">
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
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
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="TableRow22" runat="server">
            <asp:TableCell style="text-align:right">Choose Meal Type:</asp:TableCell>
            <asp:TableCell style="text-align:left">
                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceMealType" DataTextField="MealType" DataValueField="MealType" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged"></asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSourceMealType" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT DISTINCT [MealType] FROM [Meal] WHERE ([PlanID] = @PlanID)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="PlanID" SessionField="PlanID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
                <asp:TableCell ColumnSpan="2" runat="server"><asp:Button ID="btnCheckCalorie" runat="server" Text="Check Calorie" OnClick="btnCheckCalorie_Click" /></asp:TableCell>
                </asp:TableRow>
        <asp:TableRow ID="TableRow25" runat="server">
            <asp:TableCell ColumnSpan="2" style ="text-align:right">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceMeal" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="FoodName" Visible="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
            <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
            <asp:BoundField DataField="FoodCalorie" HeaderText="FoodCalorie" SortExpression="FoodCalorie" />
        </Columns>
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
                </asp:GridView>
     <asp:SqlDataSource ID="SqlDataSourceMeal" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" 
         SelectCommand="SELECT Food.FoodName, FoodDetail.Quantity, FoodDetail.Weight, Food.FoodCalorie FROM FoodDetail INNER JOIN Food ON FoodDetail.FoodID = Food.FoodID INNER JOIN Meal ON FoodDetail.MealID = Meal.MealID WHERE (Meal.PlanID = @PlanID) AND (Meal.Day = @Day) AND (Meal.MealType = @MealType)">

          <SelectParameters>
                        <asp:SessionParameter Name="PlanID" SessionField="PlanID" DefaultValue="0" Type="Int32" />
                        <asp:ControlParameter ControlID="DropDownList1" Name="Day" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownList2" Name="MealType" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
            </asp:TableCell>
            
        </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="2" runat="server"><asp:Label ID="lblMealCalorie" runat="server" Text="This meal's total calorie is:  "></asp:Label>
                <br />
                <asp:Label ID="lblTotalCalorie" runat="server" Text="Today's total calorie is:___"></asp:Label>
                </asp:TableCell>
                </asp:TableRow>
    </asp:Table>
    <br />
    Do you want to <asp:Button ID="btnShowAdd" runat="server" Text="Add" OnClick="btnShowAdd_Click" /> or <asp:Button ID="btnShowDelete" runat="server" Text="Delete" OnClick="btnShowDelete_Click" /> an item from this meal?
    <br /><br />
    <asp:Table ID="Table3" runat="server" Visible="False">
         <asp:TableRow ID="TableRow24" runat="server">
            <asp:TableCell>Please select an item you want to delete in the above meal</asp:TableCell>
        </asp:TableRow>
                <asp:TableRow ID="TableRow14" runat="server"><asp:TableCell><br /></asp:TableCell></asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell><asp:Button ID="btnDelete" runat="server" OnClick="btnDelete_Click" Text="Delete" OnClientClick = "return confirm('Are you sure you want to delete?');"/></asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSourceFoodName" DataTextField="FoodName" DataValueField="FoodName">
    </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceFoodName" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT FoodName FROM Food WHERE FoodName = @FoodName">
         <SelectParameters>
             <asp:ControlParameter ControlID="GridView1" DefaultValue="" Name="FoodName" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell>
                <asp:Label ID="lblDeleteResult" runat="server"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
   
    </asp:Table>
    <br />
    <br />
    <asp:Table ID="Table4" runat="server" Visible="False">
        <asp:TableRow runat="server">
            <asp:TableCell>
              What kind of food do you want?
        </asp:TableCell>
            <asp:TableCell>
                  <asp:DropDownList ID="ddlFoodCategory" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="FoodCategory" DataValueField="FoodCategory" OnSelectedIndexChanged="ddlFoodCategory_SelectedIndexChanged">
        </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT DISTINCT [FoodCategory] FROM [Food]"></asp:SqlDataSource>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell>Select an item:</asp:TableCell>
            <asp:TableCell>
                        <asp:DropDownList ID="ddlFoodName" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource23" DataTextField="FoodName" DataValueField="FoodName" OnSelectedIndexChanged="ddlFoodName_SelectedIndexChanged">
            <asp:ListItem Selected="True"></asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource23" runat="server" ConnectionString="<%$ ConnectionStrings:MyNutritionConnectionString %>" SelectCommand="SELECT [FoodName] FROM [Food] WHERE ([FoodCategory] = @FoodCategory)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlFoodCategory" DefaultValue="Fruit" Name="FoodCategory" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
             <asp:TableCell>Specify the weight/quantity</asp:TableCell>
            <asp:TableCell>
                <asp:RadioButton ID="rbtnWeight" runat="server" GroupName="Unit" Text="Weight" Width="70px" Enabled="False" />
        <asp:RadioButton ID="rbtnQuantity" runat="server" GroupName="Unit"  Text="Quantity" Width="71px" Enabled="False" />
        <asp:TextBox ID="tbxQuantity" runat="server" Width="74px" OnTextChanged="tbxQuantity_TextChanged"></asp:TextBox>
        <asp:DropDownList ID="ddlUnit" runat="server" AutoPostBack="True">
            <asp:ListItem>g</asp:ListItem>
            <asp:ListItem>oz</asp:ListItem>
        </asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
             <asp:TableCell>
                 <asp:Button ID="btnAddConfirm" runat="server" Text="Add" OnClick="btnAddConfirm_Click" OnClientClick = "return confirm('Are you sure you want to add?');"/> 
                 </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
             <asp:TableCell>
                 <asp:Label ID="lblAddDisplay" runat="server"></asp:Label></asp:TableCell>
            <asp:TableCell></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
            </fieldset>
            </div>
    <br />
    <br />
            
    </asp:Content>
