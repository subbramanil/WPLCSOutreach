<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/AdministratorMasterpage.master" AutoEventWireup="true" CodeBehind="ApproveLeave.aspx.cs" Inherits="CSOutreach.Pages.Administrator.ApproveLeave" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminContent" runat="server">
    <div class="row">
       <h3>Leave Applications</h3>
       <p>Use the form below to approve/discard leave applications.</p>
    </div>

    <div class="row">
        <hr class="col-md-6" />
    </div>

    <div class="form-Approve Leave">
        <div class="row">
                           
                <asp:Table ID="LeaveApplications" runat="server" CssClass="tablesorter table table-hover">
             
             
              <asp:TableHeaderRow  TableSection="TableHeader">  
                 <asp:TableHeaderCell>Event ID</asp:TableHeaderCell>
                 <asp:TableHeaderCell>Instructor ID</asp:TableHeaderCell>
                 <asp:TableHeaderCell>Event Date</asp:TableHeaderCell>
                 <asp:TableHeaderCell>Leave Application</asp:TableHeaderCell>
                 <asp:TableHeaderCell>Accept</asp:TableHeaderCell>
                 <asp:TableHeaderCell>Reject</asp:TableHeaderCell>
                     
             </asp:TableHeaderRow> 
             <asp:TableRow>
                 <asp:TableCell> </asp:TableCell>
                 
                 <asp:TableCell> </asp:TableCell>
                 
                 <asp:TableCell> </asp:TableCell>
                 
                 <asp:TableCell> </asp:TableCell>
                 
                 <asp:TableCell>
                     <input type="submit" class="btn btn-success" value="Accept"/>
                 </asp:TableCell>
                 
                 <asp:TableCell>
                     <input type="submit" class="btn btn-danger" value="Reject"/>
                 </asp:TableCell>

             </asp:TableRow>
            
                
         </asp:Table>

    </div>
</asp:Content>
