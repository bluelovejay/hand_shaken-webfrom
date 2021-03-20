<%@ Page Title="" Language="C#" MasterPageFile="~/hand_server.Master" AutoEventWireup="true" CodeBehind="ReserveEdit.aspx.cs" Inherits="hand_shaken_webform.ReserveEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <h2>庫存管理更新</h2>
    <hr>
    <table class="table table-bordered;" style=" width:500px">
        <tr>
            <td>入庫單號</td>
            <td>
                <asp:label ID="Form_No"  Text='<%# Eval("Form_No") %>'  runat="server"  CssClass="form-control-plaintext"/>
               
            </td>
        </tr>
        <tr>
            <td>品項</td>
            <td>
                <asp:label ID="mat_name"  Text='<%# Eval("mat_name") %>'  runat="server"  CssClass="form-control-plaintext"/>
            </td>
        </tr>
        <tr>
            <td>庫存量</td>
            <td>
                <asp:textbox ID="qty" Text='<%# Eval("qty") %>' runat="server" CssClass="form-control" type="number"  />
            </td>
        </tr>
        <tr>
            <td>入庫人員</td>
            <td>
                <asp:Dropdownlist ID="Emp_Id_List"  DataTextField='Emp_Name'  DataValueField="Emp_Id" runat="server"  CssClass="form-control" width="100%"  />
            </td>
        </tr>
        <tr>
            <td>入庫時間</td>
            <td>
                <asp:textbox ID="Import_Date" Text='<%# Eval("Import_Date") %>' runat="server" CssClass="form-control" type="date"  />
            </td>
        </tr>
        <tr>
            <td>備註</td>
            <td>
                <asp:textbox ID="ProcessComment" runat="server" TextMode="MultiLine" CssClass="form-control" Rows="10" Columns="80"/>
            </td>
        </tr>
        <tr>
            <td>
                <a runat="server" href="~/Student">放棄</a>
            </td>
            <td style="text-align:left">
                <asp:Button ID="confirm"  Text="確認更新"  runat="server"  Width="95%" CssClass="btn btn-primary"/>
            </td>
        </tr>
    </table>
</asp:Content>
