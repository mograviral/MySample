<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebSolutionChart.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
    <script type="text/javascript">
        $(function () {
            $('#container').highcharts({
                chart: {
                    type: 'column'
                },
                title: {
                    text: 'World\'s largest cities per 2014'


                },
                subtitle: {
                    text: 'Source: <a href="http://en.wikipedia.org/wiki/List_of_cities_proper_by_population">Wikipedia</a>'
                },
                loading: {
                    labelStyle: {
                        top: '45%',
                        backgroundImage: 'url("http://jsfiddle.net/img/logo.png")',
                        display: 'block',
                        width: '136px',
                        height: '26px',
                        backgroundColor: '#000'
                    }
                },


                xAxis: {
                    type: 'category',
                    labels: {
                        rotation: 25,
                        style: {
                            fontSize: '13px',
                            fontFamily: 'Verdana, sans-serif'
                        }
                    }
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: 'Population (millions)'
                    }
                },
                legend: {
                    enabled: false
                },
                tooltip: {
                    pointFormat: 'Population in 2008: <b>{point.y:.1f} millions</b>'
                },
                series: [{
                    name: 'Population',
                    data: [
                ['Shanghai', 23.7],
                ['Lagos', 16.1],
                ['Istanbul', 14.2],
                ['Karachi', 14.0],
                ['Mumbai', 12.5],
                ['Moscow', 12.1],
                ['São Paulo', 11.8],
                ['Beijing', 11.7],
                ['Guangzhou', 11.1],
                ['Delhi', 11.1],
                ['Shenzhen', 10.5],
                ['Seoul', 10.4],
                ['Jakarta', 10.0],
                ['Kinshasa', 9.3],
                ['Tianjin', 9.3],
                ['Tokyo', 9.0],
                ['Cairo', 8.9],
                ['Dhaka', 8.9],
                ['Mexico City', 8.9],
                ['Lima', 8.9]
            ],
                    dataLabels: {
                        enabled: true,
                        rotation: -0,
                        color: '#FFFFFF',
                        align: 'center',
                        format: '{point.y:.0f}', // one decimal
                        y: 7, // 10 pixels down from the top
                        style: {
                            fontSize: '13px',
                            fontFamily: 'Verdana, sans-serif'
                        }
                    }
                }]
            });
        });
    </script>
    <script type="text/javascript">
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

                    //     chart.showloading();


                    $.map(data.d, function (item) {
                        //                         return {
                        //                             label: item.split('-')[0],
                        //                             val: item.split('-')[1]
                        //                         }
                        resdata = resdata + "['" + item.split('|')[0] + "'," + item.split('|')[1] + "],"
                        totalstudents = totalstudents + Number(item.split('|')[1]);

                    });
                    var highchartstring = "$(function () {   $('#container').highcharts({chart: {                                 type: 'column'                             },                             title: {                                 text: 'Report Name : " + reporttype + " wise students '                             },                             subtitle: {                                 text: 'Institute : " + InstituteName + ", Degree : " + degreeName + ", Academic Year : " + academicYear + " , Total Students : " + totalstudents + ", Date : " + curdate + "'                             }, loading: {                    labelStyle: {                        top: '45%',                        backgroundImage: 'url(http://jsfiddle.net/img/logo.png)',                        display: 'block',                        width: '136px',                        height: '26px',                        backgroundColor: '#000'                    }                },                            xAxis: {                                 type: 'category',                                 labels: {                                     rotation: -45,                                     style: {                                         fontSize: '13px',                                         fontFamily: 'Verdana, sans-serif'                                     }                                 }                             },                             yAxis: {                                 min: 0,                                 title: {                                     text: 'Students'                                 }                             },                             legend: {                                 enabled: false                             },                             tooltip: {                                 pointFormat: 'Number of Students {point.y:.1f}'                             },                             series: [{                                 name: 'Students',";
                    var highchartstring2 = "data:[" + resdata + "],dataLabels: {                                     enabled: true,                                     rotation: -0,                                     color: '#FFFFFF',                                     align: 'center',                                     format: '{point.y:.0f}',  y: 7,  style: {fontSize: '13px',                                         fontFamily: 'Verdana, sans-serif'                                     }                                 }                             }]                         });                     });";
                    var highchartstring3 = highchartstring + highchartstring2;
                    // var highchartstring3 = "$(function () { $('#container').highcharts({ chart: { type: 'column' }, title: { text: 'Worlds largest cities per 2014' }, subtitle: { text: 'Source: <a href=#>Wikipedia</a>' }, xAxis: { type: 'category', labels: { rotation: -45, style: { fontSize: '13px', fontFamily: 'Verdana, sans-serif'}} }, yAxis: { min: 0, title: { text: 'Population (millions)'} }, legend: { enabled: false }, tooltip: { pointFormat: 'Population in 2008: <b>{point.y:.1f} millions</b>' }, series: [{ name: 'Population', data: [['SC', 3], ['OPEN', 65], ['SEBC', 10], ], dataLabels: { enabled: true, rotation: -90, color: '#FFFFFF', align: 'right', format: '{point.y:.1f}', y: 10, style: { fontSize: '13px', fontFamily: 'Verdana, sans-serif'}}}] }); })"
                    // var script = "<script type=\"text/javascript\"> " + highchartstring + " </script\>";
                    //   $('body').append(script); 
                    //  var sample = "$(function(){ alert('hello') });";
                    //  
                    var F = new Function(highchartstring3);
                    //   F.showLoading();
                    F();
                    //   F.hideLoading();
                    //  eval("alert('hello')");
                },
                error: function (result) {
                }
            });
        }





        $(function () {
            Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, function (color) {
                return {
                    radialGradient: {
                        cx: 0.5,
                        cy: 0.3,
                        r: 0.7
                    },
                    stops: [
                [0, color],
                [1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
            ]
                };
            });

            // Build the chart
//            $('#container2').highcharts({
//                chart: {
//                    plotBackgroundColor: null,
//                    plotBorderWidth: null,
//                    plotShadow: false,
//                    type: 'pie'
//                },
//                title: {
//                    text: 'Browser market shares. January, 2015 to May, 2015'
//                },
//                tooltip: {
//                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
//                },
//                plotOptions: {
//                    pie: {
//                        allowPointSelect: true,
//                        cursor: 'pointer',
//                        dataLabels: {
//                            enabled: true,
//                            format: '<b>{point.name}</b>: {point.percentage:.1f} %',
//                            style: {
//                                color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
//                            },
//                            connectorColor: 'silver'
//                        }
//                    }
//                },
//                series: [{
//                    name: 'Brands',
//                    data: [
//                { name: 'Microsoft Internet Explorer', y: 56.33 },
//                {
//                    name: 'Chrome',
//                    y: 24.03,
//                    sliced: true,
//                    selected: true
//                },
//                { name: 'Firefox', y: 10.38 },
//                { name: 'Safari', y: 4.77 }, { name: 'Opera', y: 0.91 },
//                { name: 'Proprietary or Undetectable', y: 0.2 }
//            ]
//                }]
//            });
//        });

 $(function () {            Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, 
 function (color) {                return {             
        radialGradient: {                   
             cx: 0.5,                        cy: 0.3,                        r: 0.7                    },                 
                stops: [                [0, color],                [1, Highcharts.Color(color).brighten(-0.3).get('rgb')]             ] 
                               }; 
                           }); 
                $('#container2').highcharts({             
                   chart: {                    plotBackgroundColor: null,                 
                      plotBorderWidth: null,                    plotShadow: false,            
                              type: 'pie'                },                title: {
                                  text: 'Cast Category  17/8/2016  12:23:22'
                              },
                              tooltip: {
                                  pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                              },
                              plotOptions: {
                                  pie: { allowPointSelect: true,
                                      cursor: 'pointer',

                                      dataLabels: {
                                          enabled: true, format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                                          style: { color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                                          }, connectorColor: 'silver'
                                      }
                                  }
                              }, series: [{ name: 'Brands',
                                  data: [{ name: 'SC', y: 3.85 }, { name: 'SEBC', y: 12.82 }, { name: 'OPEN', y: 83.33 }, ]   
                                           }]            });        });

    
    </script>
    <script>
            $(function () {            Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, function (color) {                return {                    radialGradient: {                        cx: 0.5,                        cy: 0.3,                        r: 0.7                    },                    stops: [                [0, color],                [1, Highcharts.Color(color).brighten(-0.3).get('rgb')]          ]                };            });




            $(function () {           
             Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors,
              function (color) {                return {                   
               radialGradient: {                        cx: 0.5,                        cy: 0.3,                        r: 0.7     
                              },                    stops: [                [0, color],           
                                   [1, Highcharts.Color(color).brighten(-0.3).get('rgb')]          ] 
                                                  };            });
    </script>
    <script>
    $(function () {     Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, 
    function (color) {                return {               
         radialGradient: {                        cx: 0.5,                        cy: 0.3,                        r: 0.7                    }
         ,                    stops: [                [0, color],          
               [1, Highcharts.Color(color).brighten(-0.3).get('rgb')]             ]                };            });  
               
               
               $('#container').highcharts({chart: {            
                                    type: 'column'                             },            
                                                     title:{                            
                           text: 'Report Name : " + reporttype + " wise students '                  
                                      },          
                                              subtitle: {                          
                                                         text: 'Institute : " + InstituteName + ", Degree : " + degreeName + ",
                                                                Academic Year : " + academicYear + " , Total Students : " + fintolstd + ",
                                                                Date : " + findate + "'   
                                                        }, 
                                                       
                                                       loading: {                    labelStyle: {                        top: '45%',                        backgroundImage: 'url(http://jsfiddle.net/img/logo.png)',                        display: 'block',                        width: '136px',                        height: '26px',                        backgroundColor: '#000'                    }                },                            xAxis: {                                 type: 'category',                                 labels: {                                     rotation: -45,                                     style: {                                         fontSize: '13px',                                         fontFamily: 'Verdana, sans-serif'                                     }                                 }                             },                             yAxis: {                                 min: 0,                                 title: {                                     text: 'Students'                                 }                             },                             legend: {                                 enabled: false                             },                             tooltip: {                                 pointFormat: 'Number of Students {point.y:.1f}'                             },                             series: [{                                 name: 'Students',
    data:[" + resdata + "],dataLabels: {                                     enabled: true,                                     rotation: -0,                                     color: '#FFFFFF',                                     align: 'center',                                     format: '{point.y:.0f}',  y: 7,  style: {fontSize: '13px',                                         fontFamily: 'Verdana, sans-serif'                                     }                                 }                             }]                         });                     
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div id="container" style="min-width: 1600; height: 400px; margin: 0 auto">
        </div>
    </div>
    <div>
        <div id="container2" style="min-width: 1600; height: 400px; margin: 0 auto">
        </div>
    </div>
    </form>
</body>
</html>
