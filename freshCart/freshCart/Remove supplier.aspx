<%@ Page Title="" Language="C#" MasterPageFile="~/adminMasterPage.Master" AutoEventWireup="true" CodeBehind="Remove supplier.aspx.cs" Inherits="freshCart.Remove_supplier" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <form id="Form1" runat="server">
         <asp:button id="RefreshButtonId" onclick="Refresh" style="display:none" runat="server"/>
       
         <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" ScriptMode="Release" LoadScriptsBeforeUI="true"></asp:ScriptManager>
        
        <div class="my-account-payment account-wrapper">

        <h2 class="account-title text-center text-success"><strong>Remove product</strong> </h2>
        <div class="table-responsive m-5">


            <table class="table">
                    <tr>
                        <th scope="col" class="text-center">Supplier id</th>
                        <th scope="col" class="text-center">name</th>
                        <th scope="col" class="text-center">Company name</th>
                        <th scope="col" class="text-center">Contact number</th>
                        <th scope="col" class="text-center">CNIC</th>
                        <th scope="col"></th>
                    </tr>
                <tbody>
                    <% foreach(var item in itemsList) { %>
                    <tr>
                        <th scope="row"><%=item.id%></th>
                        <td><br/><%=item.name%></td>
                        <td><br/><%=item.company %></td>
                        <td><br/><%=item.contact%></td>
                        <td><br/><%=item.CNIC%></td>
                        <td><a onclick="removeSupplier(<%=item.id%>); document.getElementById('ContentPlaceHolder1_RefreshButtonId').click(); " class=" mt-3 btn btn--medium btn--radius btn--black btn--black-hover-green font--bold text-uppercase text-center">DELETE</a></td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
            
            </div>
        </div> 
    </form>     

</asp:Content>
