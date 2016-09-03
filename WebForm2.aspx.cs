using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using ChartBLL;
namespace WebSolutionChart
{
    public partial class WebForm2 : System.Web.UI.Page
    {
      //  StudentCountInfo objStudentCount = new StudentCountInfo();
        protected void Page_Load(object sender, EventArgs e)
        {

        
          
            //try
            //{
            //    if (!IsPostBack)
            //    {
            //        List<string> lst = new List<string>();
            //        DataTable dtoraganization = objStudentCount.getOraganizationInfo(1, "", "", "", "", "", "", "", "");
            //        ddlUniversity.DataValueField = "OrgID";
            //        ddlUniversity.DataTextField = "OrgName";
            //        ddlUniversity.DataSource = dtoraganization;
            //        ddlUniversity.DataBind();

            //        if (ddlUniversity.SelectedValue != "" && ddlUniversity != null)
            //        {
            //            string uniid = ddlUniversity.SelectedValue;
            //            DataTable dtInstitute = objStudentCount.getInstituteInfo(13, uniid, "", "", "", "", "", "", "");
            //            ddlInstitute.DataValueField = "InstituteID";
            //            ddlInstitute.DataTextField = "Alias";
            //            ddlInstitute.DataSource = dtInstitute;
            //            ddlInstitute.DataBind();
            //        }
            //        if (ddlInstitute.SelectedValue != "" && ddlInstitute != null)
            //        {
            //            string uniid = ddlUniversity.SelectedValue;
            //            string instid = ddlInstitute.SelectedValue;
            //            DataTable dtdegree = objStudentCount.getDegreeInfo(1, uniid, instid, "", "", "", "", "", "", "", "", "");
            //            ddlDegree.DataValueField = "DegreeID";
            //            ddlDegree.DataTextField = "DegreeAlias";
            //            ddlDegree.DataSource = dtdegree;
            //            ddlDegree.DataBind();
            //            //  ddlDegree.SelectedValue = "149";
            //        }


            //        DataTable dtAcademicYear = objStudentCount.getAcademicYear(17, "", "", "", "", "", "", "", "");
            //        if (dtAcademicYear != null && dtAcademicYear.Rows.Count > 0)
            //        {
            //            ddlAcademicYear.DataValueField = "YearCode";
            //            ddlAcademicYear.DataTextField = "YearCode";
            //            ddlAcademicYear.DataSource = dtAcademicYear;
            //            ddlAcademicYear.DataBind();
            //        }
            //        // ddlAcademicYear.SelectedValue = "149";



            //    }
            //    else
            //    {

            //    }

            //}
            //catch (Exception ex)
            //{
            //    throw ex;
            //}
        }
    }
}