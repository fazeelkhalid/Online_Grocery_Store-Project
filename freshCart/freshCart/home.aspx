<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="freshCart.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- :::::: Start Main Container Wrapper :::::: -->
    <main id="main-container" class="main-container">
        <form runat="server">
            <asp:button id="RefreshButtonId" onclick="Refresh" style="display:none" runat="server"/>
        </form>
        <!-- ::::::  Start Hero Section  ::::::  -->
        <div class="hero slider-dot-fix slider-dot slider-dot-fix slider-dot--center slider-dot-size--medium slider-dot-circle  slider-dot-style--fill slider-dot-style--fill-white-active-green dot-gap__X--10">
            <!-- Start Single Hero Slide -->
            <div class="hero-slider">
                <img src="assets/img/hero/hero-home-1-img-1.jpg" alt=""/>
                <div class="hero__content">
                    <div class="container">
                        <div class="row">
                            <div class="col-12 col-lg-8">
                                <div class="hero__content--inner">
                                    <h6 class="title__hero title__hero--tiny text-uppercase">100% Healthy & Affordable</h6>
                                    <h1 class="title__hero title__hero--xlarge font--regular text-uppercase">Organic <br>  Vegetables</h1>
                                    <h4 class="title__hero title__hero--small font--regular">Small Changes Big Difference</h4>
                                    <a href="shop.aspx" class="btn btn--large btn--radius btn--black btn--black-hover-green font--bold text-uppercase">Shop now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> <!-- End Single Hero Slide -->
			
            <!-- Start Single Hero Slide -->
            <div class="hero-slider">
                <img src="assets/img/hero/hero-home-1-img-2.jpg" alt=""/>
                <div class="hero__content">
                    <div class="container">
                        <div class="row">
                            <div class="col-12 col-lg-8">
                                <div class="hero__content--inner">
                                    <h6 class="title__hero title__hero--tiny text-uppercase">100% Healthy & Affordable</h6>
                                    <h1 class="title__hero title__hero--xlarge font--regular text-uppercase">Organic <br/>   fresh fruits</h1>
                                    <h4 class="title__hero title__hero--small font--regular">Small Changes Big Difference</h4>
                                    <a href="shop.aspx" class="btn btn--large btn--radius btn--black btn--black-hover-green font--bold text-uppercase">Shop now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> <!-- End Single Hero Slide -->
        </div> <!-- ::::::  End Hero Section  ::::::  -->

        <!-- ::::::  Start banner Section  ::::::  -->
        <div class="banner m-t-30">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6 col-12">
                        <div class="banner__box">
                            <!-- Start Single Banner Item -->
                            <div class="banner__box--single banner__box--single-text-style-1 pos-relative">
                                <a href="#" class="banner__link">
                                    <img src="assets/img/banner/size-wide/banner-home-1-img-1-wide.jpg" alt="" class="banner__img"/>
                                </a>
                                <div class="banner__content banner__content--center pos-absolute">
                                    <h6 class="banner__title  font--regular letter-spacing--4  text-center m-b-10">Green Vegetable</h6>
                                    <h2 class="banner__title banner__title--large font--medium letter-spacing--4  text-uppercase">100% ORGANIC</h2>
                                    <h6 class="banner__title font--regular letter-spacing--4  text-center m-b-20">Healthy Nutrition</h6>
                                    <div class="text-center">
                                        <a href="shop.aspx" class="btn btn--medium btn--radius btn--transparent btn--border-black btn--border-black-hover-green font--light text-uppercase">Buy Now</a>
                                    </div>
                                </div>
                            </div> <!-- End Single Banner Item -->
                        </div>
                    </div>
                    <div class="col-md-6 col-12">
                        <div class="banner__box">
                            <!-- Start Single Banner Item -->
                            <div class="banner__box--single banner__box--single-text-style-1 pos-relative">
                                <a href="#" class="banner__link">
                                    <img src="assets/img/banner/size-wide/banner-home-1-img-2-wide.jpg" alt="" class="banner__img"/>
                                </a>
                                <div class="banner__content banner__content--center pos-absolute">
                                    <h6 class="banner__title letter-spacing--4 font--regular text-center m-b-10">Fresh herbs</h6>
                                    <h2 class="banner__title banner__title--large letter-spacing--4 font--medium text-uppercase">SPINACH</h2>
                                    <h6 class="banner__title letter-spacing--4 font--regular text-center m-b-20">Healthy Food</h6>
                                    <div class="text-center">
                                        <a href="#" class="btn btn--medium btn--radius btn--transparent btn--border-black btn--border-black-hover-green font--light text-uppercase">Buy Now</a>
                                    </div>
                                </div>
                            </div> <!-- End Single Banner Item -->
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- ::::::  End banner Section  ::::::  -->

        
        <!-- ::::::  Start Testimonial Section  ::::::  -->
        <div class="testimonial m-t-100 pos-relative">
            <div class="testimonial__bg">
                <img src="assets/img/testimonial/testimonials-bg.jpg" alt=""/>
            </div>
            <div class="testimonial__content pos-absolute absolute-center text-center">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="section-content__inner">
                                <h2>Our Client Say!</h2>
                            </div>
                            <div class="testimonial__slider default-slider">
                                <div class="testimonial__content--slider ">
                                    <div class="testimonial__single">
                                        <p class="testimonial__desc">Staff is the best in a fresh cart store and locally owned. I only get my supplements from Staff because they have a knowledgeable staff and actually pass corporate discounts on to the customer. It's just an overall solid store for quality food. Good produce, butcher, hot & salad bar. No reason to even have a WF here, it's ridiculous and undermines local businesses like Staff of Life and Shopper's Corner.</p>
                                        <div class="testimonial__info">
                                            <h5 class="testimonial__info--desig m-t-20">Fazeel Khalid / <span>CEO</span> </h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="testimonial__content--slider ">
                                    <div class="testimonial__single">
                                        <p class="testimonial__desc">This is the best local independently owned fresh cart store in Pakistan. They will have the best prices and you will be able to find the most unique hard to find items here as well. You will feel much better supporting a local company.</p>
                                        <div class="testimonial__info">
                                            <h5 class="testimonial__info--desig m-t-20">M.Hamza Adil / <span>C0O</span> </h5>
                                        </div>
                                    </div>
                                </div>
								
								<div class="testimonial__content--slider ">
                                    <div class="testimonial__single">
                                        <p class="testimonial__desc"> The service staff is very helpful and pleasant. Service can be sometimes slow.The outdoor cafe seating area is always pleasant and clean. There is plenty of seating.Convenient location near freeway and public transportation. Not much parking, plenty of bike racks.</p>
                                        <div class="testimonial__info">
                                            <h5 class="testimonial__info--desig m-t-20">amna Saeed/ <span>Manager</span> </h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- ::::::  End Testimonial Section  ::::::  -->

         
        <!-- ::::::  Start  Company Logo Section  ::::::  -->
        <div class="company-logo m-t-100">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="company-logo__area default-slider">
                            <!-- Start Single Company Logo Item -->
                            <div class="company-logo__item">
                                <a href="#" class="company-logo__link">
                                    <img src="assets/img/company-logo/company-logo-1.png" alt="shop.aspx" class="company-logo__img"/>
                                </a>
                            </div> <!-- End Single Company Logo Item -->
                            <!-- Start Single Company Logo Item -->
                            <div class="company-logo__item">
                                <a href="#" class="company-logo__link">
                                    <img src="assets/img/company-logo/company-logo-2.png" alt="shop.aspx" class="company-logo__img"/>
                                </a>
                            </div> <!-- End Single Company Logo Item -->
                            <!-- Start Single Company Logo Item -->
                            <div class="company-logo__item">
                                <a href="#" class="company-logo__link">
                                    <img src="assets/img/company-logo/company-logo-3.png" alt="shop.aspx" class="company-logo__img"/>
                                </a>
                            </div> <!-- End Single Company Logo Item -->
                            <!-- Start Single Company Logo Item -->
                            <div class="company-logo__item">
                                <a href="#" class="company-logo__link">
                                    <img src="assets/img/company-logo/company-logo-4.png" alt="shop.aspx" class="company-logo__img"/>
                                </a>
                            </div> <!-- End Single Company Logo Item -->
                            <!-- Start Single Company Logo Item -->
                            <div class="company-logo__item">
                                <a href="#" class="company-logo__link">
                                    <img src="assets/img/company-logo/company-logo-5.png" alt="shop.aspx" class="company-logo__img"/>
                                </a>
                            </div> <!-- End Single Company Logo Item -->
                            <!-- Start Single Company Logo Item -->
                            <div class="company-logo__item">
                                <a href="#" class="company-logo__link">
                                    <img src="assets/img/company-logo/company-logo-6.png" alt="shop.aspx" class="company-logo__img"/>
                                </a>
                            </div> <!-- End Single Company Logo Item -->
                            <!-- Start Single Company Logo Item -->
                            <div class="company-logo__item">
                                <a href="#" class="company-logo__link">
                                    <img src="assets/img/company-logo/company-logo-7.png" alt="shop.aspx" class="company-logo__img"/>
                                </a>
                            </div> <!-- End Single Company Logo Item -->
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- ::::::  End  Company Logo Section  ::::::  -->
    </main>  <!-- :::::: End MainContainer Wrapper :::::: -->
</asp:Content>
