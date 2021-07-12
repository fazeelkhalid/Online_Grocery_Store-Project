<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="freshCart.about" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- ::::::  Start  Main Container Section  ::::::  -->
    <main id="main-container" class="main-container">
        <form runat="server">
            <asp:button id="RefreshButtonId" onclick="Refresh" style="display:none" runat="server"/>
        </form>
        <div class="mt-5 mt-5 about-top">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="about-img">
                            <div class="img-responsive">
                                <img src="assets/img/about/about-1.jpg" alt="">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="about-content">
                            <h4 class="font--regular">We Are a online Groceryshop focused On Delivering Best Organic Food And provide Best User Experiences.</h4>
                            <p class="para__text">Our main focus is customer satisfaction and best experience provision. Our staff is composed of friendly and caring personal. Our products are of the most highest quality available in the market.</p>
                        </div>
                    </div>
                </div>
            </div>         
        </div>

        <!-- ::::::  Start CMS Section  ::::::  -->
        <div class="cms m-t-100">
            <div class="container">
                <div class="row">
                    <!-- Start Single CMS box -->
                    <div class="col-lg-4 col-md-6 col-12">
                        <div class="cms__content">
                            <div class="cms__icon">
                                <i class="fas fa-truck"></i>
                            </div>
                            <div class="cms__text">
                                <h6 class="cms__title">Free Shipping</h6>
                                <p class="para__text">We offer shipping your products to anywhere, at anytime with 0% transport fee charge.</p>
                            </div>
                        </div>
                    </div> <!-- End Single CMS box -->
                    <!-- Start Single CMS box -->
                    <div class="col-lg-4 col-md-6 col-12">
                        <div class="cms__content">
                            <div class="cms__icon">
                                <i class="far fa-money-bill-alt"></i>
                            </div>
                            <div class="cms__text">
                                <h6 class="cms__title">100% Money Back Guarantee</h6>
                                <p class="para__text">If you encounter any faulty products, we offer you 100% money back or a coupon of the same amount.</p>
                            </div>
                        </div>
                    </div> <!-- End Single CMS box -->
                    <!-- Start Single CMS box -->
                    <div class="col-lg-4 col-md-6 col-12">
                        <div class="cms__content">
                            <div class="cms__icon">
                                <i class="far fa-life-ring"></i>
                            </div>
                            <div class="cms__text">
                                <h6 class="cms__title">Online Support 24/7</h6>
                                <p class="para__text">The support staff is available 24/7 365 days every year, always ready to help you in your hour of need and resolve all your queries.</p>
                            </div>
                        </div>
                    </div> <!-- End Single CMS box -->
                </div>
            </div>
        </div> <!-- ::::::  End CMS Section  ::::::  -->
        

        <!-- ::::::  Start  Company Logo Section  ::::::  -->
        <div class="company-logo m-t-100">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="company-logo__area">
                            <!-- Start Single Company Logo Item -->
                            <div class="company-logo__item">
                                <a href="#" class="company-logo__link">
                                    <img src="assets/img/company-logo/company-logo-1.png" alt="" class="company-logo__img">
                                </a>
                            </div> <!-- End Single Company Logo Item -->
                            <!-- Start Single Company Logo Item -->
                            <div class="company-logo__item">
                                <a href="#" class="company-logo__link">
                                    <img src="assets/img/company-logo/company-logo-2.png" alt="" class="company-logo__img">
                                </a>
                            </div> <!-- End Single Company Logo Item -->
                            <!-- Start Single Company Logo Item -->
                            <div class="company-logo__item">
                                <a href="#" class="company-logo__link">
                                    <img src="assets/img/company-logo/company-logo-3.png" alt="" class="company-logo__img">
                                </a>
                            </div> <!-- End Single Company Logo Item -->
                            <!-- Start Single Company Logo Item -->
                            <div class="company-logo__item">
                                <a href="#" class="company-logo__link">
                                    <img src="assets/img/company-logo/company-logo-4.png" alt="" class="company-logo__img">
                                </a>
                            </div> <!-- End Single Company Logo Item -->
                            <!-- Start Single Company Logo Item -->
                            <div class="company-logo__item">
                                <a href="#" class="company-logo__link">
                                    <img src="assets/img/company-logo/company-logo-5.png" alt="" class="company-logo__img">
                                </a>
                            </div> <!-- End Single Company Logo Item -->
                            <!-- Start Single Company Logo Item -->
                            <div class="company-logo__item">
                                <a href="#" class="company-logo__link">
                                    <img src="assets/img/company-logo/company-logo-6.png" alt="" class="company-logo__img">
                                </a>
                            </div> <!-- End Single Company Logo Item -->
                            <!-- Start Single Company Logo Item -->
                            <div class="company-logo__item">
                                <a href="#" class="company-logo__link">
                                    <img src="assets/img/company-logo/company-logo-7.png" alt="" class="company-logo__img">
                                </a>
                            </div> <!-- End Single Company Logo Item -->
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- ::::::  End  Company Logo Section  ::::::  -->
	</main> <!-- ::::::  End  Main Container Section  ::::::  -->

</asp:Content>
