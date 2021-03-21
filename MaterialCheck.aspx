<%@ Page Title="" Language="C#" MasterPageFile="~/hand_shaken.Master" AutoEventWireup="true" CodeBehind="MaterialCheck.aspx.cs" Inherits="hand_shaken_webform.MaterialCheck" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>進貨管理/進貨單審核</h3>
    <hr>
    <div class="row" style="margin-top: 5px;">
        <div class="col-lg-12">
            <h3 class="text-center col-lg-offset-0 thumbnail" style="background-color:#2b31ed;color:white;margin-bottom:5px;margin-top:5px">審核單項目</h3>
            <div id="div" style="overflow: auto; height: 490px">
                <asp:GridView ID="ResGrid" runat="server" BackColor="white"
                    BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="4"
                    AutoGenerateColumns="False" Width="100%" CellSpacing="5" OnRowCommand="ResGrid_RowCommand"
                    ForeColor="Black" GridLines="Both" HeaderStyle-Font-Bold="True" CssClass="table-bordered">
                    <Columns>
                        <asp:TemplateField HeaderText="進貨單號" HeaderStyle-Width="10%" ItemStyle-Width="10%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="black" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:Label ID="Form_No" Text='<%# Eval("Form_No") %>' runat="server" VerticalAlign='middle' Font-Size="15pt" CommandName="viewItem"  CommandArgument='<%# Eval("form_no") %>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="料名" HeaderStyle-Width="10%" ItemStyle-Width="10%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="black" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:Label ID="mat_name" Text='<%# Eval("mat_name") %>' runat="server" VerticalAlign='middle' Font-Size="15pt" CommandName="viewItem"  CommandArgument='<%# Eval("form_no") %>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="下單人員" HeaderStyle-Width="10%" ItemStyle-Width="10%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="black" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:Label ID="Emp_Id" Text='<%# Eval("Emp_Id") %>' runat="server" VerticalAlign='middle' Font-Size="15pt" CommandName="viewItem"  CommandArgument='<%# Eval("form_no") %>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="下單時間" HeaderStyle-Width="10%" ItemStyle-Width="10%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="black" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:Label ID="form_date" Text='<%# Convert.ToDateTime(Eval("form_date")).ToString("yyyy/MM/dd") %>' runat="server" VerticalAlign='middle' Font-Size="15pt" CommandName="viewItem"  CommandArgument='<%# Eval("form_no") %>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="預估進貨時間" HeaderStyle-Width="10%" ItemStyle-Width="10%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="black" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:Label ID="Import_date" Text='<%# Convert.ToDateTime(Eval("Import_date")).ToString("yyyy/MM/dd") %>' runat="server" VerticalAlign='middle' Font-Size="15pt" CommandName="viewItem"  CommandArgument='<%# Eval("form_no") %>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="廠商" HeaderStyle-Width="10%" ItemStyle-Width="10%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="black" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:Label ID="vendor_name" Text='<%# Eval("vendor_name") %>' runat="server" VerticalAlign='middle' Font-Size="15pt" CommandName="viewItem"  CommandArgument='<%# Eval("form_no") %>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="付款方式" HeaderStyle-Width="5%" ItemStyle-Width="10%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="black" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:Label ID="pay_name" Text='<%# Eval("pay_name") %>' runat="server" VerticalAlign='middle' Font-Size="15pt" CommandName="viewItem"  CommandArgument='<%# Eval("form_no") %>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="" HeaderStyle-Width="5%" ItemStyle-Width="5%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="black" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:Button Text="簽辦" runat="server" CssClass="btn btn-info" CommandArgument='<%# Eval("Form_no") %>' CommandName="editItem" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
