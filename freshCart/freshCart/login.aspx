<%@ Page Title="" Language="C#" MasterPageFile="~/loginSignupMasterPage.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="freshCart.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:TextBox type="text" id="PhoneNumber" class="top_margin fadeIn second top_margin" required="required" name="login" placeholder="Mobile number" runat="server"></asp:TextBox>
    <asp:TextBox type="password" id="password_id" class="fadeIn third" required="required" name="login" placeholder="password" runat="server"></asp:TextBox>
    
    <!--password not match -->
    <div>
    <asp:Label class="fadeIn fourth warningBox" id="warningBox" Text ="" runat="server" > </asp:Label>
    </div>
    <asp:Button type="submit" class="fadeIn fourth" text="Log In" OnClick="Button1_click" runat="server"/>
    <div id="formFooter">
		<a class="underlineHover" href="signup.aspx">Create account?</a>
	</div>
</asp:Content>
