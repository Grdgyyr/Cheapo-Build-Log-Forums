<%@ Page Title="" Language="C#" MasterPageFile="~/CBLMaster.Master" AutoEventWireup="true" CodeBehind="forums.aspx.cs" Inherits="CheapoBuildLog.WebForm3" %>
<%@ MasterType VirtualPath="~/CBLMaster.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/forums.css" rel="stylesheet" />

    <script type="text/javascript">
        $(function () {
            $(".expand").on("click", function () {
                // $(this).next().slideToggle(200);
                $expand = $(this).find(">:first-child");

                if ($expand.text() == "+") {
                    $expand.text("-");
                } else {
                    $expand.text("+");
                }
            });
        });
    </script>

    <script>
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="navContent" runat="server">
    <li><a href="index.aspx">Home</a></li>
    <li class="active"><a href="forums.aspx">Forums</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">

    <div class="col-md-8">
        <div class="page-header">
            <h1 class="">Forums</h1>

            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 data-toggle="collapse" data-parent="#accordion" href="#newsandannouncement" class="panel-title expand">
                            <div class="right-arrow pull-right">+</div>
                            <a href="#">News and Announcements</a>
                        </h4>
                    </div>
                    <div id="newsandannouncement" class="panel-collapse collapse">
                        <asp:Panel id="panelNewsAnnouncement" runat="server"></asp:Panel>
                        <asp:Panel id="panelNewsAnnouncementfooter" CssClass="panel-footer" runat="server">
                            <span class="">Total Threads: <asp:Label ID="lblThreadsTotalNewsandAnnouncements" runat="server" Text="0"></asp:Label></span> 
                        </asp:Panel>                                                                       
                    </div>  
                    
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 data-toggle="collapse" data-parent="#accordion" href="#centralprocessingunit" class="panel-title expand">
                            <div class="right-arrow pull-right">+</div>
                            <a href="#">Central Processing Unit (CPU) Section</a>
                        </h4>
                    </div>
                    <div id="centralprocessingunit" class="panel-collapse collapse">
                        <asp:Panel id="panelCentralProcessingUnit" runat="server"></asp:Panel>
                        <asp:Panel id="panelCentralProcessingUnitfooter" CssClass="panel-footer" runat="server">
                            <span class="">Total Threads: <asp:Label ID="lblThreadsTotalCPU" runat="server" Text="0"></asp:Label></span> 
                        </asp:Panel>
                    </div>                  
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 data-toggle="collapse" data-parent="#accordion" href="#graphicsprocessingunit" class="panel-title expand">
                            <div class="right-arrow pull-right">+</div>
                            <a href="#">Graphics Processing Unit (GPU) Section</a>
                        </h4>
                    </div>
                    <div id="graphicsprocessingunit" class="panel-collapse collapse">
                        <asp:Panel id="panelGraphicsProcessingUnit" runat="server"></asp:Panel>
                        <asp:Panel id="panelGraphicsProcessingUnitfooter" CssClass="panel-footer" runat="server">
                            <span class="">Total Threads: <asp:Label ID="lblThreadsTotalGPU" runat="server" Text="0"></asp:Label></span> 
                        </asp:Panel>
                    </div>                  
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 data-toggle="collapse" data-parent="#accordion" href="#peripherals" class="panel-title expand">
                            <div class="right-arrow pull-right">+</div>
                            <a href="#">Peripherals Section</a>
                        </h4>
                    </div>
                    <div id="peripherals" class="panel-collapse collapse">
                        <asp:Panel id="panelPeripherals" runat="server"></asp:Panel>
                        <asp:Panel id="panelPeripheralsfooter" CssClass="panel-footer" runat="server">
                            <span class="">Total Threads: <asp:Label ID="lblThreadsTotalPerephirals" runat="server" Text="0"></asp:Label></span> 
                        </asp:Panel>
                    </div>                  
                </div>

            </div>
            
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

        <div class="panel panel-default">
            <div class="panel-heading">
                <h4>Latest Threads</h4>
            </div>

            <div class="panel-body">
                <asp:Panel ID="panelLatestThreads" runat="server"></asp:Panel>               
            </div>
        </div>
    </div>

</asp:Content>
