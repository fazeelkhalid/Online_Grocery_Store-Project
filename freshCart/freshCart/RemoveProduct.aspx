<%@ Page Title="" Language="C#" MasterPageFile="~/adminMasterPage.Master" AutoEventWireup="true" CodeBehind="RemoveProduct.aspx.cs" Inherits="freshCart.RemoveProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
         <asp:button id="RefreshButtonId" onclick="Refresh" style="display:none" runat="server" />
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" ScriptMode="Release" LoadScriptsBeforeUI="true"></asp:ScriptManager>
        
        <div class="my-account-payment account-wrapper">

        <h2 class="account-title text-center text-success"><strong>Remove product</strong> </h2>
        <div class="table-responsive m-5">


            <table class="table">
                    <tr>
                        <th scope="col" class="text-center">Product id</th>
                        <th scope="col" class="text-center">Image</th>
                        <th scope="col" class="text-center">Product name</th>
                        <th scope="col" class="text-center">Price</th>
                        <th scope="col" class="text-center">Total stock</th>
                        <th scope="col" class="text-center">Remaining stock</th>
                        <th scope="col"></th>
                    </tr>
                <tbody>
                    <% foreach(var item in itemsList) { %>
                    <tr>
                        <th scope="row"><%=item.Pid%></th>
                        <td><img class="bg-image hover-zoom" style="height: 70px; width: 70px;"  src="<%=item.ImgSrc%>" alt="<%=item.productname%>"/> </td>
                        <td><br/><%=item.productname %></td>
                        <td><br/><%=item.price %></td>
                        <td><br/><%=item.totalStock%></td>
                        <td><br/><%=item.remainingstock %></td>
                        <td><a onclick="deleteProduct(<%=item.Pid%>); document.getElementById('ContentPlaceHolder1_RefreshButtonId').click(); " class=" mt-3 btn btn--medium btn--radius btn--black btn--black-hover-green font--bold text-uppercase text-center">DELETE</a></td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
            
            </div>
        </div> 
    </form>     
                   
</asp:Content>
