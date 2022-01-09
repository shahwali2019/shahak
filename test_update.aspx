<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="test_update.aspx.cs" Inherits="test.test_update" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
<head>
    <title></title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="Content/datepicker.css" />
    <script type="text/javascript" src="Scripts/jQuery/bootstrap-datepicker.js"></script>
    <link rel="stylesheet" href="Content/bootstrap.min.css" type="text/css" />
    <script type="text/javascript" src="Scripts/WebForms/MSAjax/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="Scripts/WebForms/MSAjax/bootstrap.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/bootstrap-grid.css" rel="stylesheet" />


    <style>
        * {
            box-sizing: border-box;
        }

        .row {
            margin-left: -5px;
            margin-right: -5px;
        }

        .column {
            float: left;
            width: 50%;
            padding: 5px;
        }

        /* Clearfix (clear floats) */
        .row::after {
            content: "";
            clear: both;
            display: table;
        }

        table {
            border-collapse: collapse;
            border-spacing: 0;
            width: 100%;
            border: 1px solid #ddd;
        }

        th, td {
            text-align: left;
            padding: 16px;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>


    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript">
        function checkTB(val) {
            var allowedString = /^\d+(\.\d{0,2})?$/; // Allow 2 decimal place with numeric value
            if (allowedString.test(val) == false) {
                alert("The Amount allow 2 decimal place with numeric value. Please try to .33 0r .00 not " + val);
            }
        }
        $(document).ready(function () {
            validate();
            $('#txtdate, #txtfileupno, #txtbranchno, #txtcustomername, #txtaccno, #txtbenefi,#txtgoods,#txtinvoice,#txtamount,#txtcompfilup,#txtcurrency,#txtcountry,#txtaccr,#txtshipdoc,#txtpromislater,#txtcontract,#txtleaseaggr,#txtduedate,#txtexpdate,#txtcomplete').change(validate);
        });

        function validate() {
            if ($('#txtdate').val().length > 0 &&
                $('#txtfileupno').val().length > 0 &&
                $('#txtcustomername').val().length > 0 &&
                $('#txtaccno').val().length > 0 &&
                $('#txtbenefi').val().length > 0 &&
                $('#txtgoods').val().length > 0 &&
                $('#txtinvoice').val().length > 0 &&
                $('#txtamount').val().length > 0 &&
                //$('#txtcompfilup').val().length > 0 &&
                $('#txtcurrency').val().length > 0 &&
                $('#txtcountry').val().length > 0 &&
                $('#txtaccr').val().length > 0 &&
                $('#txtshipdoc').val().length > 0 &&
                $('#txtpromislater').val().length > 0 &&
                $('#txtcontract').val().length > 0 &&
                $('#txtleaseaggr').val().length > 0 &&
                $('#txtduedate').val().length > 0 &&
                $('#txtexpdate').val().length > 0 &&
                $('#txtcomplete').val().length > 0) {

                $("#SubmitBtn").prop("disabled", false);
            }



            else {
                $("#SubmitBtn").prop("disabled", true);
            }
            $(".validate").keyup(function (event) {
                var val = $(this).val();
                if (val.length == 17) {
                    alert("Max length is 16");
                    val = val.substring(0, val.length - 1);
                    $(this).val(val);
                    $(this).focus();
                    return false;
                }
            });



        }

    function HideLabel() {
        var seconds = 5;
        setTimeout(function () {
            document.getElementById("<%=txtlbl.ClientID %>").style.display = "none";
        }, seconds * 1000);
    };
    </script>
</head>
<div oncontextmenu="return true">
    <div>
        <br />
        <br />
        <br />
        <br />
        <div style="padding: 20px; margin-top: -50px">
            <div style="text-align: center;" class="alert alert-success" role="alert">
                <p style="text-align: center; font-size: 15px">
                    <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="Red" EnableViewState="false"></asp:Label>
                    <asp:Label ID="lblMessage" Text="" runat="server" ForeColor="Red" EnableViewState="false" />
                </p>
                <p class="alert-heading">
                    <strong style="font-family: Bahnschrift,'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;">Add new customer</strong>
                </p>
                <div style="margin-right: 1500px; margin-top: -30px">
                    <asp:ImageButton ID="btnBack" runat="server" title="Go to HOME page!" ImageUrl="image/back.png" Style="top: 14px; max-width: 150px; margin-left: 0px;" Height="31px" Width="35px" OnClick="btnBack_Click" />
                </div>
            </div>
            <div class="row">
                <div class="column">
                    <table class="table table-responsive">
                        <tr>
                            <td>Date:</td>
                            <td>
                                <asp:TextBox ID="txtdate" runat="server" TextMode="Date" BorderStyle="Solid" Width="200px"></asp:TextBox>
                            </td>
                            <%-- <td>
							<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Date " CssClass="alert" ControlToValidate="txtdate"></asp:RequiredFieldValidator>
							</td>--%>
                        </tr>
                        <tr>
                            <td>DMS No:</td>
                            <td>
                                <asp:TextBox ID="txtfileupno" runat="server" Width="200px" TextMode="Number"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Branch Name:</td>
                            <td>
                                <asp:DropDownList ID="txtbranchno" runat="server" Width="200px" CssClass="searchdropdown" Style="margin-bottom: 0px">
                                    <asp:ListItem Text="" Value="" Selected="True">-Select-</asp:ListItem>
                                    <asp:ListItem Value="000 MAIN BRANCH"></asp:ListItem>
                                    <asp:ListItem Value="008 HEAD OFFICE BRANCH"></asp:ListItem>
                                    <asp:ListItem Value="005 SHAHR-E-NAW BRANCH"></asp:ListItem>
                                    <asp:ListItem Value="007 HAIRATAN BRANCH"></asp:ListItem>
                                    <asp:ListItem Value="001- Mazar  kefayat"></asp:ListItem>
                                    <asp:ListItem Value="Bagram Branch"></asp:ListItem>
                                    <asp:ListItem Value="002 KANDAHAR BRANCH"></asp:ListItem>
                                    <asp:ListItem Value="034  Aino mina kandahar branch"></asp:ListItem>
                                    <asp:ListItem Value="024 PUL-E-BAGH OMOMI BRANCH"></asp:ListItem>
                                    <asp:ListItem Value="013 MAZAR MAIN BRANCH"></asp:ListItem>
                                    <asp:ListItem Value="009 SARAI SHAHZADA BRANCH"></asp:ListItem>
                                    <asp:ListItem Value="010 MIRWAISE MAIDAN BRANCH"></asp:ListItem>
                                    <asp:ListItem Value="011 KUNDUZ BRANCH"></asp:ListItem>
                                    <asp:ListItem Value="012 KHAIR KHANA BRANCH"></asp:ListItem>
                                    <asp:ListItem Value="013 MAZAR MAIN BRANCH"></asp:ListItem>
                                    <asp:ListItem Value="014 KLOLA PUSHTA BRANCH"></asp:ListItem>
                                    <asp:ListItem Value="015 TAIMANI BRANCH"></asp:ListItem>
                                    <asp:ListItem Value="016 KHOWST BRANCH"></asp:ListItem>
                                    <asp:ListItem Value="017 NIMRUZ BRANCH"></asp:ListItem>
                                    <asp:ListItem Value="018 Karte Naw Branch"></asp:ListItem>
                                    <asp:ListItem Value="019 KHAIR KHANA 2ND BRANCH"></asp:ListItem>
                                    <asp:ListItem Value="020 POL-E KHOMRI"></asp:ListItem>
                                    <asp:ListItem Value="021 POL-E-CHARKHI BRANCH"></asp:ListItem>
                                    <asp:ListItem Value="022 JADA-E-MAIWAND BRANCH"></asp:ListItem>
                                    <asp:ListItem Value="023 GREEN VILLAGE BRANCH"></asp:ListItem>
                                    <asp:ListItem Value="025 DASHT-E-BARCHI BRANCH"></asp:ListItem>
                                    <asp:ListItem Value="026 KARTE-SEH BRANCH"></asp:ListItem>
                                    <asp:ListItem Value="027 HERAT DARB-E-KHUSHK BRANCH"></asp:ListItem>
                                    <asp:ListItem Value="028 WAZIR AKBAR KHAN BRANCH"></asp:ListItem>
                                    <asp:ListItem Value="029 HELMAND BRANCH"></asp:ListItem>
                                    <asp:ListItem Value="030 UNOCA BRANCH"></asp:ListItem>
                                    <asp:ListItem Value="031 BARAKI BRANCH"></asp:ListItem>
                                    <asp:ListItem Value="032 SINAFER BRANCH"></asp:ListItem>
                                    <asp:ListItem Value="ISAF HQ Qutlet"></asp:ListItem>
                                    <asp:ListItem Value="033 AUAF BRANCH"></asp:ListItem>
                                    <asp:ListItem Value="036 ARZAN Qimat Branch"></asp:ListItem>
                                    <asp:ListItem Value="003 HERAT MAIN BRANCH"></asp:ListItem>
                                    <asp:ListItem Value="004 JALALABAD  BRANCH"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>Customer Name:</td>
                            <td>
                                <asp:TextBox ID="txtcustomername" runat="server" Width="200px" Style="margin-bottom: 4px"></asp:TextBox>
                                <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Characters Only" Display="Dynamic" ControlToValidate="txtcustomername" ValidationExpression="^[a-zA-Z'.]{1,40}$">Enter Characters Only</asp:RegularExpressionValidator>--%>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtcustomername" ErrorMessage="Only alphabets are allowed" ForeColor="Red" ValidationExpression="^[a-zA-Z ]+$"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="search" runat="server" OnClick="search_Click" Text="Account Number:" />
                                </td>
                            <td>
                                <asp:TextBox ID="txtaccno" runat="server" placeholder="Search Account Number"  class='validate' type='text' Width="200px" Style="margin-bottom: 4px"></asp:TextBox>
                            <div style="text-align:right; margin-bottom: -3px; text-align: center">
<%--                            <asp:Label ID="txtlbl" runat="server" Text="" ForeColor="Red"></asp:Label>--%>
                                <asp:Label ID="txtlbl" ForeColor="Red" Font-Bold="true" Text="No Data In The FlexCube." runat="server" Visible="false" />
</div>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtaccno" ForeColor="red" ErrorMessage="Account number should be 16!" ValidationExpression="^[a-zA-Z0-9]{16}"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Beneficiary Name:</td>
                            <td>
                                <asp:TextBox ID="txtbenefi" runat="server" Width="200px"></asp:TextBox>
                                <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Enter Characters Only" Display="Dynamic" ControlToValidate="txtbenefi" ValidationExpression="^[a-zA-Z'.]{1,40}$">Enter Characters Only</asp:RegularExpressionValidator>--%>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtbenefi" ErrorMessage="Only alphabets are allowed" ForeColor="Red" ValidationExpression="^[a-zA-Z ]+$"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Goods:</td>
                            <td>
                                <asp:TextBox ID="txtgoods" Width="200px" runat="server"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtgoods" ErrorMessage="Only alphabets are allowed" ForeColor="Red" ValidationExpression="^[a-zA-Z ]+$"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Invoice:</td>
                            <td>
                                <asp:TextBox ID="txtinvoice" Width="200px" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Amount:</td>
                            <td>
                                <asp:TextBox ID="txtamount" runat="server" onkeyup="checkTB(this.value)" Width="200px" Style="margin-bottom: 0px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </div>
                <!-- column -->
                <div class="column">
                    <table class="table table-responsive">
                        <tr>
                            <td>Currency</td>
                            <td>
                                <asp:DropDownList ID="txtcurrency" runat="server" Width="200px" Style="margin-bottom: 4px" CssClass="searchdropdown">
                                    <asp:ListItem Text="" Value="" Selected="True">-Select-</asp:ListItem>
                                    <asp:ListItem Value="AFN"></asp:ListItem>
                                    <asp:ListItem Value="USD"></asp:ListItem>
                                    <asp:ListItem Value="EURO"></asp:ListItem>
                                    <asp:ListItem Value="POUND"></asp:ListItem>
                                    <asp:ListItem Value="AED"></asp:ListItem>
                                    <asp:ListItem Value="Rupee (Indian)"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>Country:</td>
                            <td>
                                <asp:DropDownList ID="txtcountry" runat="server" Width="200px" CssClass="searchdropdown" Style="margin-bottom: 4px">
                                    <asp:ListItem Text="" Value="" Selected="True">-Select-</asp:ListItem>
                                    <asp:ListItem Value="Afghanistan">Afghanistan</asp:ListItem>
                                    <asp:ListItem Value="AL">Albania</asp:ListItem>
                                    <asp:ListItem Value="DZ">Algeria</asp:ListItem>
                                    <asp:ListItem Value="AS">American Samoa</asp:ListItem>
                                    <asp:ListItem Value="AD">Andorra</asp:ListItem>
                                    <asp:ListItem Value="AO">Angola</asp:ListItem>
                                    <asp:ListItem Value="AI">Anguilla</asp:ListItem>
                                    <asp:ListItem Value="AQ">Antarctica</asp:ListItem>
                                    <asp:ListItem Value="AG">Antigua And Barbuda</asp:ListItem>
                                    <asp:ListItem Value="AR">Argentina</asp:ListItem>
                                    <asp:ListItem Value="AM">Armenia</asp:ListItem>
                                    <asp:ListItem Value="AW">Aruba</asp:ListItem>
                                    <asp:ListItem Value="AU">Australia</asp:ListItem>
                                    <asp:ListItem Value="AT">Austria</asp:ListItem>
                                    <asp:ListItem Value="AZ">Azerbaijan</asp:ListItem>
                                    <asp:ListItem Value="BS">Bahamas</asp:ListItem>
                                    <asp:ListItem Value="BH">Bahrain</asp:ListItem>
                                    <asp:ListItem Value="BD">Bangladesh</asp:ListItem>
                                    <asp:ListItem Value="BB">Barbados</asp:ListItem>
                                    <asp:ListItem Value="BY">Belarus</asp:ListItem>
                                    <asp:ListItem Value="BE">Belgium</asp:ListItem>
                                    <asp:ListItem Value="BZ">Belize</asp:ListItem>
                                    <asp:ListItem Value="BJ">Benin</asp:ListItem>
                                    <asp:ListItem Value="BM">Bermuda</asp:ListItem>
                                    <asp:ListItem Value="BT">Bhutan</asp:ListItem>
                                    <asp:ListItem Value="BO">Bolivia</asp:ListItem>
                                    <asp:ListItem Value="BA">Bosnia And Herzegowina</asp:ListItem>
                                    <asp:ListItem Value="BW">Botswana</asp:ListItem>
                                    <asp:ListItem Value="BV">Bouvet Island</asp:ListItem>
                                    <asp:ListItem Value="BR">Brazil</asp:ListItem>
                                    <asp:ListItem Value="IO">British Indian Ocean Territory</asp:ListItem>
                                    <asp:ListItem Value="BN">Brunei Darussalam</asp:ListItem>
                                    <asp:ListItem Value="BG">Bulgaria</asp:ListItem>
                                    <asp:ListItem Value="BF">Burkina Faso</asp:ListItem>
                                    <asp:ListItem Value="BI">Burundi</asp:ListItem>
                                    <asp:ListItem Value="KH">Cambodia</asp:ListItem>
                                    <asp:ListItem Value="CM">Cameroon</asp:ListItem>
                                    <asp:ListItem Value="CA">Canada</asp:ListItem>
                                    <asp:ListItem Value="CV">Cape Verde</asp:ListItem>
                                    <asp:ListItem Value="KY">Cayman Islands</asp:ListItem>
                                    <asp:ListItem Value="CF">Central African Republic</asp:ListItem>
                                    <asp:ListItem Value="TD">Chad</asp:ListItem>
                                    <asp:ListItem Value="CL">Chile</asp:ListItem>
                                    <asp:ListItem Value="CN">China</asp:ListItem>
                                    <asp:ListItem Value="CX">Christmas Island</asp:ListItem>
                                    <asp:ListItem Value="CC">Cocos (Keeling) Islands</asp:ListItem>
                                    <asp:ListItem Value="CO">Colombia</asp:ListItem>
                                    <asp:ListItem Value="KM">Comoros</asp:ListItem>
                                    <asp:ListItem Value="CG">Congo</asp:ListItem>
                                    <asp:ListItem Value="CK">Cook Islands</asp:ListItem>
                                    <asp:ListItem Value="CR">Costa Rica</asp:ListItem>
                                    <asp:ListItem Value="CI">Cote D&#39;Ivoire</asp:ListItem>
                                    <asp:ListItem Value="HR">Croatia (Local Name: Hrvatska)</asp:ListItem>
                                    <asp:ListItem Value="CU">Cuba</asp:ListItem>
                                    <asp:ListItem Value="CY">Cyprus</asp:ListItem>
                                    <asp:ListItem Value="CZ">Czech Republic</asp:ListItem>
                                    <asp:ListItem Value="DK">Denmark</asp:ListItem>
                                    <asp:ListItem Value="DJ">Djibouti</asp:ListItem>
                                    <asp:ListItem Value="DM">Dominica</asp:ListItem>
                                    <asp:ListItem Value="DO">Dominican Republic</asp:ListItem>
                                    <asp:ListItem Value="TP">East Timor</asp:ListItem>
                                    <asp:ListItem Value="EC">Ecuador</asp:ListItem>
                                    <asp:ListItem Value="EG">Egypt</asp:ListItem>
                                    <asp:ListItem Value="SV">El Salvador</asp:ListItem>
                                    <asp:ListItem Value="GQ">Equatorial Guinea</asp:ListItem>
                                    <asp:ListItem Value="ER">Eritrea</asp:ListItem>
                                    <asp:ListItem Value="EE">Estonia</asp:ListItem>
                                    <asp:ListItem Value="ET">Ethiopia</asp:ListItem>
                                    <asp:ListItem Value="FK">Falkland Islands (Malvinas)</asp:ListItem>
                                    <asp:ListItem Value="FO">Faroe Islands</asp:ListItem>
                                    <asp:ListItem Value="FJ">Fiji</asp:ListItem>
                                    <asp:ListItem Value="FI">Finland</asp:ListItem>
                                    <asp:ListItem Value="FR">France</asp:ListItem>
                                    <asp:ListItem Value="GF">French Guiana</asp:ListItem>
                                    <asp:ListItem Value="PF">French Polynesia</asp:ListItem>
                                    <asp:ListItem Value="TF">French Southern Territories</asp:ListItem>
                                    <asp:ListItem Value="GA">Gabon</asp:ListItem>
                                    <asp:ListItem Value="GM">Gambia</asp:ListItem>
                                    <asp:ListItem Value="GE">Georgia</asp:ListItem>
                                    <asp:ListItem Value="DE">Germany</asp:ListItem>
                                    <asp:ListItem Value="GH">Ghana</asp:ListItem>
                                    <asp:ListItem Value="GI">Gibraltar</asp:ListItem>
                                    <asp:ListItem Value="GR">Greece</asp:ListItem>
                                    <asp:ListItem Value="GL">Greenland</asp:ListItem>
                                    <asp:ListItem Value="GD">Grenada</asp:ListItem>
                                    <asp:ListItem Value="GP">Guadeloupe</asp:ListItem>
                                    <asp:ListItem Value="GU">Guam</asp:ListItem>
                                    <asp:ListItem Value="GT">Guatemala</asp:ListItem>
                                    <asp:ListItem Value="GN">Guinea</asp:ListItem>
                                    <asp:ListItem Value="GW">Guinea-Bissau</asp:ListItem>
                                    <asp:ListItem Value="GY">Guyana</asp:ListItem>
                                    <asp:ListItem Value="HT">Haiti</asp:ListItem>
                                    <asp:ListItem Value="HM">Heard And Mc Donald Islands</asp:ListItem>
                                    <asp:ListItem Value="VA">Holy See (Vatican City State)</asp:ListItem>
                                    <asp:ListItem Value="HN">Honduras</asp:ListItem>
                                    <asp:ListItem Value="HK">Hong Kong</asp:ListItem>
                                    <asp:ListItem Value="HU">Hungary</asp:ListItem>
                                    <asp:ListItem Value="IS">Icel And</asp:ListItem>
                                    <asp:ListItem Value="IN">India</asp:ListItem>
                                    <asp:ListItem Value="ID">Indonesia</asp:ListItem>
                                    <asp:ListItem Value="IR">Iran (Islamic Republic Of)</asp:ListItem>
                                    <asp:ListItem Value="IQ">Iraq</asp:ListItem>
                                    <asp:ListItem Value="IE">Ireland</asp:ListItem>
                                    <asp:ListItem Value="IL">Israel</asp:ListItem>
                                    <asp:ListItem Value="IT">Italy</asp:ListItem>
                                    <asp:ListItem Value="JM">Jamaica</asp:ListItem>
                                    <asp:ListItem Value="JP">Japan</asp:ListItem>
                                    <asp:ListItem Value="JO">Jordan</asp:ListItem>
                                    <asp:ListItem Value="KZ">Kazakhstan</asp:ListItem>
                                    <asp:ListItem Value="KE">Kenya</asp:ListItem>
                                    <asp:ListItem Value="KI">Kiribati</asp:ListItem>
                                    <asp:ListItem Value="KP">Korea, Dem People&#39;S Republic</asp:ListItem>
                                    <asp:ListItem Value="KR">Korea, Republic Of</asp:ListItem>
                                    <asp:ListItem Value="KW">Kuwait</asp:ListItem>
                                    <asp:ListItem Value="KG">Kyrgyzstan</asp:ListItem>
                                    <asp:ListItem Value="LA">Lao People&#39;S Dem Republic</asp:ListItem>
                                    <asp:ListItem Value="LV">Latvia</asp:ListItem>
                                    <asp:ListItem Value="LB">Lebanon</asp:ListItem>
                                    <asp:ListItem Value="LS">Lesotho</asp:ListItem>
                                    <asp:ListItem Value="LR">Liberia</asp:ListItem>
                                    <asp:ListItem Value="LY">Libyan Arab Jamahiriya</asp:ListItem>
                                    <asp:ListItem Value="LI">Liechtenstein</asp:ListItem>
                                    <asp:ListItem Value="LT">Lithuania</asp:ListItem>
                                    <asp:ListItem Value="LU">Luxembourg</asp:ListItem>
                                    <asp:ListItem Value="MO">Macau</asp:ListItem>
                                    <asp:ListItem Value="MK">Macedonia</asp:ListItem>
                                    <asp:ListItem Value="MG">Madagascar</asp:ListItem>
                                    <asp:ListItem Value="MW">Malawi</asp:ListItem>
                                    <asp:ListItem Value="MY">Malaysia</asp:ListItem>
                                    <asp:ListItem Value="MV">Maldives</asp:ListItem>
                                    <asp:ListItem Value="ML">Mali</asp:ListItem>
                                    <asp:ListItem Value="MT">Malta</asp:ListItem>
                                    <asp:ListItem Value="MH">Marshall Islands</asp:ListItem>
                                    <asp:ListItem Value="MQ">Martinique</asp:ListItem>
                                    <asp:ListItem Value="MR">Mauritania</asp:ListItem>
                                    <asp:ListItem Value="MU">Mauritius</asp:ListItem>
                                    <asp:ListItem Value="YT">Mayotte</asp:ListItem>
                                    <asp:ListItem Value="MX">Mexico</asp:ListItem>
                                    <asp:ListItem Value="FM">Micronesia, Federated States</asp:ListItem>
                                    <asp:ListItem Value="MD">Moldova, Republic Of</asp:ListItem>
                                    <asp:ListItem Value="MC">Monaco</asp:ListItem>
                                    <asp:ListItem Value="MN">Mongolia</asp:ListItem>
                                    <asp:ListItem Value="MS">Montserrat</asp:ListItem>
                                    <asp:ListItem Value="MA">Morocco</asp:ListItem>
                                    <asp:ListItem Value="MZ">Mozambique</asp:ListItem>
                                    <asp:ListItem Value="MM">Myanmar</asp:ListItem>
                                    <asp:ListItem Value="NA">Namibia</asp:ListItem>
                                    <asp:ListItem Value="NR">Nauru</asp:ListItem>
                                    <asp:ListItem Value="NP">Nepal</asp:ListItem>
                                    <asp:ListItem Value="NL">Netherlands</asp:ListItem>
                                    <asp:ListItem Value="AN">Netherlands Ant Illes</asp:ListItem>
                                    <asp:ListItem Value="NC">New Caledonia</asp:ListItem>
                                    <asp:ListItem Value="NZ">New Zealand</asp:ListItem>
                                    <asp:ListItem Value="NI">Nicaragua</asp:ListItem>
                                    <asp:ListItem Value="NE">Niger</asp:ListItem>
                                    <asp:ListItem Value="NG">Nigeria</asp:ListItem>
                                    <asp:ListItem Value="NU">Niue</asp:ListItem>
                                    <asp:ListItem Value="NF">Norfolk Island</asp:ListItem>
                                    <asp:ListItem Value="MP">Northern Mariana Islands</asp:ListItem>
                                    <asp:ListItem Value="NO">Norway</asp:ListItem>
                                    <asp:ListItem Value="OM">Oman</asp:ListItem>
                                    <asp:ListItem Value="PK">Pakistan</asp:ListItem>
                                    <asp:ListItem Value="PW">Palau</asp:ListItem>
                                    <asp:ListItem Value="PA">Panama</asp:ListItem>
                                    <asp:ListItem Value="PG">Papua New Guinea</asp:ListItem>
                                    <asp:ListItem Value="PY">Paraguay</asp:ListItem>
                                    <asp:ListItem Value="PE">Peru</asp:ListItem>
                                    <asp:ListItem Value="PH">Philippines</asp:ListItem>
                                    <asp:ListItem Value="PN">Pitcairn</asp:ListItem>
                                    <asp:ListItem Value="PL">Poland</asp:ListItem>
                                    <asp:ListItem Value="PT">Portugal</asp:ListItem>
                                    <asp:ListItem Value="PR">Puerto Rico</asp:ListItem>
                                    <asp:ListItem Value="QA">Qatar</asp:ListItem>
                                    <asp:ListItem Value="RE">Reunion</asp:ListItem>
                                    <asp:ListItem Value="RO">Romania</asp:ListItem>
                                    <asp:ListItem Value="RU">Russian Federation</asp:ListItem>
                                    <asp:ListItem Value="RW">Rwanda</asp:ListItem>
                                    <asp:ListItem Value="KN">Saint K Itts And Nevis</asp:ListItem>
                                    <asp:ListItem Value="LC">Saint Lucia</asp:ListItem>
                                    <asp:ListItem Value="VC">Saint Vincent, The Grenadines</asp:ListItem>
                                    <asp:ListItem Value="WS">Samoa</asp:ListItem>
                                    <asp:ListItem Value="SM">San Marino</asp:ListItem>
                                    <asp:ListItem Value="ST">Sao Tome And Principe</asp:ListItem>
                                    <asp:ListItem Value="SA">Saudi Arabia</asp:ListItem>
                                    <asp:ListItem Value="SN">Senegal</asp:ListItem>
                                    <asp:ListItem Value="SC">Seychelles</asp:ListItem>
                                    <asp:ListItem Value="SL">Sierra Leone</asp:ListItem>
                                    <asp:ListItem Value="AL">Serbia</asp:ListItem>
                                    <asp:ListItem Value="SG">Singapore</asp:ListItem>
                                    <asp:ListItem Value="SK">Slovakia (Slovak Republic)</asp:ListItem>
                                    <asp:ListItem Value="SI">Slovenia</asp:ListItem>
                                    <asp:ListItem Value="SB">Solomon Islands</asp:ListItem>
                                    <asp:ListItem Value="SO">Somalia</asp:ListItem>
                                    <asp:ListItem Value="ZA">South Africa</asp:ListItem>
                                    <asp:ListItem Value="GS">South Georgia , S Sandwich Is.</asp:ListItem>
                                    <asp:ListItem Value="ES">Spain</asp:ListItem>
                                    <asp:ListItem Value="LK">Sri Lanka</asp:ListItem>
                                    <asp:ListItem Value="SH">St. Helena</asp:ListItem>
                                    <asp:ListItem Value="PM">St. Pierre And Miquelon</asp:ListItem>
                                    <asp:ListItem Value="SD">Sudan</asp:ListItem>
                                    <asp:ListItem Value="SR">Suriname</asp:ListItem>
                                    <asp:ListItem Value="SJ">Svalbard, Jan Mayen Islands</asp:ListItem>
                                    <asp:ListItem Value="SZ">Sw Aziland</asp:ListItem>
                                    <asp:ListItem Value="SE">Sweden</asp:ListItem>
                                    <asp:ListItem Value="CH">Switzerland</asp:ListItem>
                                    <asp:ListItem Value="SY">Syrian Arab Republic</asp:ListItem>
                                    <asp:ListItem Value="TW">Taiwan</asp:ListItem>
                                    <asp:ListItem Value="TJ">Tajikistan</asp:ListItem>
                                    <asp:ListItem Value="TZ">Tanzania, United Republic Of</asp:ListItem>
                                    <asp:ListItem Value="TH">Thailand</asp:ListItem>
                                    <asp:ListItem Value="TG">Togo</asp:ListItem>
                                    <asp:ListItem Value="TK">Tokelau</asp:ListItem>
                                    <asp:ListItem Value="TO">Tonga</asp:ListItem>
                                    <asp:ListItem Value="TT">Trinidad And Tobago</asp:ListItem>
                                    <asp:ListItem Value="TN">Tunisia</asp:ListItem>
                                    <asp:ListItem Value="TR">Turkey</asp:ListItem>
                                    <asp:ListItem Value="TM">Turkmenistan</asp:ListItem>
                                    <asp:ListItem Value="TC">Turks And Caicos Islands</asp:ListItem>
                                    <asp:ListItem Value="TV">Tuvalu</asp:ListItem>
                                    <asp:ListItem Value="UG">Uganda</asp:ListItem>
                                    <asp:ListItem Value="UA">Ukraine</asp:ListItem>
                                    <asp:ListItem Value="AE">United Arab Emirates</asp:ListItem>
                                    <asp:ListItem Value="GB">United Kingdom</asp:ListItem>
                                    <asp:ListItem Value="US">United States</asp:ListItem>
                                    <asp:ListItem Value="UM">United States Minor Is.</asp:ListItem>
                                    <asp:ListItem Value="UY">Uruguay</asp:ListItem>
                                    <asp:ListItem Value="UZ">Uzbekistan</asp:ListItem>
                                    <asp:ListItem Value="VU">Vanuatu</asp:ListItem>
                                    <asp:ListItem Value="VE">Venezuela</asp:ListItem>
                                    <asp:ListItem Value="VN">Viet Nam</asp:ListItem>
                                    <asp:ListItem Value="VG">Virgin Islands (British)</asp:ListItem>
                                    <asp:ListItem Value="VI">Virgin Islands (U.S.)</asp:ListItem>
                                    <asp:ListItem Value="WF">Wallis And Futuna Islands</asp:ListItem>
                                    <asp:ListItem Value="EH">Western Sahara</asp:ListItem>
                                    <asp:ListItem Value="YE">Yemen</asp:ListItem>
                                    <asp:ListItem Value="YU">Yugoslavia</asp:ListItem>
                                    <asp:ListItem Value="ZR">Zaire</asp:ListItem>
                                    <asp:ListItem Value="ZM">Zambia</asp:ListItem>
                                    <asp:ListItem Value="ZW">Zimbabwe</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>ACCD Recieved:</td>
                            <td>
                                <asp:DropDownList ID="txtaccr" runat="server" Width="200px" CssClass="searchdropdown">
                                    <asp:ListItem Text="" Value="" Selected="True">-Select-</asp:ListItem>
                                    <asp:ListItem Value="YES">YES</asp:ListItem>
                                    <asp:ListItem Value="NO">NO</asp:ListItem>
                                    <asp:ListItem Value="NOT APPLICABLE">NOT APPLICABLE</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>Shiping Documnet:</td>
                            <td>
                                <asp:DropDownList ID="txtshipdoc" runat="server" Width="200px" CssClass="searchdropdown">
                                    <asp:ListItem Text="" Value="" Selected="True">-Select-</asp:ListItem>
                                    <asp:ListItem Value="YES">YES</asp:ListItem>
                                    <asp:ListItem Value="NO">NO</asp:ListItem>
                                    <asp:ListItem Value="NOT APPLICABLE">NOT APPLICABLE</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
   
                        <tr>
                            <td>Upload Image:</td>
                            <td>
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                            </td>
                        </tr>
                    </table>
                    <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="" ForeColor="Red" ClientValidationFunction="CheckDuplicates"></asp:CustomValidator>
                </div>
            </div>
            <div style="text-align: left">
                <%-- <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />--%>
                <%-- <asp:ImageButton ID="btnSubmit" runat="server" title="Submit!" style=" top: 14px;max-width:150px; margin-left: 0px;" Height="24px" Width="35px" OnClick="btnSubmit_Click" />--%>
                <asp:Button ID="btnupdate" runat="server" class="btn btn-info" Text="Submit" OnClick="btnupdate_Click" />
            </div>
        </div>
    </div>
</div>

</asp:Content>
