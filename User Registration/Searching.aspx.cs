using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Search
{
    public partial class DisplayRecords : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButSearch_Click(object sender, EventArgs e)
        {
            string mainconn = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(mainconn);
            sqlconn.Open();
            

            SqlCommand cmd = new SqlCommand("spsearch",sqlconn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@search_text", SqlDbType.VarChar).Value = Txtsearch.Text;
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();

            GridView2.Visible = false;  

        }
        protected void Button1_click(object sender, EventArgs e)
        {
            Response.Redirect("~/Registration.aspx");

        }

    }

}