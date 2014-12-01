<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/AdministratorMasterpage.master" AutoEventWireup="true" CodeBehind="CreateEvent.aspx.cs" Inherits="CSOutreach.Pages.Administrator.CreateEvent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminContent" runat="server">
    
  <div class="row">
       <h3>Create Event</h3>
    </div>
     <div class="row">
            <hr class="col-md-12" />
        </div>
        <div class="row">
            <div class="form-group col-md-3">
                <label>Event Type :</label>
               <asp:DropDownList ID="drpEventType" runat="server"  DataTextField="TypeName" DataValueField="EventTypeId">
                </asp:DropDownList>
            </div>
            <div class="form-group col-md-6">
                <label for="">If selected Other:</label>
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox> 
            </div>
             </div>

        <div class="row">
            <div class="form-group col-md-6">
                 <label for="">Event Recurrance:</label>
               <asp:DropDownList ID="EventRecurrance" runat="server">
                </asp:DropDownList>
            </div>
        </div>

        <div class="row">
            <div class="form-group col-md-6">
                <label for="">Course Type:</label>
               <asp:DropDownList ID="drpCourseType" runat="server" DataTextField="CourseName" DataValueField="CourseId">
                </asp:DropDownList>
            </div>
            <div class="form-group col-md-3">
                <label for="">Level:</label>
                <asp:DropDownList ID="Level" runat="server">
                    <asp:ListItem>0</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
    
     <div class="row">
            <hr class="col-md-12" />
        </div>
    
     <div class="row">
            <div class="form-group col-md-6">
                <label for="">Start Date:</label>
                <asp:TextBox ID="startDate" class="datepicker" runat="server"></asp:TextBox> 
            </div>
         <div class="form-group col-md-6">
                <label for="">End Date:</label>
                <asp:TextBox ID="endDate" class="datepicker" runat="server"></asp:TextBox> 
            </div>
        </div>
    <div class="row">
            <div class="form-group col-md-6">
                <label for="">Start Time:</label>
                <asp:TextBox id="starttime" class="timepicker" runat="server"></asp:TextBox> 
            </div>
         <div class="form-group col-md-6">
                <label for="">End Time:</label>
                <asp:TextBox ID="endtime"  CssClass="timepicker" runat="server"></asp:TextBox> 
            </div>
        </div>
     <div class="row">
            <hr class="col-md-12" />
        </div>
       <div class="row">
            <div class="form-group col-md-6">
                 <label for="">Find Instructors:</label>
               <asp:DropDownList ID="DropDownList1" runat="server">
                </asp:DropDownList>
            </div>
        </div>

     <br />
        <input type="submit" class="btn btn-primary" value="Sign Up"/>
        <div class="row">
            <hr class="col-md-6" />
        </div>
              
</asp:Content>
