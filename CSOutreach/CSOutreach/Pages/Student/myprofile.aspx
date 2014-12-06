<%@ Page Title="myprofile" Language="C#" MasterPageFile="~/Pages/MasterPages/StudentMasterPage.master" AutoEventWireup="true" CodeBehind="myprofile.aspx.cs" Inherits="CSOutreach.Pages.Student.myprofile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="StudentContent" runat="server">
<div class="row">
       <div class="alert alert-success" id="divsuccess" runat="server">
           <span class="glyphicon glyphicon-ok"></span><label>You have successfully edit the content</label>
       </div>
     </div>
      <div class="row">
       <div class="alert alert-danger" id="diverror" runat="server">
           <span class="glyphicon glyphicon-exclamation-sign"></span><label> Error occured while editing. Please try again later.</label>
       </div>
<div class="form-edit">
        <div class="row">
            <div class="form-group col-md-3">
                <label for="">First Name:</label>
                <input type="text" class="form-control" id="First_Name" runat="server" maxlength="50" DataTextField="First_Name" DataValueField="First_Name"/>
                
            </div>
            <div class="form-group col-md-3">
                <label for="">Last Name:</label>
                <input type="text" class="form-control" id="Last_Name" runat="server" maxlength="50" DataTextField="Last_Name" DataValueField="Last_Name"/>
            </div>
        </div>

        <div class="row">
            <hr class="col-md-6" />
        </div>

        <div class="row">
            <div class="form-group col-md-6">
                <label for="">Address:</label>
                <textarea class="form-control" id="Address" runat="server" maxlength="85" DataTextField="Address_1" DataValueField="Address_1"></textarea>
            </div>
        </div>
    
        
        <div class="row">
            <div class="col-md-3">
                <label for="">Contact Phone Number:</label>
                <input type="text" class="form-control" id="Contact_Number" runat="server" maxlength="10" DataTextField="Contact_Number" DataValueField="Contact_Number"/>
            </div>
        </div>
        
        <div class="row">
            <hr class="col-md-6" />
        </div>

        <div class="row">
            <div class="form-group col-md-3">
                <label for="">Email:</label>1
                <input type="text" class="form-control" id="Email" runat="server" DataTextField="Email" DataValueField="Email" />
            </div>
            <div class="form-group col-md-3">
                <label for="">Confirm Email:</label>
                <input type="text" class="form-control" id="EmailConfirm" runat="server" DataTextField="EmailConfirm" DataValueField="EmailConfirm" />
            </div>
            <div class="col-md-1" id="email-ok"></div>
        </div>
        <p class="has-error"><em>*Use your UTDallas email address if you have one.</em></p>
        <br />
        <div class="row">
            <div class="form-group col-md-3">
                <label for="">Password:</label>
                <input type="password" class="form-control" id="Password" runat="server" maxlength="6" DataTextField="Password" DataValueField="Password"/>

 
            </div>
            <div class="form-group col-md-3">
                <label for="">Confirm Password:</label>
                <input type="password" class="form-control" id="CPassword" runat="server" />
                 </div>
            <div class="col-md-1" id="password-ok"></div>
        </div>
        <div class="row">
            <p class="has-error col-md-6"><em>*Password must be 8-15 characters long and contain at least 1 uppercase letter, 1 lowercase letter, and 1 number.</em></p>
        </div>
        <br />
    <asp:Button id="Button1" runat="server" Text="myprofile" 
	onClickonserverclick="Button1_Click" />
        <input type="submit" class="btn btn-primary" value="Submit" id="btnclick" runat="server"/>
        <div class="row">
            <hr class="col-md-6" />
        </div>
    </div>

 <script>

     $(document).ready(function () {

         jQuery.validator.addMethod("letters", function (value, element) {
             return this.optional(element) || /^[a-zA-Z]+$/.test(value);
         }, "Please enter letters only without spaces");

         jQuery.validator.addMethod("letters_spaces", function (value, element) {
             return this.optional(element) || /^[a-zA-Z\s]+$/.test(value);
         }, "Please enter letters only");

         jQuery.validator.addMethod("checkpassword", function (value, element) {
             return this.optional(element) || /^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])([a-zA-Z0-9]{8,15})+$/.test(value);
         }, "Entered password does not meet minimum requirements");

         jQuery.validator.addMethod("matchfield", function (value, element, param) {
             if (param == "email")
                 var fieldval = $("#" + "<%=Email.ClientID%>").val();
                    if (param == "password")
                        var fieldval = $("#" + "<%=Password.ClientID%>").val();

                    return this.optional(element) || value === fieldval;
                });

                jQuery.validator.addMethod("checkaddress", function (value, element) {
                    return this.optional(element) || /^[a-zA-Z0-9'\-\,\.\s]+$/.test(value);
                }, "Address contains some invalid characters");


                $("#pageform").validate({

                    rules: {
                        "<%=First_Name.UniqueID%>": { required: true, letters: true },
                        "<%=Last_Name.UniqueID%>": { required: true, letters: true },
                        "<%=Address.UniqueID%>": { required: true, checkaddress: true },
                        "<%=Contact_Number.UniqueID%>": { required: true, digits: true, minlength: 9 },
                         "<%=Email.UniqueID%>": {
                            required: true,
                            email: true,
                            remote: function () { //call a webmethod to check user name availability
                                return {
                                    url: "myprofile.aspx/",
                                    data: "{userName: '" + $("#" + "<%=Email.ClientID%>").val() + "'}",
                                    cache: false,
                                    type: 'POST',
                                    Async: false,
                                    dataType: "json",
                                    contentType: 'application/json; charset=utf-8',
                                    dataFilter: function (response) {
                                        return $.parseJSON(response).d;  //show error message(return false) if user name alreadu exists
                                    },
                                }

                            },
                        },

                        "<%=EmailConfirm.UniqueID%>": { required: true, email: true, matchfield: "email" },
                        "<%=Password.UniqueID%>": { required: true, checkpassword: true },
                        "<%=CPassword.UniqueID%>": { required: true, checkpassword: true, matchfield: "password" },


                    },
                    
                    },
                    messages: {
                        "<%=First_Name.UniqueID%>": { required: "Please enter your Firstname" },
                        "<%=Last_Name.UniqueID%>": { required: "Please enter your Lastname" },
                        "<%=Address.UniqueID%>": { required: "Please enter your Address" },                        
                        "<%=Contact_Number.UniqueID%>": { required: "Please enter your Contact phone number", digits: "Please enter numbers only", minlength: "minimum 3 digits required" },
                        "<%=Email.UniqueID%>": { required: "Please enter your email", email: "Please enter a valid email address", remote: "Email already in use" },
                        "<%=EmailConfirm.UniqueID%>": { required: "Please confirm your email", email: "Please enter a valid email address", matchfield: "Email and Confirm email not same" },
                        "<%=Password.UniqueID%>": { required: "Please enter your password" },
                        "<%=CPassword.UniqueID%>": { required: "Please confirm your password", matchfield: "Password and Confirm password not same" },

                    },
                    errorClass: "has-error",
                    errorPlacement: function (error, element) {
                        //show a single error message for {Phoneno} and {City,State and Zip} groups validation
                       // if ($(element).attr("name") == "" || $(element).attr("name") == " || $(element).attr("name") == ""
                           // || $(element).attr("name") == "" || $(element).attr("name") == "" || $(element).attr("name") == " {
                          //  error.insertAfter($(element).parent().parent());
                       // }
                      //  else { error.insertAfter($(element)); }
                   // },
                    highlight: function (element, errorClass) {
                        $(element).parent().children("input").addClass("error_vld");
                    },
                    unhighlight: function (element, errorClass) {
                        $(element).parent().children("input").removeClass("error_vld");
                    }
                });


            });

        </script>
</asp:Content>
