<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="WebSolutionChart.WebForm3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <script src="Scripts/jquery-1.12.4.min.js" type="text/javascript"></script>
    <script src="Scripts/bootstrap.js" type="text/javascript"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js" type="text/javascript"></script>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"rel="Stylesheet" type="text/css" />
   <script type="text/javascript">
    $(document).ready(function () {
          $("[id$=txtStartdate]").datepicker({
                dateFormat: 'dd-mm-yy',
                changeYear: true,
                changeMonth: true,
                yearRange: "2004 : 2020" // + (new Date).getFullYear() + 1
            }).datepicker("setDate", new Date()); ;


        });
    </script>
    <script type="text/javascript">
      $(document).ready(function () {
   //      $(function () { 

            // $("#txtStartdate").val("viral");
            var newv = $("#txtStartdate").attr("value");
            var startdate = $("#txtStartdate").val();
            var startdate2 = $("#TextBox1").val();
     //       });
        });

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="txtStartdate" CssClass=" form-control" runat="server"  ClientIDMode="Static"></asp:TextBox>
           <asp:TextBox ID="TextBox1" CssClass=" form-control" runat="server" ClientIDMode="Static"></asp:TextBox>
    </div>
    </form>
</body>
</html>
