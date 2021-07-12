<%@ Page Title="" Language="C#" MasterPageFile="~/loginSignupMasterPage.Master" AutoEventWireup="true" CodeBehind="signUp.aspx.cs" Inherits="freshCart.signUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="top_margin "> <asp:Label class="fadeIn fourth warningBox" id="UserNAmeError" Text ="" runat="server" > </asp:Label> </div>
    <asp:TextBox type="text"  id="userName" class="fadeIn second " placeholder="Name" runat="server" EnableViewState="False" autocomplete="off" maxLength="50" required="required" ></asp:TextBox>
    
    <div> <asp:Label class="fadeIn fourth warningBox" id="emailError"  Text ="" runat="server" > </asp:Label> </div>
    <asp:TextBox type="text" id="email" class="fadeIn second " placeholder="Email@gmail.com" runat="server" EnableViewState="False" autocomplete="off"  maxLength="50"></asp:TextBox>

    <div><asp:Label class="fadeIn fourth warningBox" id="Label2" Text ="" runat="server" > </asp:Label></div>
    <asp:TextBox type="text"  id="contactNumber_id" class="fadeIn third " placeholder="Phone number" runat="server" EnableViewState="False" autocomplete="off"  maxLength="11" minLength="11" required="required" ></asp:TextBox>
    
    <asp:TextBox type="password" id="password_id" class="fadeIn third" placeholder="Password" runat="server" EnableViewState="False" autocomplete="off"  maxLength="50" required="required" ></asp:TextBox>
    <asp:TextBox type="password" id="reEnterpassword" class="fadeIn third" placeholder="Confirm password" runat="server" EnableViewState="False" autocomplete="off"  maxLength="50" required="required" ></asp:TextBox>
    
    <!--password not match -->
    <div> <asp:Label class="fadeIn fourth warningBox" id="Label1" Text ="" runat="server" > </asp:Label> </div>

    <asp:Button ID="Button1" type="submit" class="fadeIn fourth" text="Sign Up" OnClick="Button1_click" runat="server"/>
    <div id="formFooter">
		<a class="underlineHover" href="login.aspx">Log In?</a>
	</div>
</asp:Content>
