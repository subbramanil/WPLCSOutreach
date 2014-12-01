<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/AdministratorMasterpage.master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="CSOutreach.Pages.Administrator.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminContent" runat="server">
        <div class="row">
            <div class ="col-md-6">
                <div id="upcommingEvents">
                     <div class="module">
                <h5 class="disblock" style="cursor: default;">Upcomming Events</h5>
                <div class="moduleBody">
                    <asp:Repeater ID="menu_ul_1" runat="server">
                        <HeaderTemplate>
                            <ul class="my-menu">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li>
                                    <a href='<%# Eval("Name")%>'>
                                        <%# Eval("Name")%></a>
                            </li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
            </div>
            <div class ="col-md-6">
                <div id="eventSchedule">
                     <div class="module">
                <h5 class="disblock" style="cursor: default;">Event Schedule</h5>
                <div class="moduleBody">
                    <ul>
                        <li>First Event</li>
                    </ul>
                </div>
            </div>
        </div>
            </div>
            </div>
            <div class="row">
            <div class ="col-md-6">
                <div id="Announcements">
                     <div class="module">
                <h5 class="disblock" style="cursor: default;">Announcements</h5>
                <div class="moduleBody">
                    <ul>
                        <li>First Event</li>
                    </ul>
                </div>
            </div>
        </div>
            </div>
            <div class ="col-md-6">
                <div id="instructorsOnLeave">
                     <div class="module">
                <h5 class="disblock" style="cursor: default;">Instructors On Leave</h5>
                <div class="moduleBody">
                    <ul>
                        <li>First Event</li>
                    </ul>
                </div>
            </div>
        </div>
            </div>
            </div>
      
</asp:Content>
