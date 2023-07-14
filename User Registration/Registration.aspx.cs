using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace User_Registration
{
    
    public partial class Registration : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                BindStateddl();

            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("spInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
           
            cmd.Parameters.Add("@user_name", SqlDbType.VarChar).Value = UserNameTextBox.Text;
            cmd.Parameters.Add("@email_address", SqlDbType.VarChar).Value = EmailAddressTextBox.Text;
            cmd.Parameters.Add("@dob", SqlDbType.Date).Value = DOBTextBox.Text;
            cmd.Parameters.Add("@mobile_number", SqlDbType.VarChar).Value = MobileNumberTextBox.Text;
            cmd.Parameters.Add("@state_id", SqlDbType.VarChar).Value = stateDropDownList1.Text;
            cmd.Parameters.Add("@city_id", SqlDbType.VarChar).Value = cityDropDownList2.Text;
            con.Open();
            cmd.ExecuteNonQuery();
            
            con.Close();
            Response.Write("<script>alert('Registration Done' )</script>");
            
            
        }
        void BindStateddl()
        {
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand objcmd = new SqlCommand("spgetstate", con);
            objcmd.CommandType = CommandType.StoredProcedure;


            DataTable data = new DataTable();
            data.Load(objcmd.ExecuteReader());
            stateDropDownList1.DataSource = data;
            stateDropDownList1.DataTextField = "state_name";
            stateDropDownList1.DataValueField = "state_id";
            stateDropDownList1.DataBind();
            ListItem selectitem=new ListItem("Select State","Select State");
            selectitem.Selected = true;
            stateDropDownList1.Items.Insert(0, selectitem);
            con.Close();
        }
        void Bindcityddl()
        {
            SqlConnection con = new SqlConnection(cs);

            SqlCommand objcmd = new SqlCommand("spGetCitiesByState", con);
            objcmd.CommandType = CommandType.StoredProcedure;

            objcmd.Parameters.Add("@StateId", SqlDbType.Int).Value = stateDropDownList1.Text;
            con.Open();
            DataTable data = new DataTable();
            data.Load(objcmd.ExecuteReader());
            cityDropDownList2.DataSource = data;
            cityDropDownList2.DataTextField = "city_name";
            cityDropDownList2.DataValueField = "city_id";
            cityDropDownList2.DataBind();
            ListItem selectitem = new ListItem("Select City", "Select City");
            selectitem.Selected = true;
            cityDropDownList2.Items.Insert(0, selectitem);
            con.Close();
        }
        protected void stateDropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Bindcityddl();

        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("~/Searching.aspx");
           

        }
        }
}