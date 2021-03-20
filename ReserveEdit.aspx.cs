using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hand_shaken_webform
{
    public partial class ReserveEdit : System.Web.UI.Page
    {
        dbClass mydb = new dbClass();
        public DataTable Emp_Id_Set;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {   //沒登入就導到 default
                if (Session["Emp_Name"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }

                if (Request.QueryString["Form_No"] != null)
                    Form_No.Text = Request.QueryString["Form_No"].ToString().Trim();
                else
                    Response.Redirect("~/Reserve");
                /*抓取使用者帳號*/
                prepareStaff(); Emp_Id_List.DataSource = Emp_Id_Set; Emp_Id_List.DataBind();
                getDetail();
            }
            /*抓取使用者帳號*/
            void prepareStaff()
            {
                string sqlstr = "select Emp_id, Emp_name from Staff order by Emp_id";
                Emp_Id_Set = mydb.GetDataTable(sqlstr);
            }


            
        }
        void getDetail()
        {
            string sqlstr = "select d.Form_No, M.mat_name,d.qty, d.Emp_Id, d.Import_Date, d.comment from Material M, Reserve_Import_Detail d where m.Mat_Id = d.mat_id and Form_No =" + mydb.qo(Form_No.Text);
            DataTable myTable = mydb.GetDataTable(sqlstr);
            /*抓資料庫資料*/
            mat_name.Text = myTable.Rows[0]["mat_name"].ToString().Trim();
            qty.Text = myTable.Rows[0]["qty"].ToString().Trim();
            //Staff
            int selected = 0;
            string QEmp_Id = myTable.Rows[0][2].ToString().Trim();
            foreach (DataRow row in Emp_Id_Set.Rows)
            {
                if (row["Emp_Id"].ToString().Trim() == QEmp_Id)
                {
                    Emp_Id_List.SelectedIndex = selected;
                    break;
                }

                selected++;
            }
            Import_Date.Text = ((DateTime)myTable.Rows[0]["import_date"]).ToString("yyyy-MM-dd");

        }
    }

}
