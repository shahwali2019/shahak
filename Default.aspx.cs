using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace test
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubmitBtn_Click(object sender, EventArgs e)
        {


            string constr = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM homes_1 WHERE fileupno = @fileupno", con))
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        con.Open();
                        cmd.Parameters.AddWithValue("@fileupno", this.txtfileupno.Text.Trim());
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            this.lblMessage.Text = "sorry, you'er not able to insert deplicate DMS number!";
                        }
                        else
                        {
                            using (SqlConnection con2 = new SqlConnection(constr))
                            {
                                string fullUsername = User.Identity.Name;
                                string employees_name = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);
                                if (FileUpload1.HasFile)
                                {
                                    string str = FileUpload1.FileName;
                                    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Upload/" + str));
                                    string Image = "~/Upload/" + str.ToString();
                                    con2.Open();

                                    string ins = "insert into homes_1 (sdate, fileupno,branchname,cname,acno,benname,amount,currency,country,accdrec,shdocrec,pletterr,scontactr,image, employees_name) values" +
                                      " ('" + txtdate.Text.ToString() + "', '" + txtfileupno.Text.ToString() + "' ," +
                                      " '" + txtbranchno.Text.ToString() + "'," + " '" + txtcustomername.Text.ToString() + "', " +
                                      "'" + txtaccno.Text.ToString() + "', '" + txtbenefi.Text.ToString() + "'," +
                                      " '" + txtamount.Text.ToString() + "', '" + txtcurrency.Text.ToString() + "' ," +
                                      " '" + txtcountry.Text.ToString() + "' , '" + txtaccr.Text.ToString() + "'," +
                                      " '" + txtshipdoc.Text.ToString() + "', '" + txtgoods.Text.ToString() + "', '" + txtinvoice.Text.ToString() + "'," +
                                      " '" + Image + "', '" + employees_name + "')";
                                    SqlCommand com = new SqlCommand(ins, con2);
                                    com.ExecuteNonQuery();

                                    //GridView1.DataBind();
                                    Label1.Visible = true;
                                    Label1.Text = "Successfully added new customer!";
                                }
                                else
                                {
                                    Label1.Text = "Please Upload your Image";
                                    Label1.ForeColor = System.Drawing.Color.Red;
                                }
                                txtdate.Text = "";
                                txtfileupno.Text = "";
                                txtbranchno.Text = "";
                                txtaccno.Text = "";
                                txtamount.Text = "";
                                txtcountry.Text = "";
                                txtshipdoc.Text = "";
                                txtgoods.Text = "";
                                txtcustomername.Text = "";
                                txtbenefi.Text = "";
                                txtcurrency.Text = "";
                                txtaccr.Text = "";
                                txtinvoice.Text = "";
                                txtdate.Focus();
                            }
                        }
                        //this.lblMessage.Text = "Data Inserted";
                    }

                }
            }
        }

        protected void btnBack_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void search_Click(object sender, EventArgs e)
        {

        }
    }
}