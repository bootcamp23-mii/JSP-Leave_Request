<%-- 
    Document   : AddUser
    Created on : Mar 18, 2019, 10:09:16 AM
    Author     : AdhityaWP
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="models.Employee"%>
<%@page import="models.Job"%>
<%@page import="java.util.List"%>
<%@page import="models.MarriedStatus"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="Header.jsp"%>
    <body id="page-top">

        <!-- Begin Container-->
        <div class="container-fluid">
            <div class="d-sm-flex align-items-center justify-content-between mb-4">     
                <h1 class="h3 mb-0 text-gray-800">Setting User</h1>
                <a class="btn btn-success" data-target="#modalUser" data-toggle="modal">Add User</a>
            </div>
            <div class="d-sm-flex align-items-center justify-content-between mb-4">     
                <a class="btn btn-success" data-target="#modalUpload" data-toggle="modal">Upload photo</a>
            </div>
            
            <!--modaladduser-->
            <form class="w3-container" action="AddUserServlet" method="POST">
                <div class="modal fade" id="modalUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content" >
                            <div class="modal-header text-center">
                                <h3 class="modal-title">Add User</h3>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body mx-3">
                                <div class="md-form my-5">
                                    <label data-error="wrong" data-success="true">Name</label>
                                    <input type="text" name="name" id="name-r" class="form-control">
                                </div>
                                <div class="md-form my-5">
                                    <label data-error="wrong" data-success="true">Gender</label>
                                    <select name="gender" id="gender" class="form-control">
                                        <option value="0">Female</option>
                                        <option value="1">Male</option>
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
                                        <option value=""> </option>
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
                                    <select name="job" class="form-control">
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
                                    <input type="text" id="totaldate" name="totaldate" class="form-control"/>
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

                            </div>
                            <div class="modal-footer">
                                <input class="btn btn-default" type="submit" value="Save" name="save" />
                            </div>
                        </div>
                    </div>
                </div>
            </form>

            <!--modaldetail-->
            <div class="modal fade" id="modalDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content" >
                        <div class="modal-header text-center">
                            <h3 class="modal-title">Detail User</h3>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body mx-3">
                            <div class="md-form my-2">
                                <label data-error="wrong" data-success="true">Id</label>
                                <input type="text" id="id-d" name="id" class="form-control" readonly=""/>
                            </div>
                            <div class="md-form my-2">
                                <label data-error="wrong" data-success="true">Name</label>
                                <input type="text" id="name-d" name="name-d" class="form-control" readonly=""/>
                            </div>
                            <div class="md-form my-2">
                                <label data-error="wrong" data-success="true">Gender</label>
                                <input type="text" id="gender-d" name="gender-d" class="form-control" readonly=""/>
                            </div>
                            <div class="md-form my-2">
                                <label data-error="wrong" data-success="true">Married Status</label>
                                <input type="text" id="marstat-d" name="marstat-d" class="form-control" readonly=""/>
                            </div>
                            <div class="md-form my-2">
                                <label data-error="wrong" data-success="true">Manager</label>
                                <input type="text" id="idman-d" name="manager-d" class="form-control" readonly=""/>
                            </div>
                            <div class="md-form my-2">
                                <label data-error="wrong" data-success="true">Job</label>
                                <input type="text" id="job-d" name="job-d" class="form-control" readonly=""/>
                            </div>
                            <div class="md-form my-2">
                                <label data-error="wrong" data-success="true">Join Date</label>
                                <input type="text" id="joindate-d" name="joindate-d" class="form-control" readonly=""/>
                            </div>
                            <div class="md-form my-2">
                                <label data-error="wrong" data-success="true">Leave Total (day)</label>
                                <input type="text" id="total-d" name="total-d" class="form-control" readonly="" />
                            </div>
                            <div class="md-form my-2">
                                <label data-error="wrong" data-success="true">Email</label>
                                <input type="text" id="email-d" name="email-d" class="form-control" readonly=""/>
                            </div>
                            <div class="md-form my-2">
                                <label data-error="wrong" data-success="true">Photo</label>
                                <!--space utk foto-->
                            </div>

                        </div>
                        <div class="modal-footer">
                            <a class="btn btn-light" type="submit" name="sendemail" >Send Email Verification</a>
                        </div>
                    </div>
                </div>
            </div>

            <!--modaledit-->                                
            <form class="w3-container" action="AddUserServlet?action=edit" method="POST">
                <div class="modal fade" id="modalEdit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content" >
                            <div class="modal-header text-center">
                                <h3 class="modal-title">Edit User</h3>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body mx-3">
                                <div class="md-form my-2">
                                    <label data-error="wrong" data-success="true">ID</label>
                                    <input type="text" name="id" id="id-e" class="form-control">
                                </div>
                                <div class="md-form my-2">
                                    <label data-error="wrong" data-success="true">Name</label>
                                    <input type="text" name="name" id="name-e" class="form-control">
                                </div>
                                <div class="md-form my-2">
                                    <label data-error="wrong" data-success="true">Gender</label>
                                    <select name="gender" id="gender-e" class="form-control">
                                        <option value="0">Female</option>
                                        <option value="1">Male</option>
                                    </select>
                                </div>
                                <div class="md-form my-2">
                                    <label data-error="wrong" data-success="true">Married Status</label>
                                    <select name="marriedstatus" id="marstat-e" class="form-control">
                                        <% for (MarriedStatus elem : (List<MarriedStatus>) session.getAttribute("marriedstatus")) {
                                                out.print("<option "
                                                        + "value=\"" + elem.getId() + "\" "
                                                        + (elem.getId().equals(session.getAttribute("marriedstatus")) ? "selected" : "") + ">"
                                                        + elem.getStatus() + "</option>");
                                            }%>
                                    </select>
                                </div>
                                <div class="md-form my-2">
                                    <label data-error="wrong" data-success="true">Manager</label>
                                    <select name="manager" id="manager-e" class="form-control">
                                        <option value=""> </option>
                                        <% for (Employee elem : (List<Employee>) session.getAttribute("employee")) {
                                                out.print("<option "
                                                        + "value=\"" + elem.getId() + "\" "
                                                        + (elem.getId().equals(session.getAttribute("employee")) ? "selected" : "") + ">"
                                                        + elem.getName() + "</option>");
                                            }%>
                                    </select>
                                </div>
                                <div class="md-form my-2">
                                    <label data-error="wrong" data-success="true">Job</label>
                                    <select name="job" id="job-e" class="form-control">
                                        <% for (Job elem : (List<Job>) session.getAttribute("job")) {
                                                out.print("<option "
                                                        + "value=\"" + elem.getId() + "\" "
                                                        + (elem.getId().equals(session.getAttribute("job")) ? "selected" : "") + ">"
                                                        + elem.getDepartment() + "</option>");
                                            }%>
                                    </select>
                                </div>
                                <div class="md-form my-2">
                                    <label data-error="wrong" data-success="true">Join Date</label>
                                    <input type="date" id="joindate-e" name="joindate" class="form-control"/>
                                </div>
                                <div class="md-form my-2">
                                    <label data-error="wrong" data-success="true">Leave Total</label>
                                    <input type="text" id="totaldate-e" name="totaldate" class="form-control"/>
                                </div>
                                <div class="md-form my-2">
                                    <label data-error="wrong" data-success="true">Email</label>
                                    <input type="text" name="email" id="email-e" class="form-control" value="<% if (session.getAttribute("userEmail") != null) {
                                            out.print(session.getAttribute("userEmail"));
                                        }%>">
                                </div>

                            </div>
                            <div class="modal-footer">
                                <input class="btn btn-default" type="submit" value="Save" name="save" />
                            </div>
                        </div>
                    </div>
                </div>
            </form>

            <!--modal delete-->
            <form class="w3-container" action="AddUserServlet?action=delete" method="POST">
                <div class="modal fade" id="modalDelete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content" >
                            <div class="modal-header text-center">
                                <h3 class="modal-title">Delete User</h3>
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
                                        <input type="text" name="iddelete" id="id-del" class="form-control" readonly>
                                    </div>
                                    <div class="my-2">
                                        <input type="text" name="namedelete" id="name-del" class="form-control" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input class="btn btn-default" type="submit" value="Delete" name="delete" />
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">Cancel</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

            <!--modalupload-->
            <form class="w3-container" action="UploadServlet" method="POST">
                <div class="modal fade" id="modalUpload" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content" >
                            <div class="modal-header text-center">
                                <h3 class="modal-title">Upload</h3>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body mx-3">
                                <div class="md-form my-5">
                                    <div class="my-2">
                                        <label data-error="wrong" data-success="true">Upload Photo for</label>
                                        <select name="idemployee" class="form-control">
                                        <% for (Employee elem : (List<Employee>) session.getAttribute("employee")) {
                                                out.print("<option "
                                                        + "value=\"" + elem.getId() + "\" "
                                                        + (elem.getId().equals(session.getAttribute("employee")) ? "selected" : "") + ">"
                                                        + elem.getName() + "</option>");
                                            }%>
                                    </select>
                                    </div>
                                    <div class="my-2">
                                        <input type="file" name="pathFile" id="path-f" class="form-control" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input class="btn btn-outline-success" type="submit" value="UP!" name="up" />
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">Cancel</button>
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
                            <th>Job</th>
                            <th>Join Date</th>
                            <th>Leave Quota (day)</th>
                            <th>Details</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%int j = 1;
                            SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
                            for (Employee elem : (List<Employee>) session.getAttribute("employee")) {%>
                        <tr>
                            <td><%= j++%></td>
                            <td><%= elem.getName()%></td>
                            <td><%= elem.getJob().getDepartment()%></td>
                            <td><%= dateFormat.format(elem.getJoindate())%></td>
                            <td><%= elem.getLeavetotal()%></td>
                            <td><a class="btn btn-outline-warning" data-target="#modalDetail" data-getid="<%= elem.getId()%>" 
                                   data-getname="<%= elem.getName()%>" 
                                   data-getgender="<% if (elem.getGendertype()) {
                                           out.print("Male");
                                       } else {
                                           out.print("Female");
                                       }
                                   %>" 
                                   data-getemail="<%= elem.getEmail()%>" 
                                   data-getpass="<%= elem.getPassword()%>" data-gettotal="<%= elem.getLeavetotal()%>"
                                   data-getmarstat="<%= elem.getMarriedstatus().getStatus()%>" data-getmanid="<%= elem.getIdmanager().getName()%>"
                                   data-getjob="<%= elem.getJob().getDepartment()%>" 
                                   data-getjoindate="<% out.print(dateFormat.format(elem.getJoindate()));%>" 
                                   data-getphoto="<%= elem.getPhoto()%>"
                                   data-toggle="modal">Click Here</a>
                            </td>
                            <td>
                                <button type="button" class="btn btn-outline-success" data-target="#modalEdit" 
                                        data-getid ="<%= elem.getId()%>"
                                        data-getname="<%= elem.getName()%>" 
                                        data-getgender="<%= elem.getGendertype()%>" 
                                        data-getemail="<%= elem.getEmail()%>" 
                                        data-getpass="<%= elem.getPassword()%>" data-gettotal="<%= elem.getLeavetotal()%>"
                                        data-getmarstat="<%= elem.getMarriedstatus().getId()%>" data-getmanid="<%= elem.getIdmanager().getId()%>"
                                        data-getjob="<%= elem.getJob().getId()%>" 
                                        data-getjoindate="<%= elem.getJoindate()%>" 
                                        data-getphoto="<%= elem.getPhoto()%>" data-toggle="modal">
                                    <span class="glyphicon glyphicon-edit"></span>Edit
                                </button>
                                <button type="button" class="btn btn-outline-danger" data-target="#modalDelete" data-toggle="modal"
                                        data-getid ="<%= elem.getId()%>"
                                        data-getname="<%= elem.getName()%>" >
                                    <span class="glyphicon glyphicon-edit"></span> Delete
                                </button>
                            </td>
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

    $('#modalDetail').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var id = button.data('getid')
        var name = button.data('getname')
        var gender = button.data('getgender')
        var total = button.data('gettotal')
        var email = button.data('getemail')
        var passw = button.data('getpassword')
        var marstat = button.data('getmarstat')
        var idman = button.data('getmanid')
        var job = button.data('getjob')
        var joindate = button.data('getjoindate')
        var photo = button.data('getphoto')
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var modal = $(this)
        modal.find('#id-d').val(id)
        modal.find('#name-d').val(name)
        modal.find('#gender-d').val(gender)
        modal.find('#total-d').val(total)
        modal.find('#email-d').val(email)
        modal.find('#pass-d').val(passw)
        modal.find('#marstat-d').val(marstat)
        modal.find('#idman-d').val(idman)
        modal.find('#job-d').val(job)
        modal.find('#joindate-d').val(joindate)
        modal.find('#photo-d').val(photo)
    })

    $('#modalEdit').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var id = button.data('getid')
        var name = button.data('getname')
        var gender = button.data('getgender')
        var total = button.data('gettotal')
        var email = button.data('getemail')
        var passw = button.data('getpassword')
        var marstat = button.data('getmarstat')
        var idman = button.data('getmanid')
        var job = button.data('getjob')
        var joindate = button.data('getjoindate')
        var photo = button.data('getphoto')
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var modal = $(this)
        modal.find('#id-e').val(id)
        modal.find('#name-e').val(name)
        if (gender) {
            modal.find('#gender-e').val("1")
        } else {
            modal.find('#gender-e').val("0")
        }
        modal.find('#totaldate-e').val(total)
        modal.find('#email-e').val(email)
        modal.find('#pass-e').val(passw)
        modal.find('#marstat-e').val(marstat)
        modal.find('#manager-e').val(idman)
        modal.find('#job-e').val(job)
        modal.find('#joindate-e').val(joindate)
        modal.find('#photo-e').val(photo)
    })

    $('#modalDelete').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var id = button.data('getid') // Extract info from data-* attributes
        var name = button.data('getname') // Extract info from data-* attributes
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var modal = $(this)
        modal.find('#id-del').val(id)
        modal.find('#name-del').val(name)
    })

    function getFilePath() {
        $('input[type=file]').change(function () {
            var filePath = $('#exampleInputFile-e').val();
            var filePath = $('#exampleInputFile').val();
        });
    }
</script>
</body>
<%@include file="Footer.jsp"%>
</html>
