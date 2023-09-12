<%@ Page Title="" Language="C#" MasterPageFile="~/m_APMC/user/Master1.master" AutoEventWireup="true"
    CodeFile="frmsubApmc.aspx.cs" Inherits="m_APMC_user_frmsubApmc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Sub APMC Master</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/style_banner.css" rel="stylesheet" />
    <!-- Bootstrap Core CSS -->
    <!-- MetisMenu CSS -->
    <link href="bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="dist/css/sb-admin-2.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid bg-white">
        <div class="col-md-12">
            <div class="card shadow p-4">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-12 mt-3">
                            <div class="col-md-2">
                                <asp:Label ID="Lblmainapmcname" runat="server" CssClass="control-label" Text="MAIN APMC NAME"></asp:Label>
                            </div>
                            <div class="col-md-2">
                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control rounded"
                                    DataSourceID="LinqDataSource1" DataTextField="APMC_NAME" DataValueField="APMC_Id">
                                </asp:DropDownList>
                                <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="KrushiSoftDataContext"
                                    EntityTypeName="" Select="new (APMC_NAME, APMC_Id)" TableName="mstAPMCs">
                                </asp:LinqDataSource>
                            </div>
                            <div class="col-md-2">
                                <asp:Label ID="lblsubapmc" runat="server" CssClass="control-label" Text="SUB APMC"></asp:Label>
                            </div>
                            <div class="col-md-2">
                                <asp:TextBox ID="txtSubApmc" runat="server" CssClass="form-control rounded"></asp:TextBox>
                            </div>
                            <div class="col-md-2">
                                <asp:Label ID="lblSubApmcM" runat="server" CssClass="control-label" Text="SUB APMC( Marathi)"></asp:Label>
                            </div>
                            <div class="col-md-2">
                                <asp:TextBox ID="txtSbubApmcM" runat="server" CssClass="form-control rounded"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 mt-2">
                            <div class="col-md-2">
                                <asp:Label ID="Lblcity" runat="server" CssClass="control-label" Text="CITY"></asp:Label>
                            </div>
                            <div class="col-md-2">
                                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control rounded"
                                    DataSourceID="LinqDataSource2" DataTextField="APMC_Mrt" DataValueField="APMC_Mrt">
                                </asp:DropDownList>
                                <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="KrushiSoftDataContext"
                                    EntityTypeName="" Select="new (APMC_Mrt)" TableName="mstAPMCs" Where="APMC_Mrt!=null">
                                </asp:LinqDataSource>
                            </div>
                            <div class="col-md-2">
                                <asp:Label ID="lblflag" runat="server" class="control-label" Text="FLAG"></asp:Label>
                            </div>
                            <div class="col-md-2">
                                <asp:TextBox ID="Txtflag" runat="server" class="form-control rounded"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        &nbsp;
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-md">
                                <asp:Button ID="btncancel" runat="server" Text="Cancel" CssClass="btn btn-warning pull-right"
                                    OnClick="btncancel_Click" />
                            </div>
                            <div class="col-md">
                                <asp:Button ID="btnsave" runat="server" Text="SAVE" CssClass="btn btn-warning pull-right"
                                    OnClick="btnSave_Click" />
                            </div>
                            <div class="col-md">
                                <asp:Button ID="Button3" runat="server" Text="Update" CssClass="btn btn-warning pull-right"
                                    OnClick="btnupdate_Click" />
                            </div>
                        </div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="col-md-12">
                            <asp:Panel ID="PNLGrid1" runat="server" CssClass="pre-scrollable" Height="100%">
                                <asp:GridView ID="GridView1" CssClass="table table-bordered table-hover" HeaderStyle-CssClass="FixedHeader"
                                    runat="server" AutoGenerateColumns="False" AlternatingRowStyle-BackColor="WhiteSmoke"
                                    HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="white" 
                                    OnRowEditing="BtnEdit_Click" >
                               
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sr.No.">
                                            <ItemTemplate>
                                                <asp:Label ID="SrNo" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                                <asp:Label ID="Label10" runat="server" Text='<%# Bind("SubAPMC_Id") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("APMC_Id") %>' Visible="false"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Sub-APMC Name(Marathi)">
                                            <ItemTemplate>
                                                <asp:Label Style="margin-left: 10px" ID="Label2" runat="server" Text='<%# Bind("SubAPMC_Name") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Sub-APMC">
                                            <ItemTemplate>
                                                <asp:Label Style="margin-left: 10px" ID="Label3" runat="server" Text='<%# Bind("SubAPMC_EngName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="City">
                                            <ItemTemplate>
                                                <asp:Label Style="margin-left: 10px" ID="Label5" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Flag">
                                            <ItemTemplate>
                                                <asp:Label Style="margin-left: 10px" ID="Label4" runat="server" Text='<%# Bind("Flag") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Operation">
                                            <ItemTemplate>
                                                <asp:Button ID="Btnedit" runat="server" Text="Edit" CssClass="btn btn-warning" CommandName="Edit" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Operation">
                                            <ItemTemplate>
                                                <asp:Button ID="Button2" runat="server" OnClick="delete" Text="delete" CssClass="btn btn-warning" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </asp:Panel>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
