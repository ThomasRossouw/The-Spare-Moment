using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Xceed.Wpf.Toolkit;

namespace asp.netcrud
{
    public partial class Registration : System.Web.UI.Page
    {
        // connection string to the Database
        SqlConnection sqlCon = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;Initial Catalog=Time;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // after pressing the save button the fields will clear allowing the User to start it again
        // this  is regrdless of the success or unsuccessful message
        public void Clear()
        {
            hfContactID.Value = "";
            
            lblSuccessMessage.Text = lblErrorMessage.Text = "";
            btnSave.Text = "Save";
            
        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                string pass = txtPassword.Text;
                string hash = EncryptPassword(pass);

                sqlCon.Open();
                // input the user input into the database along with the hashed password
                SqlCommand com = new SqlCommand("exec dbo.Tj_Userlogin '" + txtUsername.Text + "','" + hash + "','" + txtFirstname.Text + "','" + txtLastname.Text + "'", sqlCon);
                com.ExecuteNonQuery();

                /* Gives the User the all clear letting them know that the Username and password is
                 * unique and can be used
                 */
                lblSuccessMessage.Text = "Account Has Been Created Successfully";

                

            }
            /* Notifies the User that the Username they want to register with is already in use
             * Gives them the option to reenter a unique Username
             */

            catch
            {
                lblErrorMessage.Text = "Username is Already in Use";
            }
        }

        /*
         * Hashing of the password into the database
         * Added in Task 2 and allows the User to know their password without
         * employees knowing.
         * 
         */

        static string EncryptPassword(string pass)
        {
            byte[] bytes = System.Text.Encoding.ASCII.GetBytes(pass);
            byte[] hashed = System.Security.Cryptography.MD5.Create().ComputeHash(bytes);
            return Convert.ToBase64String(hashed);

        }


    }
}