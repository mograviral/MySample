<%@ Page Title="" Language="C#" MasterPageFile="~/MasterChart.Master" AutoEventWireup="true" CodeBehind="TotalStudentLineChart.aspx.cs" Inherits="WebSolutionChart.TotalStudentLineChart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
            InitialCalling();
        });

        function InitialCalling() {
            BindLineChart();
        
        }

        function InstituteDDLChange() {
            $("#ddlInstitute").change(function () {
                BindLineChart();
            });
        }

        function BindLineChart() {
          //  var academicYear = $("#ddlAcademicYear").val();
            var instituteID = $("#ddlInstitute").val();
            var InstituteName = $("#ddlInstitute option:selected").text();
          //  var reporttype = $("#ddlCastCategoryType option:selected").text();
            var dt = new Date();
            var maxnumId = null;
            var curdate = dt.getDate() + "/" + (dt.getMonth() + 1) + "/" + dt.getFullYear() + "  " + dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds();
            $.ajax({
                type: "POST",
                contentType: "application/json;charset=utf-8",
                url: "TotalStudentLineChart.aspx/Get_DataFor_BindTotalStudentsYearWise",
                data: "{'InstituteID':'" + instituteID + "'}",
                dataType: "Json",
                success: function (data) {

                    if (data.d.length > 0 && data != null) {
                        var resdata = "";
                        var totalstudents = 0;
                        var dataforpie = "";
                        var per = 0;
                        var academicyears = "";
                        var mydata = new Array();

                        academicyears = data.d[0].split(",").toString();
                        for (var i = 0; i < data.d.length - 1; i++) {
                            mydata.push(data.d[i + 1]);
                        }

                        $.map(mydata, function (item) {

                            resdata = resdata + "{name:'" + item.split('|')[0] + "',data: [" + item.split('|')[1] + " ]},";
                        });

                        var highchartstring = "$(function () {            $('#container').highcharts({                title: {                    text: 'Number Of Admission Yearwise',                    x: -20                },                subtitle: {                    text: 'Institute Name:" + InstituteName + ", Report Date:" + curdate + "',                    x: -20                },                xAxis: {                    categories: [" + academicyears + "]                },                yAxis: {                    title: {                        text: 'Number of Students'                    },                    plotLines: [{                        value: 0,                        width: 1,                        color: '#808080'                    }]                },                tooltip: {                    valueSuffix: ''                },                legend: {                    layout: 'vertical',                    align: 'right',                    verticalAlign: 'middle',                    borderWidth: 0                }, ";
                        var highchartstring2 = " series: [" + resdata + "]            });        });";

                        var highchartstring3 = highchartstring + highchartstring2;
//                        var highchartstring4 = "$(function () {                          $('#container2').highcharts({                              chart: {                                  type: 'column'                              },                              title: {                                  text: 'Stacked column chart of Students by " + reporttype + "'                          },     subtitle: {text: 'Institute Name:" + InstituteName + ", Academic Year: " + academicYear + ", Report Date:" + curdate + "' },                          xAxis: {                                  categories: [" + degrees + "]                              },                              yAxis: {                                  min: 0,                                  title: {                                      text: 'Number Of Students'                                  }  ,               stackLabels: {                enabled: true,                style: {                    fontWeight: 'bold',                    color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'                }            }                            },                              tooltip: {                                  pointFormat: '<span style=\"color:{series.color}\">{series.name}</span>: <b>{point.y}</b> ({point.percentage:.0f}%)<br/>',                                  shared: true                              },                              plotOptions: {                                  column: {                                      stacking: 'percent'                                  }                              },";
//                        var highchartstring5 = "series: [" + resdata + "]                          });                      });";
//                        var highchartstring6 = highchartstring4 + highchartstring5;


                        //stackLabels: {                enabled: true,                style: {                    fontWeight: 'bold',                    color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'                }            }



                        var fun = Function(highchartstring3);
                       // var fun2 = Function(highchartstring6);
                        fun();
                       // fun2();
                    }
                    else {
                        var highchartstring = "$(function () {            $('#container').highcharts({                title: {                    text: 'Monthly Average Temperature',                    x: -20                },                subtitle: {                    text: 'Source: WorldClimate.com',                    x: -20                },                xAxis: {                    categories: []                },                yAxis: {                    title: {                        text: 'Number of Students'                    },                    plotLines: [{                        value: 0,                        width: 1,                        color: '#808080'                    }]                },                tooltip: {                    valueSuffix: ''                },                legend: {                    layout: 'vertical',                    align: 'right',                    verticalAlign: 'middle',                    borderWidth: 0                }, ";
                        var highchartstring2 = " series: []            });        });";

                        var highchartstring3 = highchartstring + highchartstring2;
                     ////   var highchartstring4 = "$(function () {                          $('#container2').highcharts({                              chart: {                                  type: 'column'                              },                              title: {                                  text: 'Stacked column chart of Students by " + reporttype + "'                          },     subtitle: {text: 'Institute Name:" + InstituteName + ", Academic Year:" + academicYear + ", Report Date:" + curdate + "' },                          xAxis: {                                  categories: []                              },                              yAxis: {                                  min: 0,                                  title: {                                      text: 'Number Of Students'                                  }  ,               stackLabels: {                enabled: true,                style: {                    fontWeight: 'bold',                    color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'                }            }                            },                              tooltip: {                                  pointFormat: '<span style=\"color:{series.color}\">{series.name}</span>: <b>{point.y}</b> ({point.percentage:.0f}%)<br/>',                                  shared: true                              },                              plotOptions: {                                  column: {                                      stacking: 'percent'                                  }                              },";
                     //   var highchartstring5 = "series: []                          });                      });";
                     //   var highchartstring6 = highchartstring4 + highchartstring5;



                        var fun = Function(highchartstring3);
                     //   var fun2 = Function(highchartstring6);
                        fun();
                    //    fun2();



                    }


                },
                error: function (result) {
                    alert('error');
                }
            });
        
        }


     //   $(function () {            $('#container').highcharts({                title: {                    text: 'Monthly Average Temperature',                    x: -20                },                subtitle: {                    text: 'Source: WorldClimate.com',                    x: -20                },                xAxis: {                    categories: [" + academicyears + "]                },                yAxis: {                    title: {                        text: 'Temperature (°C)'                    },                    plotLines: [{                        value: 0,                        width: 1,                        color: '#808080'                    }]                },                tooltip: {                    valueSuffix: '°C'                },                legend: {                    layout: 'vertical',                    align: 'right',                    verticalAlign: 'middle',                    borderWidth: 0                },                series: [" + resdata + "]            });        });




        function UnivDDLChange() {

            $("#ddlUniversity").change(function () {
                // alert('Hello');
                var UnivID = $("#ddlUniversity").val();
                //  $("#ddlUniversity").data() =
                //  $("#ddlUniversity").bind()
                $.ajax({
                    type: "POST",
                    contentType: "application/json;charset=utf-8",
                    url: "TotalStudentLineChart.aspx/Get_DataFor_BindInstituteInfo",
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
                      //  $("#ddlDegree").empty();
                        //InstituteDDLChange();
                        $("#ddlInstitute").change();

                    },
                    error: function (result) {
                    }
                });
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
            <div id="container" style="min-width: 1600; height: 700px; margin: 0 auto">
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
