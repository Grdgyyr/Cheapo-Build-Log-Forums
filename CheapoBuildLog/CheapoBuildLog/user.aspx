<%@ Page Title="" Language="C#" MasterPageFile="~/CBLMaster.Master" AutoEventWireup="true" CodeBehind="user.aspx.cs" Inherits="CheapoBuildLog.WebForm4" %>
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
<asp:Content ID="Content2" ContentPlaceHolderID="navContent" runat="server">
    <li><a href="index.aspx">Home</a></li>
    <li class=""><a href="forums.aspx">Forums</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="col-sm-12 img-responsive center-block text-center">
                <asp:Image ID="Image1" runat="server" CssClass="img-circle" Height="150px" Width="150px" />
            </div>            
            <div class="col-sm-6 form-group ">
                <label class="" for="txtFName">First Name</label>               
                <div class="">
                    <asp:TextBox ID="txtFName"  CssClass="form-control" placeholder="First Name" runat="server" Enabled="False"></asp:TextBox>
                </div>          
            </div>   
             <div class="col-sm-6 form-group">
                 <label class="" for="txtLName">Last Name</label>
                <div class="">
                    <asp:TextBox ID="txtLName"  CssClass="form-control" placeholder="Last Name" runat="server" Enabled="False"></asp:TextBox>
                </div>
             </div>

            <div class="col-sm-6 form-group">
                <label class="" for="txtUsername">Username</label>
                <div class="">
                    <asp:TextBox ID="txtUsername"  CssClass="form-control" placeholder="Username" runat="server" Enabled="False"></asp:TextBox>
                </div>
            </div>

            <div class="col-sm-6 form-group">
                <label class="">Nickname</label>
                <div class="">
                    <asp:TextBox ID="txtNickname"  CssClass="form-control" placeholder="Nickname" runat="server" Enabled="False"></asp:TextBox>
                </div>
            </div>

            <div class="col-sm-6 form-group">
                <label class="">Address</label>
                <div class="">
                    <asp:TextBox ID="txtAddress" CssClass="form-control" placeholder="Address" runat="server" Enabled="False"></asp:TextBox>
                </div>
            </div>                                      
            <div class="col-sm-6 form-group">
                <label class="" for="txtEmail">Email</label>
                <div class="">
                    <asp:TextBox ID="txtEmail"   CssClass="form-control" placeholder="Email" runat="server" Enabled="False"></asp:TextBox>
                </div>               
            </div>          
            <div class="col-sm-6 form-group">
                <label class="" for="txtGender">Gender</label>
                <div class="">
                    <asp:TextBox ID="txtGender"  CssClass="form-control" placeholder="Email" runat="server" Enabled="False"></asp:TextBox>
                </div>
            </div>
            <div class="col-sm-6 form-group">
                <label class="" for="txtConfirmEmail">Birth Date</label>
                <div class="">  
                    <asp:TextBox ID="txtDay" CssClass="form-control" placeholder="Day" runat="server" Enabled="False"></asp:TextBox>
                </div>
            </div>
            <div class="col-sm-6 form-group">
                <label class="" for="txtContact">Contact</label>
                <div class="">
                    <asp:TextBox ID="txtContact" CssClass="form-control" placeholder="Contact" runat="server" Enabled="False"></asp:TextBox>
                </div>
            </div>
            <div class="col-sm-6 form-group">
                <label class="" for="txtContact">Bio</label>
                <div class="">
                    <asp:TextBox ID="txtBio" CssClass="form-control" placeholder="Bio" runat="server" MaxLength="100"  Rows="3" TextMode="MultiLine" Enabled="False"></asp:TextBox>
                    <div id="counter"></div>
                </div>
            </div>                                         
</asp:Content>
