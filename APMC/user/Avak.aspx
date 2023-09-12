<%@ Page Title="" Language="C#" MasterPageFile="~/m_APMC/user/Master1.master" AutoEventWireup="true"
    CodeFile="Avak.aspx.cs" Inherits="m_APMC_user_Avak" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function showDate() {
            $find("Date").show();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid bg-white">
        <div class="card m-3 shadow ">
            <div class=" card-body">
                <div class="row">
                    <div class=" col-md-auto" style="margin-left: -4px;">
                        <asp:Label ID="lblFarmarName" runat="server" CssClass="control-label" Text="शेतकऱ्याचे नाव"></asp:Label>
                    </div>
                    <div class=" col-md-3">
                        <asp:TextBox ID="txtFarmerName" runat="server" CssClass="form-control rounded"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="This field is required"
                            Style="color: Red" ControlToValidate="txtFarmerName" ValidationGroup="validate"></asp:RequiredFieldValidator>
                    </div>
                    <div class=" col-md-auto">
                        <asp:Label ID="lbl1" runat="server" CssClass="control-label" Text="दिनांक"></asp:Label>
                    </div>
                    <div class=" col-md-2">
                        <asp:TextBox ID="txtAKDate" runat="server" CssClass="form-control rounded" type="Date"></asp:TextBox>
                    </div>
                    <div class=" col-md-auto">
                        <asp:Label ID="lblCityName" runat="server" CssClass=" control-label" Text="गाव(ठिकाण)"></asp:Label>
                    </div>
                    <div class=" col-md-3">
                        <asp:TextBox ID="txtPlace" runat="server" CssClass="form-control rounded"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required"
                            Style="color: Red" ControlToValidate="txtPlace" ValidationGroup="validate"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class=" row mt-1">
                    <div class="col-md-7">
                        <div class=" row mt-2">
                            <div class=" col-md-2">
                                <asp:Label ID="lblMobileNo" runat="server" CssClass=" control-label" Text="मोबाईल नं"></asp:Label>
                            </div>
                            <div class=" col-md">
                                <asp:TextBox ID="txtMobileNo" runat="server" CssClass="form-control rounded"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="This is the required field"
                                    Style="color: Red" ControlToValidate="txtMobileNo" ValidationGroup="validate"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtMobileNo"
                                    ErrorMessage="Enter a valid Phone number" ValidationExpression="[0-9]{10}" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div>
                            <div class=" col-md-2">
                                <asp:Label ID="lblObstracalName" runat="server" Text="आडत्याचे नाव" CssClass=" control-label"></asp:Label>
                            </div>
                            <div class=" col-md">
                                <asp:DropDownList ID="drdAgent" runat="server" CssClass="form-control rounded">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please select an Agent name"
                                    Style="color: Red" ControlToValidate="drdAgent" ValidationGroup="validate" InitialValue="0"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class=" row  mt-2">
                            <div class=" col-md-2">
                                <asp:Label ID="Label1" runat="server" Text="वाहन प्रकार  " CssClass=" control-label"></asp:Label>
                            </div>
                            <div class=" col-md">
                                <asp:DropDownList ID="drdVehicleType" runat="server" CssClass="form-control rounded">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please select a Vehicle type"
                                    Style="color: Red" ControlToValidate="drdCommodity" ValidationGroup="validate"
                                    InitialValue="0"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-2">
                                <asp:Label ID="lblVehicalN0" runat="server" CssClass=" control-label" Text="वाहन क्रमांक"></asp:Label>
                            </div>
                            <div class="col-md">
                                <asp:TextBox ID="txtVehicleNo" runat="server" CssClass=" form-control rounded"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="This field is required"
                                    Style="color: Red" ControlToValidate="txtVehicleNo" ValidationGroup="validate"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class=" col-md-2">
                                <asp:Label ID="lblGrainName" runat="server" CssClass=" control-label" Text="मालाची जात"></asp:Label>
                            </div>
                            <div class="col-md">
                                <asp:DropDownList ID="drdCommodity" runat="server" CssClass=" form-control rounded">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please select a Commodity"
                                    Style="color: Red" ControlToValidate="drdCommodity" ValidationGroup="validate"
                                    InitialValue="0"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-2">
                                <asp:Label ID="lblBori" runat="server" CssClass=" control-label" Text="चुंबडी"></asp:Label>
                            </div>
                            <div class=" col-md">
                                <asp:TextBox ID="txtNoSmallBags" runat="server" CssClass=" form-control rounded"></asp:TextBox>
                            </div>
                        </div>
                        <div class=" row mt-2">
                            <div class="col-md-2">
                                <asp:Label ID="lblNumberOfBori" runat="server" class=" control-label" Text="पोत्यांची संख्या"></asp:Label>
                            </div>
                            <div class="col-md">
                                <asp:TextBox ID="txtNoBags" runat="server" CssClass=" form-control rounded"></asp:TextBox>
                            </div>
                            <div class="col-md-2">
                                <asp:Label ID="lblSera" runat="server" class=" control-label" Text="शेरा"></asp:Label>
                            </div>
                            <div class="col-md">
                                <asp:TextBox ID="txtRemark" runat="server" class="form-control rounded"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class=" col-md-5 mt-2">
                        <div class="row w-100">
                            <div class="col-md w-100  pre-scrollable h-100">
                                <asp:GridView ID="GvData" runat="server" CssClass="table table-bordered table-hover">
                                    <HeaderStyle BackColor="#2A3F54" ForeColor="White" />
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
                <hr />
                <div class="row">
                    <div class=" col-md">
                        <asp:Button ID="btnAdd" runat="server" class="text-uppercase" Text="Add" CssClass=" btn btn-warning pull-right "
                            Width="80px" OnClick="btnAdd_Click" ValidationGroup="validate" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <hr />
    <div class="row mt-1">
        <div class="col-md">
           <asp:Button ID="btnClose" runat="server" Text="रद्द करा" CssClass=" btn btn-warning pull-right"
                OnClick="btnClose_Click" />
            <asp:Button ID="btnSave" runat="server" Text="साठवा" CssClass=" btn btn-warning pull-right"
                OnClick="btnSave_Click" />
            
        </div>
    </div>
</asp:Content>
