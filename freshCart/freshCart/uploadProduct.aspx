<%@ Page Title="" Language="C#" MasterPageFile="~/adminMasterPage.Master" AutoEventWireup="true" CodeBehind="uploadProduct.aspx.cs" Inherits="freshCart.uploadProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <main id="main-container" style="margin-top:5%;" class="main-container">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class=" text-center">
						    <h1 class="text-success"><strong>Add Product</strong></h1>
					    </div>
					    <div class="container"> 
						     <div class="row ">
							    <div class="col-lg-7 mx-auto">
								    <div class="card mt-2 mx-auto p-4 bg-light">
									    <div class="card-body bg-light">
										    <div class="container">
											    <form id="contact-form" role="form" enctype="multipart/form-data">
												    <div class="controls">
													    <div class="row">
														    <div class="col-md-4">
															    <div class="form-group"> 
																    <label for="form_name">Supplier CNIC *</label> 
                                                                    <asp:TextBox id="Text1" type="text" name="name" class="form-control mt-1" data-error="Supplier ID is required." runat="server" placeholder="Supplier CNIC *" required="required" MinLength="13" MaxLength="13" ></asp:TextBox>
															    </div>
														    </div>
														    <div class="col-md-3">
														    </div>
														    <div class="col-md-4">
															    <div class="form-group"> 
																    <label for="form_name">price *</label>
                                                                    <asp:TextBox id="Text2" type="text" name="name" class="form-control mt-1" data-error="Price is required." runat="server" placeholder=" Enter price *" required="required" MaxLength="5" ></asp:TextBox>
															    </div>
														    </div>
														
														    <div class="row">
															    <div class="col-md-8 mt-3">
																    <div class="form-group">
																	    <label for="form_lastname">Product name *</label>
                                                                        <asp:TextBox id="Text3" type="text" name="surname" class="form-control mt-1" data-error="Product name is required." runat="server" placeholder=" Please enter Product name *" required="required" MaxLength="50" ></asp:TextBox>
																    </div>
															    </div>
														    </div>
														
														    <div class="row">
															    <div class="col-md-8 mt-3">
																    <div class="form-group">
																	    <label for="form_lastname">Product Category *</label>
                                                                        <asp:TextBox id="Text4" type="text" name="surname" class="form-control mt-1" data-error="Category is required." runat="server" placeholder="Product Category *" required="required" MaxLength="50" ></asp:TextBox>
																    </div>
															    </div>
														    </div>
													    </div>
													    <div class="row">
														    <div class="col-md-11 mt-3">
															    <div class="form-group"> 
																    <label for="form_message ">Description *</label>
																	<textarea id="Text5" name="message" class="form-control mt-1"   rows="5"  data-error="Product description of 50 character is required." runat="server" placeholder="Write your Product description here." ></textarea>
																    </div>
														    </div>
														
														    <div class="col-md-4 mt-3">
															    <div class="form-group"> 
																    <label for="form_name">Total stock *</label>
                                                                    <asp:TextBox id="Text6" type="text" name="name" class="form-control mt-1" data-error="Total stock is required." runat="server" placeholder="Total stock *" required="required"></asp:TextBox>
															    </div>
														    </div>
														
														    <div class="col-md-4 mt-3">
															    <div class="form-group"> 
																    <label for="form_name">Sale on stock</label>
                                                                    <asp:TextBox  id="Text7" type="text" name="name" class="form-control mt-1" data-error="sale on stock." runat="server" placeholder="Sale on stock" ></asp:TextBox>
															    </div>
														    </div>
														
													    </div>
													    <div class="col-md-11 mt-5 ">
		                                                    <asp:FileUpload ID="FileUpload1" runat="server" accept="image/*"></asp:FileUpload>
														    <div class="row mt-5">
                                                                <asp:Label id="warningBox" class="text-center" runat="server"></asp:Label>
                                                                <asp:Button runat="server" type="submit" class=" col-12  btn btn--medium btn--radius btn--black btn--black-hover-green font--bold text-uppercase" text="Add record" OnClick="postProduct"/>
													        </div>
													    </div>
												    </div>
											    </form>
										    </div>
									    </div>
								    </div> <!-- /.8 -->
							    </div> <!-- /.row-->
						    </div>
                    </div>  <!-- Start Rightside - Content -->
                </div>
            </div>
            </div>
        </main>  <!-- :::::: End MainContainer Wrapper :::::: -->

    </form>  

</asp:Content>
