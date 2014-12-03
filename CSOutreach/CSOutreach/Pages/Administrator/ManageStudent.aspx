<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/AdministratorMasterpage.master" AutoEventWireup="true" CodeBehind="ManageStudent.aspx.cs" Inherits="CSOutreach.Pages.Administrator.ManageStudent" %>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminContent" runat="server">

    <div class="row">
       <h3>Manage Student</h3>
       <p>Use the form below to remove or change student registration.</p>
    </div>
        
    <div class="row">
        <hr class="col-md-6" />
    </div>

    <div class="row">
        <div class="form-group col-md-3">
            <label for="">Student Name:</label>
            <input type="text" class="form-control" id="StudentName" runat="server" />
        </div>
        
    </div>
        
        <div class="row">
            <hr class="col-md-6" />
        </div>

        <asp:Button runat ="server"  CssClass="btn btn-primary" Text="Search"/>
        <div class="row">
            <hr class="col-md-6" />
        </div>
    
</asp:Content>
