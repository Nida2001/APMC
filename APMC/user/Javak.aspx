<%@ Page Title="" Language="C#" MasterPageFile="~/m_APMC/user/Master1.master" AutoEventWireup="true"
    CodeFile="Javak.aspx.cs" Inherits="m_APMC_user_FrmJavak" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class=" container-fluid bg-white">
        <div class=" row">
            <div class=" col-md">
            </div>
            <div class=" col-md-9">
                <div class="card shadow p-4 ">
                    <div class="card-body">
                        <%--background-color: #2a3f5447;--%>
                        <div class="row rounded" style="color: #2a3f54; height: 50px;">
                            <div class=" col-md m-3">
                                <asp:RadioButton ID="rdbCredit" runat="server" Checked="True" GroupName="PaymentMode"
                                    Text="Credit" />
                                <asp:RadioButton ID="rdbCash" runat="server" GroupName="PaymentMode" Text="Cash" />
                            </div>
                            <hr />
                        </div>
                        <hr />
                        <div class="row mt-2">
                            <div class="col-md-auto">
                                <asp:Label ID="lblgtpassNo" runat="server" Text="KatapattiNo" CssClass="control-label"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:TextBox ID="txtgtpassNo" runat="server" AutoPostBack="True" CssClass="form-control rounded"
                                    OnTextChanged="txtgtpassNo_TextChanged"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This is the required Field"
                                    ControlToValidate="txtgtpassNo" ValidationGroup="validate" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-auto">
                                <asp:Label ID="lblDate" runat="server" Text="Date" CssClass="control-label"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:TextBox ID="txtDate" runat="server" CssClass="form-control rounded" ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-auto" style="margin-right: 14px;">
                                <asp:Label ID="Label1" runat="server" Text="Purchaser " CssClass="control-label"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:TextBox ID="txtPurchaser" runat="server" ReadOnly="True" CssClass="form-control rounded"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-auto" style="margin-right: 8px;">
                                <asp:Label ID="lblVehicleNo" runat="server" Text="Vehicle No" CssClass="control-label"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:TextBox ID="txtVehicleNo" runat="server" ReadOnly="True" CssClass="form-control rounded"></asp:TextBox>
                            </div>
                            <div class=" col-md">
                            </div>
                            <div class=" col-md">
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-auto" style="margin-right: 40px;">
                                <asp:Label ID="lblPlace" runat="server" Text="Place" CssClass="control-label"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:TextBox ID="txtPlace" runat="server" ReadOnly="True" CssClass="form-control rounded"></asp:TextBox>
                            </div>
                            <div class=" col-md">
                            </div>
                            <div class=" col-md">
                            </div>
                        </div>
                        <div class="row">
                            <asp:GridView ID="GvData" runat="server" AutoGenerateColumns="False" HeaderStyle-BackColor="#2A3F54"
                                HeaderStyle-ForeColor="White" Height="100%" Width="100%" CssClass="table table-bordered table-hover">
                                <Columns>
                                    <asp:TemplateField HeaderText="Commodity">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCommdity" runat="server" Text='<%# Bind("CommodityName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="No Of Bags">
                                        <ItemTemplate>
                                            <asp:Label ID="lblBags" runat="server" Text='<%# Bind("Bags") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="No. Small Bags">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSmallBags" runat="server" Text='<%# Bind("SmallBag") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <hr />
                        <div class="col-md mt-1">
                        <asp:Button ID="btnClose" runat="server" Text="Close" OnClick="btnClose_Click" CssClass="btn btn-warning pull-right" />
                            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="btn btn-warning pull-right"
                                ValidationGroup="validate" />
                            
                        </div>
                    </div>
                </div>
            </div>
            <div class=" col-md">
            </div>
        </div>
    </div>
</asp:Content>
