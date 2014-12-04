<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Pages/MasterPages/StudentMasterPage.Master" AutoEventWireup="true" CodeBehind="DefaultHome.aspx.cs" Inherits="CSOutreach.Pages.DefaultHome" %>

<asp:Content ID="Content2" ContentPlaceHolderID="StudentContent" runat="server">

    <style>
        .containerPortal {
            padding: 18px 24px;
            min-width: 600px;
            margin: 0;
            color: #444;
        }

        #registeredEvents, #UpComingEvents, #EventSchedule, #Announcements {
            margin: 6px 0px 0px 0px;
            min-height: 200px;
            height: auto;
            float: left;
        }

        .module {
            border: 1px solid #D5D2CA;
            background-color: #EFEDE3;
            border-radius: 3px;
            position: relative;
            margin: 10px 20px 10px 0px;
            min-width: 400px;
        }

            .module h5 {
                border-bottom: 1px solid #D5D2CA;
                padding: 8px 8px 8px 12px;
                font-weight: bold;
            }

        .moduleBody {
            padding: 8px 8px 8px 12px;
        }

            .moduleBody a {
                font-weight: bold;
                color: #008542;
                text-decoration: none;
            }

        .ulEvent {
            list-style: none;
            padding: 0px;
            margin: 0px;
        }

            .ulEvent li {
                /*padding: 7px 0 0 0;*/
                margin: 0 0 7px 0;
            }

            .ulEvent div {
                text-indent: -16px;
                margin: 4px 0;
                padding: 0 0 0 16px;
            }

        .disblock {
            display: block;
        }

        .modulesubcontent {
            color: #9f9797;
            font-style: italic;
        }
    </style>
    <div class="containerPortal">
        <div id="registeredEvents">
            <div class="module">
                <h5 class="disblock" style="cursor: default;">Registered Events
                </h5>
                <div class="moduleBody">
                    <ul class="ulEvent">
                        <asp:Repeater ID="repRegisteredEvents" runat="server">
                            <ItemTemplate>
                                <li><a href="#"><%# DataBinder.Eval(Container.DataItem, "Name")%></a></li>
                                <div>
                                    <asp:Literal ID="ltrlDescription" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Description")%>'></asp:Literal>
                                </div>
                            </ItemTemplate>

                        </asp:Repeater>
                    </ul>
                </div>
            </div>
        </div>
        <div id="UpComingEvents">
            <div class="module">
                <h5 class="disblock" style="cursor: default;">Upcoming Events Of Your Interest
                </h5>
                <div class="moduleBody">
                    <ul class="ulEvent">
                        <asp:Repeater ID="repUpcomingEvents" runat="server" OnItemDataBound="repUpcomingEvents_ItemDataBound">
                            <ItemTemplate>
                                <li><a href="#"><%# DataBinder.Eval(Container.DataItem, "Name")%></a></li>
                                <div>
                                    <span class="modulesubcontent">Starts on </span>
                                    <asp:Literal ID="ltrlUpcomingDate" runat="server" Text='<%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "StartDate")).ToString("MMM dd, yyyy")%>' ></asp:Literal>
                                </div>
                            </ItemTemplate>

                        </asp:Repeater>

                    </ul>
                </div>
            </div>

        </div>
        <div class="clearfix"></div>
        <div id="EventSchedule">
            <div class="module">
                <h5 class="disblock" style="cursor: default;">Event Schedule
                </h5>
                <div class="moduleBody">
                    <ul class="ulEvent">
                        <asp:Repeater ID="repEventSchedule" runat="server" OnItemDataBound="repEventSchedule_ItemDataBound">
                            <ItemTemplate>
                                <li><a href="#"><%# DataBinder.Eval(Container.DataItem, "Name")%></a></li>
                                <div>
                                    <span class="modulesubcontent">Starts on </span>
                                    <asp:Literal ID="ltrlDate" runat="server"></asp:Literal>
                                    <span class="modulesubcontent">from </span>
                                    <asp:Literal ID="ltrlTimings" runat="server"></asp:Literal><br />
                                    <span class="modulesubcontent">at </span>
                                    <asp:Literal ID="ltrlLocation" runat="server"></asp:Literal>

                                </div>
                            </ItemTemplate>

                        </asp:Repeater>
                    </ul>
                </div>
            </div>
        </div>
        <div id="Announcements">
            <div class="module">
                <h5 class="disblock" style="cursor: default;">Announcements
                </h5>
                <div class="moduleBody">
                    <ul class="ulEvent">
                        <li><a href="#">
                            <asp:Literal runat="server" ID="ltrlPaperWorkComplete"></asp:Literal></a></li>
                        <asp:Repeater ID="repAnnouncements" runat="server" OnItemDataBound="repAnnouncements_ItemDataBound">
                            <ItemTemplate>
                            </ItemTemplate>

                        </asp:Repeater>

                    </ul>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

