<%@ Page Title="" Language="C#" MasterPageFile="~/m_APMC/user/Master1.master" AutoEventWireup="true"
    CodeFile="Saudapatti.aspx.cs" Inherits="m_APMC_user_Saudapatti" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
 <div class=" container-fluid bg-white">
        <div class=" card p-1 shadow ">
            <div class=" card-body">
                <div class=" row mt-2">
                    <div class=" col-md-auto" style=" margin-left:-10px">
                        <asp:Label ID="Label1" runat="server" Text="सौदापट्टी क्रमांक " CssClass=" control-label"></asp:Label>
                    </div>
                    <div class=" col-md-1">
                        <asp:TextBox ID="txtRecNo" runat="server" CssClass=" form-control rounded" 
                            ReadOnly="True"></asp:TextBox>
                    </div>
                    <div class=" col-md-auto">
                        <asp:Label ID="Label2" runat="server" Text="दिनांक " CssClass=" control-label"></asp:Label>
                    </div>
                    <div class=" col-md-auto">
                        <asp:TextBox ID="txtDate" runat="server" CssClass=" form-control rounded" type="Date"></asp:TextBox>
                        
                    </div>
                    <div class="col-md-auto">
                        <asp:Label ID="Label3" runat="server" Text="खरेदीदाराचे नाव" CssClass=" control-label"></asp:Label>
                    </div>
                    <div class="col-md">
                        <asp:DropDownList ID="drdPurchaser" runat="server" CssClass=" form-control rounded">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please select a Purchaser Name"
                                Style="color:Red" ControlToValidate="drdPurchaser" ValidationGroup="validate" InitialValue="0"></asp:RequiredFieldValidator>

                    </div>
                    <div class="col-md-auto">
                        <asp:Label ID="Label4" runat="server" Text="आडत्याचे नाव" CssClass=" control-label"></asp:Label>
                    </div>
                    <div class="col-md">
                        <asp:DropDownList ID="drdAgent" runat="server" CssClass=" form-control rounded">
                        </asp:DropDownList>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please select an Agent Name"
                                Style="color:Red" ControlToValidate="drdAgent" ValidationGroup="validate" InitialValue="0"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-md-auto" style=" margin-left:-10px">
                        <asp:Label ID="Label5" runat="server" Text="शेतकऱ्याचे नाव" CssClass=" control-label"></asp:Label>
                    </div>
                    <div class="col-md-3">
                        <asp:DropDownList ID="drdFarmer" runat="server" CssClass=" form-control rounded">
                        </asp:DropDownList>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please select a Farmer Name"
                                Style="color:Red" ControlToValidate="drdFarmer" ValidationGroup="validate" InitialValue="0"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-auto">
                        <asp:Label ID="Label6" runat="server" Text="शहर" CssClass=" control-label"></asp:Label>
                    </div>
                    <div class="col-md">
                        <asp:TextBox ID="txtCity" runat="server" CssClass=" form-control rounded"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="This field is required"
                        Style="color:Red" ValidationGroup="validate" ControlToValidate="txtCity"></asp:RequiredFieldValidator>
                    </div>
                    <div class=" col-md-auto">
                        <asp:Label ID="Label7" runat="server" Text="मालाची जात" CssClass=" control-label"></asp:Label>
                    </div>
                    <div class=" col-md">
                        <asp:DropDownList ID="drdCommodity" runat="server" CssClass=" form-control rounded">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please select a Commodity"
                                Style="color:Red" ControlToValidate="drdCommodity" ValidationGroup="validate" InitialValue="0"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class=" row mt-2">
                    <div class="col-md-6">
                        <div class=" row">
                            <div class=" col-md-2">
                                <asp:Label ID="Label8" runat="server" Text="प्रत  " CssClass=" control-label"></asp:Label>
                            </div>
                            <div class=" col-md">
                                <asp:TextBox ID="txtPrat" runat="server" CssClass=" form-control rounded"></asp:TextBox>
                            </div>
                            <div class=" col-md-3">
                                <asp:Label ID="Label13" runat="server" Text="पोत्यांची संख्या" CssClass=" control-label"></asp:Label>
                            </div>
                            <div class=" col-md">
                                <asp:TextBox ID="txtNoOfBags" runat="server" CssClass=" form-control rounded"></asp:TextBox>
                            </div>
                        </div>
                        <div class=" row  mt-2">
                            <div class="col-md-2">
                                <asp:Label ID="Label14" runat="server" Text="चुंबडी" CssClass=" control-label"></asp:Label>
                            </div>
                            <div class="col-md">
                                <asp:TextBox ID="txtNoOFSmallBags" runat="server" CssClass=" form-control rounded"></asp:TextBox>
                            </div>
                            <div class=" col-md-3">
                                <asp:Label ID="Label9" runat="server" Text="परिणाम (Qtl/Kg) " CssClass=" control-label"></asp:Label>
                            </div>
                            <div class="col-md">
                                <asp:TextBox ID="txtQtl" runat="server" CssClass=" form-control rounded"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-2">
                                <asp:Label ID="Label10" runat="server" Text="दर" CssClass=" control-label"></asp:Label>
                            </div>
                            <div class=" col-md">
                                <asp:TextBox ID="txtDar" runat="server" CssClass="  form-control rounded"></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                <asp:Label ID="Label11" runat="server" Text="शेरा  " CssClass=" control-label"></asp:Label>
                            </div>
                            <div class="col-md">
                                <asp:TextBox ID="txtRemark" runat="server" CssClass=" form-control rounded"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class=" col-md-6 mt-2">
                        <div class="row w-100">
                            <div class="col-md w-100 pre-scrollable h-100">
                                <asp:GridView ID="gvData" runat="server" CssClass="table table-bordered table-hover">
                                    <HeaderStyle BackColor="#2A3F54" ForeColor="White" />
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
                <hr />
                <div class="row">
                    <div class="col-md">
                        <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-warning pull-right"
                            Width="90px" ValidationGroup="validate" OnClick="btnAdd_Click" />
                    </div>
                </div>
            </div>
        </div>
        <hr />
        <div class="row">
            <div class="col-md">
                
                <asp:Button ID="btnClose" runat="server" Text="Close" CssClass="btn btn-warning pull-right"
                    Width="90px" OnClick="btnClose_Click" />
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-warning pull-right"
                    Width="90px" OnClick="btnSave_Click" />
            </div>
        </div>
    </div>
</asp:Content>
