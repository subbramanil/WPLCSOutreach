<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/AdministratorMasterpage.master" AutoEventWireup="true" CodeBehind="ReviewApplicants.aspx.cs" Inherits="CSOutreach.Pages.ReviewApplicants" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContent" runat="server">
      <div class="row">
       <h3>Create Event</h3>
    </div>
     <div class="row">
            <hr class="col-md-12" />
        </div>
        <div class="row">
            <div class="form-group col-md-3">
                <label>Applicant Name :</label>
                  <asp:TextBox ID="ApplicantName" CssClass="form-control" runat="server"></asp:TextBox>
             </div>
            <div class="form-group col-md-3">
                <label>Semester Started :</label>
                  <asp:TextBox ID="SemStarted" CssClass="form-control" runat="server"></asp:TextBox>
             </div>

        </div>    
        <div class="row">
            <div class="form-group col-md-3">
                 <label for="">Applicant Skill Set:</label>
              
                <asp:ListBox ID="ListBox1" runat="server" CssClass="form-control" >
                    <asp:ListItem>Sample Skill Set</asp:ListItem>
                </asp:ListBox>
            </div>

           <div class="form-group col-md-3">
               <br />
               <button type="button" class="btn btn-default"><span class="glyphicon glyphicon-plus"></span> Add Skills</button>
                    </div>
        </div>

  
     <div class="row">
            <hr class="col-md-6" />
     </div>
  
     <div class="row">
        <div class="form-group col-md-3">
            <input type="submit" class="btn btn-primary" value="Search"/>
        </div>
     </div>
       
     <div class="row">
            <hr class="col-md-12" />
     </div>

     <div class="row">

         
         <asp:Table ID="SearchResult" runat="server" CssClass="table table-hover">
             <asp:TableRow>
                 <asp:TableHeaderCell>Name</asp:TableHeaderCell>
                 <asp:TableHeaderCell>Degree Major</asp:TableHeaderCell>
                 <asp:TableHeaderCell>Skills</asp:TableHeaderCell>
                 <asp:TableHeaderCell>Has Car</asp:TableHeaderCell>
                 <asp:TableHeaderCell>Phone Number</asp:TableHeaderCell>
                 <asp:TableHeaderCell>Accept</asp:TableHeaderCell>
                 <asp:TableHeaderCell>Reject</asp:TableHeaderCell>
             </asp:TableRow>
             <asp:TableRow>
                 <asp:TableCell>Test1</asp:TableCell>
                 <asp:TableCell>CS</asp:TableCell>
                 <asp:TableCell>
                     <asp:ListBox ID="ResultList" runat="server" CssClass="form-control"></asp:ListBox>
                 </asp:TableCell>
                 <asp:TableCell>Yes</asp:TableCell>
                 <asp:TableCell>(214) 234 - 2311</asp:TableCell>
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
