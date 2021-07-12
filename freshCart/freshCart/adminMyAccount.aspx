<%@ Page Title="" Language="C#" MasterPageFile="~/adminMasterPage.Master" AutoEventWireup="true" CodeBehind="adminMyAccount.aspx.cs" Inherits="freshCart.adminMyAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main style="margin-top:10%;" id="main-container" class="main-container">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- :::::::::: Start My Account Section :::::::::: -->
                    <form id="Form1" runat="server">
                        <div class="my-account-area">
                            <div class="row">
                                <div class="col-xl-3 col-md-4">
                                    <div class="my-account-menu">
                                    
                                        <ul class="nav account-menu-list flex-column nav-pills" id="pills-tab" role="tablist">
                                            <li>
                                                <a class="active link--icon-left" id="pills-dashboard-tab" data-toggle="pill" href="#pills-dashboard"
                                                    role="tab" aria-controls="pills-dashboard" aria-selected="true"><i
                                                        class="fas fa-tachometer-alt"></i> Dashboard</a>
                                            </li>
										
                                            <li>
                                                <a id="pills-payment-tab" class="link--icon-left" data-toggle="pill" href="#Product-list" role="tab"
                                                    aria-controls="pills-payment" aria-selected="false">
                                                    <i class="fas fa-ellipsis-h"></i> Products</a>
                                            </li>
										
                                            <li>
                                                <a id="pills-address-tab" class="link--icon-left" data-toggle="pill" href="#Buyer-list" role="tab"
                                                    aria-controls="pills-address" aria-selected="false"><i
                                                        class="fas fas fa-user-friends"></i>Customers</a>
                                            </li>	
										
                                            <li>
                                                <a id="A1" class="link--icon-left" data-toggle="pill" href="#supplier-id" role="tab"
                                                    aria-controls="pills-address" aria-selected="false"><i
                                                        class="fas fa-address-card"></i>Suppliers</a>
                                            </li>

                                            <li>
                                                <a id="pills-account-tab" class="link--icon-left" data-toggle="pill" href="#pills-account" role="tab"
                                                    aria-controls="pills-account" aria-selected="false"><i class="fas fa-user"></i>
                                                    Account Details</a>
                                            </li>
										
                                            <li>
                                                <a class="link--icon-left" onclick="document.getElementById('ContentPlaceHolder1_signoutButton').click();"><i class="fas fa-sign-out-alt"></i> Logout</a>
                                            </li>
                                            <asp:button id="signoutButton" onclick="Logout_button" style="display:none" runat="server"/>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-xl-8 col-md-8">
                                    <div class="tab-content my-account-tab" id="pills-tabContent">
                                        <div class="tab-pane fade show active" id="pills-dashboard" role="tabpanel"
                                            aria-labelledby="pills-dashboard-tab">
                                            <div class="my-account-dashboard account-wrapper">
                                                <h4 class="account-title">Dashboard</h4>
                                                <div class="welcome-dashboard m-t-30">
                                                    <asp:Label runat="server"> Hello, <strong><asp:label id="Admin_name" runat="server">great admin</asp:label></strong></asp:Label>
                                                </div>
                                                <p class="m-t-25">From your account dashboard. you can easily check your password,
                                                    account details and manage your shop.</p>
                                            </div>
                                        </div>
									
                                        <div class="tab-pane fade" id="Product-list" role="tabpanel" aria-labelledby="pills-payment-tab">
                                            <div class="my-account-payment account-wrapper">
                                            <h4 class="account-title">Product List</h4>
                                                <div class="table-responsive"> 
                                                    <table class="table">
                                                        <tr>
                                                            <th scope="col">Pid</th>
                                                            <th scope="col" class="text-center" >Name</th>
                                                            <th scope="col" class="text-center" >Price</th>
                                                            <th scope="col" class="text-center" >discount</th>
                                                            <th scope="col" class="text-center" >Total stock</th>
                                                            <th scope="col" class="text-center" >Sales</th>
                                                        </tr>
                                                        <tbody>
                                                            <% foreach (var item in productList) { %>
                                                                <tr>
                                                                    <th scope="row"> <%=item.Pid %> </th>
                                                                    <td><%=item.productname%></td>
                                                                    <td><%=item.price%> RS</td>
                                                                    <td><%=item.Discount%> %</td>
                                                                    <td><%=item.totalStock%> Units</td>
                                                                    <td><%=item.totalSale%> Units</td>
                                                                </tr>
                                                             <% } %>
                                                        </tbody>
                                                   </table>
                                                 </div>    
                                            </div>
                                        </div>
                                        
                                        <div class="tab-pane fade" id="Buyer-list" role="tabpanel" aria-labelledby="pills-address-tab">
                                            <div class="my-account-address account-wrapper">
                                                <h4 class="account-title">Customers List</h4>
                                                <div class="table-responsive"> 
                                                     <table class="table">
                                                        <tr>
                                                            <th scope="col">Cid</th>
                                                            <th scope="col" class="text-center" >Name</th>
                                                            <th scope="col" class="text-center" >Email</th>
                                                            <th scope="col" class="text-center" >Contact number</th>
                                                            <th scope="col" class="text-center" >Purchase</th>
                                                        </tr>
  
                                                        <tbody>
                                                            <% foreach (var item in customerList) { %>
                                                                <tr>
                                                                    <th scope="row"> <%=item.Cid%> </th>
                                                                    <td><%=item.name%></td>
                                                                    <td><%=item.email%></td>
                                                                    <td><%=item.phone%> </td>
                                                                    <td><%=item.purchase%> RS Units</td>
                                                                </tr>
                                                                <% } %>
                                                        </tbody>
                                                     </table>
                                                  </div>   
                                            </div>
                                        </div>
                                        
                                        <div class="tab-pane fade" id="supplier-id" role="tabpanel" aria-labelledby="pills-payment-tab"> 
                                            <div class="my-account-payment account-wrapper">
                                                <h4 class="account-title">Supplier List</h4>
                                                <div class="table-responsive"> 
                                                    <table class="table">
                                                        <tr>
                                                            <th scope="col">id#</th>
                                                            <th scope="col" class="text-center" >Name</th>
                                                            <th scope="col" class="text-center" >Company</th>
                                                            <th scope="col" class="text-center" >Mobile Number</th>
                                                            <th scope="col" class="text-center" >CNIC</th>
                                                        </tr>
  
                                                        <tbody>
                                                            <% foreach (var item in supplierList) { %>
                                                                <tr>
                                                                    <th scope="row"> <%=item.id%> </th>
                                                                    <td><%=item.name%></td>
                                                                    <td><%=item.company%></td>
                                                                    <td><%=item.contact%></td>
                                                                    <td><%=item.CNIC%></td>
                                                                </tr>
                                                             <% } %>
                                                        </tbody>
                                                    </table>
                                               </div>    
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="Div2" role="tabpanel"
                                            aria-labelledby="pills-address-tab">
                                            <div class="my-account-address account-wrapper">
                                                 <h4 class="account-title">Buyers List</h4>
                                                 <div class="table-responsive">  
                                                    <table class="table">
                                                        <tr>
                                                            <th scope="col">Cid</th>
                                                            <th scope="col" class="text-center" >Name</th>
                                                            <th scope="col" class="text-center" >Email</th>
                                                            <th scope="col" class="text-center" >Contact number</th>
                                                            <th scope="col" class="text-center" >Purchase</th>
                                                        </tr>
  
                                                        <tbody>
                                                            <% foreach (var item in customerList) { %>
                                                                <tr>
                                                                    <th scope="row"> <%=item.Cid%> </th>
                                                                    <td><%=item.name%></td>
                                                                    <td><%=item.email%></td>
                                                                    <td><%=item.phone%> </td>
                                                                    <td><%=item.purchase%> RS Units</td>
                                                                </tr>
                                                                <% } %>
                                                        </tbody>
                                                     </table>   
                                                 </div>
                                            </div>
                                        </div>


                                        <div class="tab-pane fade" id="pills-account" role="tabpanel" aria-labelledby="pills-account-tab" >
                                            <div class="my-account-details account-wrapper">
                                                <h4 class="account-title">Account Details</h4>

                                                <div class="account-details">
                                                    <div class="row">
												
                                                        <div class="col-md-8">
                                                            <div class="form-box__single-group">
                                                                <asp:TextBox style="margin-left:4%;"><strong>Name</strong></asp:TextBox>
                                                                <input type="text" readonly="" id="NameOut" placeholder="Name" runat="server"/>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-8">
                                                            <div class="form-box__single-group">
                                                            
                                                                <asp:TextBox ID="TextBox1" style="margin-left:4%;"><strong>Email</strong></asp:TextBox>
                                                                <input type="text" readonly="" id="EmailOut" placeholder="Email" runat="server"/>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-8">
                                                            <div class="form-box__single-group">
                                                            
                                                                <asp:TextBox ID="TextBox2" style="margin-left:4%; "><strong>Cell number</strong></asp:TextBox>
                                                                <input type="text" readonly="" id="phoneNumberOut" placeholder="Cell number" runat="server"/>
                                                            </div>
                                                        </div>
                                                        


                                                        <!--change password form-->

                                                            <div class="col-md-12">
                                                                <div class="form-box__single-group">
                                                                    <h5 class="title">Password change</h5>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-12">
                                                                <div class="form-box__single-group">
                                                                    <asp:TextBox ID="oldPassword" type="password" placeholder="Current Password" runat="server"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-box__single-group">
                                                                    <asp:TextBox id="newPassword" type="password" placeholder="New Password" runat="server"></asp:TextBox>
                                                                
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-box__single-group">
                                                                
                                                                    <asp:TextBox id="confirmPassword" type="password" placeholder="Confirm Password" runat="server"></asp:TextBox>
                                                                </div>
                                                            </div>
												            <div class="col-md-6">
														
														        <div class="form-box__single-group">
                                                                    <asp:Label style="text-align:center;" id="passwordwarningBox" class="font--bold" runat="server"></asp:Label>
                                                                    <asp:button ID="Button1" Onclick="Button1_click" class="btn btn--box btn--radius btn--small btn--black btn--black-hover-green btn--uppercase font--bold" runat="server" Text="Save Password"></asp:button>
                                                                </div>
                                                            </div>

    												        <!--account information-->
													        <div class="col-md-12">
                                                                <div class="form-box__single-group">
                                                                    <h5 class="title">Name or email change</h5>
                                                                </div>
                                                            </div>

                                                            <div class="col-md-8">
                                                                <div class="form-box__single-group">
                                                                    <asp:TextBox ID="otherInfoCurrentPass" type="password" placeholder="Current Password" runat="server"></asp:TextBox>
                                                                </div>
                                                            </div>

                                                            <div class="col-md-6">
                                                                <div class="form-box__single-group">
                                                                    <asp:TextBox ID="changeName" type="text" placeholder="New name" runat="server"></asp:TextBox>
                                                                </div>
                                                            </div>
													
                                                            <div class="col-md-6">
                                                                <div class="form-box__single-group">
                                                                    <asp:TextBox ID="newEmail" type="text" placeholder="Email" runat="server"></asp:TextBox>
                                                                </div>
                                                            </div>
													
													
                                                            <div class="col-md-6">
														
														        <div class="form-box__single-group">
                                                                    <asp:Label style="text-align:center;" id="nameOrEmailWarning"  class="font--bold" runat="server"></asp:Label>
                                                                    <asp:button ID="Button2" Onclick="Button2_click" class="btn btn--box btn--radius btn--small btn--black btn--black-hover-green btn--uppercase font--bold" runat="server" Text="Save setting" onclientclick="#" ></asp:button>
                                                                </div>
                                                            </div>
													
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div><!-- :::::::::: End My Account Section :::::::::: -->
                    </form>
                </div>
            </div>
        </div>
    </main> <!-- ::::::  End  Main Container Section  ::::::  -->

</asp:Content>
