<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="myAccount.aspx.cs" Inherits="freshCart.myAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" onload="">
    <!-- ::::::  Start  Main Container Section  ::::::  -->
    <main style="margin-top:10%;" id="main-container" class="main-container">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- :::::::::: Start My Account Section :::::::::: -->
                    <form id="Form1" runat="server">
                        <asp:button id="Button1" onclick="Refresh" style="display:none" runat="server"/>
        
                        <asp:button id="RefreshButtonId" onclick="Refresh" style="display:none" runat="server"/>
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
                                                <a id="pills-payment-tab" class="link--icon-left" data-toggle="pill" href="#pills-payment" role="tab"
                                                    aria-controls="pills-payment" aria-selected="false"><i
                                                        class="fas fa-credit-card"></i> Payment Method</a>
                                            </li>
										
                                            <li>
                                                <a id="pills-address-tab" class="link--icon-left" data-toggle="pill" href="#pills-address" role="tab"
                                                    aria-controls="pills-address" aria-selected="false"><i
                                                        class="fas fa-map-marker-alt"></i> Address</a>
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
                                                    <asp:Label ID="Label1" runat="server"> Hello, <strong><asp:label id="Customer_name" runat="server">great admin</asp:label></strong></asp:Label>
                                                </div>
                                                <p class="m-t-25">From your account dashboard. you can easily check your password,
                                                    account details and manage both of them.
                                                </p>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <div class="form-box__single-group">
                                                            
                                                            <asp:TextBox ID="TextBox4" style="margin-left:4%;"><strong>Last Login date (M-d-yyyy)</strong></asp:TextBox>
                                                            <input type="text" readonly="" id="Text1" placeholder="Email" runat="server"/>
                                                        </div>
                                                    </div>
                                                
                                                    <div class="col-md-4">
                                                        <div class="form-box__single-group">
                                                            <asp:TextBox ID="TextBox5" style="margin-left:4%; "><strong>Login time(hh:mm:ss)</strong></asp:TextBox>
                                                            <input type="text" readonly="" id="Text2" placeholder="Cell number" runat="server"/>
                                                        </div>
                                                    </div>


                                                </div>


                                            </div>
                                        </div>
									
                                        <div class="tab-pane fade" id="pills-payment" role="tabpanel"
                                            aria-labelledby="pills-payment-tab">
                                            <div class="my-account-payment account-wrapper">
                                                <h4 class="account-title">Payment Method</h4>
                                                <p class="m-t-30">You Can't select any payment method because we are providing our services with cash on delivery.</p>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="pills-address" role="tabpanel"
                                            aria-labelledby="pills-address-tab">
                                            <div class="my-account-address account-wrapper">
                                                <h4 class="account-title">Address</h4>
                                                <div class="account-address m-t-30">
                                                    <h6 class="name">FreshCart store</h6>
                                                    <p>FAST NUCES 852 Block B<br/> Faisal Town Lahore</p>
                                                    <p>Mobile:+92 335 2316132</p>
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
                                                        <div class="col-md-3">
                                                            <div class="form-box__single-group">
                                                                <asp:TextBox ID="TextBox3" style="margin-left:10%;"> <strong>Purchase</strong></asp:TextBox>
                                                                <input type="text" readonly="" id="TotalPurchaseOut" placeholder="Total Purchase" runat="server"/>
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
                                                                    <asp:button Onclick="Button1_click" class="btn btn--box btn--radius btn--small btn--black btn--black-hover-green btn--uppercase font--bold" runat="server" Text="Save Password"></asp:button>
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
                                                                    <asp:button Onclick="Button2_click" class="btn btn--box btn--radius btn--small btn--black btn--black-hover-green btn--uppercase font--bold" runat="server" Text="Save setting" onclientclick="#" ></asp:button>
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
