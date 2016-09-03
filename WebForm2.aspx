<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="WebSolutionChart.WebForm2" %>

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
        $(function () {
            Highcharts.setOptions({ lang: { thousandsSep: ','} });
            Highcharts.numberFormat = function (number, decimals, decimalPoint, thousandsSep) {
                number = +number || 0;
                decimals = +decimals; var lang = Highcharts.getOptions().lang, origDec = (number.toString().split('.')[1] || '').length,
                            decimalComponent, strinteger, thousands, absNumber = Math.abs(number), ret;
                if (decimals === -1) {
                    decimals = Math.min(origDec, 20);
                } else if (!$.isNumeric(decimals)) {
                    decimals = 2;
                } strinteger = String(Highcharts.pInt(absNumber.toFixed(decimals)));
                thousands = strinteger.length > 3 ? (strinteger.length - 1) % 2 : 0;
                decimalPoint = Highcharts.pick(decimalPoint, lang.decimalPoint); 
                thousandsSep = Highcharts.pick(thousandsSep, lang.thousandsSep);
                ret = number < 0 ? '-' : ''; ret += thousands ? strinteger.substr(0, thousands) + thousandsSep : '';
                ret += strinteger.substr(thousands).replace(/(\\d{2})(?=\\d{3})/g, '$1' + thousandsSep);
                if (decimals) {
                    decimalComponent = Math.abs(absNumber - strinteger + Math.pow(10, -Math.max(decimals, origDec) - 1));
                    ret += decimalPoint + decimalComponent.toFixed(decimals).slice(2);
                } return ret;
            };
         $('#container').highcharts({chart: {                                 type: 'column'                             },                             title: {                                 text: 'Total Admission Fees (from 2016-01-05 to 2016-08-31)'                             },                             subtitle: {                                 text: 'Total Amount: 62480325, Report Date: 31/8/2016  18:25:10 '    }, loading: {                    labelStyle: {                        top: '45%',                        backgroundImage: 'url(http://jsfiddle.net/img/logo.png)',                        display: 'block',                        width: '136px',                        height: '26px',                        backgroundColor: '#000'                    }                },                            xAxis: {                                 type: 'category',                                 labels: {                                     rotation: -45,                                     style: {                                         fontSize: '13px',                                         fontFamily: 'Verdana, sans-serif'                                     }                                 }                             },                             yAxis: {                                 min: 0,                                 title: {                                     text: 'Amount'                                 }                             },                             legend: {                                 enabled: false                             },                             tooltip: {                                 pointFormat: 'Total Amount {point.y:,.0f}'                             },                             series: [{                                 name: 'Amount',data:[['IOT',30811400],['UVPCE',14716425],['VMPIM',5724000],['IOA',5488400],['AMPICS',3964900],['DSW',1586400],['DCS',188800],],dataLabels: {                                     enabled: true,                                     rotation: -0,                                     color: '#FFFFFF',                                     align: 'center',                       format: '{point.y:,.0f}',            y: 4,  style: {fontSize: '13px',                                         fontFamily: 'Verdana, sans-serif'                                     }                                 }                             }]                         });    });             
   
   
   
    </script>
    
    
    
    <script type="text/javascript">

//        var strinteger = "116000";
//        var str = "1," + strinteger.substr(1).replace(/(\d{2})(?=\d{3})/g, '$1' + ",");



//        $(function () {
//            Highcharts.setOptions({ lang: { thousandsSep: ','} });
//            Highcharts.numberFormat = function (number, decimals, decimalPoint, thousandsSep) {
//                number = +number || 0;
//                decimals = +decimals;
//                var lang = Highcharts.getOptions().lang, origDec = (number.toString().split('.')[1] || '').length,
//                decimalComponent, strinteger, 
//                thousands, absNumber = Math.abs(number), ret;
//                if (decimals === -1) {
//                    decimals = Math.min(origDec, 20);
//                } else if (!$.isNumeric(decimals)) {
//                    decimals = 2;
//                } strinteger = String(Highcharts.pInt(absNumber.toFixed(decimals)));
//                thousands = strinteger.length > 3 ? (strinteger.length - 1) % 2 : 0;
//                decimalPoint = Highcharts.pick(decimalPoint, lang.decimalPoint);
//                thousandsSep = Highcharts.pick(thousandsSep, lang.thousandsSep);
//                ret = number < 0 ? '-' : '';
//                ret += thousands ? strinteger.substr(0, thousands) + thousandsSep : '';
//                ret += strinteger.substr(thousands).replace(/(\d{2})(?=\d{3})/g, '$1' + thousandsSep);
//                if (decimals) {
//                    decimalComponent = Math.abs(absNumber - strinteger + Math.pow(10, -Math.max(decimals, origDec) - 1));
//                    ret += decimalPoint + decimalComponent.toFixed(decimals).slice(2);
//                } return ret;
//            };
//            $('#container').highcharts({ chart: { type: 'column' }, title: { text: 'Total Admission Fees (from 2016-08-30 to 2016-08-30)' }, subtitle: { text: 'Total Amount: 1169600, Report Date: 30/8/2016  18:36:20 ' }, loading: { labelStyle: { top: '45%', backgroundImage: 'url(http://jsfiddle.net/img/logo.png)', display: 'block', width: '136px', height: '26px', backgroundColor: '#000'} }, xAxis: { type: 'category', labels: { rotation: -45, style: { fontSize: '13px', fontFamily: 'Verdana, sans-serif'}} }, yAxis: { min: 0, title: { text: 'Amount'} }, legend: { enabled: false }, tooltip: { pointFormat: 'Total Amount ' }, series: [{ name: 'Amount', data: [['IOT', 11600], ], dataLabels: { enabled: true, rotation: -0, color: '#FFFFFF', align: 'center', y: 4, style: { fontSize: '13px', fontFamily: 'Verdana, sans-serif'}}}] });
//                });


//        $(function () {
//            Highcharts.setOptions({
//                lang: {
//                    thousandsSep: ','
//                }
//            });
//      Highcharts.numberFormat = function (number, decimals, decimalPoint, thousandsSep) {
//                number = +number || 0;
//                decimals = +decimals;

//                var lang = Highcharts.getOptions().lang,
//            origDec = (number.toString().split('.')[1] || '').length,
//            decimalComponent,
//            strinteger,
//            thousands,
//            absNumber = Math.abs(number),
//            ret;
//                if (decimals === -1) {
//                    decimals = Math.min(origDec, 20);
//                } else if (!isNumber(decimals)) {
//                    decimals = 2;
//                }

//                strinteger = String(Highcharts.pInt(absNumber.toFixed(decimals)));
//                thousands = strinteger.length > 3 ? (strinteger.length - 1) % 2 : 0;
//                decimalPoint = Highcharts.pick(decimalPoint, lang.decimalPoint);
//                thousandsSep = Highcharts.pick(thousandsSep, lang.thousandsSep);
//                ret = number < 0 ? '-' : '';
//                ret += thousands ? strinteger.substr(0, thousands) + thousandsSep : '';
//                ret += strinteger.substr(thousands).replace(/(\d{2})(?=\d{3})/g, '$1' + thousandsSep);
//                if (decimals) {
//                    decimalComponent = Math.abs(absNumber - strinteger + Math.pow(10, -Math.max(decimals, origDec) - 1));
//                    ret += decimalPoint + decimalComponent.toFixed(decimals).slice(2);
//                }
//                return ret;
//            };

//            $('#container2').highcharts({
//                series: [{
//                    name: 'Tokyo',
//                    data: [1, 10, 100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000, 10000000000]
//                }]
//            });
//        });
     
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
        .highcharts-title
        {
            color: #1393A9 !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>

       
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
            <div id="container" style="min-width: 1600; height: 400px; margin: 10 auto; padding: 20px;">
            </div>
            <br />
        </div>
        <div class="row">
            <div id="container2" style="min-width: 1600; height: 400px; margin: 10 auto;">
            </div>
            <br />
        </div>
    </div>
    </form>
</body>
</html>
