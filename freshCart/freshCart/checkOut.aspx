<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="checkOut.aspx.cs" Inherits="freshCart.checkOut" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="container">
    
    <div class="row mt-5">
        <div class="col-md-4 order-md-2 mb-4">
            <h4 class="d-flex justify-content-between align-items-center mb-3">
                <span class="text-muted">Your cart</span>
                <span class="badge badge-secondary badge-pill"><%=totalCartProduct%></span>
            </h4>
            <ul class="list-group mb-3 sticky-top">
                <% foreach(var item in cartItemsList) { %>
                    <li class="list-group-item d-flex justify-content-between lh-condensed">
                        <div>
                            <h6 class="my-0"><%=item.name%></h6>
                            <small class="text-muted"><%=item.Description%></small>
                        </div>
                        <span class="text-muted"><%=item.price%></span>
                    </li>
                <%}%>
                <li class="list-group-item d-flex justify-content-between">
                    <span>Total (PKR)</span>
                    <strong><%=TotalPrice%></strong>
                </li>
            </ul>
        </div>
        <div class="col-md-8 order-md-1">
            <h4 class="mb-3">Billing address</h4>
            <form class="needs-validation" novalidate="" runat="server">
                <asp:button id="RefreshButtonId" onclick="Refresh" style="display:none" runat="server"/>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="lastName">Your Name</label>
                        <asp:Label type="text" class="form-control" id="Text1"  runat="server"></asp:Label>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="lastName">Phone number</label>
                        <asp:Label type="text" class="form-control" id="Text2"  runat="server"></asp:Label>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="username" class="text-center">Address</label>
                        <asp:TextBox type="text" class="form-control" id="Text3" placeholder="Address" required="" runat="server"></asp:TextBox>
                </div>
                <div>
                    <asp:Label id="Text4" class="text-center" runat="server"></asp:Label>
                    <asp:button OnClick="addToOrder" class="w-100 btn btn--block btn--radius btn--box btn--black btn--black-hover-green btn--large btn--uppercase font--bold" runat="server" Text="Place order"/>
                </div>
            </form>
        </div>
    </div>
    
</div>
</asp:Content>
