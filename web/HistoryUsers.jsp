<%-- 
    Document   : AddRequest
    Created on : Mar 15, 2019, 1:40:20 PM
    Author     : acer
--%>

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
        <div class="d-sm-flex align-items-center justify-content-between mb-4">     
            <h1 class="h3 mb-0 text-gray-800">History of Your Request</h1>
        </div>
        <div>
            <table id="historyTable" class=" table table-striped" cellspacing='30' align ='center' border="1">
                <thead>
                    <tr>
                        <th>No</th>
                        <!--                               <th>ID</th>-->
                        <th>Id</th>
                        <th>Date Time</th>
                        <th>Total</th>
                        <th>Leave Type</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <% out.print(LoginSession.getIdUsername()); %>
                <tbody>
                    <%int j = 1;
                        for (RequestStatus elem : (List<RequestStatus>) session.getAttribute("Request")) {%>
                    <tr>
                        <td><%= j++%></td>                                      
                        <td><%= elem.getId()%></td>
                        <td><%= elem.getDatetime()%></td>
                        <td><%= elem.getRequest().getTotal()%> </td>
                        <td><%= elem.getRequest().getLeavetype().getType()%></td>
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
</body>
<jsp:include page="Footer.jsp" />
</html>
