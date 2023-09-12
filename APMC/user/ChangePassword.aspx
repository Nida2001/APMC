<%@ Page Title="" Language="C#" MasterPageFile="~/m_APMC/user/Master1.master" AutoEventWireup="true"
    CodeFile="ChangePassword.aspx.cs" Inherits="m_APMC_user_ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<div class="row">
        <div class="col-lg-12">
            <h2 class="page-header">
                <asp:Label ID="Label0" runat="server" Text="Change Password"></asp:Label>
            </h2>
        </div>
    </div>--%>
    <div class="container-fluid bg-white">
        <div class="row p-4 mt-2">
            <div class="col-md">
            </div>
            <div class="col-md-8">
                <div class="card shadow">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-3" style="text-align: center;">
                                    <asp:Label ID="Label2" runat="server" Text="Old Password" CssClass="control-label"></asp:Label>
                                </div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" ValidationGroup="Register"
                                        placeholder="Old Password" CssClass="form-control rounded"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPassword"
                                        ErrorMessage="Password is required!" ValidationGroup="Register" CssClass="errorMsg"
                                        SetFocusOnError="True" Display="Dynamic" />
                                </div>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-md-12">
                                <div class="col-md-3" style="text-align: center;">
                                    <asp:Label ID="Label1" runat="server" Text="New Password" CssClass="control-label"></asp:Label>
                                </div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtPassword1" runat="server" TextMode="Password" ValidationGroup="Register"
                                        placeholder="New Password" CssClass="form-control rounded"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="passwordReq" runat="server" ControlToValidate="txtPassword1"
                                        ErrorMessage="Password is required!" ValidationGroup="Register" CssClass="errorMsg"
                                        SetFocusOnError="True" Display="Dynamic" />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ValidationGroup="Register"
                                        SetFocusOnError="True" Display="Dynamic" CssClass="text-danger" ValidationExpression="^(?:.{6,}|)$"
                                        ControlToValidate="txtPassword1" ErrorMessage="Minimum 6 Character length require">
                                    </asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-md-12">
                                <div class="col-md-3" style="text-align: center;">
                                    <asp:Label ID="Label9" runat="server" Text="Re-Enter Password" CssClass="control-label"></asp:Label>
                                </div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtPassword2" runat="server" TextMode="Password" ValidationGroup="Register"
                                        placeholder="Re-Enter Password" CssClass="form-control rounded"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="confirmPasswordReq" runat="server" ControlToValidate="txtPassword2"
                                        ErrorMessage="Password confirmation is required!" SetFocusOnError="True" ValidationGroup="Register"
                                        CssClass="errorMsg" Display="Dynamic" />
                                    <asp:CompareValidator ID="comparePasswords" runat="server" ControlToCompare="txtPassword1"
                                        ControlToValidate="txtPassword2" ErrorMessage="Your passwords do not match up!"
                                        ValidationGroup="Register" CssClass="errorMsg" Display="Dynamic" />
                                </div>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-md-12">
                                <asp:ImageButton ID="ibtnRegister" runat="server" AlternateText="Change Password"
                                    ValidationGroup="Register" CssClass="btn btn-warning pull-right" OnClick="ibtnRegister_Click" />
                                <asp:ImageButton ID="ibtnRCancel" runat="server" AlternateText="Cancel" ValidationGroup="Register"
                                    CausesValidation="false" OnClientClick="javascript:ClearRegisterField();" CssClass="btn btn-warning pull-right"
                                    OnClick="ibtnRCancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md">
            </div>
        </div>
    </div>
</asp:Content>
