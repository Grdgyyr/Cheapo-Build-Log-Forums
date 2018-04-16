<%@ Page Title="" Language="C#" MasterPageFile="~/CBLMaster.Master" AutoEventWireup="true" CodeBehind="compose.aspx.cs" Inherits="CheapoBuildLog.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/compose.css" rel="stylesheet" />
    <script type="text/javascript" src="Scripts/MaxLength.min.js"></script>
    <script type="text/javascript">
        $(function () {            
            $("[id*=txtDescription]").MaxLength(
            {
                MaxLength: 1000,
                CharacterCountControl: $('#counter')
                });

            $("[id*=txtTitle]").MaxLength(
                {
                    MaxLength: 45,
                    CharacterCountControl: $('#counterTitle')
                });
           
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="navContent" runat="server">
    <li><a href="index.aspx">Home</a></li>
    <li class="active"><a href="forums.aspx">Forums</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="col-sm-12">       
        <div class="page-header">        
            <h2>Create New Thread</h2>
        </div>
        <div class=" well well-lg">
            <asp:TextBox ID="txtTitle" CssClass="form-control" placeholder="Thread Title" runat="server" MaxLength="45" ></asp:TextBox>
            <div id="counterTitle"></div>

            <asp:TextBox ID="txtDescription" CssClass="form-control" placeholder="Thread" runat="server" MaxLength="1000"  Rows="3" TextMode="MultiLine"></asp:TextBox>
            <div id="counter"></div>

            <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Submit Thread" OnClick="btnSubmit_Click" />
        </div>
    </div>
</asp:Content>
