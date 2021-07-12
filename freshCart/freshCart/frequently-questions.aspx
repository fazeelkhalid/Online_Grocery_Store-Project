<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="frequently-questions.aspx.cs" Inherits="freshCart.frequently_questions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- ::::::  Start  Main Container Section  ::::::  -->
    <main id="main-container" class="main-container">
        <form id="Form1" runat="server">
            <asp:button id="RefreshButtonId" onclick="Refresh" style="display:none" runat="server"/>
        </form>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-content m-b-60 text-center">
                        <h5 class="section-content__title">Frequent Questions</h5>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="faq-section ">
                        <div class="faq-top m-b-40">
                            <h5 class="faq__title font--bold m-b-15">The following are as often as possible posed inquiries, you may discover the response for yourself</h5>
                        </div>
                        <div class="faq__accordion accordian" id="faq__accordion">
                          <div class="accordian-item">
                                <div class="accordian-item-header">
                                  <h4>How do I track my order?</h4>
                                </div>
                                <div class="accordian-item-body">
                                  <div class="accordian-item-body-content">
                                    <p>
                                    	You can track your orders by contacting the helpline provided by the website.
					You can also keep track by the tracking no. provided.  
				    </p>
                                  </div>
                                </div>
                          </div>
                          <div class="accordian-item">
                                <div class="accordian-item-header">
                                  <h4>Can we return the faulty products once bought?</h4>
                                </div>
                                <div class="accordian-item-body">
                                  <div class="accordian-item-body-content">
                                    <p>
                                      Some sellers might accept a return but others might not.
					You have to confirm this from the seller before buying their products.
                                    </p>
                                  </div>
                                </div>
                          </div>
                          <div class="accordian-item">
                                <div class="accordian-item-header">
                                  <h4>
                                    What's the max coupons that can be activated at a time by an account?
                                  </h4>
                                </div>
                                <div class="accordian-item-body">
                                  <div class="accordian-item-body-content">
                                    <p>
                                      There can only be one active coupon at a time by an account.
					The new coupon can only be activated once the currently active coupon expires.
                                    </p>
                                  </div>
                                </div>
                          </div>
                          <div class="accordian-item">
                                <div class="accordian-item-header">
                                  <h4>Possible reasons for account to be blocked?</h4>
                                </div>
                                <div class="accordian-item-body">
                                  <div class="accordian-item-body-content">
                                    <p>
                                      The possible reasons are: Abusive language, Not accepting order after placing order, Providing incorrect information etc
                                    </p>
                                  </div>
                                </div>
                          </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main> <!-- ::::::  End  Main Container Section  ::::::  -->

</asp:Content>
