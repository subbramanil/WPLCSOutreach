﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/AdministratorMasterpage.master" AutoEventWireup="true" CodeBehind="ApproveLeave.aspx.cs" Inherits="CSOutreach.Pages.Administrator.ApproveLeave" %>
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
            <div class="form-group col-md-3">
                <label for="">Enter Event Type:</label>
                <asp:DropDownList ID="drpEventName" runat="server" DataTextField="TypeName" DataValueField="EventTypeId">
                </asp:DropDownList>
            </div>
            <div class="form-group col-md-3">
                <label for="">Course Name:</label>
                <asp:DropDownList ID="drpCourseName" runat="server" DataTextField="CourseName" DataValueField="CourseId">
                </asp:DropDownList>
            </div>
        </div>
        
        <div class="row">
            <hr class="col-md-6" />
        </div>

        <div class="row">
            <div class="form-group col-md-3">
                <label for="">Instructor Name:</label>
                <input type="text" class="form-control" id="Instructor" runat="server" />
            </div>
            <div class="form-group col-md-3">
                <label for="">Location:</label>
                <input type="text" class="form-control" id="Location" runat="server" />
            </div>
        </div>
        
        <div class="row">
            <hr class="col-md-6" />
        </div>

        <input type="submit" class="btn btn-primary" value="Search"/>
        <div class="row">
            <hr class="col-md-6" />
        </div>
    </div>
</asp:Content>