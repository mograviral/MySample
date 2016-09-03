using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using ChartBLL;
using System.Web.Services;
namespace WebSolutionChart
{
    public partial class DailyCollectionBarChart : System.Web.UI.Page
    {
        StudentCountInfo objStudentCount = new StudentCountInfo();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    List<string> lst = new List<string>();
                    DataTable dtoraganization = objStudentCount.getOraganizationInfo(1, "", "", "", "", "", "", "", "");
                    ddlUniversity.DataValueField = "OrgID";
                    ddlUniversity.DataTextField = "OrgName";
                    ddlUniversity.DataSource = dtoraganization;
                    ddlUniversity.DataBind();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        [WebMethod]
        public static List<string> Get_DataFor_DailyCollection(string UnivID, string Daybooktype, string Startdate,string Enddate)
        {
            try
            {
                List<string> lst = new List<string>();
                StudentCountInfo objStudentCount = new StudentCountInfo();
                DateTime dt = new DateTime();
                dt = Convert.ToDateTime(Startdate);
                DataTable dtDailyCollection = objStudentCount.getDailyCollectionInstitutewise(1,Convert.ToInt32(UnivID), Daybooktype, Startdate, Enddate);
                if (dtDailyCollection != null && dtDailyCollection.Rows.Count > 0)
                {
                    for (int i = 0; i < dtDailyCollection.Rows.Count; i++)
                    {
                        lst.Add(string.Format("{0}|{1}", dtDailyCollection.Rows[i].Field<string>("SubOrgCode"), dtDailyCollection.Rows[i].Field<string>("TotalAmount")));
                    }
                }

                return lst;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}