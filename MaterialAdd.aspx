<%@ Page Title="" Language="C#" MasterPageFile="~/hand_shaken.Master" AutoEventWireup="true" CodeBehind="MaterialAdd.aspx.cs" Inherits="hand_shaken_webform.MaterialAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <h2>新增進貨單</h2>
    <hr>
    <table id="mat_table" class="table table-bordered;" style=" width:500px">
        <tr>
            <td>品項</td>
            <td>
                <!--DataTextField:自訂的資料;DataValueField:讀資料庫的資料-->
                <asp:Dropdownlist ID="mat_id_List"  DataTextField='mat_name'  DataValueField="mat_id" runat="server"  CssClass="form-control" width="100%"  />
                <!--<asp:label ID="mat_name"  Text='<%# Eval("mat_name") %>'  runat="server"  CssClass="form-control-plaintext"/>-->
            </td>
        </tr>
        <tr>
            <td>單價</td>
            <td>
                <asp:label ID="Single_price"  Text='<%# Eval("price") %>'  runat="server"  CssClass="form-control-plaintext" />
            </td>
        </tr>
        <tr>
            <td>數量</td>
            <td>
                <asp:textbox ID="qty" Text='<%# Eval("qty") %>' runat="server" CssClass="form-control" type="number"  />
            </td>
        </tr>
        <tr>
            <td>下單人員</td>
            <td>
                <asp:label ID="Emp_Id" Text='<%# Eval("Emp_Id") %>'  runat="server"  CssClass="form-control-plaintext"/>
            </td>
        </tr>
        <tr>
            <td>下單時間</td>
            <td>
                <asp:textbox ID="form_Date" Text='<%# Eval("form_Date") %>' runat="server" CssClass="form-control" type="date"  />
            </td>
        </tr>
        <tr>
            <td>進貨時間</td>
            <td>
                <asp:textbox ID="Import_Date" Text='<%# Eval("Import_Date") %>' runat="server" CssClass="form-control" type="date"  />
            </td>
        </tr>
        <tr>
            <td>廠商</td>
            <td>
                <asp:Dropdownlist ID="Vendor_id_List"  DataTextField='Vendor_Id'  DataValueField="Vendor_name" runat="server"  CssClass="form-control" width="100%"  />
            </td>
        </tr>
        <tr>
            <td>金額</td>
            <td>
                <asp:label ID="price" Text='<%# Eval("price") %>' runat="server" CssClass="form-control-plaintext"  />
            </td>
        </tr>
        <tr>
            <td>付款方式</td>
            <td>
                <asp:Dropdownlist ID="pay_id_List"  DataTextField='pay_id'  DataValueField="pay_name" runat="server"  CssClass="form-control" width="100%"  />
            </td>
        </tr>
        <tr>
            <td>備註</td>
            <td>
                <asp:textbox ID="ProcessComment" runat="server" TextMode="MultiLine" CssClass="form-control" Rows="10" Columns="80"/>
            </td>
        </tr>
        <tr>
            <td></td>
            <td >
                <asp:Button ID="cancel"  Text="取消" runat="server" Width="40%" CssClass="btn btn-danger" OnClick="Cancel_Click" />
                <asp:Button ID="confirm"  Text="新增"  runat="server"  Width="40%" CssClass="btn btn-primary" OnClick="confirm_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
