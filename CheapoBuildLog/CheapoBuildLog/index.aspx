<%@ Page Title="" Language="C#" MasterPageFile="~/CBLMaster.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="CheapoBuildLog.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/index.css" rel="stylesheet" />

    <script>
        $(document).ready(function(){
            $('[data-toggle="tooltip"]').tooltip(); 
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="navContent" runat="server">
    <li class="active"><a href="index.aspx">Home</a></li>
    <li><a href="forums.aspx">Forums</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="col-md-8">
        <div class="page-header">
            <h1 class="">Popular Threads</h1>
            <asp:Panel ID="panelPortal" runat="server"></asp:Panel>
            
        </div>
    </div>
    <div class="col-md-4">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4>Forum Statistics</h4>
                
            </div>
            <div class="panel-body">
                <div class="single category">
                    <ul class="list-unstyled">
                        <li><a>Total Users:<span class="pull-right"><asp:Label ID="lblTotalUser" runat="server" Text="0"></asp:Label></span></a></li>
                        <li><a>Total Threads:<span class="pull-right"><asp:Label ID="lblTotalThreads" runat="server" Text="0"></asp:Label></span></a></li>
                        <li><a>Total Comments:<span class="pull-right"><asp:Label ID="lblTotalComments" runat="server" Text="0"></asp:Label></span></a></li>
                    </ul>                   
                </div>
            </div>
        </div>

        <div class="panel panel-default ">
            <div class="panel-heading">
                <h4>Latest Threads</h4>
            </div>

            <div class="panel-body">
                <asp:Panel ID="panelLatestThreads" runat="server"></asp:Panel>               
            </div>
        </div>
    </div>

    

</asp:Content>
