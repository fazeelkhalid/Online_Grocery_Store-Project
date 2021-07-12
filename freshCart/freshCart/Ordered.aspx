<%@ Page Title="" Language="C#" MasterPageFile="~/adminMasterPage.Master" AutoEventWireup="true" CodeBehind="Ordered.aspx.cs" Inherits="freshCart.Order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <form id="Form1" runat="server">
         <asp:button id="RefreshButtonId" onclick="Refresh" style="display:none" runat="server"/>
       
         <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" ScriptMode="Release" LoadScriptsBeforeUI="true"></asp:ScriptManager>
        
        <div class="my-account-payment account-wrapper">

        <h2 class="account-title text-center text-success"><strong>Delivered order</strong> </h2>
        <div class="table-responsive m-5">


            <table class="table">
                    <tr>
                        <th scope="col" class="text-center">Product id</th>
                        <th scope="col" class="text-center">product name</th>
                        <th scope="col" class="text-center">quantity</th>
                        <th scope="col" class="text-center">address</th>
                        <th scope="col" class="text-center">Customer name</th>
                        <th scope="col"></th>
                    </tr>
                <tbody>
                    <% foreach(var item in itemsList) { %>
                    <tr>
                        <th scope="row"><%=item.Oid%></th>
                        <td><br/><%=item.pName%></td>
                        <td><br/><%=item.quantity %></td>
                        <td><br/><%=item.address%></td>
                        <td><br/><%=item.cName%></td>
                        <td><a onclick="orderDelivered(<%=item.CID%>); document.getElementById('ContentPlaceHolder1_RefreshButtonId').click(); " class=" mt-3 btn btn--medium btn--radius btn--black btn--black-hover-green font--bold text-uppercase text-center">Deliver</a></td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
            
            </div>
        </div> 
    </form>     

</asp:Content>
