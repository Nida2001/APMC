<%@ Page Title="" Language="C#" MasterPageFile="~/m_APMC/user/Master1.master" AutoEventWireup="true"
    CodeFile="CessA.aspx.cs" Inherits="m_APMC_user_CessA" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function showDate() {
            $find("Date").show();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid bg-white">
        <div class=" col-md-auto">
            <div class="card shadow p-4 ">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class=" col-md-1">
                                <asp:Label ID="Label1" runat="server" Text="Date"></asp:Label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtDate" runat="server" CssClass="form-control rounded " type="Date"
                                    AutoPostBack="true"></asp:TextBox>
                            </div>
                            <div class=" col-md-1">
                                <asp:Label ID="frmdate1" runat="server" Text="From Date"></asp:Label>
                            </div>
                            <div class=" col-md-3">
                                <asp:TextBox ID="txtfrmdate" runat="server" CssClass="form-control rounded " type="Date"></asp:TextBox>
                            </div>
                            <div class=" col-md-1">
                                <asp:Label ID="todate1" runat="server" Text="To Date"></asp:Label>
                            </div>
                            <div class=" col-md-3">
                                <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control rounded " type="Date"
                                    AutoPostBack="true" OnTextChanged="txtToDate_TextChanged"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-7">
                            <div class="row">
                                <div class="col-md-3">
                                    <asp:Label ID="Label4" runat="server" Text="खरेदीदाराचे नाव"></asp:Label>
                                </div>
                                <div class="col-md-6">
                                    <asp:DropDownList ID="drdPurchaserName" runat="server" CssClass="form-control rounded">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please select a Purchaser Name"
                                        Style="color: Red" ControlToValidate="drdPurchaserName" ValidationGroup="validatePurchaser"
                                        InitialValue="0"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-auto">
                                    <asp:Button ID="btnShow" runat="server" Text="दाखवा" CssClass="btn btn-warning" ValidationGroup="validatePurchaser"
                                        OnClick="btnShow_Click" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3 ">
                                    <asp:Label ID="Label3" runat="server" Text="एकूण खरेदी किंमत"></asp:Label>
                                </div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control rounded" OnTextChanged="txtAmount_TextChanged"
                                        AutoPostBack="True"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required"
                                        Style="color: Red" ControlToValidate="txtAmount" ValidationGroup="validate"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">
                                    <asp:Label ID="Label6" runat="server" Text="मार्केट फी"></asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtMkFee" runat="server" CssClass="form-control rounded" ReadOnly="True"></asp:TextBox>
                                </div>
                                <div class="col-md-2">
                                    <asp:Label ID="Label2" runat="server" Text="मागिल देयक"></asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtMagildeyak" runat="server" CssClass="form-control rounded"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="This field is required"
                                        Style="color: Red" ControlToValidate="txtMagildeyak" ValidationGroup="validate"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">
                                    <asp:Label ID="Label7" runat="server" Text="सुपरहीजन फी" CssClass=" control-label"></asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtSuperVFee" runat="server" CssClass="form-control rounded" ReadOnly="True"></asp:TextBox>
                                </div>
                                <div class="col-md-2">
                                    <asp:Label ID="Label9" runat="server" Text="जमा केलेले" CssClass=" control-label"></asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtAdvance" runat="server" CssClass="form-control rounded" AutoPostBack="True"
                                        OnTextChanged="txtAdvance_TextChanged"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="This field is required"
                                        Style="color: Red" ControlToValidate="txtAdvance" ValidationGroup="validate"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">
                                    <asp:Label ID="Label8" runat="server" Text="एकूण रक्कम"></asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtTotal" runat="server" CssClass="form-control rounded" ReadOnly="True"></asp:TextBox>
                                </div>
                                <div class="col-md-2">
                                    <asp:Label ID="Label13" runat="server" Text="बाकी"></asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtBaaki" runat="server" CssClass="form-control rounded" AutoPostBack="True"
                                        ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <br />
                        </div>
                        <div class="col-md-5">
                            <asp:Panel ID="PnlGrid" runat="server" CssClass="pre-scrollable" Width="100%" Height="260px">
                                <asp:GridView ID="GvData" runat="server" CssClass="table table-bordered table-hover"
                                    ShowHeaderWhenEmpty="true" AlternatingRowStyle-BackColor="WhiteSmoke" AutoGenerateColumns="true">
                                    <HeaderStyle BackColor="#2A3F54" ForeColor="White" />
                                </asp:GridView>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row mt-4 ">
                        <br />
                        <div class="col-md-5">
                            <div class="col-md-2">
                                <asp:RadioButtonList ID="rbtSearch" runat="server" OnTextChanged="rbtSearch_Cilck"
                                    AutoPostBack="true" RepeatDirection="Horizontal" Width="150" Selected="True">
                                    <asp:ListItem Text="चेक " Value="0" Selected="True"> </asp:ListItem>
                                    <asp:ListItem Text="कॅश" Value="1"> </asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>
                    </div>
                    <div class=" col-md-12">
                        <div class="card shadow p-4 ">
                            <div class="card-body">
                                <div class="row" id="Bankdetails">
                                    <div class="col-md-auto">
                                        <asp:Label ID="Label5" runat="server" Text="बँकेचा तपशील" CssClass="control-label"></asp:Label>
                                    </div>
                                    <div class="col-md-auto">
                                        <asp:Label ID="Label10" runat="server" Text="चेक नं" CssClass="control-label"></asp:Label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtChkNo" runat="server" CssClass="form-control rounded"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="This field is required"
                                            Style="color: Red" ControlToValidate="txtChkNo" ValidationGroup="validate"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-md-auto">
                                        <asp:Label ID="Label11" runat="server" Text="चेकची दिनांक" CssClass="control-label"></asp:Label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtChkDate" runat="server" CssClass="form-control rounded" type="Date"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="This field is required"
                                            Style="color: Red" ControlToValidate="txtChkDate" ValidationGroup="validate"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-md-auto">
                                        <asp:Label ID="Label12" runat="server" Text="बँकेचे नांव " CssClass="control-label"></asp:Label>
                                    </div>
                                    <div class="col-md-5">
                                        <asp:TextBox ID="txtBankName" runat="server" CssClass="form-control rounded" OnTextChanged="txtBankName_TextChanged"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="This field is required"
                                            Style="color: Red" ControlToValidate="txtBankName" ValidationGroup="validate"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md">
                        <asp:Button ID="Button3" runat="server" Text="रदद करा" CssClass="btn btn-warning pull-right "
                                OnClick="Button3_Click" />
                            <asp:Button ID="PrintCess" runat="server" Text="सेस प्रिंट" CssClass="btn  btn-warning pull-right"
                                OnClick="PrintCess_Click" />
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /#wrapper -->
    <!-- jQuery -->
    <script src="~/bower_components/jquery/dist/jquery.min.js" type="text/javascript"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="~/bower_components/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- Metis Menu Plugin JavaScript -->
    <script src="~/bower_components/metisMenu/dist/metisMenu.min.js" type="text/javascript"></script>
    <!-- Custom Theme JavaScript -->
    <script src="~/dist/js/sb-admin-2.js" type="text/javascript"></script>
    <script src="~/AutoComplete/js/jquery.min_autocomplete.js" type="text/javascript"></script>
    <script src="~/AutoComplete/js/jquery-ui.min_autocomplete.js" type="text/javascript"></script>
</asp:Content>
