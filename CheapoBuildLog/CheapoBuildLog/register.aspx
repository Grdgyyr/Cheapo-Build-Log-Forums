<%@ Page Title="" Language="C#" MasterPageFile="~/CBLMaster.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="CheapoBuildLog.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript" src="Scripts/MaxLength.min.js"></script>
    <script type="text/javascript">
        $(function () {            
            $("[id*=txtBio]").MaxLength(
            {
                MaxLength: 100,
                CharacterCountControl: $('#counter')
            });
           
        });
    </script>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="navContent" runat="server">
    <li><a href="index.aspx">Home</a></li>
    <li><a href="forums.aspx">Forums</a></li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    
            <div class="col-sm-12 img-responsive center-block text-center">
                <asp:Image ID="Image1" runat="server" CssClass="img-circle" Height="150px" Width="150px" />
            </div>
            <div class="col-sm-12 form-group " style="margin-top:50px">
                <asp:FileUpload ID="FileUploadProfile"  runat="server" CssClass="center-block text-center btn"/>
                <asp:Button ID="btnUpload" runat="server" Text="Upload" CssClass="center-block text-center btn btn-info" OnClick="btnUpload_Click" />
            </div>
            <div class="col-sm-6 form-group ">
                <label class="" for="txtFName">First Name</label>
                
                <div class="">
                    <asp:TextBox ID="txtFName"  CssClass="form-control" placeholder="First Name" runat="server"></asp:TextBox>
                </div>          
            </div>   

             <div class="col-sm-6 form-group">
                 <label class="" for="txtLName">Last Name</label>
                <div class="">
                    <asp:TextBox ID="txtLName"  CssClass="form-control" placeholder="Last Name" runat="server"></asp:TextBox>
                </div>
             </div>

            


            <div class="col-sm-6 form-group">
                <label class="" for="txtUsername">Username</label>
                <div class="">
                    <asp:TextBox ID="txtUsername"  CssClass="form-control" placeholder="Username" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="col-sm-6 form-group">
                <label class="">Nickname</label>
                <div class="">
                    <asp:TextBox ID="txtNickname"  CssClass="form-control" placeholder="Nickname" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="col-sm-6 form-group">
                <label class="">Address</label>
                <div class="">
                    <asp:TextBox ID="txtAddress" CssClass="form-control" placeholder="Address" runat="server"></asp:TextBox>
                </div>
            </div>
            
           
            <div class="col-sm-6  form-group">
                <label class="" for="txtPassword">Password</label>
                <div class="">
                    <asp:TextBox ID="txtPassword"  CssClass="form-control" placeholder="Password" runat="server"  ControlToCompare="txtPassword"></asp:TextBox>
                </div>

                
            </div>

            <div class="col-sm-6  form-group">
                <div class="form-inline">
                    <label class="">Confirm Password</label>
                    <asp:Label ID="lblPassword" runat="server" Text=""></asp:Label>
                </div>
                
                <div class="">
                    <asp:TextBox ID="txtConfirmPassword"  CssClass="form-control" placeholder="Confirm Password" runat="server"  ControlToValidate="txtConfirmPassword" AutoCompleteType="None"></asp:TextBox>
                </div>

            </div>
           

            <div class="col-sm-6 form-group">
                <label class="" for="txtEmail">Email</label>
                <div class="">
                    <asp:TextBox ID="txtEmail"  AutoCompleteType="Disabled" CssClass="form-control" placeholder="Email" runat="server" TextMode="Email"></asp:TextBox>
                </div>

                
            </div>

            <div class="col-sm-6 form-group">
                <div class="form-inline">
                        <label class="">Confirm Email</label>
                    <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
                    </div>
                
                <div class="">
                    <asp:TextBox ID="txtConfirmEmail" AutoCompleteType="Disabled"  CssClass="form-control" placeholder="Confirm Email" runat="server" TextMode="Email"></asp:TextBox>
                </div>
            </div>

            <div class="col-sm-6 form-group">
                <label class="" for="txtGender">Gender</label>
                <div class="">
                    <asp:DropDownList ID="txtGender" CssClass="form-control"  runat="server">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                        <asp:ListItem Selected="True">Unspecified</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="col-sm-6 form-group">
                <label class="" for="txtConfirmEmail">Birth Date</label>
                <div class="">  
                    <asp:TextBox ID="txtDay" CssClass="form-control" placeholder="Day" runat="server" TextMode="Date"></asp:TextBox>
                </div>
            </div>

            <div class="col-sm-6 form-group">
                <label class="" for="txtContact">Contact</label>
                <div class="">
                    <asp:TextBox ID="txtContact" CssClass="form-control" placeholder="Contact" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="col-sm-6 form-group">
                <label class="" for="txtContact">Bio</label>
                <div class="">
                    <asp:TextBox ID="txtBio" CssClass="form-control" placeholder="Bio" runat="server" MaxLength="100"  Rows="3" TextMode="MultiLine"></asp:TextBox>
                    <div id="counter"></div>
                </div>
            </div>
            
            
          
                
	
	
        
	
	<div class="content2BG container-fluid">
			<div class=" form-group">
				<div class="  col-sm-2"></div>
				<div class="   col-sm-8">
                    <div class=" form-group form-inline">
                        
                        <label><asp:CheckBox ID="chkbxMonthly" CssClass="chkbxMonthly" runat="server"  />  Subscribe to Monthly News Letter</label>

                    </div>

                    <div class=" form-group form-inline">
                        
                        <label><asp:CheckBox ID="chkbxAgreement" CssClass="chkbxMonthly" runat="server"  />  I Accept the <a href="">Terms and Agreement</a></label>

                    </div>
                    <div class="form-group text-center center-block">
                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click" />
                    </div>
                    
                    </div>
				<div class="  col-sm-2"></div>
			</div>
	</div>
</asp:Content>
