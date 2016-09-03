using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using ChartBLL;
using System.Linq; 
namespace WebSolutionChart
{
    public partial class ChartTest1 : System.Web.UI.Page
    {

        StudentCountInfo objStudentCount = new StudentCountInfo();

        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dtResult = objStudentCount.getStudentInfo(1, 0, "2016-2017", 0, "", 0, 0, 0, "");
            DataTable dtInstitute = objStudentCount.getStudentInfo(2, 0, "2016-2017", 0, "", 0, 0, 0, "");
            DataTable dtInstAdmis = objStudentCount.getStudentInfo(9, 0, "2016-2017", 0, "", 0, 0, 0, "");
            if (dtResult != null && dtResult.Rows.Count > 0)
            {

              //dtInstitute.AsEnumerable().Sum(row => row.Field<int>("TotalStudent")); //Convert.ToInt32(dtInstitute.Compute("SUM(TotalStudent)", string.Empty));
                var result = dtInstitute.AsEnumerable().Sum(x => Convert.ToInt32(x["TotalStudent"]));
                int TotalStudent = Convert.ToInt32(result);  
                int TotalInstitute = dtInstitute.Rows.Count;
                string CurrentYear = dtInstitute.Rows[0]["AcademicYear"].ToString();
              string Student1= bindPage(dtResult);
              string Student2 = bindPageInstitute(dtInstitute, dtInstAdmis);
              lblTotalStudent.InnerText = dtResult.AsEnumerable().Sum(x => Convert.ToInt32(x["TotalStudent"])).ToString();
              lblYear.InnerText = CurrentYear;
              lblYearStudent.InnerText = TotalStudent.ToString();
              lblInstitute.InnerText = TotalInstitute.ToString();
               
               StringBuilder builder = new StringBuilder();
               builder.Append(Student1);
               builder.AppendLine();
               builder.AppendLine();
               builder.Append(Student2);
               builder.AppendLine();
               builder.AppendLine();

               string innerString = builder.ToString(); 
               System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Submitted", innerString, true);
            }
        }

        public string bindPage(DataTable dtResult)
        {

            string xAxis = "";
            string xData = "";

            StringBuilder builder = new StringBuilder();

            builder.Append("$(function () {");
            builder.Append("$('#container').highcharts({").AppendLine();
            builder.Append("chart: {").AppendLine();
            builder.Append("type: 'column'").AppendLine();
            builder.Append(" },").AppendLine();
            builder.Append("title: {").AppendLine();
            builder.Append("text: 'Yearly Enrolled Students'").AppendLine();
            builder.Append(" },").AppendLine();
            builder.Append("subtitle: {").AppendLine();
            builder.Append("text: ''").AppendLine();
            builder.Append("},").AppendLine();
            builder.Append("xAxis: {").AppendLine();
            for (int cnt = 0; cnt < dtResult.Rows.Count; cnt++)
            {
                if (cnt == (dtResult.Rows.Count - 1))
                {
                    xAxis = xAxis + "'" + dtResult.Rows[cnt]["AcademicYear"].ToString() + "'";
                }
                else
                    xAxis = xAxis + "'" + dtResult.Rows[cnt]["AcademicYear"].ToString() + "',";
            }
            builder.Append("categories: [" + xAxis.ToString()  + " ],").AppendLine();
            builder.Append("crosshair: true").AppendLine();
            builder.Append(" },").AppendLine();
            builder.Append("yAxis: {  min: 0, title: { text: 'No Of Students' }},").AppendLine();
            builder.Append("tooltip: {headerFormat: '<span style='font-size:10px'>{point.key}</span><table>',").AppendLine();
            builder.Append("pointFormat: '<tr><td style='color:{series.color};padding:0'>{series.name}: </td>' +").AppendLine();
            builder.Append("'<td style='padding:0'><b>{point.y:.1f} Students </b></td></tr>',").AppendLine();
            builder.Append("footerFormat: '</table>', shared: true,useHTML: true },").AppendLine();
            builder.Append("plotOptions: { column: { pointPadding: 0, borderWidth: 0, dataLabels: { enabled: true } }},").AppendLine();
            builder.Append("series: [{").AppendLine();
            builder.Append("name: 'Year', colorByPoint: true,").AppendLine();


            for (int cnt = 0; cnt < dtResult.Rows.Count; cnt++)
            {
                if (cnt == (dtResult.Rows.Count - 1))
                {
                    xData = xData + "" + dtResult.Rows[cnt]["TotalStudent"].ToString() + "";
                }
                else
                    xData = xData + "" + dtResult.Rows[cnt]["TotalStudent"].ToString() + ",";
            }
            builder.Append("data: [" + xData + "]").AppendLine();
           
            builder.Append("}] ").AppendLine();
            builder.Append("}); }); ").AppendLine();
            string innerString = builder.ToString().Replace("style='", "style=\"").Replace("'>", "\">");

            return innerString;
            //System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Submitted", innerString, true);
           
        }

        public string bindPageInstitute(DataTable dtInstitute, DataTable dtInstAdmis)
        {

            string xAxis = "";
            string xData = "";
            string xData2 = "";

            StringBuilder builder = new StringBuilder();

            builder.Append("$(function () {");
            builder.Append("$('#container1').highcharts({").AppendLine();
            builder.Append("chart: {").AppendLine();
            builder.Append("type: 'bar'").AppendLine();
            builder.Append(" },").AppendLine();
            builder.Append("title: {").AppendLine();
            builder.Append("text: 'Institute Wise Admission (" + dtInstitute.Rows[0]["AcademicYear"].ToString() + ")' ").AppendLine();
            builder.Append(" },").AppendLine();
            builder.Append("subtitle: {").AppendLine();
            builder.Append("text: ''").AppendLine();
            builder.Append("},").AppendLine();
            builder.Append("xAxis: { type: 'category'").AppendLine();
            //for (int cnt = 0; cnt < dtResult.Rows.Count; cnt++)
            //{
            //    if (cnt == (dtResult.Rows.Count - 1))
            //    {
            //        xAxis = xAxis + "'" + dtResult.Rows[cnt]["Institute"].ToString() + "'";
            //    }
            //    else
            //        xAxis = xAxis + "'" + dtResult.Rows[cnt]["Institute"].ToString() + "',";
            //}
            //builder.Append("categories: [" + xAxis.ToString() + " ],").AppendLine();
            //builder.Append("crosshair: true").AppendLine();
            builder.Append(" },").AppendLine();
            builder.Append("yAxis: {  title: { text: 'No Of Students' }},").AppendLine();
            builder.Append("legend: { enabled: false },").AppendLine();
            builder.Append("tooltip: {headerFormat: '<span style='font-size:10px'>{point.key}</span><table>',").AppendLine();
            builder.Append("pointFormat: '<tr><td style='color:{series.color};padding:0'>{series.name}: </td>' +").AppendLine();
            builder.Append("'<td style='padding:0'><b>{point.y:.1f} Students </b></td></tr>',").AppendLine();
            builder.Append("footerFormat: '</table>', shared: true,useHTML: true },").AppendLine();
            builder.Append("plotOptions: { series: { pointPadding: 0, borderWidth: 0, dataLabels: { enabled: true } }},").AppendLine();
            //builder.Append("legend: {layout: 'vertical', align: 'right', verticalAlign: 'top', x: -40, y: 80, floating: true, borderWidth: 1, backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'), shadow: true},").AppendLine();
            builder.Append("series: [{").AppendLine();
            builder.Append("name: 'Institute', colorByPoint: true,").AppendLine();


            for (int cnt = 0; cnt < dtInstitute.Rows.Count; cnt++)
            {
                DataView dv = new DataView(dtInstAdmis);
                dv.RowFilter = " Institute = '" + dtInstitute.Rows[cnt]["Institute"].ToString() + "'";
                DataTable dt = new DataTable();
                string dataInner = "";
                if (dv != null)
                {
                    dt = dv.ToTable();
                    dv.Dispose();

                    if (dt.Rows.Count > 0)
                    {
                        for (int cnt1 = 0; cnt1 < dt.Rows.Count; cnt1++)
                        {
                            if (cnt1 == (dt.Rows.Count - 1))
                            {
                                dataInner = dataInner + "" + " [ '" + dt.Rows[cnt1]["AdmissionType"].ToString() + "', " + dt.Rows[cnt1]["TotalStudent"].ToString() + "]";
                            }
                            else
                            {

                                dataInner = dataInner + "" + " [ '" + dt.Rows[cnt1]["AdmissionType"].ToString() + "', " + dt.Rows[cnt1]["TotalStudent"].ToString() + "],";
                            }
                        }
                    }
                    else
                    {
                        dataInner = "";
                    }
                }
                if (cnt == (dtInstitute.Rows.Count - 1))
                {
                    xData = xData + "" + " { name: '" + dtInstitute.Rows[cnt]["Institute"].ToString() + "', y: " + dtInstitute.Rows[cnt]["TotalStudent"].ToString() + ", drilldown: '" + dtInstitute.Rows[cnt]["Institute"].ToString() + "'}";

                    if (dataInner !="")
                        xData2 = xData2 + "" + " { name: '" + dtInstitute.Rows[cnt]["Institute"].ToString() + "', id: '" + dtInstitute.Rows[cnt]["Institute"].ToString() + "', data: [" + dataInner + " ]}";
                }
                else
                {
                    xData = xData + "" + " { name: '" + dtInstitute.Rows[cnt]["Institute"].ToString() + "', y: " + dtInstitute.Rows[cnt]["TotalStudent"].ToString() + ", drilldown: '" + dtInstitute.Rows[cnt]["Institute"].ToString() + "'},";
                    if (dataInner!="")
                        xData2 = xData2 + "" + " { name: '" + dtInstitute.Rows[cnt]["Institute"].ToString() + "', id: '" + dtInstitute.Rows[cnt]["Institute"].ToString() + "',data: [" + dataInner + " ]},";
                }
            }
            builder.Append("data: [" + xData + "]").AppendLine();
            builder.Append("}] ").AppendLine();
            builder.Append(", drilldown: { series: [").AppendLine();
            builder.Append("" + xData2 + "").AppendLine();
            builder.Append("] } ").AppendLine(); ///series End

            builder.Append("}); }); ").AppendLine();
            string innerString = builder.ToString().Replace("style='", "style=\"").Replace("'>", "\">");

            return innerString;
          //  System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Submitted", innerString, true);
        }
    }
}