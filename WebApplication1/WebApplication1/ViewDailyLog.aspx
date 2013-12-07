<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewDailyLog.aspx.cs" Inherits="WebApplication1.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    
    <style type="text/css">
        .auto-style1
        {
            height: 25px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
   <link href="Content/ViewDailyLog.css" rel="stylesheet" />
    <br />
    <div id="center">
    <asp:DropDownList ID="ddlCustomer" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCustomer_SelectedIndexChanged">
    </asp:DropDownList>
    <br />
    <br />
    <asp:GridView ID="gvDailyLog" runat="server">
        <Columns>
        <asp:TemplateField>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkStatus" runat="server"/>
                           
                    </ItemTemplate>                    
                </asp:TemplateField>

        </Columns>
    </asp:GridView>
   <div style="margin:0 auto 0 auto; width:90px"> <asp:Button ID="btncomment" CssClass="buttons" runat="server" Text="Add Comment" OnClick="btncomment_Click" /></div>
 <br />

  <fieldset><legend>What Food Did You Eat?</legend>
    <asp:Table ID="Table4" runat="server" Visible="False">
        <asp:TableRow ID="TableRow3" runat="server">
            <asp:TableCell>Food Category</asp:TableCell>
            <asp:TableCell>
                <input type="text" id="txtfoodCatgories"/>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow><asp:TableCell>Food Name</asp:TableCell><asp:TableCell>
            <input type="text" id="txtfoodName"/></asp:TableCell></asp:TableRow>
        <asp:TableRow ID="TableRow5" runat="server">
             <asp:TableCell>Food Calories</asp:TableCell>
            <asp:TableCell>
                
        <input type="text" id="txtquntity"/>
       
        
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow><asp:TableCell>Food Weight</asp:TableCell><asp:TableCell>
            <input type="text" id="txtWeight"/></asp:TableCell></asp:TableRow>
        <asp:TableRow><asp:TableCell>Food Quantity</asp:TableCell><asp:TableCell>
            <input type="text" id="txtdescrp"/></asp:TableCell></asp:TableRow>
        <asp:TableRow ID="TableRow6" runat="server">
             <asp:TableCell>
                 <input name="Submit5" type="button" onClick=add_row() class="buttons" value=" Add ">
        <input name="Submit33" onclick=del_row() type="button" class="buttons" value=" Delete ">
                 
                 </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="TableRow7" runat="server" Visible="False">
             <asp:TableCell>
                 <asp:Label ID="lblAddDisplay" runat="server"></asp:Label></asp:TableCell>
            <asp:TableCell></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
        </fieldset>
   
    <script>
       
        var j = 0
        function add_row() {
            
            k = j + 1
            j = sqd.rows.length;
            newRow = document.all.sqd.insertRow(-1)
            newcell = newRow.insertCell()
            newcell.style.backgroundColor = '#f7f7f7'
            newcell.innerHTML = "<input name=Number type=radio >"
            newcell = newRow.insertCell()
            newcell.style.backgroundColor = '#f7f7f7'
            newcell.innerText = document.getElementById("txtquntity").value;
            newcell = newRow.insertCell()
            newcell.style.backgroundColor = '#f7f7f7'
            newcell.innerText = document.getElementById("txtWeight").value;
            newcell = newRow.insertCell()
            newcell.style.backgroundColor = '#f7f7f7'
            newcell.innerText = document.getElementById("txtdescrp").value;
            newcell = newRow.insertCell()
            newcell.style.backgroundColor = '#f7f7f7'
            newcell.innerText = document.getElementById("txtfoodName").value;
            
            newcell = newRow.insertCell()
            newcell.style.backgroundColor = '#f7f7f7'
            newcell.innerHTML = document.getElementById("txtfoodCatgories").value;
            
          
          
        }
        function del_row() {
            if (sqd.rows.length == 1) return;
            var checkit = false
            for (var i = 0; i < document.all.Number.length; i++) {
                if (document.all.Number[i].checked) {

                    checkit = true;
                    sqd.deleteRow(i)
                    break;
                }
            }

            if (checkit) {

                for (i = 1; i < sqd.rows.length; i++) {
                    sqd.rows[i].cells[0].innerText = i
                }


            } else {
                alert("Please choose the row that you want to delete");
                return false
            }

        }
</script>
<table width=90% border=0 align="center" cellpadding=2 cellspacing=1 bgcolor="#FFFFFF" id="tablecoment">
  <tr>
    <td height="25" class="table1" hidden="hidden">
      <div align="center"><font color="#FFFFFF"><strong>≡≡≡ Comments ≡≡≡</strong></font></div></td>
  </tr>
  <tr>
    <td align=center valign=top bgcolor=f7f7f7 id="tbcomment"><table id="sqd" width="90%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999">
        <tr bgcolor="#BAC2DA">
          <td class="auto-style1">
            <div align="center">Food Catagorie</div></td>
          <td class="auto-style1">
            <div align="center">Food Name
                <input name=Number type=hidden />
          </div></td>
          
            <td class="auto-style1">
            <div align="center">Food Quantity</div></td>
          <td class="auto-style1">
            <div align="center">Food Weight</div></td>
            <td class="auto-style1" id ="tdcalories">
            <div align="center">Food Calories</div></td>
             <td class="auto-style1">
            <div align="center"></div></td>
          
            
          
        </tr>
      </table>
        <br />
        &nbsp;
    </td>
  </tr>
</table>
<asp:Button ID="btnevaluate" CssClass="buttons" runat="server" Text="Evaluate" OnClick="btnevaluate_Click" />&nbsp;<asp:Label ID="Label1" runat="server" Text="Label"> Your total calories of the food intake will be</asp:Label>
    <script type="text/javascript">
        function total() {
            var double1;
            var cells = document.getElementById("sqd");
            var tese1 = 0;
            var total=0;
            var test1=0; var test2=0; var test3=0; var test4=0;

            if (cells.rows.length == 1) {
                test1 = parseInt(document.getElementById("sqd").rows[1].cells[4].textContent.toString());
                total = test1;
            }
            else if (cells.rows.length == 2) {
                test1 = parseInt(document.getElementById("sqd").rows[1].cells[4].textContent.toString());
                test2 = parseInt(document.getElementById("sqd").rows[2].cells[4].textContent.toString());
                total = test1+test2;
            }
            else if (cells.rows.length == 3){
                test1 = parseInt(document.getElementById("sqd").rows[1].cells[4].textContent.toString());
                test2 = parseInt(document.getElementById("sqd").rows[2].cells[4].textContent.toString());
                test3 = parseInt(document.getElementById("sqd").rows[3].cells[4].textContent.toString());
                total = test1+test2+test3;
            }
            else if (cells.rows.length == 4) {
                test1 = parseInt(document.getElementById("sqd").rows[1].cells[4].textContent.toString());
                test2 = parseInt(document.getElementById("sqd").rows[2].cells[4].textContent.toString());
                test3 = parseInt(document.getElementById("sqd").rows[3].cells[4].textContent.toString());
                test4 = parseInt(document.getElementById("sqd").rows[4].cells[4].textContent.toString());
                total = test1+test2+test3+test4;
            }
           /* for (var i = 1; i < cells.rows.length; i++) {
                test1 =parseInt(document.getElementById("sqd").rows[i].cells[4].textContent.toString());
                total += test1;
            }*/
          
         
            document.getElementById("test").value =total.toString();
        }
    </script>
    &nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
 , and your followed diet plan calories will be<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
, Please keeping the diet plan every day.
        </div>
</asp:Content>
