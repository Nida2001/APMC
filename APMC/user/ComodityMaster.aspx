<%@ Page Title="" Language="C#" MasterPageFile="~/m_APMC/user/Master1.master" AutoEventWireup="true"
    CodeFile="ComodityMaster.aspx.cs" Inherits="m_APMC_user_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Comodity Master</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/style_banner.css" rel="stylesheet" />
    <!-- Bootstrap Core CSS -->
    <!-- MetisMenu CSS -->
    <link href="bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="dist/css/sb-admin-2.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid bg-white">
        <div class="col-md-12">
            <div class="card shadow p-4">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-12 mt-3">
                            <div class="col-md-2">
                                <asp:Label ID="LblComodityName" runat="server" CssClass="control-label" Text="COMODITY NAME"></asp:Label>
                            </div>
                            <div class="col-md-2">
                                <asp:TextBox ID="txtComodityName" runat="server" CssClass="form-control rounded"></asp:TextBox>
                            </div>
                            <div class="col-md-2">
                                <asp:Label ID="lblMarComName" runat="server" CssClass="control-label" Text="MARATHI COMODITY NAME"></asp:Label>
                            </div>
                            <div class="col-md-2">
                                <asp:TextBox ID="txtMarComName" runat="server" CssClass="form-control rounded"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 mt-3">
                            <div class="col-md-2">
                                <asp:Label ID="lblflag" runat="server" class="control-label" Text="FLAG"></asp:Label>
                            </div>
                            <div class="col-md-2">
                                <asp:TextBox ID="Txtflag" runat="server" class="form-control rounded"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                 <%--   <div class="row">
                        &nbsp;
                    </div>--%>
                    
                    <div class="row">
                        <div class="col-md-12">
                        <div class="col-md">
                                <asp:Button ID="btncancel" runat="server" Text="Cancel" CssClass="btn btn-warning pull-right" OnClick="BtnCancel_Click" />
                            </div>
                            <div class="col-md">
                                <asp:Button ID="btnSubmit1" runat="server" Text="SAVE" CssClass="btn btn-warning pull-right"
                                    OnClick="btnSubmit" />
                            </div>
                            <div class="col-md">
                                <asp:Button ID="BtnUpdate" runat="server" Text="Update" CssClass="btn btn-warning pull-right" OnClick="BtnUpdate_Click" />
                            </div>
                        </div>
                    </div>
                      <hr />
                    <div class="row">
                        <div class="col-md-12">
                            <asp:Panel ID="PNLGrid1" runat="server"  CssClass="pre-scrollable" Height="100%">
                                <asp:GridView ID="GridView1" CssClass="table table-bordered table-hover" HeaderStyle-CssClass="FixedHeader"
                                    runat="server" AutoGenerateColumns="False" AlternatingRowStyle-BackColor="WhiteSmoke"
                                    HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="white"  
                                    OnRowEditing="BtnEdit1_Click" >
                                   
                                     
                                    
                                    <AlternatingRowStyle BackColor="WhiteSmoke" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sr.No.">
                                            <ItemTemplate>
                                                <asp:Label ID="SrNo" runat="server" Text="<%# Container.DataItemIndex + 1 %>"></asp:Label>
                                                 <asp:Label ID="lblComId" runat="server" Text='<%# Bind("ComId") %>' Visible="false"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Commodity Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblComName" runat="server" Style="margin-left: 10px" 
                                                    Text='<%# Bind("ComName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Commodity Name(Marathi)">
                                            <ItemTemplate>
                                                <asp:Label ID="lblMarComNmae" runat="server" Style="margin-left: 10px" 
                                                    Text='<%# Bind("MarathiComName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Flag">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFlag" runat="server" Style="margin-left: 10px" 
                                                    Text='<%# Bind("Flag") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Operation">
                                        <ItemTemplate>
                                        <asp:Button ID="BtnDelete" runat="server" Text ="Delete" OnClick="BtnDelete_Click" CssClass="btn btn-warning" />
                                        </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                        <ItemTemplate>
                                        <asp:Button ID ="BtnEdit1" runat="server" Text ="Edit1" OnClick="BtnEdit1_Click"  CssClass="btn btn-warning" />
                                        </ItemTemplate></asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle BackColor="#2A3F54" CssClass="FixedHeader" ForeColor="White" />
                                </asp:GridView>
                            </asp:Panel>
                        </div>
                    </div>
                </div>
            </div>
</asp:Content>
