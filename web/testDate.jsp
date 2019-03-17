<%-- 
    Document   : testDate
    Created on : Mar 17, 2019, 10:46:50 PM
    Author     : Panji Sadewo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>datepicker demo</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.12.4.js"></script>
  <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
 
<div id="datepicker"></div>
 
<script>
$( "#datepicker" ).datepicker({beforeShowDay: $.datepicker.noWeekends});
</script>
 
</body>
</html>
