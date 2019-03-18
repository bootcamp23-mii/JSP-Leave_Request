<%-- 
    Document   : HistoryAdmin
    Created on : Mar 16, 2019, 1:52:15 PM
    Author     : acer
--%>

<%@page import="models.LeaveHistory"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="Header.jsp" />
    <jsp:include page="TemplateAdmin.jsp"/>
    <body id="page-top">

        <div class="d-sm-flex align-items-center justify-content-between mb-4">     
            <h1 class="h3 mb-0 text-gray-800">History of User Request</h1>
        </div>
        <form action="HistoryAdminServlet" method="POST">
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
                            <a type="button" class="btn btn-primary" data-target="#modalRegion" href="../HistoryAdminServlet?action=update&id=<%= elem.getId()%>">Edit</a>
                            <a class="btn btn-danger" href="../HistoryAdminServlet?action=delete&id=<%= elem.getId()%>"><% if (session.getAttribute("id") != null) {
                                    if (session.getAttribute("id").equals(elem.getId())) {
                                        out.print("checked");
                                    } else {
                                        out.print("Hapus");
                                    }
                                } else {
                                    out.print("Hapus");

                                }%></a>
                        </td>
                    </tr> 
                    <%}%>
                </tbody>
            </table>
            <!-- End Container-->
            <!-- 
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
</html>
