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
    public partial class ChartDegreeWise : System.Web.UI.Page
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
                        string uniid = ddlUniversity.SelectedValue;
                        string instid = ddlInstitute.SelectedValue;
                        DataTable dtdegree = objStudentCount.getDegreeInfo(1, uniid, instid, "", "", "", "", "", "", "", "", "");
                        ddlDegree.DataValueField = "DegreeID";
                        ddlDegree.DataTextField = "DegreeAlias";
                        ddlDegree.DataSource = dtdegree;
                        ddlDegree.DataBind();
                        //  ddlDegree.SelectedValue = "149";
                    }


                    DataTable dtAcademicYear = objStudentCount.getAcademicYear(17, "", "", "", "", "", "", "", "");
                    if (dtAcademicYear != null && dtAcademicYear.Rows.Count > 0)
                    {
                        ddlAcademicYear.DataValueField = "YearCode";
                        ddlAcademicYear.DataTextField = "YearCode";
                        ddlAcademicYear.DataSource = dtAcademicYear;
                        ddlAcademicYear.DataBind();
                    }
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
        public static List<string> Get_DataFor_BindDegreeWithCast(string DegreeID, string InstituteID, string AcademicYear)
        {
            try
            {
                List<string> lst = new List<string>();
                StudentCountInfo objStudentCount = new StudentCountInfo();
                DataTable dtDegreeWithCast = objStudentCount.getStudentInfo(10, 0, AcademicYear, 0, "", 0, Convert.ToInt32(InstituteID), Convert.ToInt32(DegreeID), "");
                if (dtDegreeWithCast != null && dtDegreeWithCast.Rows.Count > 0)
                {
                    for (int i = 0; i < dtDegreeWithCast.Rows.Count; i++)
                    {
                        lst.Add(string.Format("{0}|{1}", dtDegreeWithCast.Rows[i].Field<string>("DataValue"), dtDegreeWithCast.Rows[i].Field<string>("TotalStudent")));
                    }

                }

                return lst;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        [WebMethod]
        public static List<string> Get_DataFor_BindDegreeWithActualCast(string DegreeID, string InstituteID, string AcademicYear)
        {
            try
            {
                List<string> lst = new List<string>();
                StudentCountInfo objStudentCount = new StudentCountInfo();
                DataTable dtDegreeWithCast = objStudentCount.getStudentInfo(11, 0, AcademicYear, 0, "", 0, Convert.ToInt32(InstituteID), Convert.ToInt32(DegreeID), "");
                if (dtDegreeWithCast != null && dtDegreeWithCast.Rows.Count > 0)
                {
                    for (int i = 0; i < dtDegreeWithCast.Rows.Count; i++)
                    {
                        lst.Add(string.Format("{0}|{1}", dtDegreeWithCast.Rows[i].Field<string>("DataValue"), dtDegreeWithCast.Rows[i].Field<string>("TotalStudent")));
                    }

                }

                return lst;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        [WebMethod]
        public static List<string> Get_DataFor_BindDegreeWithAdmissionType(string DegreeID, string InstituteID, string AcademicYear)
        {
            try
            {
                List<string> lst = new List<string>();
                StudentCountInfo objStudentCount = new StudentCountInfo();
                DataTable dtDegreeWithAdmissionType = objStudentCount.getStudentInfo(12, 0, AcademicYear, 0, "", 0, Convert.ToInt32(InstituteID), Convert.ToInt32(DegreeID), "");
                if (dtDegreeWithAdmissionType != null && dtDegreeWithAdmissionType.Rows.Count > 0)
                {
                    for (int i = 0; i < dtDegreeWithAdmissionType.Rows.Count; i++)
                    {
                        lst.Add(string.Format("{0}|{1}", dtDegreeWithAdmissionType.Rows[i].Field<string>("AdmissionType"), dtDegreeWithAdmissionType.Rows[i].Field<string>("TotalStudent")));
                    }

                }

                return lst;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        [WebMethod]
        public static List<string> Get_DataFor_BindDegreeWithGender(string DegreeID, string InstituteID, string AcademicYear)
        {
            try
            {
                List<string> lst = new List<string>();
                StudentCountInfo objStudentCount = new StudentCountInfo();
                DataTable dtDegreeWithAdmissionType = objStudentCount.getStudentInfo(13, 0, AcademicYear, 0, "", 0, Convert.ToInt32(InstituteID), Convert.ToInt32(DegreeID), "");
                if (dtDegreeWithAdmissionType != null && dtDegreeWithAdmissionType.Rows.Count > 0)
                {
                    for (int i = 0; i < dtDegreeWithAdmissionType.Rows.Count; i++)
                    {
                        lst.Add(string.Format("{0}|{1}", dtDegreeWithAdmissionType.Rows[i].Field<string>("Gender"), dtDegreeWithAdmissionType.Rows[i].Field<string>("TotalStudent")));
                    }

                }

                return lst;
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


        [WebMethod]
        public static List<string> Get_DataFor_BindDegreeInfo(string UnivID, string InstID)
        {
            try
            {
                List<string> lst = new List<string>();
                StudentCountInfo objStudentCount = new StudentCountInfo();

                DataTable dtDegree = objStudentCount.getDegreeInfo(1, UnivID, InstID, "", "", "", "", "", "", "", "", "");


                if (dtDegree != null && dtDegree.Rows.Count > 0)
                {
                    for (int i = 0; i < dtDegree.Rows.Count; i++)
                    {
                        lst.Add(string.Format("{0}|{1}", dtDegree.Rows[i].Field<string>("DegreeID").ToString(), dtDegree.Rows[i].Field<string>("DegreeAlias")));
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