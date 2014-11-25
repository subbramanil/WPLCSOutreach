<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Pages/MasterPages/StudentMasterPage.Master" AutoEventWireup="true" CodeBehind="DefaultHome.aspx.cs" Inherits="CSOutreach.Pages.DefaultHome" %>

<asp:Content ID="Content2" ContentPlaceHolderID="StudentContent" runat="server">
    <div>
        <div id="eventHeader">
            <div class="row">
                <h3 id="EventTitle" class="col-md-8">Event Title</h3>
                <h3 id="EventType" class="col-md-4 text-right">Event Type</h3>
            </div>
            <div class="progress text-right">
                <div class="progress-bar progress-bar-success progress-bar-striped active" id="progressbar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                </div>
            </div>
        </div>

        <hr />
        <div id="regStep1">
            <div class="row">
                <p class="text-info text-justify">Details of the event...</p>
            </div>
            <hr />
            <div class="row">
                <div class="form-group col-md-3">
                    <label for="">Student ID:</label>
                    <input type="text" class="form-control" id="StudentID" runat="server" readonly="true" />
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-3">
                    <label for="">First Name:</label>
                    <input type="text" class="form-control" id="FirstName" runat="server" readonly="true" />
                </div>
                <div class="form-group col-md-3">
                    <label for="">Last Name:</label>
                    <input type="text" class="form-control" id="LastName" runat="server" readonly="true" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <label for="">Emergency Contact:</label>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-1">
                    <input type="text" class="form-control col-md-1" maxlength="3" id="PhoneArea" runat="server" />
                </div>
                <div class="form-group col-md-1">
                    <input type="text" class="form-control col-md-1" maxlength="3" id="PhoneFirst" runat="server" />
                </div>
                <div class="form-group col-md-1">
                    <input type="text" class="form-control col-md-1" maxlength="4" id="PhoneSecond" runat="server" />
                </div>
            </div>
            <hr />
            <div class="row text-right">
                <input type="button" class="btn btn-primary" value="Next" id="step1NextBtn" />
            </div>
            <hr />
        </div>

        <div id="regStep2">
            <div class="row">
                <h3 id="regStep2Title">PreRequsites & Schedule Conflicts</h3>
                <hr />
                <div id="prereqBlock">
                    <div class="module">
                        <h5 class="disblock" style="cursor: default;">Class Prerequisites
                        </h5>
                        <div class="moduleBody">
                            <ul class="ulEvent">
                                <asp:Repeater ID="repClassPrerequisites" runat="server">
                                    <ItemTemplate>
                                        <!--<li><a href="#"><%# DataBinder.Eval(Container.DataItem, "Name")%></a></li>
                                            <div>
                                                <asp:Literal ID="ltrlDescription" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Description")%>'></asp:Literal>
                                            </div>-->
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </div>
                    </div>
                </div>

                <div id="conflictsBlock">
                    <div class="module">
                        <h5 class="disblock" style="cursor: default;">Event Schedule Conflicts
                        </h5>
                        <div class="moduleBody">
                            <ul class="ulEvent">
                                <asp:Repeater ID="Repeater2" runat="server">
                                    <ItemTemplate>
                                        <!--<li><a href="#"><%# DataBinder.Eval(Container.DataItem, "Name")%></a></li>
                                            <div>
                                                <asp:Literal ID="ltrlDescription" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Description")%>'></asp:Literal>
                                            </div>-->
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <hr />
            <div class="row text-right">
                <input type="button" class="btn btn-primary" value="Prev" id="step2PrevBtn" />
                <input type="button" class="btn btn-primary" value="Next" id="step2NextBtn" />
            </div>
            <hr />
        </div>

        <div id="regStep3">
            <h3 id="regStep3Title">Consent Forms</h3>
            <hr />
            <div class="row">
                <div class="panel-group" id="accordion">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseFormOne">Consent Form 1</a>
                            </h4>
                        </div>
                        <div id="collapseFormOne" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <embed src="../../img/sample.pdf" width="800" height="600" id="consentForm1" />
                                <div class="row text-center">
                                    <p>
                                        <input type="checkbox" id="form1Check" />
                                        I accept to the terms and conditions specified
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseFormTwo">Consent Form 2</a>
                            </h4>
                        </div>
                        <div id="collapseFormTwo" class="panel-collapse collapse">
                            <div class="panel-body">
                                <embed src="../../img/sample.pdf" width="800" height="600" id="consentForm2" />
                                <div class="row text-center">
                                    <p>
                                        <input type="checkbox" id="form2Check" />
                                        I accept to the terms and conditions specified
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseFormThree">Consent Form 3</a>
                            </h4>
                        </div>
                        <div id="collapseFormThree" class="panel-collapse collapse">
                            <div class="panel-body">
                                <embed src="../../img/sample.pdf" width="800" height="600" id="consentForm3" />
                                <div class="row text-center">
                                    <p>
                                        <input type="checkbox" id="form3Check" />
                                        I accept to the terms and conditions specified
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr />
            <div class="row text-right">
                <input type="button" class="btn btn-primary" value="Prev" id="step3PrevBtn" />
                <input type="button" class="btn btn-primary" value="Next" id="step3NextBtn" />
            </div>
            <hr />
        </div>

        <div id="regStep4">
            <h3 id="regStep4Title">Confirmation</h3>
            <hr />
            <div class="row">
            </div>
            <hr />
            <div class="row text-right">
                <input type="button" class="btn btn-warning" value="Cancel Registration" id="step3CancelBtn" />
                <input type="submit" class="btn btn-success" value="Confirm & pay" id="step4SubmitBtn" />
            </div>
            <hr />
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $('#regStep2').hide();
            $('#regStep3').hide();
            $('#regStep4').hide();
        });

        $('#step1NextBtn').click(function () {
            $('#regStep1').hide();
            $('#regStep2').show();
            $('#progressbar').css('width', '25%');
            $('#progressbar').text("25%");
        });
        /*
        <div class="progress-bar progress-bar-success" style="width: 35%">
                <span class="sr-only">35% Complete (success)</span>
              </div>
              <div class="progress-bar progress-bar-warning progress-bar-striped" style="width: 20%">
                <span class="sr-only">20% Complete (warning)</span>
              </div>
              <div class="progress-bar progress-bar-danger" style="width: 10%">
                <span class="sr-only">10% Complete (danger)</span>
              </div>
        */

        $('#step2NextBtn').click(function () {
            $('#regStep2').hide();
            $('#regStep3').show();
            $('#progressbar').css('width', '50%');
            $('#progressbar').text("50%");
        });

        $('#step3NextBtn').click(function () {
            if (!$('#form1Check').is(':checked')) {
                alert("Kindly accept to the condtions specified in consent form 1");
                return;
            }
            if (!$('#form2Check').is(':checked')) {
                alert("Kindly accept to the condtions specified in consent form 2");
                return;
            }
            if (!$('#form3Check').is(':checked')) {
                alert("Kindly accept to the condtions specified in consent form 3");
                return;
            }
            $('#regStep3').hide();
            $('#regStep4').show();
            $('#progressbar').css('width', '75%');
            $('#progressbar').text("75%");
        });

        $('#step2PrevBtn').click(function () {
            $('#regStep2').hide();
            $('#regStep1').show();
            $('#progressbar').css('width', '0%');
            $('#progressbar').text("0%");
        });

        $('#step3PrevBtn').click(function () {
            $('#regStep3').hide();
            $('#regStep2').show();
            $('#progressbar').css('width', '25%');
            $('#progressbar').text("25%");
        });
    </script>
</asp:Content>
