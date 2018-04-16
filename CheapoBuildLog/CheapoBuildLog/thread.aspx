<%@ Page Title="" Language="C#" MasterPageFile="~/CBLMaster.Master" AutoEventWireup="true" CodeBehind="thread.aspx.cs" Inherits="CheapoBuildLog.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/thread.css" rel="stylesheet" />
    <script type="text/javascript" src="Scripts/MaxLength.min.js"></script>
    <script type="text/javascript">
        $(function () {            
            $("[id*=txtDescription]").MaxLength(
            {
                MaxLength: 200,
                CharacterCountControl: $('#counter')
                });            
           
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="navContent" runat="server">
    <li><a href="index.aspx">Home</a></li>
    <li class="active"><a href="forums.aspx">Forums</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="container col-sm-12">
        <div id="body_panels" class="panel panel-default">
		<div class="panel-heading">
			<div id="body_row" class="col-sm-2 col-md-2">
				<figure id="body_figure">                  
                        <asp:Image ID="body_avatar" class="center-block" runat="server"> </asp:Image>
                    <figcaption Class="center-block text-center">
                        <a id="body_a1" href="user.aspx?id=1"><asp:Label ID="lblUser"   runat="server" Text=""></asp:Label></a>
                    </figcaption>
				</figure>
			</div>
            <asp:Label ID="lblTitle" CssClass="fa-lg" runat="server" Text=""></asp:Label>
		</div>
        <div class="panel-body">
            <asp:Label ID="lblContent" runat="server" Text=""></asp:Label>
		</div>
        <div class="panel-footer">
			<p id="body_p1" class=" fa">Date Posted: </p>
            <asp:Label ID="lblDate" runat="server" Text=""></asp:Label>
            <asp:Label ID="lblLikes" CssClass="pull-right" runat="server" Text="0"></asp:Label>
            <i id="body_i1" class="glyphicon glyphicon-thumbs-up pull-right" data-toggle="tooltip" title="" data-original-title="Likes Received"></i>
            <asp:Label ID="lblHelpful" CssClass="pull-right" runat="server" Text="0"></asp:Label>
            <i id="body_i2" class="glyphicon glyphicon glyphicon-wrench pull-right" data-toggle="tooltip" title="" data-original-title="Helpfuls Received"></i>
		</div>
	</div>
    </div>

    <div class="container col-sm-12">
        <div class="container col-sm-12">
            <asp:Panel ID="panelComments" runat="server"></asp:Panel>
        </div>
    </div>

    <div class="container col-sm-12">
        <div class="panel panel-default">       
            <div class="panel-heading">        
                <h4>Add New Comment</h4>
            </div>
            <div class="panel-body">            

                <asp:TextBox ID="txtDescription" CssClass="form-control" placeholder="Comment" runat="server" MaxLength="1000"  Rows="3" TextMode="MultiLine"></asp:TextBox>
                <div id="counter"></div>

                <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Submit Comment" OnClick="btnSubmit_Click" />
            </div>
        </div>
    </div>
    
    
    
</asp:Content>
