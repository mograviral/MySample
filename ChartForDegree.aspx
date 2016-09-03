<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChartForDegree.aspx.cs"
    Inherits="WebSolutionChart.ChartForDegree" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Chart By Student Cast</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
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
            //BindDegreeWithCast();
            UnivDDLChange();
            InstituteDDLChange();
            DegreeDDLChange();
            //BindDegreeWithActualCast();
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
            var degreeID = $("#ddlDegree").val();
            var degreeName = $("#ddlDegree  option:selected").text();
            var academicYear = $("#ddlAcademicYear").val();
            var instituteID = $("#ddlInstitute").val();
            var InstituteName = $("#ddlInstitute option:selected").text();
            var reporttype = $("#ddlCastCategoryType option:selected").text();
            var dt = new Date();
            var curdate = dt.getDate() + "/" + (dt.getMonth() + 1) + "/" + dt.getFullYear() + "  " + dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds();
            $.ajax({
                type: "POST",
                contentType: "application/json;charset=utf-8",
                url: "ChartForDegree.aspx/Get_DataFor_BindDegreeWithCast",
                data: "{'DegreeID':'" + degreeID + "','InstituteID':'" + instituteID + "','AcademicYear':'" + academicYear + "'}",
                dataType: "Json",
                success: function (data) {
                    var resdata = "";
                    var totalstudents = 0;
                    var dataforpie = "";
                    var per = 0;
                    //     chart.showloading();
                    $.map(data.d, function (item) {
                        //                         return {
                        //                             label: item.split('-')[0],
                        //                             val: item.split('-')[1]
                        //                         }
                        resdata = resdata + "['" + item.split('|')[0] + "'," + item.split('|')[1] + "],"
                        totalstudents = totalstudents + Number(item.split('|')[1]);
                        //  per = (Number(item.split('|')[1]) * 100 / Number(totalstudents));
                        // dataforpie = dataforpie + "{name:'" + item.split('|')[0] + "',y:" + (Number(item.split('|')[1]) * 100 / Number(totalstudents)) + "},"

                    });
                    $.map(data.d, function (item) {
                        per = Number((Number(item.split('|')[1]) * 100 / Number(totalstudents)).toFixed(2));
                        dataforpie = dataforpie + "{name:'" + item.split('|')[0] + "',y:" + (Number(Number(item.split('|')[1]) * 100 / Number(totalstudents)).toFixed(2)) + "},"
                    });
                    var fintolstd = totalstudents.toString();
                    var findate = curdate.toString();
                 //   var colorfun = "$(function () { Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, function (color) {                return {                    radialGradient: {                        cx: 0.5,                        cy: 0.3,                        r: 0.7                    },                    stops: [                [0, color],                [1, Highcharts.Color(color).brighten(-0.3).get('rgb')]             ]                };            }); });"
                    var highchartstring = "$(function () {  $('#container').highcharts({chart: {                                 type: 'column'                             },                             title: {                                 text: 'Report Name : " + reporttype + " wise students '                             },                             subtitle: {                                 text: 'Institute : " + InstituteName + "'    }, loading: {                    labelStyle: {                        top: '45%',                        backgroundImage: 'url(http://jsfiddle.net/img/logo.png)',                        display: 'block',                        width: '136px',                        height: '26px',                        backgroundColor: '#000'                    }                },                            xAxis: {                                 type: 'category',                                 labels: {                                     rotation: -45,                                     style: {                                         fontSize: '13px',                                         fontFamily: 'Verdana, sans-serif'                                     }                                 }                             },                             yAxis: {                                 min: 0,                                 title: {                                     text: 'Students'                                 }                             },                             legend: {                                 enabled: false                             },                             tooltip: {                                 pointFormat: 'Number of Students {point.y:.1f}'                             },                             series: [{                                 name: 'Students',";
                    var highchartstring2 = "data:[" + resdata + "],dataLabels: {                                     enabled: true,                                     rotation: -0,                                     color: '#FFFFFF',                                     align: 'center',                                     format: '{point.y:.0f}',  y: 7,  style: {fontSize: '13px',                                         fontFamily: 'Verdana, sans-serif'                                     }                                 }                             }]                         });                     ";
                    var highchartstring3 = highchartstring + highchartstring2;
                    var piechart = "   $('#container2').highcharts({                chart: {                    plotBackgroundColor: null,                    plotBorderWidth: null,                    plotShadow: false,                    type: 'pie'                },                title: {                    text:'Report Name : " + reporttype + " '               },   subtitle: {                                 text: 'Institute : " + InstituteName + ", Degree : " + degreeName + ", Academic Year : " + academicYear + " , Total Students : " + totalstudents + ", Date : " + curdate + "'                             },               tooltip: {                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'                },                plotOptions: {                    pie: {                        allowPointSelect: true,                        cursor: 'pointer',                        dataLabels: {                            enabled: true,                            format: '<b>{point.name}</b>: {point.percentage:.1f} %',                            style: {                                color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'                            },                            connectorColor: 'silver'                        }                    }                },                series: [{                    name: 'Brands',";
                    var piechart2 = "data: [            " + dataforpie + "           ]                }]            });        });";
                    var piechart3 = piechart + piechart2;
                    var finalallchart = highchartstring3 + piechart3;
                    var Final = Function(finalallchart);
                  //  var fcolor = Function(colorfun);
                  //  fcolor();
                    Final();


                },
                error: function (result) {
                    alert('error');
                }
            });
        }

        function BindDegreeWithActualCast() {
            var degreeID = $("#ddlDegree").val();
            var degreeName = $("#ddlDegree  option:selected").text();
            var academicYear = $("#ddlAcademicYear").val();
            var instituteID = $("#ddlInstitute").val();
            var InstituteName = $("#ddlInstitute option:selected").text();
            var reporttype = $("#ddlCastCategoryType option:selected").text();
            var dt = new Date();
            var curdate = dt.getDate() + "/" + (dt.getMonth() + 1) + "/" + dt.getFullYear() + "  " + dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds();
            $.ajax({
                type: "POST",
                contentType: "application/json;charset=utf-8",
                url: "ChartForDegree.aspx/Get_DataFor_BindDegreeWithActualCast",
                data: "{'DegreeID':'" + degreeID + "','InstituteID':'" + instituteID + "','AcademicYear':'" + academicYear + "'}",
                dataType: "Json",
                success: function (data) {
                    var resdata = "";
                    var totalstudents = 0;
                    var dataforpie = "";
                    var per = 0;
                    $.map(data.d, function (item) {
                        //                         return {
                        //                             label: item.split('-')[0],
                        //                             val: item.split('-')[1]
                        //                         }
                        resdata = resdata + "['" + item.split('|')[0] + "'," + item.split('|')[1] + "],"
                        totalstudents = totalstudents + Number(item.split('|')[1]);
                    });
                    $.map(data.d, function (item) {
                        per = Number((Number(item.split('|')[1]) * 100 / Number(totalstudents)).toFixed(2));
                        dataforpie = dataforpie + "{name:'" + item.split('|')[0] + "',y:" + (Number(Number(item.split('|')[1]) * 100 / Number(totalstudents)).toFixed(2)) + "},"
                    });
                    var fintolstd = totalstudents.toString();
                    var findate = curdate.toString();
                 //   var colorfun = "$(function () { Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, function (color) {                return {                    radialGradient: {                        cx: 0.5,                        cy: 0.3,                        r: 0.7                    },                    stops: [                [0, color],                [1, Highcharts.Color(color).brighten(-0.3).get('rgb')]             ]                };            }); });"
                    var highchartstring = "$(function () {       $('#container').highcharts({chart: {                                 type: 'column'                             },                             title: {                                 text: 'Report Name : " + reporttype + " wise students '                             },                             subtitle: {                                 text: 'Institute : " + InstituteName + "'                             }, loading: {                    labelStyle: {                        top: '45%',                        backgroundImage: 'url(http://jsfiddle.net/img/logo.png)',                        display: 'block',                        width: '136px',                        height: '26px',                        backgroundColor: '#000'                    }                },                            xAxis: {                                 type: 'category',                                 labels: {                                     rotation: -45,                                     style: {                                         fontSize: '13px',                                         fontFamily: 'Verdana, sans-serif'                                     }                                 }                             },                             yAxis: {                                 min: 0,                                 title: {                                     text: 'Students'                                 }                             },                             legend: {                                 enabled: false                             },                             tooltip: {                                 pointFormat: 'Number of Students {point.y:.1f}'                             },                             series: [{                                 name: 'Students',";
                    var highchartstring2 = "data:[" + resdata + "],dataLabels: {                                     enabled: true,                                     rotation: -0,                                     color: '#FFFFFF',                                     align: 'center',                                     format: '{point.y:.0f}',  y: 7,  style: {fontSize: '13px',                                         fontFamily: 'Verdana, sans-serif'                                     }                                 }                             }]                         });                     ";
                    var highchartstring3 = highchartstring + highchartstring2;
                    var piechart = "   $('#container2').highcharts({                chart: {                    plotBackgroundColor: null,                    plotBorderWidth: null,                    plotShadow: false,                    type: 'pie'                },                title: {                    text:'Report Name : " + reporttype + " '               },   subtitle: {                                 text: 'Institute : " + InstituteName + ", Degree : " + degreeName + ", Academic Year : " + academicYear + " , Total Students : " + totalstudents + ", Date : " + curdate + "'                             },               tooltip: {                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'                },                plotOptions: {                    pie: {                        allowPointSelect: true,                        cursor: 'pointer',                        dataLabels: {                            enabled: true,                            format: '<b>{point.name}</b>: {point.percentage:.1f} %',                            style: {                                color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'                            },                            connectorColor: 'silver'                        }                    }                },                series: [{                    name: 'Brands',";
                    var piechart2 = "data: [            " + dataforpie + "           ]                }]            });        });";
                    var piechart3 = piechart + piechart2;
                    var finalallchart = highchartstring3 + piechart3;
                    var Final = Function(finalallchart);
                  //  var fcolor = Function(colorfun);
                  //  fcolor();
                    Final();

                },
                error: function (result) {
                }
            });
        }

        function BindDegreeWithAdmissionType() {
            var degreeID = $("#ddlDegree").val();
            var degreeName = $("#ddlDegree  option:selected").text();
            var academicYear = $("#ddlAcademicYear").val();
            var instituteID = $("#ddlInstitute").val();
            var InstituteName = $("#ddlInstitute option:selected").text();
            var reporttype = $("#ddlCastCategoryType option:selected").text();
            var dt = new Date();
            var curdate = dt.getDate() + "/" + (dt.getMonth() + 1) + "/" + dt.getFullYear() + "  " + dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds();
            $.ajax({
                type: "POST",
                contentType: "application/json;charset=utf-8",
                url: "ChartForDegree.aspx/Get_DataFor_BindDegreeWithAdmissionType",
                data: "{'DegreeID':'" + degreeID + "','InstituteID':'" + instituteID + "','AcademicYear':'" + academicYear + "'}",
                dataType: "Json",
                success: function (data) {
                    var resdata = "";
                    var totalstudents = 0;
                    var dataforpie = "";
                    var per = 0;
                    $.map(data.d, function (item) {
                        //                         return {
                        //                             label: item.split('-')[0],
                        //                             val: item.split('-')[1]
                        //                         }
                        resdata = resdata + "['" + item.split('|')[0] + "'," + item.split('|')[1] + "],"
                        totalstudents = totalstudents + Number(item.split('|')[1]);
                    });
                    $.map(data.d, function (item) {
                        per = Number((Number(item.split('|')[1]) * 100 / Number(totalstudents)).toFixed(2));
                        dataforpie = dataforpie + "{name:'" + item.split('|')[0] + "',y:" + (Number(Number(item.split('|')[1]) * 100 / Number(totalstudents)).toFixed(2)) + "},"
                    });
                    var fintolstd = totalstudents.toString();
                    var findate = curdate.toString();
                    //   var colorfun = "$(function () { Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, function (color) {                return {                    radialGradient: {                        cx: 0.5,                        cy: 0.3,                        r: 0.7                    },                    stops: [                [0, color],                [1, Highcharts.Color(color).brighten(-0.3).get('rgb')]             ]                };            }); });"
                    var highchartstring = "$(function () {       $('#container').highcharts({chart: {                                 type: 'column'                             },                             title: {                                 text: 'Report Name : " + reporttype + " wise students '                             },                             subtitle: {                                 text: 'Institute : " + InstituteName + "'                             }, loading: {                    labelStyle: {                        top: '45%',                        backgroundImage: 'url(http://jsfiddle.net/img/logo.png)',                        display: 'block',                        width: '136px',                        height: '26px',                        backgroundColor: '#000'                    }                },                            xAxis: {                                 type: 'category',                                 labels: {                                     rotation: -45,                                     style: {                                         fontSize: '13px',                                         fontFamily: 'Verdana, sans-serif'                                     }                                 }                             },                             yAxis: {                                 min: 0,                                 title: {                                     text: 'Students'                                 }                             },                             legend: {                                 enabled: false                             },                             tooltip: {                                 pointFormat: 'Number of Students {point.y:.1f}'                             },                             series: [{                                 name: 'Students',";
                    var highchartstring2 = "data:[" + resdata + "],dataLabels: {                                     enabled: true,                                     rotation: -0,                                     color: '#FFFFFF',                                     align: 'center',                                     format: '{point.y:.0f}',  y: 7,  style: {fontSize: '13px',                                         fontFamily: 'Verdana, sans-serif'                                     }                                 }                             }]                         });                     ";
                    var highchartstring3 = highchartstring + highchartstring2;
                    var piechart = "   $('#container2').highcharts({                chart: {                    plotBackgroundColor: null,                    plotBorderWidth: null,                    plotShadow: false,                    type: 'pie'                },                title: {                    text:'Report Name : " + reporttype + " '               },   subtitle: {                                 text: 'Institute : " + InstituteName + ", Degree : " + degreeName + ", Academic Year : " + academicYear + " , Total Students : " + totalstudents + ", Date : " + curdate + "'                             },               tooltip: {                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'                },                plotOptions: {                    pie: {                        allowPointSelect: true,                        cursor: 'pointer',                        dataLabels: {                            enabled: true,                            format: '<b>{point.name}</b>: {point.percentage:.1f} %',                            style: {                                color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'                            },                            connectorColor: 'silver'                        }                    }                },                series: [{                    name: 'Brands',";
                    var piechart2 = "data: [            " + dataforpie + "           ]                }]            });        });";
                    var piechart3 = piechart + piechart2;
                    var finalallchart = highchartstring3 + piechart3;
                    var Final = Function(finalallchart);
                    //  var fcolor = Function(colorfun);
                    //  fcolor();
                    Final();
                },
                error: function (result) {
                }
            });
        }

        function BindDegreeWithGender() {
            var degreeID = $("#ddlDegree").val();
            var degreeName = $("#ddlDegree  option:selected").text();
            var academicYear = $("#ddlAcademicYear").val();
            var instituteID = $("#ddlInstitute").val();
            var InstituteName = $("#ddlInstitute option:selected").text();
            var reporttype = $("#ddlCastCategoryType option:selected").text();
            var dt = new Date();
            var curdate = dt.getDate() + "/" + (dt.getMonth() + 1) + "/" + dt.getFullYear() + "  " + dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds();
            $.ajax({
                type: "POST",
                contentType: "application/json;charset=utf-8",
                url: "ChartForDegree.aspx/Get_DataFor_BindDegreeWithGender",
                data: "{'DegreeID':'" + degreeID + "','InstituteID':'" + instituteID + "','AcademicYear':'" + academicYear + "'}",
                dataType: "Json",
                success: function (data) {
                    var resdata = "";
                    var totalstudents = 0;
                    var dataforpie = "";
                    var per = 0;
                    $.map(data.d, function (item) {

                        resdata = resdata + "['" + item.split('|')[0] + "'," + item.split('|')[1] + "],"
                        totalstudents = totalstudents + Number(item.split('|')[1]);
                    });
                    $.map(data.d, function (item) {
                        per = Number((Number(item.split('|')[1]) * 100 / Number(totalstudents)).toFixed(2));
                        dataforpie = dataforpie + "{name:'" + item.split('|')[0] + "',y:" + (Number(Number(item.split('|')[1]) * 100 / Number(totalstudents)).toFixed(2)) + "},"
                    });
                    var fintolstd = totalstudents.toString();
                    var findate = curdate.toString();
                    //   var colorfun = "$(function () { Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, function (color) {                return {                    radialGradient: {                        cx: 0.5,                        cy: 0.3,                        r: 0.7                    },                    stops: [                [0, color],                [1, Highcharts.Color(color).brighten(-0.3).get('rgb')]             ]                };            }); });"
                    var highchartstring = "$(function () {       $('#container').highcharts({chart: {                                 type: 'column'                             },                             title: {                                 text: 'Report Name : " + reporttype + " wise students '                             },                             subtitle: {                                 text: 'Institute : " + InstituteName + "'                             }, loading: {                    labelStyle: {                        top: '45%',                        backgroundImage: 'url(http://jsfiddle.net/img/logo.png)',                        display: 'block',                        width: '136px',                        height: '26px',                        backgroundColor: '#000'                    }                },                            xAxis: {                                 type: 'category',                                 labels: {                                     rotation: -45,                                     style: {                                         fontSize: '13px',                                         fontFamily: 'Verdana, sans-serif'                                     }                                 }                             },                             yAxis: {                                 min: 0,                                 title: {                                     text: 'Students'                                 }                             },                             legend: {                                 enabled: false                             },                             tooltip: {                                 pointFormat: 'Number of Students {point.y:.1f}'                             },                             series: [{                                 name: 'Students',";
                    var highchartstring2 = "data:[" + resdata + "],dataLabels: {                                     enabled: true,                                     rotation: -0,                                     color: '#FFFFFF',                                     align: 'center',                                     format: '{point.y:.0f}',  y: 7,  style: {fontSize: '13px',                                         fontFamily: 'Verdana, sans-serif'                                     }                                 }                             }]                         });                     ";
                    var highchartstring3 = highchartstring + highchartstring2;
                    var piechart = "   $('#container2').highcharts({                chart: {                    plotBackgroundColor: null,                    plotBorderWidth: null,                    plotShadow: false,                    type: 'pie'                },                title: {                    text:'Report Name : " + reporttype + " '               },   subtitle: {                                 text: 'Institute : " + InstituteName + ", Degree : " + degreeName + ", Academic Year : " + academicYear + " , Total Students : " + totalstudents + ", Date : " + curdate + "'                             },               tooltip: {                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'                },                plotOptions: {                    pie: {                        allowPointSelect: true,                        cursor: 'pointer',                        dataLabels: {                            enabled: true,                            format: '<b>{point.name}</b>: {point.percentage:.1f} %',                            style: {                                color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'                            },                            connectorColor: 'silver'                        }                    }                },                series: [{                    name: 'Brands',";
                    var piechart2 = "data: [            " + dataforpie + "           ]                }]            });        });";
                    var piechart3 = piechart + piechart2;
                    var finalallchart = highchartstring3 + piechart3;
                    var Final = Function(finalallchart);
                    //  var fcolor = Function(colorfun);
                    //  fcolor();
                    Final();

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
                    url: "ChartForDegree.aspx/Get_DataFor_BindInstituteInfo",
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
                //  $("#ddlUniversity").data() =
                //  $("#ddlUniversity").bind()
                $.ajax({
                    type: "POST",
                    contentType: "application/json;charset=utf-8",
                    url: "ChartForDegree.aspx/Get_DataFor_BindDegreeInfo",
                    data: "{'UnivID':'" + UnivID + "','InstID':'" + InstID + "'}",
                    dataType: "Json",
                    success: function (data) {

                        //alert(data);
                        $("#ddlDegree").empty();
                        $.map(data.d, function (item) {
                            //  alert(item.split('-')[1]);

                            $("#ddlDegree").append($("<option></option").val(item.split('|')[0]).html(item.split('|')[1]));

                        });
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

                    },
                    error: function (result) {
                    }
                });
            });
        }

        function DegreeDDLChange() {

            $("#ddlDegree").change(function () {

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

                //BindDegreeWithCast();
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
        .chartddl
        {
            width: 200px;
            display: inline;
        }
        .row
        {
            margin-top: 50px;
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
</head>
<body>
    <form id="form1" runat="server">
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
            <asp:Label ID="lblDegree" runat="server" Text="Degree" ForeColor="White" CssClass="lblstyle3 lblstyle4"></asp:Label>
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
            <asp:DropDownList ID="ddlDegree" runat="server" CssClass="chartddl form-control"
                ClientIDMode="Static">
                <%-- <asp:ListItem Value="1" Selected="True"> MCA</asp:ListItem>--%>
            </asp:DropDownList>
        </div>



        <div class="row">
            <div id="container" style="min-width: 1600; height: 400px; margin: 0 auto">
            </div>
            <br />
        </div>
        <div class="row">
            <div id="container2" style="min-width: 1600; height: 400px; margin: 0 auto">
            </div>
            <br />
        </div>
    </div>
    </form>
</body>
</html>
