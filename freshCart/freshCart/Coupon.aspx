<%@ Page Title="" Language="C#" MasterPageFile="~/adminMasterPage.Master" AutoEventWireup="true" CodeBehind="Coupon.aspx.cs" Inherits="freshCart.Coupon" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="Form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" ScriptMode="Release" LoadScriptsBeforeUI="true"></asp:ScriptManager>
        
        <div class="my-account-payment account-wrapper">

        <h2 class="account-title text-center text-success"><strong>Apply coupon</strong> </h2>
        <div class="table-responsive m-5">


              <table class="table">
                    <tr>
                        <th scope="col" class="text-center">Customer id</th>
                        <th scope="col" class="text-center">Name</th>
                        <th scope="col" class="text-center">Phone number</th>
                        <th scope="col" class="text-center">Purchase</th>
                        <th scope="col" class="text-center">Coupon Box</th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                    </tr>
                <tbody>
                    <% foreach(var item in itemsList) { %>
                        <%if (item.role != "1" && item.role == "0") {%>
                            <tr>
                                <th scope="row"><%=item.Cid%></th>
                                <td><br/><%=item.name %></td>
                                <td><br/><%=item.phone%></td>
                                <td><br/><%=item.purchase%></td>
                                <td>
                                    <div class="form__group field">
                                        <br />
                                        <input id="<%=item.Cid%>" type="input" class="text-center form__field" placeholder="Coupon percentage" name="name" required="" maxlength="3"/>
                                    </div>
                                </td>
                                <td><a onclick="applycoupon(<%=item.Cid%>);" class=" mt-3 btn btn--medium btn--radius btn--black btn--black-hover-green font--bold text-uppercase text-center">Apply</a></td>
                                <td><a onclick="removeCouponJS(<%=item.Cid%>);" class=" mt-3 btn btn--medium btn--radius btn--black btn--black-hover-green font--bold text-uppercase text-center">Remove</a></td>
                            </tr>
                        <%}%>
                    <%}%>
                </tbody>
            </table>
            
            </div>
        </div> 
    </form>     

</asp:Content>
