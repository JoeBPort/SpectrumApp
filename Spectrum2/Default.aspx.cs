using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration; 

namespace Spectrum2
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string connectionString = ConfigurationManager.ConnectionStrings["SQLDbConnection"].ToString();
            //SqlConnection conn = new SqlConnection(connectionString);
            //conn.Open();

            /*try
            {
                SqlDataReader myReader = null;
                SqlCommand myCommand = new SqlCommand("select * from Customers",
                                                         conn);
                myReader = myCommand.ExecuteReader();
                while (myReader.Read())
                {
                    Console.WriteLine(myReader["Column1"].ToString());
                    Console.WriteLine(myReader["Column2"].ToString());
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.ToString());
            }


            //SqlCommand cmd = new conn.CreateCommand();
            //cmd.CommandText = "SELECT * FROM Customers";
            */
           // Label1.Text = "Connected to Database Server !!";
            //conn.Close();
             
            
        }

      
    }
}
