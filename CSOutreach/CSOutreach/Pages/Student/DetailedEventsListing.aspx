<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/StudentMasterPage.master" AutoEventWireup="true" CodeBehind="DetailedEventsListing.aspx.cs" Inherits="CSOutreach.Pages.Student.DetailedEventsListing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="StudentContent" runat="server">

    <script>
        $("document").ready(function () {
            $("#DataEventsTable").dataTable();
        });
    </script>

    <asp:Repeater ID="EventDetailsRepeater" runat="server">
        <HeaderTemplate>
            <table id="DataEventsTable" class="table table-striped table-bordered" width="100%" cellspacing="0">
                <thead>
                    <tr>
                    <td>No.</td>
                    <td>Event</td>
                    <td>Date</td>
                    <td>Time</td>
                    <td>Venue</td>
                    <td>Details</td>
                        <td>Action</td>
                        </tr>
                </thead>
                <tbody>
        </HeaderTemplate>
        <ItemTemplate>
           <tr>
               <td><asp:Label ID="LabelNo" runat="server" Text='<%# Eval("EventNo") %>'></asp:Label></td>
               <td><asp:Label ID="LabelEvent" runat="server" Text='<%# Eval("EventName") %>'></asp:Label></td>
               <td><asp:Label ID="LabelDate" runat="server" Text='<%# Eval("EventDate") %>'></asp:Label></td>
               <td><asp:Label ID="LabelTime" runat="server" Text='<%# Eval("EventTime") %>'></asp:Label></td>
               <td><asp:Label ID="LabelVenue" runat="server" Text='<%# Eval("EventVenue") %>'></asp:Label></td>
              <td><asp:Button ID="ButtonDetails" runat="server" Text="Details"></asp:Button></td>
               <td><asp:Button ID="ButtonRegister" runat="server" Text="Register"></asp:Button></td>
           </tr>
        </ItemTemplate>
        <FooterTemplate>
            </tbody>

            </table>
        </FooterTemplate>
    </asp:Repeater>
</asp:Content>
