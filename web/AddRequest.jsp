<%-- 
    Document   : AddRequest
    Created on : Mar 15, 2019, 1:40:20 PM
    Author     : acer
--%>

<%@page import="java.time.Duration"%>
<%@page import="models.RequestStatus"%>
<%@page import="models.LoginSession"%>
<%@page import="models.Request"%>
<%@page import="java.util.List"%>
<%@page import="models.LeaveType"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="Header.jsp" />
<body id="page-top">
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Begin Container-->
            <div class="container-fluid">
                <div class="d-sm-flex align-items-center justify-content-between mb-4">     
                    <h1 class="h3 mb-0 text-gray-800">Add Request</h1>
                </div>
                <form action="AddRequestServlet" method="POST">
                    <table cellspacing='50' align ='center' border="2">
                        <tbody>
                            <tr>
                                <td>Start Leave</td>
                                <td><input type="text" id="startdate" name="startdate"/></td>
                            </tr>
                            <tr>
                                <td>End Leave</td>
                                <td><input type="text" id="enddate" name="enddate"/></td>
                            </tr>
                            <tr>
                                <td>Total</td>
                                <td><input type="text" id="total" name="total" readonly></td>
                            </tr>
                            <tr>
                                <td>Leave Type</td>
                                <td><select name="leavetype" />
                                    <% for (LeaveType elem : (List<LeaveType>) session.getAttribute("LeaveType")) {
                                            out.print("<option "
                                                    + "value=\"" + elem.getId() + "\" "
                                                    + (elem.getId().equals(session.getAttribute("LeaveType")) ? "selected" : "") + ">"
                                                    + elem.getType() + "</option>");
                                        }%>
                                    </select></td>
                            </tr>
                            <tr>
                                <td colspan="2" align='center' ><input type="submit" value="Save" name="Submit" /></td>
                            </tr>
                        </tbody>
                    </table>
                    <div>
                        <select name="isS1">
                            <option value="0">Sedang Diproses</option>
                            <option value="1">Telah Diproses</option>
                        </select>
                    </div>

                </form> 

                <div>
                    <table id="" class=" table table-striped" cellspacing='30' align ='center' border="1">

                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>Id</th>
                                <th>Request Date</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%int j = 1;
                                for (RequestStatus elem : (List<RequestStatus>) session.getAttribute("Request")) {%>
                            <tr>
                                <td><%= j++%></td>
                                <td><%= elem.getRequest().getId()%></td>
                                <td><%= elem.getDatetime()%></td>
                                <td><%= elem.getStatus().getType()%></td>
                            </tr>
                            <%}%>

                        </tbody>
                    </table>
                </div>
            </div>
            <!-- End Container-->



            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Leave Request Website 2019</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <script>
        $("#startdate").datepicker({beforeShowDay: $.datepicker.noWeekends, dateFormat: 'dd-mm-yy'});
        $("#enddate").datepicker({beforeShowDay: $.datepicker.noWeekends, dateFormat: 'dd-mm-yy'});
        $("#startdate").click(function () {
            var start = document.getElementById("startdate").value;
            var end = document.getElementById("enddate").value;
            var startTanggal = start.split("-")[0];
            var endTanggal = end.split("-")[0];
            var startBulan = start.split("-")[1];
            var endBulan = end.split("-")[1];
            var startTahun = start.split("-")[2];
            var endTahun = end.split("-")[2];
            var totalCuti = (endTanggal - startTanggal + ((endBulan - startBulan) * 30) + ((endTahun - startTahun) * 360));
            document.getElementById("total").value = totalCuti.toString();
        });
        $("#enddate").click(function () {
            var start = document.getElementById("startdate").value;
            var end = document.getElementById("enddate").value;
            var startTanggal = start.split("-")[0];
            var endTanggal = end.split("-")[0];
            var startBulan = start.split("-")[1];
            var endBulan = end.split("-")[1];
            var startTahun = start.split("-")[2];
            var endTahun = end.split("-")[2];
            var totalCuti = (endTanggal - startTanggal + ((endBulan - startBulan) * 30) + ((endTahun - startTahun) * 360));
            document.getElementById("total").value = totalCuti.toString();
        });
    </script>
</body>
<jsp:include page="Footer.jsp" />
