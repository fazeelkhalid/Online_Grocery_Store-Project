<%@ Page Title="" Language="C#" MasterPageFile="~/adminMasterPage.Master" AutoEventWireup="true" CodeBehind="restrictCustomer.aspx.cs" Inherits="freshCart.restructCustomer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="Form1" runat="server">
        <asp:button id="RefreshButtonId" onclick="Refresh" style="display:none" runat="server"/>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" ScriptMode="Release" LoadScriptsBeforeUI="true"></asp:ScriptManager>
        <div class="my-account-payment account-wrapper p-5" style="margin-left: 50px; margin-right: 50px;">

        <h2 class="account-title text-center text-success"><strong>Restrict customer</strong> </h2>
        <div class="table-responsive">


            <table class="table">
                    <tr>
                        <th scope="col" class="text-center">Customer id</th>
                        <th scope="col" class="text-center">Name</th>
                        <th scope="col" class="text-center">Email</th>
                        <th scope="col" class="text-center">Phone number</th>
                        <th scope="col" class="text-center">Purchase</th>
                        <th scope="col" class="text-center">Status</th>
                        <th scope="col"></th>
                    </tr>
                <tbody>
                    <% foreach(var item in itemsList) { %>
                        <%if(item.role != "1") {%>
                            <tr>
                                <th scope="row"><%=item.Cid%></th>
                                <td><br/><%=item.name %></td>
                                <td><br/><%=item.email %></td>
                                <td><br/><%=item.phone%></td>
                                <td><br/><%=item.purchase%></td>
                                <%if(item.role == "0") {%>
                                    <td><br/>Active</td>
                                <%}else{%>
                                    <td><br/><strong>Blocked</strong></td>
                                <%} %>   
                                
                                <td><a onclick="restructCust(<%=item.Cid%>); document.getElementById('ContentPlaceHolder1_RefreshButtonId').click(); " class=" mt-3 btn btn--medium btn--radius btn--black btn--black-hover-green font--bold text-uppercase text-center">Block / Unblock</a></td>
                            </tr>
                        <%}%>
                    <%}%>
                </tbody>
            </table>
            
            </div>
        </div> 
    </form>     
    
</asp:Content>
