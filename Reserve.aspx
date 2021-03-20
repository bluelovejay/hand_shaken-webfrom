<%@ Page Title="" Language="C#" MasterPageFile="~/hand_shaken.Master" AutoEventWireup="true" CodeBehind="Reserve.aspx.cs" Inherits="hand_shaken_webform.Reserve" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>庫存管理/庫存統計</h3>
    <hr>
    <div class="row" style="margin-top: 5px;">
        <div class="col-lg-12">
            <h3 class="text-center col-lg-offset-0 thumbnail" style="background-color:#2b31ed;color:white;margin-bottom:5px;margin-top:5px">庫存項目</h3>
            <div id="div" style="overflow: auto; height: 490px">
                <!--查詢-->
                <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                <asp:Button Text="Search" runat="server" CssClass="btn btn-danger"  OnClick="Search"/>
                
                <!--   onpageindexchanging="ResGrid_PageIndexChanging"-->
                <asp:GridView ID="ResGrid" runat="server" BackColor="white"
                    BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="4"
                    AutoGenerateColumns="False" Width="100%" CellSpacing="5" OnRowCommand="ResGrid_RowCommand"
                    ForeColor="Black" GridLines="Both" HeaderStyle-Font-Bold="True" CssClass="table-bordered"
                    AllowPaging="true" OnPageIndexChanging="OnPaging">
                    <Columns>
                        <asp:TemplateField HeaderText="入庫單號" HeaderStyle-Width="10%" ItemStyle-Width="10%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="black" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:Label ID="Form_No" Text='<%# Eval("Form_No") %>' runat="server" VerticalAlign='middle' Font-Size="15pt"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="品項" HeaderStyle-Width="10%" ItemStyle-Width="10%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="black" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:Label ID="mat_name" Text='<%# Eval("mat_name") %>' runat="server" VerticalAlign='middle' Font-Size="15pt"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="庫存量" HeaderStyle-Width="5%" ItemStyle-Width="10%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="black" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:Label ID="qty" Text='<%# Eval("qty") %>' runat="server" VerticalAlign='middle' Font-Size="15pt"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="入庫人員" HeaderStyle-Width="10%" ItemStyle-Width="10%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="black" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:Label ID="Emp_Id" Text='<%# Eval("Emp_Id") %>' runat="server" VerticalAlign='middle' Font-Size="15pt"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="入庫時間" HeaderStyle-Width="15%" ItemStyle-Width="15%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="black" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:Label ID="import_date" Text='<%# Convert.ToDateTime(Eval("import_date")).ToString("yyyy/MM/dd") %>' runat="server" VerticalAlign='middle' Font-Size="15pt"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="備註" HeaderStyle-Width="20%" ItemStyle-Width="20%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="black" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:Label ID="comment" Text='<%# Eval("comment") %>' runat="server" VerticalAlign='middle' Font-Size="15pt"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="" HeaderStyle-Width="10%" ItemStyle-Width="10%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="black" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:Button Text="更新" runat="server" CssClass="btn btn-info" CommandArgument='<%# Eval("Form_no") %>' CommandName="Edit_Click" />
                                <asp:Button Text="刪除" runat="server" CssClass="btn btn-danger" CommandArgument='<%# Eval("Form_no") %>' CommandName="Delete_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>


    

</asp:Content>
