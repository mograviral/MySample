<%@ Page Title="" Language="C#" MasterPageFile="~/MasterChart.Master" AutoEventWireup="true"
    CodeBehind="DailyCollectionBarChart.aspx.cs" Inherits="WebSolutionChart.DailyCollectionBarChart" %>

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
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js" type="text/javascript"></script>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
        rel="Stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function () {

            $("[id$=txtStartdate]").datepicker({
                dateFormat: 'dd-mm-yy',
              //  dateFormat: 'yy-mm-dd',
                changeYear: true,
                changeMonth: true,
                yearRange: "2004 : 2020" // + (new Date).getFullYear() + 1

            }).datepicker("setDate", new Date());

            $("[id$=txtEnddate]").datepicker({
                  dateFormat: 'dd-mm-yy',
              //  dateFormat: 'yy-mm-dd',
                changeYear: true,
                changeMonth: true,
                yearRange: "2004 : 2020" // + (new Date).getFullYear() + 1
                // setDate: new Date
                //yearRange: "'" + (new Date) + ":'" + (((new Date).getFullYear()) + 1)
            }).datepicker("setDate", new Date());


        });
    </script>
    <script type="text/javascript">




        $(document).ready(function () {

            UnivDDLChange();
            InitialCalling();
            StartDateChange();
            EndDateChange();
            DayBookCheckListChange();
        });

        function Sample() {
            var sam = new Date("09/08/2015", "dd/mm/yy");
            var startdate1 = new Date($('#txtStartdate').val());
        }

        function BindDailyCollection() {
            var univID = $("#ddlUniversity").val();
            var univName = $("#ddlUniversity  option:selected").text();
            //  var academicYear = $("#ddlAcademicYear").val();
            var daybooktype = $("#rbtndaybooktype input:checked").val();

            var daybooktype = $("#rbtndaybooktype input:checked");
            var daybookcheckedlist = "";
            daybooktype.each(function () {
                var value = $(this).val();
              //  var text = $(this).closest("td").find("label").html();
                daybookcheckedlist += value+",";
              //  daybookcheckedlist += "\n";
            });



         //   var startdate1 = $("#txtStartdate").val();
            var startdate = $("[id$=txtStartdate]").val();
            var enddate =  $("[id$=txtEnddate]").val();

            // var sdate = startdate.getDate().toString();
            // var edate = enddate.getDate().toString();
            //  var InstituteName = $("#ddlInstitute option:selected").text();
            //  var reporttype = $("#ddlCastCategoryType option:selected").text();
            var dt = new Date();
            var curdate = dt.getDate() + "/" + (dt.getMonth() + 1) + "/" + dt.getFullYear() + "  " + dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds();
            $.ajax({
                type: "POST",
                contentType: "application/json;charset=utf-8",
                url: "DailyCollectionBarChart.aspx/Get_DataFor_DailyCollection",
                data: "{'UnivID':'" + univID + "','Daybooktype':'" + daybookcheckedlist + "','Startdate':'" + startdate + "','Enddate':'" + enddate + "'}",
                dataType: "Json",
                success: function (data) {
                    var resdata = "";
                    var totalamount = 0;
                    var dataforpie = "";
                    var per = 0;

                    $.map(data.d, function (item) {
                        resdata = resdata + "['" + item.split('|')[0] + "'," + item.split('|')[1] + "],"
                        totalamount = totalamount + Number(item.split('|')[1]);
                       // strinteger.substr(thousands).replace(/(d{2})(?=d{3})/g, '$1' + thousandsSep);
                    });

                    var setop = "$(function () {    });";
                    var forcurrencyindian = "$(function () {   });";
                    var highchartstring = "$(function () {   Highcharts.setOptions({        lang: {            thousandsSep: ','        }  });  Highcharts.numberFormat = function (number, decimals, decimalPoint, thousandsSep) {                        number = +number || 0;                        decimals = +decimals; var lang = Highcharts.getOptions().lang,     origDec = (number.toString().split('.')[1] || '').length,            decimalComponent,            strinteger,            thousands,            absNumber = Math.abs(number),            ret;                        if (decimals === -1) {                            decimals = Math.min(origDec, 20);                        } else if (!$.isNumeric(decimals)) {                            decimals = 2;                        } strinteger = String(Highcharts.pInt(absNumber.toFixed(decimals)));                        thousands = strinteger.length > 3 ? (strinteger.length - 1) % 2 : 0;                        decimalPoint = Highcharts.pick(decimalPoint, lang.decimalPoint);                        thousandsSep = Highcharts.pick(thousandsSep, lang.thousandsSep);                        ret = number < 0 ? '-' : '';                        ret += thousands ? strinteger.substr(0, thousands) + thousandsSep : '';                        ret += strinteger.substr(thousands).replace(/(\\d{2})(?=\\d{3})/g, '$1' + thousandsSep);                        if (decimals) {                            decimalComponent = Math.abs(absNumber - strinteger + Math.pow(10, -Math.max(decimals, origDec) - 1));                            ret += decimalPoint + decimalComponent.toFixed(decimals).slice(2);                        }                        return ret;                    };   $('#container').highcharts({chart: {                                 type: 'column'                             },                             title: {                                 text: 'Total Admission Fees (from " + startdate + " to " + enddate + ")'                             },                             subtitle: {                                 text: 'Total Amount: " + totalamount + ", Report Date: " + curdate + " '    }, loading: {                    labelStyle: {                        top: '45%',                        backgroundImage: 'url(http://jsfiddle.net/img/logo.png)',                        display: 'block',                        width: '136px',                        height: '26px',                        backgroundColor: '#000'                    }                },                            xAxis: {                                 type: 'category',                                 labels: {                                     rotation: -45,                                     style: {                                         fontSize: '13px',                                         fontFamily: 'Verdana, sans-serif'                                     }                                 }                             },                             yAxis: {                                 min: 0,                                 title: {                                     text: 'Amount'                                 }                             },                             legend: {                                 enabled: false                             },                             tooltip: {                                 pointFormat: 'Total Amount {point.y:,.0f}'                             },                             series: [{                                 name: 'Amount',";
                    var highchartstring2 = "data:[" + resdata + "],dataLabels: {                                     enabled: true,                                     rotation: -0,                                     color: '#FFFFFF',                                     align: 'center',                       format: '{point.y:,.0f}',            y: 4,  style: {fontSize: '13px',                                         fontFamily: 'Verdana, sans-serif'                                     }                                 }                             }]                         });    });                 ";

                    //var highchartstring = "$(function () {   Highcharts.setOptions({        lang: {            thousandsSep: ','        }  });  Highcharts.numberFormat = function (number, decimals, decimalPoint, thousandsSep) {                        number = +number || 0;                        decimals = +decimals; var lang = Highcharts.getOptions().lang,            origDec = (number.toString().split('.')[1] || '').length,            decimalComponent,            strinteger,            thousands,            absNumber = Math.abs(number),            ret;                        if (decimals === -1) {                            decimals = Math.min(origDec, 20);                        } else if (!$.isNumeric(decimals)) {                            decimals = 2;                        } strinteger = String(Highcharts.pInt(absNumber.toFixed(decimals)));                        thousands = strinteger.length > 3 ? (strinteger.length - 1) % 2 : 0;                        decimalPoint = Highcharts.pick(decimalPoint, lang.decimalPoint);                        thousandsSep = Highcharts.pick(thousandsSep, lang.thousandsSep);                        ret = number < 0 ? '-' : '';                        ret += thousands ? strinteger.substr(0, thousands) + thousandsSep : '';                        ret += strinteger.substr(thousands).replace(/(\d{2})(?=\d{3})/g, '$1' + thousandsSep);                        if (decimals) {                            decimalComponent = Math.abs(absNumber - strinteger + Math.pow(10, -Math.max(decimals, origDec) - 1));                            ret += decimalPoint + decimalComponent.toFixed(decimals).slice(2);                        }                        return ret;                    };   $('#container').highcharts({chart: {                                 type: 'column'                             },                             title: {                                 text: 'Total Admission Fees (from " + startdate + " to " + enddate + ")'                             },                             subtitle: {                                 text: 'Total Amount: " + totalamount + ", Report Date: " + curdate + " '    }, loading: {                    labelStyle: {                        top: '45%',                        backgroundImage: 'url(http://jsfiddle.net/img/logo.png)',                        display: 'block',                        width: '136px',                        height: '26px',                        backgroundColor: '#000'                    }                },                            xAxis: {                                 type: 'category',                                 labels: {                                     rotation: -45,                                     style: {                                         fontSize: '13px',                                         fontFamily: 'Verdana, sans-serif'                                     }                                 }                             },                             yAxis: {                                 min: 0,                                 title: {                                     text: 'Amount'                                 }                             },                             legend: {                                 enabled: false                             },                             tooltip: {                                 pointFormat: 'Total Amount {point.y:,.0f}'                             },                             series: [{                                 name: 'Amount',";
                   // var highchartstring2 = "data:[" + resdata + "],dataLabels: {                                     enabled: true,                                     rotation: -0,                                     color: '#FFFFFF',                                     align: 'center',                                     format: '{point.y:,.0f}',  y: 4,  style: {fontSize: '13px',                                         fontFamily: 'Verdana, sans-serif'                                     }                                 }                             }]                         });    });                 ";
                    var highchartstring3 = highchartstring + highchartstring2;
               //     var setoption = Function(setop);
               //     var indcur = Function(forcurrencyindian);
                    var Final = Function(highchartstring3);
                  //  setoption();
                 //   indcur();
                    Final();


                },
                error: function (result) {
                    alert('error');
                }
            });
        }


        function StartDateChange() {
            $("#txtStartdate").change(function () {
                BindDailyCollection();
            });
        }

        function EndDateChange() {
            $("#txtEnddate").change(function () {
                BindDailyCollection();
            });
        }

        function DayBookCheckListChange() {
            $("#rbtndaybooktype").change(function () {
                BindDailyCollection();
            });
        
        }

        function UnivDDLChange() {

            $("#ddlUniversity").change(function () {
                BindDailyCollection();
            });
        }


        function InitialCalling() {
            BindDailyCollection();

        }
    </script>
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
            margin-left: 130px;
        }
        
        .lblstyle3
        {
            margin-left: 20px;
            display: inline;
            width: 200px !important;
            margin-top: 10px;
        }
        .lblstyle4
        {
            margin-left: 150px;
        }
        .chartrbtn
        {
            margin-top: 30px;
            width: 200px;
            display: inline;
        }
        
        .charttxtbox
        {
            width: 200px;
            display: inline;
        }
        html .ui-autocomplete a
        {
            color: Black !important;
        }
        .ui-state-default, .ui-widget-content .ui-state-default, .ui-widget-header .ui-state-default
        {
            color: #555555 !important;
        }
        #rbtndaybooktype td
        {
            border: 0px solid silver !important;
        }
        
        .checkbox
        {
            padding-left: 20px;
        }
        .checkbox label
        {
            display: inline-block;
            vertical-align: middle;
            position: relative;
            padding-left: 5px;
        }
        .checkbox label::before
        {
            content: "";
            display: inline-block;
            position: absolute;
            width: 17px;
            height: 17px;
            left: 0;
            margin-left: -20px;
            border: 1px solid #cccccc;
            border-radius: 3px;
            background-color: #fff;
            -webkit-transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
            -o-transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
            transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
        }
        .checkbox label::after
        {
            display: inline-block;
            position: absolute;
            width: 16px;
            height: 16px;
            left: 0;
            top: 0;
            margin-left: -20px;
            padding-left: 3px;
            padding-top: 1px;
            font-size: 11px;
            color: #555555;
        }
        .checkbox input[type="checkbox"]
        {
            opacity: 0;
            z-index: 1;
        }
        .checkbox input[type="checkbox"]:checked + label::after
        {
            font-family: "FontAwesome";
            content: "\f00c";
        }
         
        .checkbox-primary input[type="checkbox"]:checked + label::before
        {
            background-color: #337ab7;
            border-color: #337ab7;
        }
        .checkbox-primary input[type="checkbox"]:checked + label::after
        {
            color: #fff;
        }
        
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div>
            <asp:HiddenField ID="hdnforcolor" runat="server" ClientIDMode="Static" Value="0" />
        </div>
        <div>
            <asp:Label ID="lblUniversity" runat="server" Text="University" ForeColor="White"
                CssClass="lblstyle"></asp:Label>
            <asp:Label ID="lblDayBookType" runat="server" Text="Day Book Type" ForeColor="White"
                CssClass="lblstyle lblstyle2"></asp:Label>
            <asp:Label ID="lblStartdate" runat="server" Text="Start Date" ForeColor="White" CssClass="lblstyle lblstyle3"></asp:Label>
            <asp:Label ID="lblEnddate" runat="server" Text="End Date" ForeColor="White" CssClass="lblstyle lblstyle4"></asp:Label>
        </div>
        <div style="margin-left: 10px;" class="">
            <asp:DropDownList ID="ddlUniversity" runat="server" CssClass="chartddl form-control"
                ClientIDMode="Static">
            </asp:DropDownList>
            <div class="checkbox checkbox-primary" style="display:inline;">
            <asp:CheckBoxList ID="rbtndaybooktype" runat="server" CssClass="chartrbtn " ForeColor="White" RepeatDirection="Horizontal"  ClientIDMode="Static" >
                
                <asp:ListItem Selected="True" Value="C" style=" padding-right: 15px;">Cash</asp:ListItem>
                <asp:ListItem Value="B">Bank</asp:ListItem>
            </asp:CheckBoxList>
            </div>
            <asp:TextBox ID="txtStartdate" CssClass="charttxtbox form-control" runat="server"
                ClientIDMode="Static"></asp:TextBox>
            <asp:TextBox ID="txtEnddate" CssClass="charttxtbox form-control" runat="server" ClientIDMode="Static"></asp:TextBox>
         
        </div>
        <div class="row">
            <div id="container" style="min-width: 1600; height: 350px; margin: 0 auto">
            </div>
            <br />
        </div>
    </div>
</asp:Content>
