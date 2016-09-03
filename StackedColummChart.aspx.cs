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
    public partial class StackedColummChart : System.Web.UI.Page
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
        public static List<string> Get_DataFor_BindDegreeWithCast(string InstituteID, string AcademicYear)
        {
            try
            {
                List<string> lst = new List<string>();
                StudentCountInfo objStudentCount = new StudentCountInfo();
                DataTable dtDegreeWithCast = objStudentCount.getStudentInfoForStackChart(1, 0, AcademicYear, 0, "", 0, Convert.ToInt32(InstituteID), "");
                DataTable dtDegrees = dtDegreeWithCast.DefaultView.ToTable(true, "Degree");
                DataTable dtCastCategory = dtDegreeWithCast.DefaultView.ToTable(true, "DataValue");
                List<string> lstTotalStudentCount = new List<string>();
                string strstdcount = "";
                string strdegrees = "";
                int n = 0;
                if (dtDegrees.Rows.Count > 0 && dtDegrees != null)
                {
                    for (int i = 0; i < dtDegrees.Rows.Count; i++)
                    {
                        strdegrees = strdegrees + "'" + dtDegrees.Rows[i].Field<string>("Degree") + "',";
                    }
                    lstTotalStudentCount.Add(string.Format("{0}", strdegrees));
                }

                for (int j = 0; j < dtCastCategory.Rows.Count; j++)
                {
                    while (n < dtDegrees.Rows.Count)
                    {
                      // dtDegreeWithCast.Select(
                      string strexp = "Degree = '" + dtDegrees.Rows[n].Field<string>("Degree") + "' and DataValue ='" + dtCastCategory.Rows[j].Field<string>("DataValue")+"'";
                      DataRow[] dr = dtDegreeWithCast.Select(strexp, "Degree");
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
                    lstTotalStudentCount.Add(string.Format("{0}|{1}", dtCastCategory.Rows[j].Field<string>("DataValue"), strstdcount));
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
        public static List<string> Get_DataFor_BindDegreeWithActualCast(string InstituteID, string AcademicYear)
        {
            try
            {
                List<string> lst = new List<string>();
                StudentCountInfo objStudentCount = new StudentCountInfo();
                DataTable dtDegreeWithCast = objStudentCount.getStudentInfoForStackChart(2, 0, AcademicYear, 0, "", 0, Convert.ToInt32(InstituteID), "");

                DataTable dtDegrees = dtDegreeWithCast.DefaultView.ToTable(true, "Degree");
                DataTable dtCastCategory = dtDegreeWithCast.DefaultView.ToTable(true, "DataValue");
                List<string> lstTotalStudentCount = new List<string>();
                string strstdcount = "";
                string strdegrees = "";

                if (dtDegrees.Rows.Count > 0 && dtDegrees != null)
                {
                    for (int i = 0; i < dtDegrees.Rows.Count; i++)
                    {
                        strdegrees = strdegrees + "'" + dtDegrees.Rows[i].Field<string>("Degree") + "',";
                    }
                    lstTotalStudentCount.Add(string.Format("{0}", strdegrees));
                }

                int n = 0;
                for (int j = 0; j < dtCastCategory.Rows.Count; j++)
                {
                    while (n < dtDegrees.Rows.Count)
                    {
                        // dtDegreeWithCast.Select(
                        string strexp = "Degree = '" + dtDegrees.Rows[n].Field<string>("Degree") + "' and DataValue ='" + dtCastCategory.Rows[j].Field<string>("DataValue") + "'";
                        DataRow[] dr = dtDegreeWithCast.Select(strexp, "Degree");
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
                    lstTotalStudentCount.Add(string.Format("{0}|{1}", dtCastCategory.Rows[j].Field<string>("DataValue"), strstdcount));
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
        public static List<string> Get_DataFor_BindDegreeWithAdmissionType(string InstituteID, string AcademicYear)
        {
            try
            {
                List<string> lst = new List<string>();
                StudentCountInfo objStudentCount = new StudentCountInfo();
                DataTable dtDegreeWithCast = objStudentCount.getStudentInfoForStackChart(3, 0, AcademicYear, 0, "", 0, Convert.ToInt32(InstituteID), "");

                DataTable dtDegrees = dtDegreeWithCast.DefaultView.ToTable(true, "Degree");
                DataTable dtCastCategory = dtDegreeWithCast.DefaultView.ToTable(true, "AdmissionType");
                List<string> lstTotalStudentCount = new List<string>();
                string strstdcount = "";
                string strdegrees = "";

                if (dtDegrees.Rows.Count > 0 && dtDegrees != null)
                {
                    for (int i = 0; i < dtDegrees.Rows.Count; i++)
                    {
                        strdegrees = strdegrees + "'" + dtDegrees.Rows[i].Field<string>("Degree") + "',";
                    }
                    lstTotalStudentCount.Add(string.Format("{0}", strdegrees));
                }

                int n = 0;
                for (int j = 0; j < dtCastCategory.Rows.Count; j++)
                {
                    while (n < dtDegrees.Rows.Count)
                    {
                        // dtDegreeWithCast.Select(
                        string strexp = "Degree = '" + dtDegrees.Rows[n].Field<string>("Degree") + "' and DataValue ='" + dtCastCategory.Rows[j].Field<string>("DataValue") + "'";
                        DataRow[] dr = dtDegreeWithCast.Select(strexp, "Degree");
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
                    lstTotalStudentCount.Add(string.Format("{0}|{1}", dtCastCategory.Rows[j].Field<string>("DataValue"), strstdcount));
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
        public static List<string> Get_DataFor_BindDegreeWithGender(string InstituteID, string AcademicYear)
        {
            try
            {
                List<string> lst = new List<string>();
                StudentCountInfo objStudentCount = new StudentCountInfo();
                DataTable dtDegreeWithCast = objStudentCount.getStudentInfoForStackChart(4, 0, AcademicYear, 0, "", 0, Convert.ToInt32(InstituteID), "");

                DataTable dtDegrees = dtDegreeWithCast.DefaultView.ToTable(true, "Degree");
                DataTable dtCastCategory = dtDegreeWithCast.DefaultView.ToTable(true, "Gender");
                List<string> lstTotalStudentCount = new List<string>();
                string strstdcount = "";
                string strdegrees = "";

                if (dtDegrees.Rows.Count > 0 && dtDegrees != null)
                {
                    for (int i = 0; i < dtDegrees.Rows.Count; i++)
                    {
                        strdegrees = strdegrees + "'" + dtDegrees.Rows[i].Field<string>("Degree") + "',";
                    }
                    lstTotalStudentCount.Add(string.Format("{0}", strdegrees));
                }

           

                int n = 0;
                for (int j = 0; j < dtCastCategory.Rows.Count; j++)
                {
                    while (n < dtDegrees.Rows.Count)
                    {
                        // dtDegreeWithCast.Select(
                        string strexp = "Degree = '" + dtDegrees.Rows[n].Field<string>("Degree") + "' and DataValue ='" + dtCastCategory.Rows[j].Field<string>("DataValue") + "'";
                        DataRow[] dr = dtDegreeWithCast.Select(strexp, "Degree");
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
                    lstTotalStudentCount.Add(string.Format("{0}|{1}", dtCastCategory.Rows[j].Field<string>("DataValue"), strstdcount));
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