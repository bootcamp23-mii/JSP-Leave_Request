<%-- 
    Document   : AddUser
    Created on : Mar 18, 2019, 10:09:16 AM
    Author     : AdhityaWP
--%>

<%@page import="models.Employee"%>
<%@page import="models.Job"%>
<%@page import="java.util.List"%>
<%@page import="models.MarriedStatus"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="Header.jsp" />
    <jsp:include page="TemplateAdmin.jsp"/>
    <body id="page-top">

        <!-- Begin Container-->
        <div class="container-fluid">
            <div class="d-sm-flex align-items-center justify-content-between mb-4">     
                <h1 class="h3 mb-0 text-gray-800">Setting User</h1>
                <a class="btn btn-success" data-target="#modalUser" data-toggle="modal">Add User</a>
            </div>

            <form class="w3-container" action="AddUsers" method="POST">
                <div class="modal fade" id="modalUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content" >
                            <div class="modal-header text-center">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span area-hidden="true">&times;</span></button>
                                <h3 class="modal-title">CRUD User</h3>
                            </div>
                            <div class="modal-body mx-3">
                                <div class="md-form my-5">
                                    <label data-error="wrong" data-success="true">Name</label>
                                    <input type="text" name="name" id="name-r" class="form-control" value="<% if (session.getAttribute("userName") != null) {
                                            out.print(session.getAttribute("userName"));
                                        }%>">
                                </div>
                                <div class="md-form my-5">
                                    <label data-error="wrong" data-success="true">Gender</label>
                                    <select name="gender" id="gender" class="form-control">
                                        <option value="0">Wanita</option>
                                        <option value="1">Pria</option>
                                    </select>
                                </div>
                                <div class="md-form my-5">
                                    <label data-error="wrong" data-success="true">Married Status</label>
                                    <select name="marriedstatus" class="form-control">
                                        <% for (MarriedStatus elem : (List<MarriedStatus>) session.getAttribute("marriedstatus")) {
                                                out.print("<option "
                                                        + "value=\"" + elem.getId() + "\" "
                                                        + (elem.getId().equals(session.getAttribute("marriedstatus")) ? "selected" : "") + ">"
                                                        + elem.getStatus() + "</option>");
                                            }%>
                                    </select>
                                </div>
                                <div class="md-form my-5">
                                    <label data-error="wrong" data-success="true">Manager</label>
                                    <select name="manager" class="form-control">
                                        <% for (Employee elem : (List<Employee>) session.getAttribute("employee")) {
                                                out.print("<option "
                                                        + "value=\"" + elem.getId() + "\" "
                                                        + (elem.getId().equals(session.getAttribute("employee")) ? "selected" : "") + ">"
                                                        + elem.getName() + "</option>");
                                            }%>
                                    </select>
                                </div>
                                <div class="md-form my-5">
                                    <label data-error="wrong" data-success="true">Job</label>
                                    <select name="manager" class="form-control">
                                        <% for (Job elem : (List<Job>) session.getAttribute("job")) {
                                                out.print("<option "
                                                        + "value=\"" + elem.getId() + "\" "
                                                        + (elem.getId().equals(session.getAttribute("job")) ? "selected" : "") + ">"
                                                        + elem.getDepartment() + "</option>");
                                            }%>
                                    </select>
                                </div>
                                <div class="md-form my-5">
                                    <label data-error="wrong" data-success="true">Join Date</label>
                                    <input type="date" id="joindate" name="joindate" class="form-control"/>
                                </div>
                                <div class="md-form my-5">
                                    <label data-error="wrong" data-success="true">Leave Total</label>
                                    <input type="date" id="totaldate" name="totaldate" class="form-control"/>
                                </div>
                                <div class="md-form my-5">
                                    <label data-error="wrong" data-success="true">Email</label>
                                    <input type="text" name="email" id="email-r" class="form-control" value="<% if (session.getAttribute("userEmail") != null) {
                                            out.print(session.getAttribute("userEmail"));
                                        }%>">
                                </div>
                                <div class="md-form my-5">
                                    <label data-error="wrong" data-success="true">Password</label>
                                    <input type="text" name="password" id="password-r" class="form-control" value="<% if (session.getAttribute("userPassword") != null) {
                                            out.print(session.getAttribute("Password"));
                                        }%>">
                                </div>
                                <div class="md-form my-5">
                                    <label data-error="wrong" data-success="true">Photo</label>
                                    <input type="file" disable="true" id="exampleInputFile">
                                </div>

                            </div>
                            <div class="modal-footer">
                                <input class="btn btn-default" type="submit" value="Save" name="save" />
                            </div>
                        </div>
                    </div>
                </div>
            </form>

            <div>
                <table id="" class=" table table-striped" cellspacing='30' align ='center' border="1">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Name</th>
                            <th>ID</th>
                            <th>Gender</th>
                            <th>ID Manager</th>
                            <th>Married Status</th>
                            <th>Job</th>
                            <th>Leave Total</th>
                            <th>Join Date</th>
                            <th>Email</th>
                            <th>Password</th>
                            <th>Photo</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%int j = 1;
                            for (Employee elem : (List<Employee>) session.getAttribute("employee")) {%>
                        <tr>
                            <td><%= j++%></td>
                            <td><%= elem.getName() %></td>
                            <td><%= elem.getId()%></td>
                            <td><%= elem.getGendertype()%></td>
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
<script>
    $('#modalUser').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var id = button.data('getid') // Extract info from data-* attributes
        var name = button.data('getname') // Extract info from data-* attributes
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var modal = $(this)
        modal.find('#id-r').val(id)
        modal.find('#name-r').val(name)
    })
</script>
</body>
</html>
