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
    public partial class MaterialAdd : System.Web.UI.Page
    {
        dbClass mydb = new dbClass();
        public static DataTable mat_table;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {   //沒登入就導到 default
                if (Session["Emp_Name"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                else
                    Response.Redirect("~/MaterialCheck.aspx");
                /*抓取料名*/
                prepareMaterial(); 
                /*抓廠商名*/
                prepareVendor();
                /*付款方式名稱*/
                preparePay();
                getDetail();
            }
        }
        /*抓取料名*/
        void prepareMaterial()
        {
            string sqlstr = "select '' as Mat_Id, '請選擇品項' as Mat_Name union(select Mat_Id, Mat_Name from Material) order by Mat_id";
            mat_id_List.DataSource = mydb.GetDataTable(sqlstr);
            mat_id_List.DataBind();
        }

        /*抓取廠商名*/
        void prepareVendor()
        {
            string sqlstr = "select '' as Vendor_Id, '請選擇廠商' as Vendor_Name union(select Vendor_Id, Vendor_Name from Vendor) order by Vendor_id";
            Vendor_id_List.DataSource = mydb.GetDataTable(sqlstr);
            Vendor_id_List.DataBind();
        }
        /*抓付款方式名稱*/
        void preparePay()
        {
            string sqlstr = "select '' as pay_Id, '請選擇付款方式' as pay_Name union(select pay_Id, pay_Name from Pay) order by pay_Id";
            pay_id_List.DataSource = mydb.GetDataTable(sqlstr);
            pay_id_List.DataBind();
        }


        void getDetail()
        {

            /*抓料品單價*/
            string sqlstr = "select price from Material where Mat_Name= '" + mydb.qo(mat_id_List.SelectedValue.Trim()) + "'";
            DataTable myTable = mydb.GetDataTable(sqlstr);
            Response.Write(sqlstr);

            /*抓單價*/
            Single_price.Text = myTable.Rows[0]["price"].ToString().Trim();

            /*下單人員，抓登入帳號*/
            Emp_Id.Text = Session["Emp_Name"].ToString().Trim();

            /*進貨日期、入庫日期、數量、備註*/

            /*計算總金額*/
            int count = 0;
            int qtyCount = 0;
            for (int i = 0; i < mat_table.Rows.Count; i++)
            {
                mat_table.Rows[i]["Id"] = i + 1;
                int qty = int.Parse(mat_table.Rows[i]["qty"].ToString());
                qtyCount += qty;
                count += (int.Parse(mat_table.Rows[i]["price"].ToString()) * qty);
            }
            /*顯示總金額*/
            price.Text = count.ToString() + "元";
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MaterialCheck.aspx");
        }
        protected void confirm_Click(object sender, EventArgs e)
        {
           

            Response.Redirect("student.aspx");

        }


    }

}
