<%-- 
    Document   : AddRequest
    Created on : Mar 15, 2019, 1:40:20 PM
    Author     : acer
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="models.LoginSession"%>
<%@page import="models.RequestStatus"%>
<%@page import="models.Request"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="Header.jsp" />
    <jsp:include page="TemplateUsers.jsp"/>
    <body id="page-top">
       <form action="HistoryUserServlet" method="POST">
            <div class="modal fade" id="modalHistory" tabindex="-1" role="dialog" 
                 aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header text-center">   
                            <h3 class="modal-title">View Detail Request</h3>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body mx-3">
                            <div class="modal-body mx-5">
                                 <label data-error="wrong" data-success="true">ID</label>
                                <input type="text" disabled="true" id="h-id" name="id" class="form-control form-control-user"/>
                            </div>
                            <div class="modal-body mx-5">
                                 <label data-error="wrong" data-success="true">Start Leave</label>
                                <input type="text" disabled="true" id="h-startdate" name="startdate" class="form-control form-control-user"/>
                            </div>
                            <div class="modal-body mx-5">
                                 <label data-error="wrong" data-success="true">End Leave</label>
                                <input type="text" disabled="true" id="h-enddate" name="enddate" class="form-control form-control-user"/>
                            </div>
                            <div class="modal-body mx-5">
                                 <label data-error="wrong" data-success="true">Total</label>
                                <input type="text" disabled="true" id="h-total" name="total" class="form-control form-control-user" />
                            </div>
                            <div class="modal-body mx-5">
                                 <label data-error="wrong" data-success="true">Leave Type</label>
                                <input type="text" disabled="true" id="h-leavetype" name="leavetype" class="form-control form-control-user" />
                            </div>  
                            <div class="modal-body mx-5">
                                 <label data-error="wrong" data-success="true">Employee</label>
                                <input type="text" disabled="true" id="h-employee" name="employee" class="form-control form-control-user" />
                            </div>  
                            <div class="modal-body mx-5">
                                 <label data-error="wrong" data-success="true">Status</label>
                                <input type="text" disabled="true" id="h-status" name="status" class="form-control form-control-user" />
                            </div>  
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <div class="d-sm-flex align-items-center justify-content-between mb-4">     
            <h1 class="h3 mb-0 text-gray-800">History of Your Request</h1>
        </div>
        <div>
            <table id="historyTable" class=" table table-striped" cellspacing='30' align ='center' border="1">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Start</th>
                        <th>End</th>
                        <th>Total</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>
                    <%int j = 1;
                        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
                        for (Request elem : (List<Request>) session.getAttribute("request")) {%>
                    <tr>
                        <td><%= j++%></td>                                     
                        <td><%= dateFormat.format(elem.getStartdate())%></td>
                        <td><%= dateFormat.format(elem.getEnddate())%> </td>
                        <td><%= elem.getTotal()%></td>
                        <td><%= elem.getStatus()%></td>
                        <td><button class="btn btn-success" data-target="#modalHistory" data-toggle="modal" data-getid="<%= elem.getId()%>" 
                               data-getstartdate="<%= dateFormat.format(elem.getStartdate())%>" data-getenddate="<%= dateFormat.format(elem.getEnddate())%>" data-gettotal="<%= elem.getTotal()%>"
                               data-getleavetype="<%= elem.getLeavetype().getType()%>" data-getemployee="<%= elem.getEmployee().getName()%>"
                               data-getstatus="<%= elem.getStatus()%>">View Detail</button></td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
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

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="DashboardAdminServlet?action=logout">Logout</a>
            </div>
        </div>
    </div>
</div>
<script>
    $('#modalHistory').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var id = button.data('getid') // Extract info from data-* attributes
        var startdate = button.data('getstartdate') // Extract info from data-* attributes
        var enddate = button.data('getenddate')
        var total = button.data('gettotal')
        var leavetype = button.data('getleavetype')
        var employee = button.data('getemployee')
        var status = button.data('getstatus')
        var modal = $(this)
        modal.find('#h-id').val(id)
        modal.find('#h-startdate').val(startdate)
        modal.find('#h-enddate').val(enddate)
        modal.find('#h-total').val(total)
        modal.find('#h-leavetype').val(leavetype)
        modal.find('#h-employee').val(employee)
        modal.find('#h-status').val(status)
    });
</script>
</body>
<jsp:include page="Footer.jsp" />
</html>
