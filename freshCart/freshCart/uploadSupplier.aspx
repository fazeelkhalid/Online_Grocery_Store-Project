<%@ Page Title="" Language="C#" MasterPageFile="~/adminMasterPage.Master" AutoEventWireup="true" CodeBehind="uploadSupplier.aspx.cs" Inherits="freshCart.insertSupplier" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <main id="main-container" style="margin-top:5%;" class="main-container">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class=" text-center">
						    <h1 class="text-success"><strong>Add Supplier</strong></h1>
					    </div>
					    <div class="container"> 
						     <div class="row ">
							    <div class="col-lg-7 mx-auto">
								    <div class="card mt-2 mx-auto p-4 bg-light">
									    <div class="card-body bg-light">
										    <div class="container">
											    <div class="controls">
													<div class="row">														
														<div class="row">
															<div class="col-md-8 mt-3">
																<div class="form-group">
																	<label for="form_lastname">Supplier name *</label>
                                                                    <asp:TextBox id="Text1" type="text" name="surname" class="form-control mt-1" placeholder="Supplier name *" data-error="Supplier name is required." runat="server" required="required" MaxLength="50"></asp:TextBox>
																</div>
															</div>
														</div>
														
														<div class="row">
															<div class="col-md-8 mt-3">
																<div class="form-group">
																	<label for="form_lastname">Company name*</label>
                                                                    <asp:TextBox id="Text2" type="text" name="surname" class="form-control mt-1" placeholder="Company name *" data-error="Company name is required." runat="server" required="required" MaxLength="50"></asp:TextBox>
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-md-8 mt-3">
																<div class="form-group">
																	<label for="form_lastname">CNIC *</label>
                                                                    <asp:TextBox id="Text3" type="text" name="surname" class="form-control mt-1" placeholder="CNIC *" data-error="CNIC is required." runat="server" required="required" MinLength="13" MaxLength="13"></asp:TextBox>
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-md-8 mt-3">
																<div class="form-group">
																	<label for="form_lastname">Company address *</label>
                                                                    <asp:TextBox id="Text4" type="text" name="surname" class="form-control mt-1" placeholder="Company address *"  data-error="Company address is required." runat="server" required="required" MaxLength="50"></asp:TextBox>
																</div>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-md-6 mt-3">
															<div class="form-group"> 
																<label for="form_name">Email</label>
                                                                <asp:TextBox id="Text5" type="text" name="name" class="form-control mt-1" placeholder="Email" runat="server" MaxLength="50"></asp:TextBox>
															</div>
														</div>
														
														<div class="col-md-6 mt-3">
															<div class="form-group"> 
																<label for="form_name">Phone number</label>
                                                                <asp:TextBox id="Text6" type="text" name="name" class="form-control mt-1" placeholder="Phone number" runat="server" MaxLength="11" minLength="11"></asp:TextBox>
															</div>
														</div>
														
													</div>
													<div class="col-md-11 mt-5 ">
		                                               <div class="row mt-5">
                                                            <asp:Label id="warningBox" class="text-center" runat="server"></asp:Label>
                                                            <asp:Button ID="Button1" runat="server" type="submit" class=" col-12  btn btn--medium btn--radius btn--black btn--black-hover-green font--bold text-uppercase" text="Add record" OnClick="addSupplier"/>
													    </div>
													</div>
										        </div>
									        </div>
								        </div> <!-- /.8 -->
							        </div> <!-- /.row-->
                                </div>
						    </div>
                        </div>
                    </div>  <!-- Start Rightside - Content -->
                </div>
            </div>
        </main>  <!-- :::::: End MainContainer Wrapper :::::: -->
    </form>
</asp:Content>
