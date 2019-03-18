<%-- 
    Document   : AddRequest
    Created on : Mar 15, 2019, 1:40:20 PM
    Author     : acer
--%>

<%@page import="models.LoginSession"%>
<%@page import="models.Request"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="Header.jsp" />
    <jsp:include page="TemplateUsers.jsp"/>
    <body id="page-top">
        <form action="AddRequestServlet" method="POST">
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
                            <div class="modal-body mx-5"
                                 <label data-error="wrong" data-success="true">Start Leave</label>
                                <input type="date" id="startdate" name="startdate" class="form-control form-control-user"/>
                            </div>
                            <div class="modal-body mx-5"
                                 <label data-error="wrong" data-success="true">End Leave</label>
                                <input type="date" id="enddate" name="enddate" class="form-control form-control-user"/>
                            </div>
                            <div class="modal-body mx-5"
                                 <label data-error="wrong" data-success="true">Total</label>
                                <input type="text" id="total" name="total" class="form-control form-control-user" />
                            </div>
                            <div class="modal-body mx-5"
                                 <label data-error="wrong" data-success="true">Leave Type</label>
                                <input type="text" id="status" name="status" class="form-control form-control-user" />
                            </div>  
                            <div class="modal-body mx-5"
                                 <label data-error="wrong" data-success="true">Employee</label>
                                <input type="text" id="status" name="status" class="form-control form-control-user" />
                            </div>  
                             <div class="modal-body mx-5"
                                 <label data-error="wrong" data-success="true">Status</label>
                                <input type="text" id="status" name="status" class="form-control form-control-user" />
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
                        for (Request elem : (List<Request>) session.getAttribute("Request")) {%>
                    <tr>
                        <td><%= j++%></td>                                     
                        <td><%= elem.getStartdate()%></td>
                        <td><%= elem.getEnddate()%> </td>
                        <td><%= elem.getTotal()%></td>
                        <td><%= elem.getStatus()%></td>
                        <td><a class="btn btn-success" data-target="#modalHistory" data-toggle="modal">View Detail</a></td>
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
                <a class="btn btn-primary" href="LoginPage.jsp">Logout</a>
            </div>
        </div>
    </div>
</div>
</body>
<jsp:include page="Footer.jsp" />
</html>
