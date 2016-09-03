<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" CodeBehind="ChartTest1.aspx.cs"
    Inherits="WebSolutionChart.ChartTest1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sample Charts</title>
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
</head>
<body>
    <form id="form1" runat="server">
    <div id="hs-component">
        <div class="container">
            <div id="wrap" class="sidebar-wrapper">
                <div id="page-wrapper">
                    <div id="page-inner">
                        <div class="row">
                            <div class="col-md-12">
                                <h1 class="page-header">
                                    Dashboard <small>Summary of your App</small>
                                </h1>
                            </div>
                        </div>
                        <!-- /. ROW  -->
                        <div class="row">
                            <div class="col-md-3 col-sm-12 col-xs-12">
                                <div class="panel panel-primary text-center no-boder bg-color-green">
                                    <div class="panel-body">
                                        <i class="fa fa-users fa-5x"></i>
                                        <h3>
                                            <label id="lblTotalStudent" runat="server">
                                            </label>
                                        </h3>
                                    </div>
                                    <div class="panel-footer back-footer-green">
                                        No. of Students In The Institute
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-12 col-xs-12">
                                <div class="panel panel-primary text-center no-boder bg-color-blue">
                                    <div class="panel-body">
                                        <i class="fa fa-certificate fa-5x"></i>
                                        <h3>
                                            <label id="lblYearStudent" runat="server">
                                            </label>
                                        </h3>
                                    </div>
                                    <div class="panel-footer back-footer-blue">
                                        No. of Admission &nbsp;&nbsp;
                                        <label id="lblYear" runat="server">
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-12 col-xs-12">
                                <div class="panel panel-primary text-center no-boder bg-color-red">
                                    <div class="panel-body">
                                        <i class="fa fa fa-building-o fa-5x"></i>
                                        <h3>
                                            <label id="lblInstitute" runat="server">
                                            </label>
                                        </h3>
                                    </div>
                                    <div class="panel-footer back-footer-red">
                                        No. of Institute
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-12 col-xs-12">
                                <div class="panel panel-primary text-center no-boder bg-color-brown">
                                    <div class="panel-body">
                                        <i class="fa fa-users fa-5x"></i>
                                        <h3>
                                            36,752
                                        </h3>
                                    </div>
                                    <div class="panel-footer back-footer-brown">
                                        No. of Visits
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div id="container" style="min-width: 1600; height: 400px; margin: 0 auto">
                            </div>
                            <br />
                        </div>
                        <div class="row">
                            <div id="container1" style="min-width: 1600; height: 1800px; margin: 0 auto">
                            </div>
                            <br />
                        </div>
                        <div class="row">
                            <div id="container2" style="min-width: 1600; height: 1800px; margin: 0 auto">
                            </div>
                            <br />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
