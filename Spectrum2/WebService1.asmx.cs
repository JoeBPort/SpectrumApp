using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Services;
using System.Collections;
using System.Web.Script.Serialization;
using System.Configuration; 

namespace Spectrum2
{

    /// <summary>
    /// Summary description for WebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    
    [System.Web.Script.Services.ScriptService]
    public class WebService1 : System.Web.Services.WebService
    {
        
         string connection = ConfigurationManager.ConnectionStrings["SQLDbConnection"].ToString();

        
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string Populate()
        {
             DataTable dt = new DataTable();
             SqlConnection con = new SqlConnection(connection);
             
             SqlCommand cmd = new SqlCommand("SELECT CID, Fname, Lname, Address, City, State, Phone FROM Customers", con);
                 
                     con.Open();
                     SqlDataAdapter da = new SqlDataAdapter(cmd);
                     da.Fill(dt);
                     System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
                     List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
                     Dictionary<string, object> row;
                     foreach (DataRow dr in dt.Rows)
                     {
                         row = new Dictionary<string, object>();
                         foreach (DataColumn col in dt.Columns)
                         {
                             row.Add(col.ColumnName, dr[col]);
                         }
                         rows.Add(row);
                     }
                     con.Close();
                     return serializer.Serialize(rows);
                   
         }
       
        
         [WebMethod]
         [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
         public string newCustomer(string fname,
             string lname, string address, string city,
             string state, string phone)
         {
             SqlConnection con = new SqlConnection(connection);
             SqlCommand cmd;
            
                 con.Open();
                 cmd = con.CreateCommand();
                 cmd.CommandText = "INSERT INTO Customers (Fname,Lname,Address,City,State,Phone) VALUES(@Fname,@Lname,@Address,@City,@State,@Phone)";
                 cmd.Parameters.AddWithValue("@Fname", fname);
                 cmd.Parameters.AddWithValue("@Lname", lname);
                 cmd.Parameters.AddWithValue("@Address", address);
                 cmd.Parameters.AddWithValue("@City", city);
                 cmd.Parameters.AddWithValue("@State", state);
                 cmd.Parameters.AddWithValue("@Phone", phone);
                 cmd.ExecuteNonQuery();
                 con.Close();
                 return "Record Inserted Successfully";
             

      
         }
        

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string updateCustomer(int cid, string fname,
             string lname, string address, string city,
             string state, string phone)
        { 
            SqlConnection con = new SqlConnection(connection);

            SqlCommand cmd = new SqlCommand("UPDATE Customers SET Fname = @Fname, Lname = @Lname, Address = @Address, City = @City, State = @State, Phone = @Phone where CID = @CID" );

            cmd.Parameters.AddWithValue("@Fname", fname);
            cmd.Parameters.AddWithValue("@Lname", lname);
            cmd.Parameters.AddWithValue("@Address", address);
            cmd.Parameters.AddWithValue("@City", city);
            cmd.Parameters.AddWithValue("@State", state);
            cmd.Parameters.AddWithValue("@Phone", phone);
            cmd.Parameters.AddWithValue("@CID", cid);
    
           
            cmd.Connection = con;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            return "Record Updated Successfully";

        }
         

        


    }
}
