<%@ Page Title="" Language="C#" MasterPageFile="~/MasterChart.Master" AutoEventWireup="true" CodeBehind="StackedColummChart.aspx.cs" Inherits="WebSolutionChart.StackedColummChart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <title></title>
    <link href="Styles/highslide.min.css" rel="stylesheet" type="text/css" />
    <link href="Styles/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="Styles/source-sans-pro.css" rel="stylesheet" type="text/css" />
    <link href="Styles/font-awesome.css" rel="stylesheet" type="text/css" />
    <link href="Styles/template.css" rel="stylesheet" type="text/css" />
    <link href="Styles/ie.css" rel="stylesheet" type="text/css" />
    <link href="Styles/css.css" rel="stylesheet" type="text/css" />
    <link href="http://fonts.googleapis.com/css?family=Roboto+Condensed:400,300,700"
        rel="stylesheet" type="text/css" />
    <link href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900"
        rel="stylesheet" type="text/css" />
    <script src="Scripts/highslide-full.min.js" type="text/javascript"></script>
    <script src="Scripts/highslide.config.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery-1.12.4.min.js" type="text/javascript"></script>
    <script src="Scripts/bootstrap.js" type="text/javascript"></script>
    <script src="Scripts/modernizr.js" type="text/javascript"></script>
    <script src="Scripts/script.js" type="text/javascript"></script>
    <script src="Scripts/jquery.appear.min.js" type="text/javascript"></script>
    <script src="Scripts/highcharts.js" type="text/javascript"></script>
    <script src="Scripts/exporting.js" type="text/javascript"></script>
    <script src="Scripts/drilldown.js" type="text/javascript"></script>
    <script src="Scripts/json2.js" type="text/javascript"></script>
    <style type="text/css">
        .container
        {
            width: 100%;
        }
        .container1
        {
            width: 100%;
        }
        #hs-component
        {
            background-color: inherit;
            padding: 0;
        }
        #hs-component .container
        {
            padding: 0;
            width: 100%;
        }
        #comp-menu
        {
            background-color: #3A3A4F;
            z-index: 1;
            padding: 0;
        }
        #comp-menu .cont
        {
            padding: 0 50px;
        }
        #comp-menu h2, #comp-menu h2 a
        {
            color: #eee;
            font-weight: 400;
            text-transform: inherit;
        }
        #comp-menu h2 a:hover
        {
            color: #8085e8;
        }
        a.btn.btn-theme
        {
            color: #eeeaea;
            background-color: #565669;
            border: 1px solid #343434e;
            border-bottom: 0;
            border-radius: 0;
            font-weight: 700;
            font-size: 13px;
            margin: 0 2px 0 0;
            letter-spacing: .5px;
            line-height: 36px;
            padding: 0 15px;
            transition: all .2s ease-in-out;
            -webkit-transition: all .2s ease-in-out;
            -moz-transition: all .2s ease-in-out;
            -ms-transition: all .2s ease-in-out;
        }
        a.btn.btn-theme:hover
        {
            background-color: #6A6A7E;
            color: #90ef7f;
        }
        a.btn.btn-theme.disabled
        {
            background-color: #eee;
            color: #313131;
            opacity: 1;
        }
        .demo
        {
            background-color: #eee;
        }
        .demo .demo-name
        {
            color: #47475C;
            font-weight: 400;
            text-transform: none;
            text-align: center;
            display: inline;
            margin: 0 10px;
        }
        #chart-switcher
        {
            text-align: center;
            padding: 30px 0;
        }
        .demo #chart-switcher #next-example, .demo #chart-switcher #previous-example
        {
            font-size: 30px;
            padding: 0 10px;
            color: #888;
        }
        #demo-buttons
        {
            text-align: center;
            padding: 20px 0;
        }
        #demo-buttons a
        {
            background-color: #ddd;
        }
        #demo-buttons a:hover
        {
            background-color: #8085E8;
            color: #eee;
        }
        .demo .chart-container
        {
            position: relative;
            padding: 0;
        }
        .demo .chart-container > #container
        {
            box-shadow: 0 3px 4px #ddd;
        }
        .demo .chart-container > #container1
        {
            box-shadow: 0 3px 4px #ddd;
        }
        .demo .chart-container #previous-example
        {
            position: absolute;
            top: 40%;
            left: -35px;
            font-size: 55px;
        }
        .demo .chart-container #next-example
        {
            position: absolute;
            top: 40%;
            right: -35px;
            font-size: 55px;
        }
        .demo .chart-container #next-example, .demo .chart-container #previous-example
        {
            color: #999;
            cursor: pointer;
        }
        .demo .chart-container #next-example:hover, .demo .chart-container #previous-example:hover
        {
            color: #58BB45;
        }
        .sidebar-eq-fill
        {
            background-color: #eee;
        }
        #small-switcher
        {
            margin: 0 -15px;
            padding: 10px;
            background-color: #3A3A4F;
            height: 45px;
        }
        @media screen and (max-width:400px)
        {
            #chart-switcher, .demo .chart-container, .sidebar-wrapper .sidebar-eq
            {
                padding: 0;
            }
            #small-switcher
            {
                text-align: center;
            }
            .demo #chart-switcher #next-example, .demo #chart-switcher #previous-example
            {
                font-size: 20px;
            }
            .sidebar-wrapper .sidebar-eq.demo
            {
                padding-top: 0;
            }
            #sidebar-close, #view-menu
            {
                position: absolute;
                top: 0;
                left: 0;
                background-color: #3A3A4F;
                color: #fff;
                border-radius: 0;
                z-index: 100;
                cursor: pointer;
                padding: 0 10px;
                line-height: 45px;
            }
            #sidebar-close
            {
                display: none;
            }
            #view-menu, .toggled #sidebar-close
            {
                display: block;
            }
            .toggled #view-menu
            {
                display: none;
            }
        }
        @media screen and (min-width:400px) and (max-width:768px)
        {
            .demo
            {
                padding: 15px;
            }
            .sidebar-wrapper .sidebar-eq.demo
            {
                padding-top: 0;
            }
            #sidebar-close, #view-menu
            {
                position: absolute;
                top: 0;
                left: 0;
                background-color: #3A3A4F;
                color: #fff;
                border-radius: 0;
                z-index: 100;
                cursor: pointer;
                padding: 10px;
            }
            #sidebar-close
            {
                display: none;
            }
            #view-menu, .toggled #sidebar-close
            {
                display: block;
            }
            .toggled #view-menu
            {
                display: none;
            }
        }
    </style>
      <script type="text/javascript">
          $(document).ready(function () {
              UnivDDLChange();
              InstituteDDLChange();
              CastCategoryDDLChange();
              InitialCalling();
              AcademicYearDDLChange();
              SetColorForChart();
          });

          function SetColorForChart() {
              if ($("#hdnforcolor").val() == 0) {
                  $(function () { Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, function (color) { return { radialGradient: { cx: 0.5, cy: 0.3, r: 0.7 }, stops: [[0, color], [1, Highcharts.Color(color).brighten(-0.3).get('rgb')]] }; }); });
                  $("#hdnforcolor").val() == 1;
              }
              else {

              }
          }

          function BindDegreeWithCast() {
              // var degreeID = $("#ddlDegree").val();
              //  var degreeName = $("#ddlDegree  option:selected").text();
              var academicYear = $("#ddlAcademicYear").val();
              var instituteID = $("#ddlInstitute").val();
              var InstituteName = $("#ddlInstitute option:selected").text();
              var reporttype = $("#ddlCastCategoryType option:selected").text();
              var dt = new Date();
              var maxnumId = null;
              var curdate = dt.getDate() + "/" + (dt.getMonth() + 1) + "/" + dt.getFullYear() + "  " + dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds();
              $.ajax({
                  type: "POST",
                  contentType: "application/json;charset=utf-8",
                  url: "StackedColummChart.aspx/Get_DataFor_BindDegreeWithCast",
                  data: "{'InstituteID':'" + instituteID + "','AcademicYear':'" + academicYear + "'}",
                  dataType: "Json",
                  success: function (data) {

                      if (data.d.length > 0 && data != null) {
                          var resdata = "";
                          var totalstudents = 0;
                          var dataforpie = "";
                          var per = 0;
                          var degrees = "";
                          var mydata = new Array();

                          degrees = data.d[0].split(",").toString();
                          for (var i = 0; i < data.d.length - 1; i++) {
                              mydata.push(data.d[i + 1]);
                          }

                          $.map(mydata, function (item) {

                              resdata = resdata + "{name:'" + item.split('|')[0] + "',data: [" + item.split('|')[1] + " ]},";
                          });

                          var highchartstring = "$(function () {                          $('#container').highcharts({                              chart: {                                  type: 'column'                              },                              title: {                                  text: 'Stacked column chart of Students by " + reporttype + "'                              },  subtitle: {text: 'Institute Name: " + InstituteName + ", Academic Year: " + academicYear + ", Report Date:" + curdate + "' },                            xAxis: {                                  categories: [" + degrees + "]                              },                              yAxis: {                                  min: 0,                                  title: {                                      text: 'Number Of Students'                                  },                                  stackLabels: {                                      enabled: true,                                      style: {                                          fontWeight: 'bold',                                          color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'                                      }                                  }                              },                              legend: {                                  align: 'center',                                  x: -20,                                  verticalAlign: 'bottom',                                  y: 15,                                  floating: true,                                  backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',                                  borderColor: '#CCC',                                  borderWidth: 1,                                  shadow: false                              },                              tooltip: {                                  headerFormat: '<b>{point.x}</b><br/>',                                  pointFormat: '{series.name}: {point.y}<br/>Total: {point.stackTotal}'                              },                              plotOptions: {                                  column: {                                      stacking: 'normal',                                      dataLabels: {                                          enabled: true,                                          color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white',                                          style: {                                              textShadow: '0 0 3px black'                                          }                                      }                                  }                              },  ";
                          var highchartstring2 = "series: [" + resdata + "]                          });                      });";

                          var highchartstring3 = highchartstring + highchartstring2;
                          var highchartstring4 = "$(function () {                          $('#container2').highcharts({                              chart: {                                  type: 'column'                              },                              title: {                                  text: 'Stacked column chart of Students by " + reporttype + "'                          },     subtitle: {text: 'Institute Name:" + InstituteName + ", Academic Year: " + academicYear + ", Report Date:" + curdate + "' },                          xAxis: {                                  categories: [" + degrees + "]                              },                              yAxis: {                                  min: 0,                                  title: {                                      text: 'Number Of Students'                                  }  ,               stackLabels: {                enabled: true,                style: {                    fontWeight: 'bold',                    color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'                }            }                            },                              tooltip: {                                  pointFormat: '<span style=\"color:{series.color}\">{series.name}</span>: <b>{point.y}</b> ({point.percentage:.0f}%)<br/>',                                  shared: true                              },                              plotOptions: {                                  column: {                                      stacking: 'percent'                                  }                              },";
                          var highchartstring5 = "series: [" + resdata + "]                          });                      });";
                          var highchartstring6 = highchartstring4 + highchartstring5;


                          //stackLabels: {                enabled: true,                style: {                    fontWeight: 'bold',                    color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'                }            }



                          var fun = Function(highchartstring3);
                          var fun2 = Function(highchartstring6);
                          fun();
                          fun2();
                      }
                      else {
                          var highchartstring = "$(function () {                          $('#container').highcharts({                              chart: {                                  type: 'column'                              },                              title: {                                  text: 'Stacked column chart of Students by " + reporttype + "'                              },  subtitle: {text: 'Institute Name:" + InstituteName + ", Academic Year: " + academicYear + ", Report Date:" + curdate + "' },                            xAxis: {                                  categories: []                              },                              yAxis: {                                  min: 0,                                  title: {                                      text: 'Number Of Students'                                  },                                  stackLabels: {                                      enabled: true,                                      style: {                                          fontWeight: 'bold',                                          color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'                                      }                                  }                              },                              legend: {                                  align: 'center',                                  x: -20,                                  verticalAlign: 'bottom',                                  y: 15,                                  floating: true,                                  backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',                                  borderColor: '#CCC',                                  borderWidth: 1,                                  shadow: false                              },                              tooltip: {                                  headerFormat: '<b>{point.x}</b><br/>',                                  pointFormat: '{series.name}: {point.y}<br/>Total: {point.stackTotal}'                              },                              plotOptions: {                                  column: {                                      stacking: 'normal',                                      dataLabels: {                                          enabled: true,                                          color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white',                                          style: {                                              textShadow: '0 0 3px black'                                          }                                      }                                  }                              },  ";
                          var highchartstring2 = "series: []                          });                      });";

                          var highchartstring3 = highchartstring + highchartstring2;
                          var highchartstring4 = "$(function () {                          $('#container2').highcharts({                              chart: {                                  type: 'column'                              },                              title: {                                  text: 'Stacked column chart of Students by " + reporttype + "'                          },     subtitle: {text: 'Institute Name:" + InstituteName + ", Academic Year:" + academicYear + ", Report Date:" + curdate + "' },                          xAxis: {                                  categories: []                              },                              yAxis: {                                  min: 0,                                  title: {                                      text: 'Number Of Students'                                  }  ,               stackLabels: {                enabled: true,                style: {                    fontWeight: 'bold',                    color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'                }            }                            },                              tooltip: {                                  pointFormat: '<span style=\"color:{series.color}\">{series.name}</span>: <b>{point.y}</b> ({point.percentage:.0f}%)<br/>',                                  shared: true                              },                              plotOptions: {                                  column: {                                      stacking: 'percent'                                  }                              },";
                          var highchartstring5 = "series: []                          });                      });";
                          var highchartstring6 = highchartstring4 + highchartstring5;



                          var fun = Function(highchartstring3);
                          var fun2 = Function(highchartstring6);
                          fun();
                          fun2();



                      }


                  },
                  error: function (result) {
                      alert('error');
                  }
              });
          }

          function BindDegreeWithActualCast() {
              //  var degreeID = $("#ddlDegree").val();
              //  var degreeName = $("#ddlDegree  option:selected").text();
              var academicYear = $("#ddlAcademicYear").val();
              var instituteID = $("#ddlInstitute").val();
              var InstituteName = $("#ddlInstitute option:selected").text();
              var reporttype = $("#ddlCastCategoryType option:selected").text();
              var dt = new Date();
              var curdate = dt.getDate() + "/" + (dt.getMonth() + 1) + "/" + dt.getFullYear() + "  " + dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds();
              $.ajax({
                  type: "POST",
                  contentType: "application/json;charset=utf-8",
                  url: "StackedColummChart.aspx/Get_DataFor_BindDegreeWithActualCast",
                  data: "{'InstituteID':'" + instituteID + "','AcademicYear':'" + academicYear + "'}",
                  dataType: "Json",
                  success: function (data) {
                      if (data.d.length > 0 && data != null) {
                          var resdata = "";
                          var totalstudents = 0;
                          var dataforpie = "";
                          var degrees = "";
                          var mydata = new Array();

                          degrees = data.d[0].split(",").toString();

                          //data.d.pop();

                          for (var i = 0; i < data.d.length - 1; i++) {
                              mydata.push(data.d[i + 1]);
                          }

                          //data.d.reduce()
                          $.map(mydata, function (item) {

                              resdata = resdata + "{name:'" + item.split('|')[0] + "',data: [" + item.split('|')[1] + " ]},";
                          });

                          var highchartstring = "$(function () {                          $('#container').highcharts({                              chart: {                                  type: 'column'                              },                              title: {                                  text: 'Stacked column chart of Students by " + reporttype + "'                              },  subtitle: {text: 'Institute Name: " + InstituteName + ", Academic Year: " + academicYear + ", Report Date:" + curdate + "' },                            xAxis: {                                  categories: [" + degrees + "]                              },                              yAxis: {                                  min: 0,                                  title: {                                      text: 'Number Of Students'                                  },                                  stackLabels: {                                      enabled: true,                                      style: {                                          fontWeight: 'bold',                                          color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'                                      }                                  }                              },                              legend: {                                  align: 'center',                                  x: -20,                                  verticalAlign: 'bottom',                                  y: 15,                                  floating: true,                                  backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',                                  borderColor: '#CCC',                                  borderWidth: 1,                                  shadow: false                              },                              tooltip: {                                  headerFormat: '<b>{point.x}</b><br/>',                                  pointFormat: '{series.name}: {point.y}<br/>Total: {point.stackTotal}'                              },                              plotOptions: {                                  column: {                                      stacking: 'normal',                                      dataLabels: {                                          enabled: true,                                          color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white',                                          style: {                                              textShadow: '0 0 3px black'                                          }                                      }                                  }                              },  ";
                          var highchartstring2 = "series: [" + resdata + "]                          });                      });";

                          var highchartstring3 = highchartstring + highchartstring2;
                          var highchartstring4 = "$(function () {                          $('#container2').highcharts({                              chart: {                                  type: 'column'                              },                              title: {                                  text: 'Stacked column chart of Students by " + reporttype + "'                          },     subtitle: {text: 'Institute Name: " + InstituteName + ", Academic Year:" + academicYear + ", Report Date:" + curdate + "' },                          xAxis: {                                  categories: [" + degrees + "]                              },                              yAxis: {                                  min: 0,                                  title: {                                      text: 'Number Of Students'                                  }                              },                              tooltip: {                                  pointFormat: '<span style=\"color:{series.color}\">{series.name}</span>: <b>{point.y}</b> ({point.percentage:.0f}%)<br/>',                                  shared: true                              },                              plotOptions: {                                  column: {                                      stacking: 'percent'                                  }                              },";
                          var highchartstring5 = "series: [" + resdata + "]                          });                      });";
                          var highchartstring6 = highchartstring4 + highchartstring5;



                          var fun = Function(highchartstring3);
                          var fun2 = Function(highchartstring6);
                          fun();
                          fun2();
                      }
                      else {
                          var highchartstring = "$(function () {                          $('#container').highcharts({                              chart: {                                  type: 'column'                              },                              title: {                                  text: 'Stacked column chart of Students by " + reporttype + "'                              },  subtitle: {text: 'Institute Name: " + InstituteName + ", Academic Year:" + academicYear + ", Report Date:" + curdate + "' },                            xAxis: {                                  categories: []                              },                              yAxis: {                                  min: 0,                                  title: {                                      text: 'Number Of Students'                                  },                                  stackLabels: {                                      enabled: true,                                      style: {                                          fontWeight: 'bold',                                          color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'                                      }                                  }                              },                              legend: {                                  align: 'center',                                  x: -20,                                  verticalAlign: 'bottom',                                  y: 15,                                  floating: true,                                  backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',                                  borderColor: '#CCC',                                  borderWidth: 1,                                  shadow: false                              },                              tooltip: {                                  headerFormat: '<b>{point.x}</b><br/>',                                  pointFormat: '{series.name}: {point.y}<br/>Total: {point.stackTotal}'                              },                              plotOptions: {                                  column: {                                      stacking: 'normal',                                      dataLabels: {                                          enabled: true,                                          color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white',                                          style: {                                              textShadow: '0 0 3px black'                                          }                                      }                                  }                              },  ";
                          var highchartstring2 = "series: []                          });                      });";

                          var highchartstring3 = highchartstring + highchartstring2;
                          var highchartstring4 = "$(function () {                          $('#container2').highcharts({                              chart: {                                  type: 'column'                              },                              title: {                                  text: 'Stacked column chart of Students by " + reporttype + "'                          },     subtitle: {text: 'Institute Name: " + InstituteName + ", Academic Year:" + academicYear + ", Report Date:" + curdate + "' },                          xAxis: {                                  categories: []                              },                              yAxis: {                                  min: 0,                                  title: {                                      text: 'Number Of Students'                                  }                              },                              tooltip: {                                  pointFormat: '<span style=\"color:{series.color}\">{series.name}</span>: <b>{point.y}</b> ({point.percentage:.0f}%)<br/>',                                  shared: true                              },                              plotOptions: {                                  column: {                                      stacking: 'percent'                                  }                              },";
                          var highchartstring5 = "series: []                          });                      });";
                          var highchartstring6 = highchartstring4 + highchartstring5;

                          var fun = Function(highchartstring3);
                          var fun2 = Function(highchartstring6);
                          fun();
                          fun2();

                      }

                  },
                  error: function (result) {
                  }
              });
          }

          function BindDegreeWithAdmissionType() {
              //   var degreeID = $("#ddlDegree").val();
              //   var degreeName = $("#ddlDegree  option:selected").text();
              var academicYear = $("#ddlAcademicYear").val();
              var instituteID = $("#ddlInstitute").val();
              var InstituteName = $("#ddlInstitute option:selected").text();
              var reporttype = $("#ddlCastCategoryType option:selected").text();
              var dt = new Date();
              var curdate = dt.getDate() + "/" + (dt.getMonth() + 1) + "/" + dt.getFullYear() + "  " + dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds();
              $.ajax({
                  type: "POST",
                  contentType: "application/json;charset=utf-8",
                  url: "StackedColummChart.aspx/Get_DataFor_BindDegreeWithAdmissionType",
                  data: "{'InstituteID':'" + instituteID + "','AcademicYear':'" + academicYear + "'}",
                  dataType: "Json",
                  success: function (data) {
                      if (data.d.length > 0 && data != null) {
                          var resdata = "";
                          var totalstudents = 0;
                          var dataforpie = "";
                          var degrees = "";
                          var mydata = new Array();

                          degrees = data.d[0].split(",").toString();

                          //data.d.pop();

                          for (var i = 0; i < data.d.length - 1; i++) {
                              mydata.push(data.d[i + 1]);
                          }

                          //data.d.reduce()
                          $.map(mydata, function (item) {

                              resdata = resdata + "{name:'" + item.split('|')[0] + "',data: [" + item.split('|')[1] + " ]},";
                          });

                          var highchartstring = "$(function () {                          $('#container').highcharts({                              chart: {                                  type: 'column'                              },                              title: {                                  text: 'Stacked column chart of Students by " + reporttype + "'                              },  subtitle: {text: 'Institute Name: " + InstituteName + ", Academic Year: " + academicYear + ", Report Date: " + curdate + "' },                            xAxis: {                                  categories: [" + degrees + "]                              },                              yAxis: {                                  min: 0,                                  title: {                                      text: 'Number Of Students'                                  },                                  stackLabels: {                                      enabled: true,                                      style: {                                          fontWeight: 'bold',                                          color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'                                      }                                  }                              },                              legend: {                                  align: 'center',                                  x: -20,                                  verticalAlign: 'bottom',                                  y: 15,                                  floating: true,                                  backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',                                  borderColor: '#CCC',                                  borderWidth: 1,                                  shadow: false                              },                              tooltip: {                                  headerFormat: '<b>{point.x}</b><br/>',                                  pointFormat: '{series.name}: {point.y}<br/>Total: {point.stackTotal}'                              },                              plotOptions: {                                  column: {                                      stacking: 'normal',                                      dataLabels: {                                          enabled: true,                                          color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white',                                          style: {                                              textShadow: '0 0 3px black'                                          }                                      }                                  }                              },  ";
                          var highchartstring2 = "series: [" + resdata + "]                          });                      });";

                          var highchartstring3 = highchartstring + highchartstring2;
                          var highchartstring4 = "$(function () {                          $('#container2').highcharts({                              chart: {                                  type: 'column'                              },                              title: {                                  text: 'Stacked column chart of Students by " + reporttype + "'                          },     subtitle: {text: 'Institute Name: " + InstituteName + ", Academic Year: " + academicYear + ", Report Date: " + curdate + "' },                          xAxis: {                                  categories: [" + degrees + "]                              },                              yAxis: {                                  min: 0,                                  title: {                                      text: 'Number Of Students'                                  }                              },                              tooltip: {                                  pointFormat: '<span style=\"color:{series.color}\">{series.name}</span>: <b>{point.y}</b> ({point.percentage:.0f}%)<br/>',                                  shared: true                              },                              plotOptions: {                                  column: {                                      stacking: 'percent'                                  }                              },";
                          var highchartstring5 = "series: [" + resdata + "]                          });                      });";
                          var highchartstring6 = highchartstring4 + highchartstring5;



                          var fun = Function(highchartstring3);
                          var fun2 = Function(highchartstring6);
                          fun();
                          fun2();
                      }
                      else {
                          var highchartstring = "$(function () {                          $('#container').highcharts({                              chart: {                                  type: 'column'                              },                              title: {                                  text: 'Stacked column chart of Students by " + reporttype + "'                              },  subtitle: {text: 'Institute Name: " + InstituteName + ", Academic Year: " + academicYear + ", Report Date: " + curdate + "' },                            xAxis: {                                  categories: []                              },                              yAxis: {                                  min: 0,                                  title: {                                      text: 'Number Of Students'                                  },                                  stackLabels: {                                      enabled: true,                                      style: {                                          fontWeight: 'bold',                                          color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'                                      }                                  }                              },                              legend: {                                  align: 'center',                                  x: -20,                                  verticalAlign: 'bottom',                                  y: 15,                                  floating: true,                                  backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',                                  borderColor: '#CCC',                                  borderWidth: 1,                                  shadow: false                              },                              tooltip: {                                  headerFormat: '<b>{point.x}</b><br/>',                                  pointFormat: '{series.name}: {point.y}<br/>Total: {point.stackTotal}'                              },                              plotOptions: {                                  column: {                                      stacking: 'normal',                                      dataLabels: {                                          enabled: true,                                          color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white',                                          style: {                                              textShadow: '0 0 3px black'                                          }                                      }                                  }                              },  ";
                          var highchartstring2 = "series: []                          });                      });";

                          var highchartstring3 = highchartstring + highchartstring2;
                          var highchartstring4 = "$(function () {                          $('#container2').highcharts({                              chart: {                                  type: 'column'                              },                              title: {                                  text: 'Stacked column chart of Students by " + reporttype + "'                          },     subtitle: {text: 'Institute Name: " + InstituteName + ", Academic Year: " + academicYear + ", Report Date: " + curdate + "' },                          xAxis: {                                  categories: []                              },                              yAxis: {                                  min: 0,                                  title: {                                      text: 'Number Of Students'                                  }                              },                              tooltip: {                                  pointFormat: '<span style=\"color:{series.color}\">{series.name}</span>: <b>{point.y}</b> ({point.percentage:.0f}%)<br/>',                                  shared: true                              },                              plotOptions: {                                  column: {                                      stacking: 'percent'                                  }                              },";
                          var highchartstring5 = "series: []                          });                      });";
                          var highchartstring6 = highchartstring4 + highchartstring5;

                          var fun = Function(highchartstring3);
                          var fun2 = Function(highchartstring6);
                          fun();
                          fun2();

                      }



                  },
                  error: function (result) {
                  }
              });
          }

          function BindDegreeWithGender() {
              //  var degreeID = $("#ddlDegree").val();
              //  var degreeName = $("#ddlDegree  option:selected").text();
              var academicYear = $("#ddlAcademicYear").val();
              var instituteID = $("#ddlInstitute").val();
              var InstituteName = $("#ddlInstitute option:selected").text();
              var reporttype = $("#ddlCastCategoryType option:selected").text();
              var dt = new Date();
              var curdate = dt.getDate() + "/" + (dt.getMonth() + 1) + "/" + dt.getFullYear() + "  " + dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds();
              $.ajax({
                  type: "POST",
                  contentType: "application/json;charset=utf-8",
                  url: "StackedColummChart.aspx/Get_DataFor_BindDegreeWithGender",
                  data: "{'InstituteID':'" + instituteID + "','AcademicYear':'" + academicYear + "'}",
                  dataType: "Json",
                  success: function (data) {
                      if (data.d.length > 0 && data != null) {
                          var resdata = "";
                          var totalstudents = 0;
                          var dataforpie = "";
                          var degrees = "";
                          var mydata = new Array();

                          degrees = data.d[0].split(",").toString();

                          //data.d.pop();

                          for (var i = 0; i < data.d.length - 1; i++) {
                              mydata.push(data.d[i + 1]);
                          }

                          //data.d.reduce()
                          $.map(mydata, function (item) {

                              resdata = resdata + "{name:'" + item.split('|')[0] + "',data: [" + item.split('|')[1] + " ]},";
                          });

                          var highchartstring = "$(function () {                          $('#container').highcharts({                              chart: {                                  type: 'column'                              },                              title: {                                  text: 'Stacked column chart of Students by " + reporttype + "'                              },  subtitle: {text: 'Institute Name: " + InstituteName + ", Academic Year: " + academicYear + ", Report Date: " + curdate + "' },                            xAxis: {                                  categories: [" + degrees + "]                              },                              yAxis: {                                  min: 0,                                  title: {                                      text: 'Number Of Students'                                  },                                  stackLabels: {                                      enabled: true,                                      style: {                                          fontWeight: 'bold',                                          color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'                                      }                                  }                              },                              legend: {                                  align: 'center',                                  x: -20,                                  verticalAlign: 'bottom',                                  y: 15,                                  floating: true,                                  backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',                                  borderColor: '#CCC',                                  borderWidth: 1,                                  shadow: false                              },                              tooltip: {                                  headerFormat: '<b>{point.x}</b><br/>',                                  pointFormat: '{series.name}: {point.y}<br/>Total: {point.stackTotal}'                              },                              plotOptions: {                                  column: {                                      stacking: 'normal',                                      dataLabels: {                                          enabled: true,                                          color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white',                                          style: {                                              textShadow: '0 0 3px black'                                          }                                      }                                  }                              },  ";
                          var highchartstring2 = "series: [" + resdata + "]                          });                      });";

                          var highchartstring3 = highchartstring + highchartstring2;
                          var highchartstring4 = "$(function () {                          $('#container2').highcharts({                              chart: {                                  type: 'column'                              },                              title: {                                  text: 'Stacked column chart of Students by " + reporttype + "'                          },     subtitle: {text: 'Institute Name: " + InstituteName + ", Academic Year: " + academicYear + ", Report Date: " + curdate + "' },                          xAxis: {                                  categories: [" + degrees + "]                              },                              yAxis: {                                  min: 0,                                  title: {                                      text: 'Number Of Students'                                  }                              },                              tooltip: {                                  pointFormat: '<span style=\"color:{series.color}\">{series.name}</span>: <b>{point.y}</b> ({point.percentage:.0f}%)<br/>',                                  shared: true                              },                              plotOptions: {                                  column: {                                      stacking: 'percent'                                  }                              },";
                          var highchartstring5 = "series: [" + resdata + "]                          });                      });";
                          var highchartstring6 = highchartstring4 + highchartstring5;



                          var fun = Function(highchartstring3);
                          var fun2 = Function(highchartstring6);
                          fun();
                          fun2();
                      }
                      else {
                          var highchartstring = "$(function () {                          $('#container').highcharts({                              chart: {                                  type: 'column'                              },                              title: {                                  text: 'Stacked column chart of Students by " + reporttype + "'                              },  subtitle: {text: 'Institute Name: " + InstituteName + ", Academic Year: " + academicYear + ", Report Date: " + curdate + "' },                            xAxis: {                                  categories: []                              },                              yAxis: {                                  min: 0,                                  title: {                                      text: 'Number Of Students'                                  },                                  stackLabels: {                                      enabled: true,                                      style: {                                          fontWeight: 'bold',                                          color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'                                      }                                  }                              },                              legend: {                                  align: 'center',                                  x: -20,                                  verticalAlign: 'bottom',                                  y: 15,                                  floating: true,                                  backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',                                  borderColor: '#CCC',                                  borderWidth: 1,                                  shadow: false                              },                              tooltip: {                                  headerFormat: '<b>{point.x}</b><br/>',                                  pointFormat: '{series.name}: {point.y}<br/>Total: {point.stackTotal}'                              },                              plotOptions: {                                  column: {                                      stacking: 'normal',                                      dataLabels: {                                          enabled: true,                                          color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white',                                          style: {                                              textShadow: '0 0 3px black'                                          }                                      }                                  }                              },  ";
                          var highchartstring2 = "series: []                          });                      });";

                          var highchartstring3 = highchartstring + highchartstring2;
                          var highchartstring4 = "$(function () {                          $('#container2').highcharts({                              chart: {                                  type: 'column'                              },                              title: {                                  text: 'Stacked column chart of Students by " + reporttype + "'                          },     subtitle: {text: 'Institute Name: " + InstituteName + ", Academic Year: " + academicYear + ", Report Date: " + curdate + "' },                          xAxis: {                                  categories: []                              },                              yAxis: {                                  min: 0,                                  title: {                                      text: 'Number Of Students'                                  }                              },                              tooltip: {                                  pointFormat: '<span style=\"color:{series.color}\">{series.name}</span>: <b>{point.y}</b> ({point.percentage:.0f}%)<br/>',                                  shared: true                              },                              plotOptions: {                                  column: {                                      stacking: 'percent'                                  }                              },";
                          var highchartstring5 = "series: []                          });                      });";
                          var highchartstring6 = highchartstring4 + highchartstring5;

                          var fun = Function(highchartstring3);
                          var fun2 = Function(highchartstring6);
                          fun();
                          fun2();

                      }

                  },
                  error: function (result) {
                  }
              });
          }



          function UnivDDLChange() {

              $("#ddlUniversity").change(function () {
                  // alert('Hello');
                  var UnivID = $("#ddlUniversity").val();
                  //  $("#ddlUniversity").data() =
                  //  $("#ddlUniversity").bind()
                  $.ajax({
                      type: "POST",
                      contentType: "application/json;charset=utf-8",
                      url: "StackedColummChart.aspx/Get_DataFor_BindInstituteInfo",
                      data: "{'UnivID':'" + UnivID + "'}",
                      dataType: "Json",
                      success: function (data) {
                          //alert(data);
                          $("#ddlInstitute").empty();
                          $.map(data.d, function (item) {
                              //  alert(item.split('-')[2]);
                              $("#ddlInstitute").append($("<option></option").val(item.split('|')[0]).html(item.split('|')[1]));
                          });

                          //  BindDegreeWithCast();
                          $("#ddlDegree").empty();
                          //InstituteDDLChange();
                          $("#ddlInstitute").change();

                      },
                      error: function (result) {
                      }
                  });
              });

          }
          function InstituteDDLChange() {
              $("#ddlInstitute").change(function () {
                  // alert('Hello');
                  var UnivID = $("#ddlUniversity").val();
                  var InstID = $("#ddlInstitute").val();
                  var cstcat = $("#ddlCastCategoryType").val();
              
                  if (cstcat == 1) {
                      BindDegreeWithCast();
                  }
                  else if (cstcat == 2) {
                      BindDegreeWithActualCast();
                  }
                  else if (cstcat == 3) {
                      BindDegreeWithAdmissionType();
                  }
                  else {
                      BindDegreeWithGender();
                  }

              
              });
          }

       

          function CastCategoryDDLChange() {

              $("#ddlCastCategoryType").change(function () {
                  var cstcat = $("#ddlCastCategoryType").val();
                  if (cstcat == 1) {
                      BindDegreeWithCast();
                  }
                  else if (cstcat == 2) {
                      BindDegreeWithActualCast();
                  }
                  else if (cstcat == 3) {
                      BindDegreeWithAdmissionType();
                  }
                  else {
                      BindDegreeWithGender();
                  }
                  //   BindDegreeWithActualCast();

              });

          }

          function InitialCalling() {

              var cstcat = $("#ddlCastCategoryType").val();
              if (cstcat == 1) {
                  BindDegreeWithCast();
              }
              else if (cstcat == 2) {
                  BindDegreeWithActualCast();
              }
              else if (cstcat == 3) {
                  BindDegreeWithAdmissionType();
              }
              else {
                  BindDegreeWithGender();
              }


          }

          function AcademicYearDDLChange() {

              $("#ddlAcademicYear").change(function () {
                  InitialCalling();

              });
          }
    </script>

  
    <style type="text/css">
        body
        {
                padding-top: 10px;
        }
        .chartddl
        {
            width: 200px;
            display: inline;
        }
        .row
        {
            margin-top: 20px;
        }
        .lblstyle
        {
            margin-left: 10px;
            display: inline;
            width: 200px !important;
        }
        .lblstyle2
        {
            margin-left: 120px;
        }
        
        .lblstyle3
        {
            margin-left: 10px;
            display: inline;
            width: 200px !important;
            margin-top: 10px;
        }
        .lblstyle4
        {
            margin-left: 140px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div>
        <div>
            <asp:HiddenField ID="hdnforcolor" runat="server" ClientIDMode="Static" Value="0" />
        </div>
        <div>
            <asp:Label ID="lblReportType" runat="server" Text="Report Type" ForeColor="White"
                CssClass="lblstyle"></asp:Label>
            <asp:Label ID="lblAcademicYear" runat="server" Text="Academic Year" ForeColor="White"
                CssClass="lblstyle lblstyle2"></asp:Label>
        </div>
        <div style="margin-left: 10px;">
            <asp:DropDownList ID="ddlCastCategoryType" runat="server" CssClass="chartddl form-control"
                ClientIDMode="Static">
                <%--   <asp:ListItem Value="1" Selected="True"> MCA</asp:ListItem>--%>
                <asp:ListItem Value="1">Cast Category </asp:ListItem>
                <asp:ListItem Value="2">Actual Cast Category </asp:ListItem>
                <asp:ListItem Value="3">Admission Type</asp:ListItem>
                <asp:ListItem Value="4"> Gender </asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="ddlAcademicYear" runat="server" CssClass="chartddl form-control"
                ClientIDMode="Static">
            </asp:DropDownList>
        </div>
        <div>
            <asp:Label ID="lblUniversity" runat="server" Text="University" ForeColor="White"
                CssClass="lblstyle3"></asp:Label>
            <asp:Label ID="lblInstitute" runat="server" Text="Institute" ForeColor="White" CssClass="lblstyle3 lblstyle4"></asp:Label>
        </div>
        <div style="margin-top: 0px; margin-left: 10px;">
            <asp:DropDownList ID="ddlUniversity" runat="server" CssClass="chartddl form-control"
                ClientIDMode="Static">
                <%--   <asp:ListItem Value="1" Selected="True"> MCA</asp:ListItem>--%>
            </asp:DropDownList>
            <asp:DropDownList ID="ddlInstitute" runat="server" CssClass="chartddl form-control"
                ClientIDMode="Static">
                <%--<asp:ListItem Value="1" Selected="True"> MCA</asp:ListItem>--%>
            </asp:DropDownList>
        </div>
        <div class="row">
            <div id="container" style="min-width: 1600; height: 350px; margin: 0 auto">
            </div>
            <br />
        </div>
        <div class="row">
            <div id="container2" style="min-width: 1600; height: 350px; margin: 0 auto">
            </div>
            <br />
        </div>
    </div>
</asp:Content>
