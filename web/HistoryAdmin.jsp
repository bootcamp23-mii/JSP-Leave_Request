<%-- 
    Document   : HistoryAdmin
    Created on : Mar 16, 2019, 1:52:15 PM
    Author     : acer
--%>

<%@page import="models.LeaveHistory"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <jsp:include page="Header.jsp" />

        <div class="d-sm-flex align-items-center justify-content-between mb-4">     
            <h1 class="h3 mb-0 text-gray-800">History of User Request</h1>
        </div>
        
        <!--show modal form-->
        <div class="modal fade" id="modalHistoryAdminDelete" tabindex="-1" role="dialog" 
             aria-labelledby="myModalLabel" aria-hidden="true">
            <form action="HistoryAdminServlet" method="POST">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header text-center">
                            <h3 class="modal-title">History Delete</h3>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body mx-3">
                            <div class="md-form my-5">
                                <label data-error="wrong" data-success="true">ID</label>
                                <input type="text" name="historyAdminDeleteId" id="idDelete-r" class="form-control">
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
        
        <!--show modal form-->
        <div class="modal fade" id="modalHistoryAdmin" tabindex="-1" role="dialog" 
             aria-labelledby="myModalLabel" aria-hidden="true">
            <form action="HistoryAdminServlet" method="POST">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header text-center">
                            <h3 class="modal-title">History Update</h3>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body mx-3">
                            <div class="md-form my-5">
                                <label data-error="wrong" data-success="true">ID</label>
                                <input type="text" name="historyAdminId" id="id-r" class="form-control" value="<% if (session.getAttribute("regionId") != null) {
                                        out.print(session.getAttribute("regionId"));
                                    }   %>">
                            </div>
                            <div class="md-form my-5">
                                <label data-error="wrong" data-success="true">DataTime</label>
                                <input type="text" name="historyAdminDataTime" id="datetime-r" class="form-control">
                            </div>
                            <div class="md-form my-5">
                                <label data-error="wrong" data-success="true">Total</label>
                                <input type="text" name="historyAdminTotal" id="total-r" class="form-control">
                            </div>
                            <div class="md-form my-5">
                                <label data-error="wrong" data-success="true">Description</label>
                                <input type="text" name="historyAdminDescription" id="description-r" class="form-control">
                            </div>
                            <div class="md-form my-5">
                                <label data-error="wrong" data-success="true">Employee</label>
                                <input type="text" name="historyAdminEmployee" id="employee-r" class="form-control">
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

        <table id="historyAdminTable" class=" table table-striped" cellspacing='30' align ='center' border="1">
            <thead>
                <tr>
                    <th>No</th> 
                    <th>DateTime</th>
                    <th>Total</th>
                    <th>Description</th>
                    <th>Employee</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%int j = 1;
                    for (LeaveHistory elem : (List<LeaveHistory>) session.getAttribute("Leavehistory")) {%>
                <tr>
                    <td><%= j++%></td>   
                    <td><%= elem.getDatetime()%></td>
                    <td><%= elem.getTotal()%></td>
                    <td><%= elem.getDescription().getDescription()%></td>
                    <td><%= elem.getEmployee().getId()%></td>
                    <td>
                        <a type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalHistoryAdmin" 
                           data-getid="<%= elem.getId()%>" data-datetime="<%= elem.getDatetime()%>" data-total="<%= elem.getTotal()%>" data-description="<%= elem.getDescription().getId()%>" data-employee="<%= elem.getEmployee().getId()%>">Edit</a>
                        <a class="btn btn-danger" data-toggle="modal" data-target="#modalHistoryAdminDelete" data-getiddelete="<%= elem.getId()%>">Hapus</a>
                    </td>
                </tr> 
                <%}%>
            </tbody>
        </table>
        <!-- End Container-->
    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!--set modal js-->
<script>
    $('#modalHistoryAdmin').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)
        var id = button.data('getid')
        var datetime = button.data('datetime')
        var total = button.data('total')
        var description = button.data('description')
        var employee = button.data('employee')
        var modal = $(this)
        modal.find('#id-r').val(id)
        modal.find('#datetime-r').val(datetime)
        modal.find('#total-r').val(total)
        modal.find('#description-r').val(description)
        modal.find('#employee-r').val(employee)
    })
</script>
</body>
<!--end of set modal js-->
<!--set modal js-->
<script>
    $('#modalHistoryAdminDelete').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)
        var id = button.data('getiddelete')
        var modal = $(this)
        modal.find('#idDelete-r').val(id)
    })
</script>
<!--end of set modal js-->

<jsp:include page="Footer.jsp" />
</html>