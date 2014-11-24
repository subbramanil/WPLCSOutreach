<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="CSOutreach.Pages.Common.Signup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">

    <div class="row">
       <h3>New User Sign Up</h3>
       <p>Use the form below to sign up.</p>
       <p>Once you have become a user, you will be able to register as a student or apply to be an instructor.</p>
    </div>

    <div class="row">
        <hr class="col-md-6" />
    </div>
    <div class="form-signup">
        <div class="row">
            <div class="form-group col-md-3">
                <label for="">First Name:</label>
                <input type="text" class="form-control" id="FirstName" runat="server" />
            </div>
            <div class="form-group col-md-3">
                <label for="">Last Name:</label>
                <input type="text" class="form-control" id="LastName" runat="server" />
            </div>
        </div>

        <div class="row">
            <hr class="col-md-6" />
        </div>

        <div class="row">
            <div class="form-group col-md-6">
                <label for="">Address 1:</label>
                <input type="text" class="form-control" id="Address1" runat="server" />
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-6">
                <label for="">Address 2:</label>
                <input type="text" class="form-control" id="Address2" runat="server" />
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-3">
                <label for="">City:</label>
                <input type="text" class="form-control" id="City" runat="server" />
            </div>
            <div class="form-group col-md-1">
                <label for="">State:</label>
                <input type="text" class="form-control" id="State" runat="server" />
            </div>
            <div class="form-group col-md-2">
                <label for="">Zip:</label>
                <input type="text" class="form-control" id="Zip" runat="server" />
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <label for="">Contact Phone Number:</label>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-1">
                <input type="text" class="form-control col-md-1" maxlength="3"  id="PhoneAreaCode" runat="server" />
            </div>
            <div class="form-group col-md-1">
                <input type="text" class="form-control col-md-1" maxlength="3" id="PhoneFirstPart" runat="server" />
            </div>
            <div class="form-group col-md-1">
                <input type="text" class="form-control col-md-1" maxlength="4" id="PhoneSecondPart" runat="server" />
            </div>
        </div>

        <div class="row">
            <hr class="col-md-6" />
        </div>

        <div class="row">
            <div class="form-group col-md-3">
                <label for="">Email:</label>
                <input type="text" class="form-control" id="Email" runat="server" />
            </div>
            <div class="form-group col-md-3">
                <label for="">Confirm Email:</label>
                <input type="text" class="form-control" id="EmailConfirm" runat="server" />
            </div>
            <div class="col-md-1" id="email-ok"></div>
        </div>
        <p class="has-error" id="usernameError"><em>Username already exists.</em></p>
        <p class="has-error"><em>*Use your UTDallas email address if you have one.</em></p>
        <br />
        <div class="row">
            <div class="form-group col-md-3">
                <label for="">Password:</label>
                <input type="password" class="form-control" id="Password" runat="server" />
            </div>
            <div class="form-group col-md-3">
                <label for="">Confirm Password:</label>
                <input type="text" class="form-control" id="PasswordConfirm" runat="server" />
            </div>
            <div class="col-md-1" id="password-ok"></div>
        </div>
        <div class="row">
            <p class="has-error col-md-6"><em>*Password must be 8-15 characters long and contain at least 1 uppercase letter, 1 lowercase letter, and 1 number.</em></p>
        </div>
        <br />
        <input type="submit" class="btn btn-primary" value="Sign Up"/>
        <div class="row">
            <hr class="col-md-6" />
        </div>
    </div>

    <script>
        $(document).ready(function () {
            $("#usernameError").hide();
            var emailId = $("#<%= Email.ClientID %>");

            // Code Added
            // On Email Id change
            $(emailId).change(function () {
                $("#usernameError").hide();
                $(emailId).css("border-color", "#66afe9");
            });

            //On key up
            $(emailId).keyup(function () {
                $("#usernameError").hide();
                $(emailId).css("border-color", "#66afe9");
            });

            // On Focus Lost : Check the user Id exists in database.
            $(emailId).focusout(function () {
            $.ajax({
                url: "Signup.aspx/IsUserExists",
                data: "{userName: '" + emailId.val() + "'}",
                cache: false,
                type: 'POST',
                Async: false,
                dataType: "json",
                contentType: 'application/json; charset=utf-8',
                success: function (response) {
                    if (response.d == 1) {
                        $(emailId).css("border-color", "#a94442");
                        $("#usernameError").show();
                    }
                },
                error: function () {
                    //alert("Error");
                }
            });

        });

    });
    </script>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageScripts" runat="server">
</asp:Content>
