<%-- 
    Document   : AddRequest
    Created on : Mar 15, 2019, 1:40:20 PM
    Author     : acer
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="models.RequestStatus"%>
<%@page import="models.Request"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <%@include file="Header.jsp"%>
    <body id="page-top">
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Scroll to Top Button-->
                <a class="scroll-to-top rounded" href="#page-top">
                    <i class="fas fa-angle-up"></i>
                </a>

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

                                    <div class="md-form my-2">
                                        <input type="text" id="status-r" name="approvalstatus" class="form-control">
                                        <input type="hidden" id="datetime" name="approvalDatetime" class="form-control">
                                        <input type="hidden" id="reqid" name="approvalReqid" class="form-control">
                                        <label data-error="wrong" data-success="true">ID</label>
                                        <input type="text" name="approvalIdID" id="id-r" class="form-control">
                                    </div>
                                    <div class="md-form my-2">
                                        <label data-error="wrong" data-success="true">Employee</label>
                                        <input type="text" name="approvalEmployee" id="employee-r" class="form-control">
                                    </div>
                                    <div class="md-form my-2">
                                        <label data-error="wrong" data-success="true">Start</label>
                                        <input type="text" name="approvalStart" id="start-r" class="form-control">
                                    </div>
                                    <div class="md-form my-2">
                                        <label data-error="wrong" data-success="true">End</label>
                                        <input type="text" name="approvalEnd" id="end-r" class="form-control">
                                    </div>
                                    <div class="md-form my-2">
                                        <label data-error="wrong" data-success="true">Total</label>
                                        <input type="text" name="approvalTotal" id="total-r" class="form-control">
                                    </div>
                                    <div class="md-form my-2">
                                        <label data-error="wrong" data-success="true">Leave Type</label>
                                        <input type="text" name="approvalLeave" id="leave-r" class="form-control">
                                    </div>
                                    <div class="md-form my-2">
                                        <label data-error="wrong" data-success="true">Keterangan</label>
                                        <input type="text" name="approvalDesk" class="form-control">
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <input class ="btn btn-outline-success" type="submit" value="Save" name="save" />
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
                        <table id="ApprovalTable" class=" table table-striped" cellspacing='30' align ='center' border="1">
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
                                <% if (session.getAttribute("Request") == null) {
                                        response.sendRedirect("./ApprovalServlet");
                                    }
                                %>
                                <% SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
                                    int j = 1;
                                    for (RequestStatus elem : (List<RequestStatus>) session.getAttribute("Request")) {%>
                                <tr>
                                    <td><%= j++%></td>     
                                    <td><%= elem.getRequest().getEmployee().getId()%></td>
                                    <td><%= dateFormat.format(elem.getRequest().getStartdate())%></td>
                                    <td><%= dateFormat.format(elem.getRequest().getEnddate())%></td>
                                    <td><%= elem.getRequest().getTotal()%></td>
                                    <td><%= elem.getRequest().getLeavetype().getType()%></td>
                                    <td><%= elem.getStatus().getType()%></td>
                                    <td>
                                        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#modalApproval" 
                                                data-getid="<%= elem.getId()%>" data-getreqid="<%= elem.getRequest().getId()%>"
                                                data-getemployee="<%= elem.getRequest().getEmployee().getId()%>" 
                                                data-getstart="<%= elem.getRequest().getStartdate()%>" 
                                                data-getend="<%= elem.getRequest().getEnddate()%>" 
                                                data-gettotal="<%= elem.getRequest().getTotal()%>" 
                                                data-getleave="<%= elem.getRequest().getLeavetype().getType()%>" 
                                                data-getstatus="S2"
                                                data-getdatetime="<%= elem.getDatetime()%>">Accept
                                        </button>

                                        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modalApproval" 
                                                data-getid="<%= elem.getId()%>" data-getreqid="<%= elem.getRequest().getId()%>"
                                                data-getemployee="<%= elem.getRequest().getEmployee().getId()%>" 
                                                data-getstart="<%= elem.getRequest().getStartdate()%>" 
                                                data-getend="<%= elem.getRequest().getEnddate()%>" 
                                                data-gettotal="<%= elem.getRequest().getTotal()%>" 
                                                data-getleave="<%= elem.getRequest().getLeavetype().getType()%>" 
                                                data-getstatus="S3" data-getdatetime="<%= elem.getDatetime()%>">Reject</button>
                                    </td>
                                </tr>        
                                <%}%>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
            <!-- End Container-->
        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

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
            var datetime = button.data('getdatetime')
            var reqid = button.data('getreqid')
            var modal = $(this)
            modal.find('#id-r').val(id)
            modal.find('#employee-r').val(employee)
            modal.find('#start-r').val(start)
            modal.find('#end-r').val(end)
            modal.find('#total-r').val(total)
            modal.find('#leave-r').val(leave)
            modal.find('#status-r').val(status)
            modal.find('#datetime').val(datetime)
            modal.find('#reqid').val(reqid)
        })
    </script>
</body>
<%@include file="Footer.jsp"%>
</html>
