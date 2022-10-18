using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Calculation; // using the Calculation class for the calculations
using Module; // using the Module class for the gets and sets


namespace asp.netcrud
{ /* References 
 * 
 * XAML Management idea
 * https://youtu.be/7YWz44JANEY (Part 1)
 * https://www.youtube.com/watch?v=hGS91tS9aC8 (Part 2)
 * https://stackoverflow.com/questions/39118665/setting-binding-source-properly-in-xaml
 *  
 * Listbox Idea
 * https://www.c-sharpcorner.com/UploadFile/mahesh/listbox-in-wpf/
 * https://nicksnettravels.builttoroam.com/xaml-basics-listbox-listview/
 * 
 * VC Resources 
 * https://myvc.iielearn.ac.za/webapps/blackboard/content/listContent.jsp?course_id=_119724_1&content_id=_10394175_1&mode=reset
 * 
 * Logo Creation 
 * https://www.canva.com/create/logos/ 
 * 
 * Background Image 
 * https://cdn.wallpapersafari.com/97/20/F5DH7p.jpg
 * 
 * MessageBox Ideas
 * https://www.c-sharpcorner.com/UploadFile/mahesh/messagebox-in-wpf/
 * https://stackoverflow.com/questions/34046617/how-to-use-the-result-from-a-yes-no-messagebox
 * 
 * Splash Screen (Although not used still used as a reference)
 * https://www.youtube.com/watch?v=BswTPRSTh4c with custom progress bar.
 * https://www.youtube.com/watch?v=fPpYilRalHk with custom progress bar.
 * 
 * Login & Registration
 * https://www.youtube.com/watch?v=t4Kg62UeSws 
 * 
 * Icons 
 * http://materialdesigninxaml.net/
 * https://dragablz.net/2016/01/18/icon-pack-material-design-in-xaml-1-4/
 * https://materialdesignicons.com/
 * 
 * Color Scheme
 * https://www.w3schools.com/colors/colors_gradient.asp
 * 
 * Wallpaper  
 * https://wallpapercave.com/wp/wp2632423.jpg
 * 
 * ASP.net 
 * https://www.w3schools.com/asp/webpages_intro.asp
 * https://docs.microsoft.com/en-us/aspnet/core/client-side/spa/angular?WT.mc_id=dotnet-35129-website&view=aspnetcore-6.0&tabs=visual-studio
 * https://dotnet.microsoft.com/apps/aspnet/web-apps
 * https://stackoverflow.com/questions/60477121/system-data-sqlclient-sqlexception-error-converting-data-type-nvarchar-to-date
 * https://stackoverflow.com/questions/41867371/error-converting-data-type-nvarchar-to-datetime-sql-server/41867420
 * 
 */
    public partial class Contact : System.Web.UI.Page
    {
        // connection string to the Database
        SqlConnection sqlCon = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;Initial Catalog=Time;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnDelete.Enabled = false;
                FillGridView();
            }
        }
        // the clear button clears all the fields allowing the User to reenter data
        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }

        public void Clear()
        {
            hfContactID.Value = "";
            txtCode.Text = txtModuleName.Text = txtCode.Text = txtCredits.Text = txtHoursWeek.Text = txtWeeks.Text = txtHoursSpent.Text = "";
            lblSuccessMessage.Text = lblErrorMessage.Text = "";
            btnSave.Text = "Save";
            btnDelete.Enabled = false;
        }
        // pressing the save button allows the user to have their inputted data entered into the 
        // databae and have it shown in both a graph and in grid view.
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                Modules ii = new Modules();
                calculate cal = new calculate();


                ii.Credits = Convert.ToInt32(txtCredits.Text);
                ii.classhours = Convert.ToInt32(txtHoursWeek.Text);
                ii.numWeeks = Convert.ToInt32(txtWeeks.Text);
                ii.numHours = Convert.ToInt32(txtHoursSpent.Text);


                double i = cal.Calc(ii.Credits, ii.numWeeks, ii.numHours);

                double remainingHours = i - ii.numHours;
                int remaining = Convert.ToInt32(remainingHours);

                int selfStudyHours = Convert.ToInt32(i);


                if (sqlCon.State == ConnectionState.Closed)
                    sqlCon.Open();
                SqlCommand sqlCmd = new SqlCommand("ModuleCreationOrUpdation", sqlCon);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.AddWithValue("@MODULE_ID", (hfContactID.Value == "" ? 0 : Convert.ToInt32(hfContactID.Value)));
                sqlCmd.Parameters.AddWithValue("@MODULE_NAME", txtModuleName.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@MODULE_CODE", txtCode.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@MODULE_CREDITS", txtCredits.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@MODULE_HOURS_WEEK", txtHoursWeek.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@MODULE_WEEKS", txtWeeks.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@MODULE_HOURS_SPENT", txtHoursSpent.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@MODULE_START", txtDate.SelectedDate);
                sqlCmd.Parameters.AddWithValue("@SELF_STUDY", selfStudyHours);
                sqlCmd.Parameters.AddWithValue("@WEEK_STUDY_HOURS_REMAINING", remaining);
                sqlCmd.Parameters.AddWithValue("@USERNAME", txtUser.Text.Trim());
                sqlCmd.ExecuteNonQuery();
                sqlCon.Close();
                string contactID = hfContactID.Value;
                Clear();
                if (contactID == "")
                    lblSuccessMessage.Text = "Save was Successfully";
                else
                    lblSuccessMessage.Text = "Update was Successfully";
                FillGridView();
            }
            catch
            {
                lblErrorMessage.Text = "Please Ensure that all the fields are fulled";
            }


        }

        void FillGridView()
        {

            

            
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();


            string query = "select * from Module WHERE UserName=@USERNAME";
            SqlCommand com = new SqlCommand(query, sqlCon);
            com.Parameters.AddWithValue("@USERNAME", txtUser.Text);
            com.ExecuteNonQuery();



            SqlDataAdapter sqlDa = new SqlDataAdapter(com);
            
            DataTable dtbl = new DataTable("Module");
            sqlDa.Fill(dtbl);
            sqlCon.Close();
            gvContact.DataSource = dtbl;
            gvContact.DataBind();
        
        }

        protected void lnk_OnClick(object sender, EventArgs e)
        {
            int contactID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("ModuleIView", sqlCon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@MODULE_ID", contactID);
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlCon.Close();
            hfContactID.Value = contactID.ToString();
            txtCode.Text = dtbl.Rows[0]["ModuleCode"].ToString();
            txtModuleName.Text = dtbl.Rows[0]["ModuleName"].ToString();
            txtCredits.Text = dtbl.Rows[0]["ModuleCredits"].ToString();
            txtHoursWeek.Text = dtbl.Rows[0]["ModuleHrsPerWeek"].ToString();
            txtWeeks.Text = dtbl.Rows[0]["ModuleWeeks"].ToString();
            txtHoursSpent.Text = dtbl.Rows[0]["HrsSpent"].ToString();
           
            btnSave.Text = "Update";
            btnDelete.Enabled = true;
        }

        // the Delete button allows the user to delete a data entry 
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlCommand sqlCmd = new SqlCommand("ModuleDelete",sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@Module_ID",Convert.ToInt32(hfContactID.Value));
            sqlCmd.ExecuteNonQuery();
            sqlCon.Close();
            Clear();
            FillGridView();
            lblSuccessMessage.Text = "Delete Was Successfully";
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        
        static string EncryptPassword(string pass)
        {
            byte[] bytes = System.Text.Encoding.ASCII.GetBytes(pass);
            byte[] hashed = System.Security.Cryptography.MD5.Create().ComputeHash(bytes);
            return Convert.ToBase64String(hashed);

        }
        // the user logs in and it is aligned with the database information granting access 
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            
                sqlCon.Open();



                //verification of user details

                SqlCommand check_User_Name = new SqlCommand("SELECT COUNT(*) FROM [Users] WHERE ([UserName] = @USERNAME and [Password] = @PASSWORD)", sqlCon);
                string pass = txtPass.Text;
                string hash = EncryptPassword(pass);
                check_User_Name.Parameters.AddWithValue("@USERNAME", txtUser.Text);
                check_User_Name.Parameters.AddWithValue("@PASSWORD", hash);
                int UserExist = (int)check_User_Name.ExecuteScalar();


                

            // Details are either entered incorrectly or they gain access
            if (UserExist > 0)
            {
                //Username exist
                lblSuccessMessage.Text = "Login Was Successful";
                lblErrorMessage.Text = "";
                FillGridView();
            }
            else
            {
                //Username doesn't exist.
                lblErrorMessage.Text = "Login Error. Please Double Check your Username or Password.";
                lblSuccessMessage.Text = "";
            }
            sqlCon.Close();


        }
    }
}