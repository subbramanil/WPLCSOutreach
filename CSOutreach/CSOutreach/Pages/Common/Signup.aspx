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
                <input type="text" class="form-control" id="FirstName" runat="server" name="firstname" required/>
            </div>
            <div class="form-group col-md-3">
                <label for="">Last Name:</label>
                <input type="text" class="form-control" id="LastName" runat="server" name="lastname" required/>
            </div>
        </div>

        <div class="row">
            <hr class="col-md-6" />
        </div>

        <div class="row">
            <div class="form-group col-md-6">
                <label for="">Address 1:</label>
                <input type="text" class="form-control" id="Address1" runat="server" required/>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-6">
                <label for="">Address 2:</label>
                <input type="text" class="form-control" id="Address2" runat="server" required/>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-3">
                <label for="">City:</label>
                <input type="text" class="form-control" id="City" runat="server" required/>
            </div>
            <div class="form-group col-md-1">
                <label for="">State:</label>
                    <select name="state" runat="server" class="form-control" required>
	                    <option value="AL">AL</option>
	                    <option value="AK">AK</option>
	                    <option value="AZ">AZ</option>
	                    <option value="AR">AR</option>
	                    <option value="CA">CA</option>
	                    <option value="CO">CO</option>
	                    <option value="CT">CT</option>
	                    <option value="DE">DE</option>
	                    <option value="DC">DC</option>
	                    <option value="FL">FL</option>
	                    <option value="GA">GA</option>
	                    <option value="HI">HI</option>
	                    <option value="ID">ID</option>
	                    <option value="IL">IL</option>
	                    <option value="IN">IN</option>
	                    <option value="IA">IA</option>
	                    <option value="KS">KS</option>
	                    <option value="KY">KY</option>
	                    <option value="LA">LA</option>
	                    <option value="ME">ME</option>
	                    <option value="MD">MD</option>
	                    <option value="MA">MA</option>
	                    <option value="MI">MI</option>
	                    <option value="MN">MN</option>
	                    <option value="MS">MS</option>
	                    <option value="MO">MO</option>
	                    <option value="MT">MT</option>
	                    <option value="NE">NE</option>
	                    <option value="NV">NV</option>
	                    <option value="NH">NH</option>
	                    <option value="NJ">NJ</option>
	                    <option value="NM">NM</option>
	                    <option value="NY">NY</option>
	                    <option value="NC">NC</option>
	                    <option value="ND">ND</option>
	                    <option value="OH">OH</option>
	                    <option value="OK">OK</option>
	                    <option value="OR">OR</option>
	                    <option value="PA">PA</option>
	                    <option value="RI">RI</option>
	                    <option value="SC">SC</option>
	                    <option value="SD">SD</option>
	                    <option value="TN">TN</option>
	                    <option value="TX" selected="selected">TX</option>
	                    <option value="UT">UT</option>
	                    <option value="VT">VT</option>
	                    <option value="VA">VA</option>
	                    <option value="WA">WA</option>
	                    <option value="WV">WV</option>
	                    <option value="WI">WI</option>
	                    <option value="WY">WY</option>
                    </select>
            </div>
            <div class="form-group col-md-2">
                <label for="">Zip:</label>
                <input type="text" class="form-control numbers-only" id="Zip" runat="server"  maxlength="5" required/>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <label for="">Contact Phone Number:</label>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-1">
                <input type="text" class="form-control col-md-1 numbers-only" maxlength="3"  id="PhoneAreaCode" runat="server" required/>
            </div>
            <div class="form-group col-md-1">
                <input type="text" class="form-control col-md-1 numbers-only" maxlength="3" id="PhoneFirstPart" runat="server" required/>
            </div>
            <div class="form-group col-md-1">
                <input type="text" class="form-control col-md-1 numbers-only" maxlength="4" id="PhoneSecondPart" runat="server" required/>
            </div>
        </div>

        <div class="row">
            <hr class="col-md-6" />
        </div>

        <div class="row">
            <div class="form-group col-md-3">
                <label for="">Email:</label>
                <input type="text" class="form-control" id="Email" runat="server" required/>
            </div>
            <div class="form-group col-md-3">
                <label for="">Confirm Email:</label>
                <input type="text" class="form-control" id="EmailConfirm" runat="server" required/>
            </div>
            <div class="col-md-1" id="email-ok"></div>
        </div>
        <p class="has-error"><em>*Use your UTDallas email address if you have one.</em></p>
        <br />
        <div class="row">
            <div class="form-group col-md-3">
                <label for="">Password:</label>
                <input type="password" class="form-control" id="Password" runat="server" required/>
            </div>
            <div class="form-group col-md-3">
                <label for="">Confirm Password:</label>
                <input type="text" class="form-control" id="PasswordConfirm" runat="server" required/>
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


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageScripts" runat="server">
    <script>
        $("#pageform").validate({message: "*Required"});

    </script>
</asp:Content>
