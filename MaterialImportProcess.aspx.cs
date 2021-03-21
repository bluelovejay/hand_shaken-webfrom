using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hand_shaken_webform
{
    public partial class MaterialImportProcess : System.Web.UI.Page
    {
        dbClass mydb = new dbClass();
        public static DataTable tempItem;

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
                    Response.Redirect("~/ReserveCheck");
                prepareStatusList();
                preparePayList();
                showDetail();
            }

        }
        /*進貨明細*/
        void prepareStatusList()
        {
            string sqlstr = "select '' as status_id, '請選擇驗貨情況' as Status union(select status_id, Status from status where class='Material') order by status_id";
            StatusList.DataSource = mydb.GetDataTable(sqlstr);
            StatusList.DataBind();
        }
        /*付款方式*/
        
        void preparePayList()
        {
            string sqlstr = "select '' as Pay_Id, '請選擇付款方式' as Pay_name union(select Pay_Id, Pay_name from Pay) order by Pay_Id ";
            PayList.DataSource = mydb.GetDataTable(sqlstr);
            PayList.DataBind();
        }

        /*簽辦Button*/
        protected void confirm_Click(object sender, EventArgs e)
        {

            string sqlstr = "update Material_Import set Import_Date = convert(datetime," + mydb.qo(Import_Date.Text) + ")";
            //sqlstr += " ,Comment =" + mydb.qo(Comment.Text);
            sqlstr += " ,status_id = " + mydb.qo(StatusList.SelectedValue.Trim());
            sqlstr += " ,Pay_id = " + mydb.qo(PayList.SelectedValue.Trim());
            sqlstr += " where Form_No = " + Form_No.Text;

            //Verify
            sqlstr += " declare @Form_No int ";
            sqlstr += " select @Form_No=isnull(max(Form_No),0)+1 from Verify where form_no = " + Form_No.Text;
            sqlstr += " insert into Verify(Form_No,Emp_id,Verify_Date,status_id,Comment)values(";
            //sqlstr += "'IMPORT',";
            sqlstr += Form_No.Text + ",";
            sqlstr += mydb.qo(Session["Emp_Name"].ToString().Trim()) + ",";
            sqlstr += " getdate(),";
            sqlstr +=   mydb.qo(StatusList.SelectedValue.Trim()) +",";
            string opinion = "▼" + Session["Emp_Name"].ToString() + "於" + DateTime.Now.ToString() + "簽辦意見:" + ProcessComment.Text.Trim();
            sqlstr += mydb.qo(opinion) + ")";
            Response.Write(sqlstr);
            mydb.execSQL(sqlstr);
            Response.Redirect("~/MaterialCheck");
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MaterialCheck");
        }



        void showGrid()
        {
            ResGrid.DataSource = tempItem;
            ResGrid.DataBind();
        }

        void showDetail()
        {   //Material_Import
            string sqlstr = "Select M.Form_No , mat.mat_name ,M.Emp_Id ,M.Form_Date, M.Import_Date, M.Vendor_Id, p.Pay_Name";
            sqlstr += " from Material_Import M , Material mat , Pay p, Status s";
            sqlstr += " where M.form_no = " + Form_No.Text; 
            sqlstr += " and M.mat_id = mat.mat_id";
            sqlstr += " and M.Pay_id = p.Pay_Id";
            sqlstr += " and M.Status_id= s.Status_Id";
            sqlstr += " and s.Class='Material'";
            DataTable myTable = mydb.GetDataTable(sqlstr);
            /*讀取登入者名稱*/
            Emp_Id.Text = Session["Emp_Name"].ToString().Trim();
            //日期:讀取資料
            Import_Date.Text = ((DateTime)myTable.Rows[0]["import_date"]).ToString("yyyy-MM-dd");
            //廠商
            Vendor_Id.Text = myTable.Rows[0]["Vendor_Id"].ToString().Trim();
            /*用廠商ID抓名稱*/
            sqlstr = " select vendor_name from vendor where vendor_id=" + mydb.qo(Vendor_Id.Text);
            Vendor_Name.Text = mydb.getSingleData(0, sqlstr);

            //備註
            sqlstr = " select comment from Material_Import_Detail where Form_no =" + Form_No.Text;
            Comment.Text = mydb.getSingleData(0, sqlstr);
            //-------------------------


            //Material_Import_Detail
            sqlstr = "select  d.Form_No as Form_No, d.mat_id as mat_id, m.mat_name as mat_name, d.qty as qty, d.price as price, d.comment as comment ";
            sqlstr += " from Material_Import_Detail d, Material M ";
            sqlstr += " where d.form_no = " + Form_No.Text;
            sqlstr += "   and d.mat_id = m.mat_id ";
            ResGrid.DataSource = mydb.GetDataTable(sqlstr);
            ResGrid.DataBind();
            //Verify
            sqlstr = "select  s.Status,v.Form_No,v.Emp_Id,v.Verify_Date,v.Comment from Verify v,Status s ";
            sqlstr += " where  v.Form_No = " + Form_No.Text;
            sqlstr += " and v.Status_id = s.Status_Id";
            sqlstr += " and s.Class  ='Material'";

            ProcessGrid.DataSource = mydb.GetDataTable(sqlstr);
            ProcessGrid.DataBind();

        }
        /*protected void CommentList_SelectedIndexChanged(object sender, EventArgs e)
        {
            ProcessComment.Text = CommentList.SelectedItem.Text;
        }*/


    }
}