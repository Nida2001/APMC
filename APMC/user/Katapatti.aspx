<%@ Page Title="" Language="C#" MasterPageFile="~/m_APMC/user/Master1.master" AutoEventWireup="true"
    CodeFile="Katapatti.aspx.cs" Inherits="m_APMC_user_Katapatti" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
      <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <script type="text/javascript">
        function showDate() {
            $find("Date").show();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid bg-white">
        <div class="col-md-auto">
            <div class="card shadow p-4">
                <div class="card-body">
                    <div id="frmGross" runat="server">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-4">
                                </div>
                                <div class="col-md-4">
                                    <asp:Button ID="btnGross" runat="server" Font-Bold="True" Text="GROSS" CssClass="btn btn-warning"
                                        OnClick="btnGross_Click" />
                                    <asp:Button ID="btnTare" runat="server" Font-Bold="True" Text="TARE" CssClass=" btn btn-warning"
                                        OnClick="btnTare_Click" />
                                </div>
                                <div class="col-md-4">
                                </div>
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col-md-6">
                                <div class="col-md-2">
                                    <asp:Label ID="lblPavatiNo" runat="server" CssClass="control-label" Text="पावती क्र."></asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtPavatiNo" runat="server" CssClass="form-control rounded" ReadOnly="true"></asp:TextBox>
                                </div>
                                <div class="col-md-2">
                                    <asp:Label ID="lblbookNo" runat="server" CssClass="control-label" Text="बुक क्र."></asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <asp:TextBox ID="TxtBookNo" runat="server" CssClass="form-control rounded"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="col-md-2">
                                    <asp:Label ID="lblsaudapatti" runat="server" CssClass="control-label" Text="सौदा पट्टी नं."></asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtsaudapatti" runat="server" CssClass="form-control rounded" AutoPostBack="True"
                                        OnTextChanged="txtsaudapatti_TextChanged"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This is the required field"
                                        Style="color: Red" ControlToValidate="txtsaudapatti" Font-Bold="true" ValidationGroup="GvValidate"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-2">
                                    <asp:Label ID="lbl1" runat="server" CssClass="control-label" Text="दिनांक"></asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtAKDate" runat="server" CssClass="form-control rounded" type="Date"
                                        ></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="This is the required field"
                                        Style="color: Red" ControlToValidate="txtAKDate" Font-Bold="true" ValidationGroup="validate"
                                        ForeColor="Red"></asp:RequiredFieldValidator>

                                  <%--  <cc1:calendarextender id="ceDate" runat="server" targetcontrolid="txtAKDate" popupbuttonid="txtAKDate"
                        ></cc1:calendarextender>--%>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-2">
                                    <asp:Label ID="lblagentname" runat="server" CssClass="control-label" Text="आडत्याचे नाव"></asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlAgentName" runat="server" CssClass=" form-control rounded"
                                        ValidationGroup="validate">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-2">
                                    <asp:Label ID="lblpurchaser" runat="server" CssClass="control-label" Text="खरेदीदाराचे नाव"></asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlPurchaser" runat="server" CssClass=" form-control rounded">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-12">
                                <div class="col-md-2">
                                    <asp:Label ID="lblFarmer" runat="server" CssClass="control-label" Text="शेतकऱ्याचे नाव "></asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlFarmer" runat="server" CssClass=" form-control rounded">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-2">
                                    <asp:Label ID="lblmeasurer" runat="server" CssClass="control-label" Text="मापारी "></asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlMeasurer" runat="server" 
                                        CssClass=" form-control rounded" 
                                        onselectedindexchanged="ddlMeasurer_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="This is the required field"
                                        Style="color: Red" ControlToValidate="ddlMeasurer" Font-Bold="true" ValidationGroup="validate"
                                        ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-12">
                                <div class="col-md-2">
                                    <asp:Label ID="Label3" runat="server" CssClass="control-label" Text="शेतकऱ्याचे गाव"></asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtPlace" runat="server" CssClass="form-control rounded"></asp:TextBox>
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="This is the required field "
                                     Style="color:Red" ControlToValidate="txtPlace" Font-Bold="true" ValidationGroup="validate" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-2">
                                    <asp:Label ID="lblvehno" runat="server" CssClass="control-label" Text="गाडी नं."></asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <asp:TextBox ID="Txtvehno" runat="server" CssClass="form-control rounded"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="This is the required field "
                                    Style="color:Red" ControlToValidate="Txtvehno" Font-Bold="true" ValidationGroup="validate" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-12">
                                <div class="col-md-2">
                                    <asp:Label ID="lblcomodity" runat="server" CssClass="control-label" Text="शेतमालाची जात"></asp:Label>
                                </div>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="ddlcomodity" runat="server" CssClass=" form-control rounded">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="This is the required field "
                                    Style="color:Red" ControlToValidate="ddlcomodity" Font-Bold="true" ValidationGroup="GvValidate" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-2">
                                    <asp:Label ID="lblbharati" runat="server" CssClass="control-label" Text="भरती "></asp:Label>
                                </div>
                                <div class="col-md-2">
                                    <asp:TextBox ID="Txtbharati" runat="server" CssClass="form-control rounded"></asp:TextBox>
                                </div>
                                <div class="col-md-2">
                                    <asp:Label ID="lblrate" runat="server" CssClass="control-label" Text="दर"></asp:Label>
                                </div>
                                <div class="col-md-2">
                                    <asp:TextBox ID="txtRate" runat="server" CssClass="form-control rounded"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="This is the required feild"
                                     Style="color:Red" ControlToValidate="txtRate" Font-Bold="true" ValidationGroup="GvValidate" ForeColor="Red"></asp:RequiredFieldValidator>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-12">
                                <div class="col-md-2">
                                    <asp:Label ID="LblTotalRate" runat="server" CssClass="control-label" Text="एकूण खरेदी किंमत"></asp:Label>
                                </div>
                                <div class="col-md-2">
                                    <asp:TextBox ID="TxtTotalRate" runat="server" CssClass="form-control rounded" 
                                        AutoPostBack="true" ontextchanged="TxtTotalRate_TextChanged"></asp:TextBox>
                                       
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="This is the required field "
                            Style="color:Red" ControlToValidate="TxtTotalRate" Font-Bold="true" ValidationGroup="validate" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-2">
                                    <asp:Label ID="lblSmallbag" runat="server" CssClass="control-label" Text="चुंबडी"></asp:Label>
                                </div>
                                <div class="col-md-2">
                                    <asp:TextBox ID="txtSmallbag" runat="server" CssClass="form-control rounded"></asp:TextBox>
                                </div>
                                <div class="col-md-2">
                                    <asp:Label ID="lblquintal" runat="server" CssClass="control-label" Text="क्विंटल"></asp:Label>
                                </div>
                                <div class="col-md-2">
                                    <asp:TextBox ID="Txtquintal" runat="server" CssClass="form-control rounded" AutoPostBack="True"
                                        OnTextChanged="Txtquintal_TextChanged"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-12">
                                <div class="col-md-2">
                               <asp:Label ID="lblmarketfee" runat="server" class="text-uppercase" Text="मार्केट फी"></asp:Label>
                                   
                                </div>
                                <div class="col-md-2">
                                  <asp:TextBox ID="Txtmarketfee" runat="server" CssClass="form-control" 
                                        ReadOnly="True" ></asp:TextBox>
                                   
                                </div>
                                <div class="col-md-2">
                                    <asp:Label ID="lblBag" runat="server" CssClass="control-label" Text=" पोते"></asp:Label>
                                </div>
                                <div class="col-md-2">
                                    <asp:TextBox ID="txtBag" runat="server" CssClass="form-control rounded" AutoPostBack="True"
                                        OnTextChanged="txtBag_TextChanged"></asp:TextBox>
                                </div>
                                <div class="col-md-2">
                                    <asp:Label ID="Lblkilo" runat="server" CssClass="control-label" Text=" किलो/ग्रॅम"></asp:Label>
                                </div>
                                <div class="col-md-2">
                                    <asp:TextBox ID="Txtkilo" runat="server" CssClass="form-control rounded" 
                                        ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-12">
                                <div class="col-md-2">
                                <asp:Label ID="lblsupFee" runat="server" CssClass="control-label" Text="सुपरव्हीजन फी "></asp:Label>
                                    
                                </div>
                                <div class="col-md-2">
                                 <asp:TextBox ID="TxtsupFee" runat="server" CssClass="form-control rounded" 
                                        ReadOnly="True"></asp:TextBox>
                                    
                                </div>
                                <div class="col-md-2">
                                    <asp:Label ID="lblQty" runat="server" CssClass="control-label" Text="पोत्याची संख्या"></asp:Label>
                                </div>
                                <div class="col-md-2">
                                    <asp:TextBox ID="TxtQty" runat="server" CssClass="form-control rounded" 
                                        ReadOnly="True"></asp:TextBox>
                                </div>
                                <div class="col-md-2">
                                    <asp:Label ID="Label5" runat="server" CssClass="control-label" Text="एकूण क्विं./किलोग्रॅम "></asp:Label>
                                </div>
                                <div class="col-md-2">
                                     <asp:TextBox ID="txtTotalQKilo" runat="server" CssClass="form-control rounded" AutoPostBack="true"
                                        OnTextChanged="txtTotalQKilo_TextChanged1" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-12">
                                <div class="col-md-2">
                                   <asp:Label ID="lblTotalPrice" runat="server" CssClass="control-label" Text="एकूण रक्कम"></asp:Label>
                                </div>
                                <div class="col-md-2">
                                  <asp:TextBox ID="TxtPrice" runat="server" CssClass="form-control rounded" 
                                        ReadOnly="True"></asp:TextBox>
                                </div>
                                <div class="col-md-2">
                                    <asp:Button ID="btnAdd" runat="server" Text="ADD" CssClass=" btn btn-warning" OnClick="btnAdd_Click" ValidationGroup="GvValidate" />
                                </div>
                                <div class="col-md-6">
                                    <asp:Panel ID="pnlUserId" runat="server" CssClass="pre-scrollable">
                                        <asp:GridView ID="gvData" runat="server" HeaderStyle-BackColor="#2A3F54" HeaderStyle-ForeColor="White"
                                            Height="100%" Width="100%" CssClass="table table-bordered table-hover">
                                        </asp:GridView>
                                    </asp:Panel>
                                </div>
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col-md-12">
                            <asp:Button ID="btnClose" runat="server" Text="बंद करा" 
                                    CssClass=" btn btn-warning pull-right" onclick="btnClose_Click" />
                                <asp:Button ID="btnSave" runat="server" Text="साठवा" CssClass=" btn btn-warning pull-right"
                                    OnClick="btnSave_Click1" ValidationGroup="validate" />
                                
                               
                               
                            </div>
                        </div>
                    </div>
                    <div id="frmTare" runat="server">
                        <%--<div style="border: solid 2px black; padding: 30px 200px 30px 30px; margin: 20px">--%>
                        <%--<div class="col-md-12">
                                <asp:Label ID="lblemptyveh" runat="server" Text="Weight Of Empty Vehicle" Font-Bold="True"
                                    Font-Underline="False" BorderColor="Black" Font-Size="Medium"></asp:Label>
                            </div>--%>
                        <h2>
                            Weight of Empty Vehicle</h2>
                        <br />
                        <hr />
                        <div class="row mt-2">
                            <div class="col-md-12">
                                <div class="col-md-1">
                                    <asp:Label ID="lblVehRec" runat="server" CssClass="control-label">Receipt NO</asp:Label>
                                </div>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtTareWtRecNo" runat="server" CssClass="form-control rounded" ReadOnly="true" AutoPostBack="true" 
                                     ></asp:TextBox>
                                       
                                         
                                </div>
                                <div class="col-md-1">
                                    <asp:Label ID="LblVehType" runat="server" CssClass="control-label">Vehicle Type</asp:Label>
                                </div>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="drdTareVehicleType" runat="server" CssClass=" form-control rounded">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="This is the required field "
                            Style="color:Red" ControlToValidate="drdTareVehicleType" Font-Bold="true" ValidationGroup="validate" InitialValue="0" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-1">
                                    <asp:Label ID="Label4" runat="server" CssClass="control-label">Vehicle No</asp:Label>
                                </div>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtTareVehicleNO" runat="server" CssClass="form-control rounded"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="This is the required field "
                            Style="color:Red" ControlToValidate="txtTareVehicleNO" Font-Bold="true" ValidationGroup="validate" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-12">
                                <div class="col-md-1">
                                    <asp:Label ID="Label1" runat="server" CssClass="control-label">Vehicle Wt(Qtl)</asp:Label>
                                </div>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtVQtl" runat="server" CssClass="form-control rounded"></asp:TextBox>
                                </div>
                                <div class="col-md-2">
                                    <asp:Button ID="btnconvert" runat="server" Text="Convert>>" CssClass="btn btn-warning"
                                        OnClick="btnconvert_Click" />
                                </div>
                              
                                   <div class="col-md-1">
                                    <asp:Label ID="lblVWtKG" runat="server" CssClass="control-label">Vehicle Wt(KG)</asp:Label>
                                  </div>
                                 <div class="col-md-3">
                                    <asp:TextBox ID="txtVKg" runat="server" CssClass="form-control rounded" 
                                         ReadOnly="True"></asp:TextBox>
                                 </div>
                               

                            </div>
                        </div>
                      <%--  <div class="row mt-2">
                            <div class="col-md-12">
                                <div class="col-md-1">
                                    <asp:Label ID="lblVWtKG" runat="server" CssClass="control-label">Vehicle Wt(KG)</asp:Label>
                                </div>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtVKg" runat="server" CssClass="form-control rounded"></asp:TextBox>
                                </div>
                            </div>
                        </div>--%>
                        <hr />
                        <div class="row">
                            <div class="col-md-12">
                                <asp:Button ID="btnTareSave" runat="server" Text="Save" CssClass="btn btn-warning pull-right"
                                    OnClick="btnTareSave_Click" ValidationGroup="validate"  />
                                <asp:Button ID="btnTareClose" runat="server" Text="Close" CssClass="btn btn-warning pull-right"
                                    OnClick="btnTareClose_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
