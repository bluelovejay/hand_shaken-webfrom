using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hand_shaken_webform
{
    public partial class MaterialCheck : System.Web.UI.Page
    {
        dbClass mydb = new dbClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                /*顯示在GridView*/
                string sqlstr = "Select M.Form_No , mat.mat_name ,M.Emp_Id ,M.Form_Date, M.Import_Date, v.Vendor_Name,p.Pay_Name";
                sqlstr += " from Material_Import M , Material mat , Vendor v , Pay p,Status s";
                sqlstr += " where M.mat_id = mat.mat_id";
                sqlstr += " and M.Vendor_id =v.Vendor_Id";
                sqlstr += " and M.Pay_id = p.Pay_Id";
                sqlstr += " and M.Status_id= s.Status_Id";
                sqlstr += " and s.Class='Material'";
                ResGrid.DataSource = mydb.GetDataTable(sqlstr);
                ResGrid.DataBind();
            }
        }

        protected void ResGrid_RowCommand(Object sender, GridViewCommandEventArgs e)
        {
            string Form_No = e.CommandArgument.ToString().Trim();
            switch (e.CommandName)
            {

                /*case "viewItem":
                    {
                        Response.Redirect("ReserveImportView.aspx?Form_No=" + Form_No);
                        break;
                    }*/
                case "editItem":
                    {
                        Response.Write("MaterialImportProcess.aspx?Form_No=" + Form_No);
                        Response.Redirect("MaterialImportProcess.aspx?Form_No=" + Form_No);
                        break;
                    }
                default:
                    break;
            }
        }

        protected void AddBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MaterialAdd.aspx");
        }
    }
}