<%-- 
    Document   : AddRequest
    Created on : Mar 15, 2019, 1:40:20 PM
    Author     : acer
--%>

<%@page import="models.Request"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="Header.jsp" />
    <jsp:include page="TemplateAdmin.jsp"/>
    <body id="page-top">
        <!--show modal form-->
        <div class="modal fade" id="modalApproval" tabindex="-1" role="dialog" 
             aria-labelledby="myModalLabel" aria-hidden="true">
            <form action="ApprovalServlet" method="POST">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header text-center">
                            <h3 class="modal-title">Approval</h3>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body mx-3">
                            <p hidden="true" id="statusKirim" name="statusKirim"></p>
                            <div class="md-form my-5">
                                <label data-error="wrong" data-success="true">ID</label>
                                <input type="text" name="approvalId" id="id-r" class="form-control" disabled="">
                            </div>
                            <div class="md-form my-5">
                                <label data-error="wrong" data-success="true">Employee</label>
                                <input type="text" name="approvalEmployee" id="employee-r" class="form-control">
                            </div>
                            <div class="md-form my-5">
                                <label data-error="wrong" data-success="true">Start</label>
                                <input type="text" name="approvalStart" id="start-r" class="form-control">
                            </div>
                            <div class="md-form my-5">
                                <label data-error="wrong" data-success="true">End</label>
                                <input type="text" name="approvalEnd" id="end-r" class="form-control">
                            </div>
                            <div class="md-form my-5">
                                <label data-error="wrong" data-success="true">Total</label>
                                <input type="text" name="approvalTotal" id="total-r" class="form-control">
                            </div>
                            <div class="md-form my-5">
                                <label data-error="wrong" data-success="true">Leave Type</label>
                                <input type="text" name="approvalLeave" id="leave-r" class="form-control">
                            </div>
                            <div class="md-form my-5">
                                <label data-error="wrong" data-success="true">Status</label>
                                <input type="text" name="approvalStatus" id="status-r" class="form-control" disabled="">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="submit" value="Save" name="save" />
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <!--end of show modal form-->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">     
            <h1 class="h3 mb-0 text-gray-800">Approval of Users Request</h1>
        </div>
        <div>
            <form action="HistoryUserServlet" method="POST">
                <table id="historyTable" class=" table table-striped" cellspacing='30' align ='center' border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>ID Employee</th>
                            <th>Start</th>
                            <th>End</th>
                            <th>Total</th>
                            <th>Leave Type</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%int j = 1;
                            for (Request elem : (List<Request>) session.getAttribute("Request")) {%>
                        <tr>
                            <td><%= j++%></td>     
                            <td><%= elem.getEmployee().getId()%></td>
                            <td><%= elem.getStartdate()%></td>
                            <td><%= elem.getEnddate()%></td>
                            <td><%= elem.getTotal()%></td>
                            <td><%= elem.getLeavetype().getType()%></td>
                            <td><%= elem.getStatus()%></td>
                            <td>
                                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#modalApproval" 
                                        data-getid="<%= elem.getId()%>" 
                                        data-getemployee="<%= elem.getEmployee().getId()%>" 
                                        data-getstart="<%= elem.getStartdate()%>" 
                                        data-getend="<%= elem.getEnddate()%>" 
                                        data-gettotal="<%= elem.getTotal()%>" 
                                        data-getleave="<%= elem.getLeavetype().getId()%>" 
                                        data-getstatus="Accept"
                                        data-getstatusKirim="Accept">Accept</button>
                                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modalApproval" 
                                        data-getid="<%= elem.getId()%>" 
                                        data-getemployee="<%= elem.getEmployee().getId()%>" 
                                        data-getstart="<%= elem.getStartdate()%>" 
                                        data-getend="<%= elem.getEnddate()%>" 
                                        data-gettotal="<%= elem.getTotal()%>" 
                                        data-getleave="<%= elem.getLeavetype().getId()%>" 
                                        data-getstatus="Reject"
                                        data-getstatusKirim="Reject">Reject</button>
                            </td>
                        </tr>        
                        <%}%>
                    </tbody>
                </table>
            </form>
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
        $('#modalApproval').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget)
            var id = button.data('getid')
            var employee = button.data('getemployee')
            var start = button.data('getstart')
            var end = button.data('getend')
            var total = button.data('gettotal')
            var leave = button.data('getleave')
            var status = button.data('getstatus')
            var statusKirim = button.data('getstatusKirim')
            var modal = $(this)
            modal.find('#id-r').val(id)
            modal.find('#employee-r').val(employee)
            modal.find('#start-r').val(start)
            modal.find('#end-r').val(end)
            modal.find('#total-r').val(total)
            modal.find('#leave-r').val(leave)
            modal.find('#status-r').val(status)
            modal.find('#statusKirim').val(statusKirim)
        })
    </script>
</body>
<jsp:include page="Footer.jsp" />
</html>
