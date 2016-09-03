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
    public partial class TotalStudentLineChart : System.Web.UI.Page
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

                    if (ddlUniversity.SelectedValue != "" && ddlUniversity != null)
                    {
                        string uniid = ddlUniversity.SelectedValue;
                        DataTable dtInstitute = objStudentCount.getInstituteInfo(13, uniid, "", "", "", "", "", "", "");
                        ddlInstitute.DataValueField = "InstituteID";
                        ddlInstitute.DataTextField = "Alias";
                        ddlInstitute.DataSource = dtInstitute;
                        ddlInstitute.DataBind();
                    }
                    if (ddlInstitute.SelectedValue != "" && ddlInstitute != null)
                    {
                        //string uniid = ddlUniversity.SelectedValue;
                        //string instid = ddlInstitute.SelectedValue;
                        //DataTable dtdegree = objStudentCount.getDegreeInfo(1, uniid, instid, "", "", "", "", "", "", "", "", "");
                        //ddlDegree.DataValueField = "DegreeID";
                        //ddlDegree.DataTextField = "DegreeAlias";
                        //ddlDegree.DataSource = dtdegree;
                        //ddlDegree.DataBind();
                        //  ddlDegree.SelectedValue = "149";
                    }


                    //DataTable dtAcademicYear = objStudentCount.getAcademicYear(17, "", "", "", "", "", "", "", "");
                    //if (dtAcademicYear != null && dtAcademicYear.Rows.Count > 0)
                    //{
                    //    ddlAcademicYear.DataValueField = "YearCode";
                    //    ddlAcademicYear.DataTextField = "YearCode";
                    //    ddlAcademicYear.DataSource = dtAcademicYear;
                    //    ddlAcademicYear.DataBind();
                    //}
                    // ddlAcademicYear.SelectedValue = "149";



                }
                else
                {

                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }




        [WebMethod]
        public static List<string> Get_DataFor_BindTotalStudentsYearWise(string InstituteID)
        {
            try
            {
                List<string> lst = new List<string>();
                StudentCountInfo objStudentCount = new StudentCountInfo();
                DataTable dtTotalStudent = objStudentCount.getTotalAdmissionStudentsYearwise(1,Convert.ToInt32(InstituteID));
              //  dtTotalStudent.Select(
                DataRow[] dtAcademicYearRaw =new DataRow[20];
             
                DataTable dtAcademicYear = new DataTable();
                if (dtTotalStudent.Rows.Count > 0 && dtTotalStudent != null)
                {
                     dtAcademicYearRaw = dtTotalStudent.Select("", "AcademicYear asc");
                     dtAcademicYear = dtAcademicYearRaw.CopyToDataTable().DefaultView.ToTable(true, "AcademicYear");
                }

                // dtAcademicYear.DefaultView.Sort = "occr desc";
                       //          dtAcademicYear.Select("AcademicYear","Asc");
                DataTable dtDegrees = dtTotalStudent.DefaultView.ToTable(true, "Degree");
                List<string> lstTotalStudentCount = new List<string>();
                string strstdcount = "";
                string strAcademicYear = "";

                if (dtAcademicYear.Rows.Count > 0 && dtAcademicYear != null)
                {
                    for (int i = 0; i < dtAcademicYear.Rows.Count; i++)
                    {
                        strAcademicYear = strAcademicYear + "'" + dtAcademicYear.Rows[i].Field<string>("AcademicYear") + "',";
                    }
                    lstTotalStudentCount.Add(string.Format("{0}", strAcademicYear));
                }

          
                int n = 0;
                for (int j = 0; j < dtDegrees.Rows.Count; j++)
                {
                    while (n < dtAcademicYear.Rows.Count)
                    {
                        // dtDegreeWithCast.Select(
                        string strexp = "AcademicYear = '" + dtAcademicYear.Rows[n].Field<string>("AcademicYear") + "'and Degree ='" + dtDegrees.Rows[j].Field<string>("Degree") + "'";
                        DataRow[] dr = dtTotalStudent.Select(strexp, "AcademicYear");
                        if (dr.Count() > 0)
                        {
                            strstdcount = strstdcount + dr[0].Field<string>("TotalStudent") + ",";
                            n++;
                        }
                        else
                        {
                            strstdcount = strstdcount + "0,";
                            n++;
                        }

                    }
                    n = 0;
                    lstTotalStudentCount.Add(string.Format("{0}|{1}", dtDegrees.Rows[j].Field<string>("Degree"), strstdcount));
                    strstdcount = "";
                }

                return lstTotalStudentCount;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        [WebMethod]
        public static List<string> Get_DataFor_BindInstituteInfo(string UnivID)
        {
            try
            {
                List<string> lst = new List<string>();
                StudentCountInfo objStudentCount = new StudentCountInfo();

                DataTable dtInstitute = objStudentCount.getInstituteInfo(13, UnivID, "", "", "", "", "", "", "");


                if (dtInstitute != null && dtInstitute.Rows.Count > 0)
                {
                    for (int i = 0; i < dtInstitute.Rows.Count; i++)
                    {
                        lst.Add(string.Format("{0}|{1}", dtInstitute.Rows[i].Field<string>("InstituteID").ToString(), dtInstitute.Rows[i].Field<string>("Alias")));
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