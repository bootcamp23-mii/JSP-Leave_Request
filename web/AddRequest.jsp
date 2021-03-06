<%-- 
    Document   : AddRequest
    Created on : Mar 15, 2019, 1:40:20 PM
    Author     : acer
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.Duration"%>
<%@page import="models.RequestStatus"%>
<%@page import="models.LoginSession"%>
<%@page import="models.Request"%>
<%@page import="java.util.List"%>
<%@page import="models.LeaveType"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="Header.jsp"%>
<body>
    <!-- Content Wrapper -->
    <form action="AddRequestServlet" method="POST">
        <a type="button" class="btn btn-success" data-target="#modalRegion" data-toggle="modal">Add Request</a>
        <div class="modal fade" id="modalRegion" tabindex="-1" role="dialog" 
             aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header text-center">   
                        <h3 class="modal-title">Add Request</h3>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body mx-3">
                        <div class="modal-body mx-5"
                             <label data-error="wrong" data-success="true">Start Leave</label>
                            <input type="text" id="startdate" name="startdate" class="form-control form-control-user"/>
                        </div>
                        <div class="modal-body mx-5"
                             <label data-error="wrong" data-success="true">End Leave</label>
                            <input type="text" id="enddate" name="enddate" class="form-control form-control-user"/>
                        </div>
                        <div class="modal-body mx-5"
                             <label data-error="wrong" data-success="true">Total</label>
                            <input type="text" id="total" name="total" readonly class="form-control form-control-user" />
                        </div>
                        <div class="modal-body mx-5"
                             <label data-error="wrong" data-success="true">Leave Type</label>
                            <select type="text" id="leavetype" name="leavetype" class="form-control form-control-user"/>
                            <% for (LeaveType elem : (List<LeaveType>) session.getAttribute("LeaveType")) {
                                    out.print("<option "
                                            + "value=\"" + elem.getId() + "\" "
                                            + (elem.getId().equals(session.getAttribute("LeaveType")) ? "selected" : "") + ">"
                                            + elem.getType() + "</option>");
                                }%>
                            </select>
                        </div>  
                        <div class="modal-footer">
                            <input type="submit" value="Save" name="Submit" class="btn btn-info" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <table id="AddTable" class=" table table-striped" cellspacing='30' align ='center' border="1">

        <thead>
            <tr>
                <th>No.</th>
                <!--                    <th>Id</th>-->
                <th>StartDate</th>
                <th>EndDate</th>
                <th>Request Date</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <%int j = 1;
                    SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
                    for (RequestStatus elem : (List<RequestStatus>) session.getAttribute("Request")) {%>
            <tr>
                <td><%= j++%></td>
                <td><%= dateFormat.format(elem.getRequest().getStartdate())%></td>
                <td><%= dateFormat.format(elem.getRequest().getEnddate())%></td>
                <td><%= dateFormat.format(elem.getDatetime())%></td>
                <td><%= elem.getStatus().getType()%></td>
            </tr>
            <%}%>

        </tbody>
    </table>
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
        var totalCuti = (endTanggal - startTanggal + 1 + ((endBulan - startBulan) * 30) + ((endTahun - startTahun) * 360));
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
        var totalCuti = (endTanggal - startTanggal + 1 + ((endBulan - startBulan) * 30) + ((endTahun - startTahun) * 360));
        document.getElementById("total").value = totalCuti.toString();
    });
</script>
</body>
<%@include file="Footer.jsp"%>
