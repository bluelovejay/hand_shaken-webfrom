<%@ Page Title="" Language="C#" MasterPageFile="~/hand_shaken.Master" AutoEventWireup="true" CodeBehind="MaterialImportProcess.aspx.cs" Inherits="hand_shaken_webform.MaterialImportProcess" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>庫存審核單</h3>
    <hr />
    <div class="row" style="margin-top: 5px;">
            <div class="col-md-6" >
                <h3 class="text-center col-lg-offset-0 thumbnail" style="background-color:#62ff89;color:white;margin-bottom:5px;margin-top:5px; color:darkslategrey">進貨明細</h3>
                <div style="overflow: auto; height: 200px">
                    <asp:GridView ID="ResGrid" runat="server" BackColor="white"
                        BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="4"
                        AutoGenerateColumns="False" Width="100%" CellSpacing="5"
                        CaptionAlign="Top" ForeColor="Black" GridLines="Vertical" HeaderStyle-Font-Bold="True" 
                        CssClass="table-bordered" ShowFooter="True">
                        <Columns>
                            <asp:TemplateField HeaderText="進貨單號" ItemStyle-Width="15%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#663300">
                                <HeaderStyle Font-Bold="True" />
                                <ItemStyle HorizontalAlign='Center' VerticalAlign="Middle" BackColor="white" />
                                <ItemTemplate>
                                    <asp:Label ID="Form_No" Text='<%# Eval("Form_No") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="料號" ItemStyle-Width="15%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#663300">
                                <HeaderStyle Font-Bold="True" />
                                <ItemStyle HorizontalAlign='Center' VerticalAlign="Middle" BackColor="white" />
                                <ItemTemplate>
                                    <asp:Label ID="mat_id" Text='<%# Eval("mat_id") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="料名" ItemStyle-Width="15%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#663300">
                                <HeaderStyle Font-Bold="True" />
                                <ItemStyle HorizontalAlign='Center' VerticalAlign="Middle" BackColor="white" />
                                <ItemTemplate>
                                    <asp:Label ID="mat_name" Text='<%# Eval("mat_name") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="數量" ItemStyle-Width="15%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#663300">
                                <HeaderStyle Font-Bold="True" />
                                <ItemStyle HorizontalAlign='Center' VerticalAlign="Middle" BackColor="white" />
                                <ItemTemplate>
                                    <asp:Label ID="qty" Text='<%# Eval("qty") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="金額" ItemStyle-Width="15%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#663300">
                                <HeaderStyle Font-Bold="True" />
                                <ItemStyle HorizontalAlign='Center' VerticalAlign="Middle" BackColor="white" />
                                <ItemTemplate>
                                    <asp:Label ID="price" Text='<%# Eval("price") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="備註" ItemStyle-Width="15%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#663300">
                                <HeaderStyle Font-Bold="True" />
                                <ItemStyle HorizontalAlign='Center' VerticalAlign="Middle" BackColor="white" />
                                <ItemTemplate>
                                    <asp:Label ID="comment" Text='<%# Eval("comment") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>

                <h3 class="text-center col-lg-offset-0 thumbnail" style="background-color:#62ff89;color:white;margin-bottom:5px;margin-top:5px; color:darkslategrey">驗貨流程</h3>
                <div style="overflow: auto; height: 500px">
                    <asp:GridView ID="ProcessGrid" runat="server" BackColor="white"
                        BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="4"
                        AutoGenerateColumns="False" Width="100%" CellSpacing="5"
                        CaptionAlign="Top" ForeColor="Black" GridLines="Vertical" HeaderStyle-Font-Bold="True" 
                        CssClass="table-bordered" ShowFooter="True">
                        <Columns>
                            <asp:TemplateField HeaderText="進貨單號" ItemStyle-Width="10%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#663300">
                                <HeaderStyle Font-Bold="True" />
                                <ItemStyle HorizontalAlign='Center' VerticalAlign="Middle" BackColor="white" />
                                <ItemTemplate>
                                    <asp:Label ID="Form_No" Text='<%# Eval("Form_No") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="簽辦人" ItemStyle-Width="10%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#663300">
                                <HeaderStyle Font-Bold="True" />
                                <ItemStyle HorizontalAlign='Center' VerticalAlign="Middle" BackColor="white" />
                                <ItemTemplate>
                                    <asp:Label ID="Emp_Id" Text='<%# Eval("Emp_Id") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="簽辦時間" ItemStyle-Width="10%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#663300">
                                <HeaderStyle Font-Bold="True" />
                                <ItemStyle HorizontalAlign='Center' VerticalAlign="Middle" BackColor="white" />
                                <ItemTemplate>
                                    <asp:Label ID="Verify_Date" Text='<%# Convert.ToDateTime(Eval("Verify_Date")).ToString("yyyy/MM/dd") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="意見" ItemStyle-Width="10%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="#663300">
                                <HeaderStyle Font-Bold="True" />
                                <ItemStyle HorizontalAlign='Center' VerticalAlign="Middle" BackColor="white" />
                                <ItemTemplate>
                                    <asp:Label ID="Comment" Text='<%# Eval("Comment") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <div class="col-md-6" >
                <h3 class="text-center col-lg-offset-0 thumbnail" style="background-color:#f64040;color:white;margin-bottom:5px;margin-top:5px; color:darkslategrey">入庫簽辦單</h3>
                    <table class="table table-bordered;" style=" width:500px">
                        <tr>
                            <td>進貨單號</td>
                            <td>
                                <asp:label ID="Form_No" Text='<%# Eval("Form_No") %>'  runat="server"  CssClass="form-control-plaintext"/>
                            </td>
                        </tr>
                        <tr>
                            <td>入庫人</td>
                            <td>
                                <asp:label ID="Emp_Id" Text='<%# Eval("Emp_Id") %>'  runat="server"  CssClass="form-control-plaintext"/>
                            </td>
                        </tr>
                        <tr>
                            <td>入庫時間</td>
                            <td>
                                <asp:textbox ID="Import_Date" Text='<%# Eval("Import_Date") %>' runat="server" CssClass="form-control" type="date"  />
                            </td>
                        </tr>
                        <tr>
                            <td>廠商</td>
                            <td>
                                <asp:label ID="Vendor_Name" Text='<%# Eval("Vendor_Name") %>'  runat="server"  CssClass="form-control-plaintext"/>
                                <asp:label ID="Vendor_Id" Text='<%# Eval("Vendor_Id") %>'  runat="server"  CssClass="form-control-plaintext"/>
                            </td>
                        </tr>
                        <tr>
                            <td>備註</td>
                            <td>
                                <asp:textbox ID="Comment"   runat="server"  CssClass="form-control" TextMode="MultiLine"/>
                            </td>
                        </tr>
                        <tr>
                            <td>現況</td>
                            <td>
                                <asp:Dropdownlist ID="StatusList"  DataTextField='Comment'  DataValueField="Status_Id" runat="server"  CssClass="form-control" width="100%"  />
                            </td>
                        </tr>
                        <tr>
                            <td>簽辦意見</td>
                            <td>
                                <asp:textbox ID="ProcessComment" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="10" Columns="80" Width="100%"  />
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td >
                                <asp:Button Id="confirm" Text="簽辦" runat="server" Width="40%" CssClass="btn btn-primary" OnClick="confirm_Click" />
                                <asp:Button ID="Cancel"  Text="取消"  runat="server"  Width="40%" CssClass="btn btn-danger" OnClick="Cancel_Click" />
                            </td>
                        </tr>
                    </table>
            </div>
    </div>
</asp:Content>
