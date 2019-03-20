<%-- 
    Document   : HistoryAdmin
    Created on : Mar 16, 2019, 1:52:15 PM
    Author     : acer
--%>

<%@page import="models.Request"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="models.LeaveHistory"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="Header.jsp"%>

<form action="HistoryAdminServlet" method="POST">
    <div class="modal fade" id="modalHistory" tabindex="-1" role="dialog" 
         aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">   
                    <h3 class="modal-title">Edit Request</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <!--modal action-->
                <div class="modal-body mx-3">
                    <div class="modal-body mx-5">
                        <label data-error="wrong" data-success="true">ID</label>
                        <input type="text" id="h-id" name="id" class="form-control form-control-user"/>
                    </div>
                    <div class="modal-body mx-5">
                        <label data-error="wrong" data-success="true">Start Leave</label>
                        <input type="text" id="h-startdate" name="startdate" class="form-control form-control-user"/>
                    </div>
                    <div class="modal-body mx-5">
                        <label data-error="wrong" data-success="true">End Leave</label>
                        <input type="text" id="h-enddate" name="enddate" class="form-control form-control-user"/>
                    </div>
                    <div class="modal-body mx-5">
                        <label data-error="wrong" data-success="true">Total</label>
                        <input type="text" id="h-total" name="total" class="form-control form-control-user" />
                    </div>
                    <div class="modal-body mx-5">
                        <label data-error="wrong" data-success="true">Leave Type</label>
                        <input type="text" id="h-leavetype" name="status" class="form-control form-control-user" />
                    </div>  
                    <div class="modal-body mx-5">
                        <label data-error="wrong" data-success="true">Employee</label>
                        <input type="text" id="h-employee" name="status" class="form-control form-control-user" />
                    </div>  
                    <div class="modal-body mx-5">
                        <label data-error="wrong" data-success="true">Status</label>
                        <input type="text" id="h-status" name="status" class="form-control form-control-user" />
                    </div> 
                    <div class="modal-body mx-5">
                        <input class="btn btn-primary btn-user" type="submit" value="Save" name="save" />
                    </div>
                </div>     
            </div>
        </div>
    </div>
</form>

<!--modal Detail-->
<div class="modal fade" id="modalDetail" tabindex="-1" role="dialog" 
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header text-center">   
                <h3 class="modal-title">Detail Request</h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body mx-3">
                <div class="modal-body mx-5">
                    <label data-error="wrong" data-success="true">ID</label>
                    <input type="text" id="id-r" disabled="true" name="id" class="form-control form-control-user"/>
                </div>
                <div class="modal-body mx-5">
                    <label data-error="wrong" data-success="true">Start Leave</label>
                    <input type="text" id="startdate-r" disabled="true" name="startdate" class="form-control form-control-user"/>
                </div>
                <div class="modal-body mx-5">
                    <label data-error="wrong" data-success="true">End Leave</label>
                    <input type="text" id="enddate-r" disabled="true" name="enddate" class="form-control form-control-user"/>
                </div>
                <div class="modal-body mx-5">
                    <label data-error="wrong" data-success="true">Total</label>
                    <input type="text" id="total-r" disabled="true" name="total" class="form-control form-control-user" />
                </div>
                <div class="modal-body mx-5">
                    <label data-error="wrong" data-success="true">Leave Type</label>
                    <input type="text" id="leavetype-r" disabled="true" name="status" class="form-control form-control-user" />
                </div>  
                <div class="modal-body mx-5">
                    <label data-error="wrong" data-success="true">Employee</label>
                    <input type="text" id="employee-r" disabled="true" name="status" class="form-control form-control-user" />
                </div>  
                <div class="modal-body mx-5">
                    <label data-error="wrong" data-success="true">Status</label>
                    <input type="text" id="status-r" disabled="true" name="status" class="form-control form-control-user" />
                </div>             
            </div>     
        </div>
    </div>
</div>

<!--modal delete-->
<form action="HistoryAdminServlet" method="POST">
    <div class="modal fade" id="modalDelete" tabindex="-1" role="dialog" 
         aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">   
                    <h3 class="modal-title">Delete Request</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="md-form my-5">
                        <div class="my-2">
                            <label data-error="wrong" data-success="true">Are you sure want to delete?</label>
                        </div>
                        <div class="my-2">
                            <input type="text" name="idDelete-r" id="idDelete-r" class="form-control" readonly>
                        </div>
                        <div class="my-2">
                            <input type="text" name="employee" id="employeeDelete-r" class="form-control" readonly>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <input class="btn btn-default" type="submit" value="Delete" name="Delete" />
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
                <th>Details</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%int j = 1;
                SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
                for (Request elem : (List<Request>) session.getAttribute("Request")) {%>
            <tr>
                <td><%= j++%></td>                                      
                <td><%= dateFormat.format(elem.getStartdate())%></td>
                <td><%= dateFormat.format(elem.getEnddate())%></td>
                <td><%= elem.getTotal()%></td>
                <td><%= elem.getStatus()%></td>
                <td><button class="btn btn-success" data-target="#modalDetail" data-toggle="modal" data-getid="<%= elem.getId()%>" 
                            data-getstartdate="<%= dateFormat.format(elem.getStartdate())%>" data-getenddate="<%= dateFormat.format(elem.getEnddate())%>" data-gettotal="<%= elem.getTotal()%>"
                            data-getleavetype="<%= elem.getLeavetype().getType()%>" data-getemployee="<%= elem.getEmployee().getName()%>"
                            data-getstatus="<%= elem.getStatus()%>">Details</button>
                </td>
                <td><button class="btn btn-success" data-target="#modalHistory" data-toggle="modal" data-getid="<%= elem.getId()%>" 
                            data-getstartdate="<%= dateFormat.format(elem.getStartdate())%>" data-getenddate="<%= dateFormat.format(elem.getEnddate())%>" data-gettotal="<%= elem.getTotal()%>"
                            data-getleavetype="<%= elem.getLeavetype().getType()%>" data-getemployee="<%= elem.getEmployee().getName()%>"
                            data-getstatus="<%= elem.getStatus()%>">Edit</button>
                    <button class="btn btn-danger" data-target="#modalDelete" data-toggle="modal" data-getiddelete="<%= elem.getId()%>" data-getemployee="<%= elem.getEmployee().getName()%>">Hapus</button>
                </td>
            </tr>
            <%}%>
        </tbody>
    </table>
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

    $('#modalDetail').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var id = button.data('getid') // Extract info from data-* attributes
        var startdate = button.data('getstartdate') // Extract info from data-* attributes
        var enddate = button.data('getenddate')
        var total = button.data('gettotal')
        var leavetype = button.data('getleavetype')
        var employee = button.data('getemployee')
        var status = button.data('getstatus')
        var modal = $(this)
        modal.find('#id-r').val(id)
        modal.find('#startdate-r').val(startdate)
        modal.find('#enddate-r').val(enddate)
        modal.find('#total-r').val(total)
        modal.find('#leavetype-r').val(leavetype)
        modal.find('#employee-r').val(employee)
        modal.find('#status-r').val(status)
    });

    $('#modalDelete').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        var id = button.data('getiddelete');
        var employee= button.data('getemployee')
        var modal = $(this);
        modal.find('#idDelete-r').val(id);
        modal.find('#employeeDelete-r').val(employee);
    });
</script>

<!--end of set modal js-->

<%@include file="Footer.jsp"%>
