<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="shop.aspx.cs" Inherits="freshCart.shop" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="assets/css/product.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- :::::: Start Main Container Wrapper :::::: -->
    <form runat="server">
        <asp:button id="RefreshButtonId" onclick="Refresh" style="display:none" runat="server"/>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" ScriptMode="Release" LoadScriptsBeforeUI="true"></asp:ScriptManager>
        <main id="main-container" style="margin-top:5%;" class="main-container">
            <div class="container">
                <div class="row">
                    <!-- Start Rightside - Content -->
                    <div class="col-12">
                        <div class="img-responsive">
                            <img src="assets/img/banner/size-wide/banner-shop-1-img-1-wide.jpg" alt=""/>
                        </div>
                     
                        <div class="product-tab-area">
                            <div class="tab-content tab-animate-zoom">
                                <div class="tab-pane show active shop-grid" id="sort-grid">
                                    <div class="row">
                                        <div class="wrapper">
                                            <div class="container">
                                                <div class="row g-1">
                                                        <% foreach(var item in itemsList) { %>
                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-sm-6 col-12">
                                                            <!-- Start Single Default Product -->
                                                            <div class="product__box product__default--single text-center">
                                                                <!-- Start Product Image -->
                                                                <div class="product__img-box  pos-relative">
                                                                    <img class="product__img img-fluid" src="<%=item.ImgSrc%>" alt="<%=item.productname%>"/>
                                                                    <!-- Start Procuct Label -->
                                                                    <%if(item.totalSale != "0") {%>
                                                                        <span class="product__label product__label--sale-dis" id="blink"><%=item.totalSale%>%</span>
                                                                    <%}%>
                                                                    <!--check if stock not avail able of a perticula items it will label that itme as soldou--> 
                                                                    <%if(item.remainingstock == "0") {%>
                                                                        <span class="product__label product__label--sale-out">Soldout</span>
                                                                    <%}%>
                                                                    <!-- End Procuct Label -->
                                                                    <!-- Start Product Action Link-->
                                                                    <ul class="product__action--link pos-absolute">
                                                                        <li ><a onclick="CallButtonEvent(<%=item.Pid%>); document.getElementById('ContentPlaceHolder1_RefreshButtonId').click(); " data-toggle="modal"><i class="icon-shopping-cart"></i></a></li>
                                                                        <li><a href="#show<%=item.Pid%>" data-toggle="modal"><i class="icon-eye"></i></a></li>
                                                     
                                                                   </ul> <!-- End Product Action Link -->
                                                                </div> <!-- End Product Image -->
                                                                <!-- Start Product Content -->
                                                                <div class="product__content m-t-20">
                                                
                                                                    <span class="product__link"><%=item.productname%></span>
                                                                    <div class="product__price m-t-5">
                                                                        <%if(item.totalSale != "0") {%>
                                                                            <span class="product__price " id="blinkPrice" ><%=item.Discount%> RS <del><%=item.price%> RS</del></span>
                                                                        <%} %>
                                                                        <%if(item.totalSale == "0") {%>
                                                                            <span class="product__price"><%=item.price%> RS</span>
                                                                        <%} %>
                                                                    </div>
                                                                </div> <!-- End Product Content -->
                                                            </div> <!-- End Single Default Product -->
                                                        </div>
                                                        <% } %>
                                              
                                                </div>
                                            </div>
                                        </div>                 
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>  <!-- Start Rightside - Content -->
                </div>
            </div>
        </main>  <!-- :::::: End MainContainer Wrapper :::::: -->
    </form>

</asp:Content>
