using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace test
{
    public partial class test_update : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string fullUsername = User.Identity.Name;
                int index_domain = fullUsername.IndexOf("AIB\\");
                string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);
                string qry = string.Empty;
                qry = "select Access_role from [userMng] where username='" + username + "'";
                string strConnString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;

                SqlConnection con = new SqlConnection(strConnString);
                con.Open();
                SqlCommand cd = new SqlCommand(qry, con);

                string Access_role = Convert.ToString(cd.ExecuteScalar());

                if (string.IsNullOrEmpty(Access_role))
                {
                    Response.Redirect("NotAuthorize.aspx?ReturnPath=" + Server.UrlEncode(Request.Url.AbsoluteUri));
                }
                //----------------------------------------------
                if (Session["olds_id"] != null)
                {

                    btnupdate.Text = "update";
                    lblMessage.Text = "UPDATE LAR RECORD";

                    //--------------------------------------------------------------   note should add from database           
                    Session["Id"].ToString();
                    txtdate.Text = Session["txtdate"].ToString();
                    txtfileupno.Text = Session["txtfileupno"].ToString();
                    txtbranchno.SelectedValue = Session["txtbranchno"].ToString();
                    txtcustomername.Text = Session["txtcustomername"].ToString();
                    txtbenefi.Text = Session["txtbenefi"].ToString();
                    txtgoods.Text = Session["txtgoods"].ToString();
                    txtinvoice.Text = Session["txtinvoice"].ToString();
                    txtamount.Text = Session["txtHOCCApprovalDate"].ToString();
                    txtcurrency.SelectedValue = Session["txtcurrency"].ToString();
                    txtcountry.SelectedValue = Session["txtcountry"].ToString();
                    txtaccr.SelectedValue = Session["txtaccr"].ToString();
                    txtshipdoc.Text = Session["txtshipdoc"].ToString();

                }

            }
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            //string fullUsername = User.Identity.Name;
            //int index_domain = fullUsername.IndexOf("AIB\\");
            //string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);
            //if (Page.IsValid)
            //{

            //    string connectionStringg = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
            //    using (SqlConnection sqlConn = new SqlConnection(connectionStringg))
            //    using (SqlConnection sqlConn1 = new SqlConnection(connectionStringg))
            //    {
            //        sqlConn.Open();
            //        string query = "INSERT INTO [dbo].[LAR_update]" +
            //            "(" +
            //            "Id," +
            //              "[Disbursementdate]" +
            //              ",[Borrower]" +
            //              ",[CaseNumber]" +
            //              ",[FacilityType]" +
            //              ",[facilityevent]" +
            //              ",[Ccy]" +
            //              ",[FacilityAmount]" +
            //              ",[HOCCApprovalDate]" +
            //              ",[CEO]" +
            //              ",[CFO]" +
            //              ",[BODRequirement]" +
            //              ",[BoDApprovalDate]" +
            //              ",[LutfullahRahmat]" +
            //              ",[HamidullahMohib]" +
            //              ",[HugoMinderhod]" +
            //              ",[RS]" +
            //              ",[SS]" +
            //              ",[MT]" +
            //              ",[AS]" +
            //              ",[FacilityStatus]" +
            //              ",[Remarks]" +
            //              ",[Updated By]" +
            //            ")" +
            //            " VALUES" +
            //            "(" +
            //            "@id," +
            //              "@txtdate," +
            //              "@txtBorrower," +
            //              "@txtCaseNo," +
            //              "@txtFacilityTypeList," +
            //              "@txtfacilityevent," +
            //              "@txtDropDownListCurrency," +
            //              "@txtfamount," +
            //              "@txtHOCCApprovalDate," +
            //              "@txtceo," +
            //              "@txtcfo," +
            //              "@txtBODRequirement," +
            //              "@txtBoDApprovalDate," +
            //              "@txtLutfullahRahmat," +
            //              "@txtHamidullahMohib," +
            //              "@txtHugoMinderhod," +
            //              "@txtRS," +
            //              "@txtSS," +
            //              "@txtMT," +
            //              "@txtAS," +
            //              "@txtFacilityStatus," +
            //              "@txtRemarks," +
            //            "@up_by); " +
            //            "INSERT INTO [dbo].[LAR_update1]" +
            //            "(" +
            //            "Id," +
            //              "[Disbursementdate]" +
            //              ",[Borrower]" +
            //              ",[CaseNumber]" +
            //              ",[FacilityType]" +
            //              ",[facilityevent]" +
            //              ",[Ccy]" +
            //              ",[FacilityAmount]" +
            //              ",[HOCCApprovalDate]" +
            //              ",[CEO]" +
            //              ",[CFO]" +
            //              ",[BODRequirement]" +
            //              ",[BoDApprovalDate]" +
            //              ",[LutfullahRahmat]" +
            //              ",[HamidullahMohib]" +
            //              ",[HugoMinderhod]" +
            //              ",[RS]" +
            //              ",[SS]" +
            //              ",[MT]" +
            //              ",[AS]" +
            //              ",[FacilityStatus]" +
            //              ",[Remarks]" +
            //              ",[Updated By]" +
            //            ")" +
            //            " VALUES" +
            //            "(" +
            //            "@id," +
            //              "@txtdate," +
            //              "@txtBorrower," +
            //              "@txtCaseNo," +
            //              "@txtFacilityTypeList," +
            //              "@txtfacilityevent," +
            //              "@txtDropDownListCurrency," +
            //              "@txtfamount," +
            //              "@txtHOCCApprovalDate," +
            //              "@txtceo," +
            //              "@txtcfo," +
            //              "@txtBODRequirement," +
            //              "@txtBoDApprovalDate," +
            //              "@txtLutfullahRahmat," +
            //              "@txtHamidullahMohib," +
            //              "@txtHugoMinderhod," +
            //              "@txtRS," +
            //              "@txtSS," +
            //              "@txtMT," +
            //              "@txtAS," +
            //              "@txtFacilityStatus," +
            //              "@txtRemarks," +
            //            "@up_by)";
            //        SqlCommand sqlcmd = new SqlCommand(query, sqlConn);
            //        sqlcmd.Parameters.AddWithValue("@id", Session["Id"].ToString());
            //        sqlcmd.Parameters.AddWithValue("@txtdate", txtdate.Text);
            //        sqlcmd.Parameters.AddWithValue("@txtBorrower", txtBorrower.Text);
            //        sqlcmd.Parameters.AddWithValue("@txtCaseNo", txtCaseNo.Text);
            //        sqlcmd.Parameters.AddWithValue("@txtFacilityTypeList", txtFacilityTypeList.Text);
            //        sqlcmd.Parameters.AddWithValue("@txtfacilityevent", txtfacilityevent.Text);
            //        sqlcmd.Parameters.AddWithValue("@txtDropDownListCurrency", txtDropDownListCurrency.SelectedValue);
            //        sqlcmd.Parameters.AddWithValue("@txtfamount", txtfamount.Text);
            //        sqlcmd.Parameters.AddWithValue("@txtHOCCApprovalDate", txtHOCCApprovalDate.Text);
            //        sqlcmd.Parameters.AddWithValue("@txtceo", txtceo.SelectedValue);
            //        sqlcmd.Parameters.AddWithValue("@txtcfo", txtcfo.SelectedValue);
            //        sqlcmd.Parameters.AddWithValue("@txtBODRequirement", txtBODRequirement.SelectedValue);
            //        sqlcmd.Parameters.AddWithValue("@txtBoDApprovalDate", txtBoDApprovalDate.Text);
            //        sqlcmd.Parameters.AddWithValue("@txtLutfullahRahmat", txtbodcharman.Text);
            //        sqlcmd.Parameters.AddWithValue("@txtHamidullahMohib", txtbod1.Text);
            //        sqlcmd.Parameters.AddWithValue("@txtHugoMinderhod", txtbod2.Text);
            //        sqlcmd.Parameters.AddWithValue("@txtRS", txtbod3.Text);
            //        sqlcmd.Parameters.AddWithValue("@txtSS", txtbod4.Text);
            //        sqlcmd.Parameters.AddWithValue("@txtMT", txtbod5.Text);
            //        sqlcmd.Parameters.AddWithValue("@txtAS", txtbod6.Text);
            //        sqlcmd.Parameters.AddWithValue("@txtFacilityStatus", txtFacilityStatus.SelectedValue);
            //        sqlcmd.Parameters.AddWithValue("@txtRemarks", txtRemarks.Text);
            //        sqlcmd.Parameters.AddWithValue("@up_by", username);
            //        //sqlCmd.ExecuteNonQuery();
            //        sqlcmd.ExecuteNonQuery();
            //        sqlConn.Close();
            //        sqlConn.Dispose();

            //    }
            //    lblMessage.Visible = true;
            //    lblMessage.Text = "The record updated. <br/> It needs your admin approval.";
            //    lblMessage.ForeColor = System.Drawing.Color.Green;

            //}

        }
    }
}


//USE[compliancetest]
//GO

///****** Object:  Table [dbo].[homes_1]    Script Date: 1/9/2022 2:41:00 PM ******/
//SET ANSI_NULLS ON
//GO

//SET QUOTED_IDENTIFIER ON
//GO

//CREATE TABLE[dbo].[homes_1]
//(

//   [id][int] IDENTITY(1,1) NOT NULL,

//  [sdate] [nvarchar] (50) NULL,
//	[fileupno] [nvarchar] (255) NULL,
//	[branchname] [nvarchar] (255) NULL,
//	[cname] [nvarchar] (255) NULL,
//	[acno] [nvarchar] (255) NULL,
//	[benname]
//[nvarchar]
//(max) NULL,

//    [amount] [nvarchar] (255) NULL,
//	[currency] [nvarchar] (255) NULL,
//	[country] [nvarchar] (255) NULL,
//	[accdrec] [nvarchar] (255) NULL,
//	[shdocrec] [nvarchar] (255) NULL,
//	[pletterr] [nvarchar] (255) NULL,
//	[scontactr] [nvarchar] (255) NULL,
//	[largr] [nvarchar] (255) NULL,
//	[duedate] [nvarchar] (255) NULL,
//	[extduedate] [nvarchar] (255) NULL,
//	[goods] [nvarchar] (255) NULL,
//	[invoice] [nvarchar] (255) NULL,
//	[extenddatedate] [nvarchar] (255) NULL,
//	[extreason] [nvarchar] (255) NULL,
//	[complete] [nvarchar] (255) NULL,
//	[cfileupno] [nvarchar] (255) NULL,
//	[incomplete] [nvarchar] (255) NULL,
//	[image]
//[nvarchar]
//(max) NULL,

//    [incocomment] [nvarchar] (255) NULL,
//	[employees_name] [nvarchar] (255) NULL,
//	[deleted_at] [nvarchar] (50) NULL,
// CONSTRAINT[PK_homes_1] PRIMARY KEY CLUSTERED
//(
//   [id] ASC
//)WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON[PRIMARY]
//) ON[PRIMARY] TEXTIMAGE_ON[PRIMARY]
//GO


