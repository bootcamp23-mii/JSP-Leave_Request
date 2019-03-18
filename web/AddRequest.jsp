<%-- 
    Document   : AddRequest
    Created on : Mar 15, 2019, 1:40:20 PM
    Author     : acer
--%>

<%@page import="models.RequestStatus"%>
<%@page import="models.LoginSession"%>
<%@page import="models.Request"%>
<%@page import="java.util.List"%>
<%@page import="models.LeaveType"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="Header.jsp" />
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3"> Hi <% out.print(session.getAttribute("name"));%></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="DashboardAdminServlet">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>

            <!-- Divider -->
            <!--                <hr class="sidebar-divider">-->

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="DashboardAdminServlet?action=delete">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>Users</span>
                </a>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="DashboardAdminServlet?action=add_request">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>Add Resquest</span>
                </a>
            </li>


            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="DashboardAdminServlet?action=his_req">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>History and Request</span>
                </a>
            </li>

            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="DashboardAdminServlet?action=approval">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>Approval</span></a>
            </li>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Search -->
                    <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search..." aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Users</span>
                                <img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Settings
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Activity Log
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>
                    </ul>

                </nav>
                <!-- Begin Container-->
                <div class="container-fluid">
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">     
                        <h1 class="h3 mb-0 text-gray-800">Add Request</h1>
                    </div>
                    <form action="AddRequestServlet" method="POST">
                        <table cellspacing='50' align ='center' border="2">
                            <tbody>
                                <tr>
                                    <td>Start Leave</td>
                                    <td><input type="text" id="startdate" name="startdate"/></td>
                                </tr>
                                <tr>
                                    <td>End Leave</td>
                                    <td><input type="text" id="enddate" name="enddate"/></td>
                                </tr>
                                <tr>
                                    <td>Total</td>
                                    <td><input type="text" id="total" name="total" readonly></td>
                                </tr>
                                <tr>
                                    <td>Leave Type</td>
                                    <td><select name="leavetype" />
                                        <% for (LeaveType elem : (List<LeaveType>) session.getAttribute("LeaveType")) {
                                                out.print("<option "
                                                        + "value=\"" + elem.getId() + "\" "
                                                        + (elem.getId().equals(session.getAttribute("LeaveType")) ? "selected" : "") + ">"
                                                        + elem.getType() + "</option>");
                                            }%>
                                        </select></td>
                                </tr>
                                <tr>
                                    <td colspan="2" align='center' ><input type="submit" value="Save" name="Submit" /></td>
                                </tr>
                            </tbody>
                        </table>
                        <div>
                            <select name="isS1">
                                <option value="0">Sedang Diproses</option>
                                <option value="1">Telah Diproses</option>
                            </select>
                        </div>

                    </form> 

                    <div>
                        <table id="" class=" table table-striped" cellspacing='30' align ='center' border="1">

                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Id</th>
                                    <th>Request Date</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%int j = 1;
                                    for (RequestStatus elem : (List<RequestStatus>) session.getAttribute("Request")) {%>
                                <tr>
                                    <td><%= j++%></td>
                                    <td><%= elem.getRequest().getId()%></td>
                                    <td><%= elem.getDatetime()%></td>
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
                        <a class="btn btn-primary" href="login.html">Logout</a>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $("#startdate").datepicker({beforeShowDay: $.datepicker.noWeekends, dateFormat: 'dd-mm-yy'});
            $("#enddate").datepicker({beforeShowDay: $.datepicker.noWeekends, dateFormat: 'dd-mm-yy'});
            $("#startdate").click(function () {
                var start = document.getElementById("startdate").value;
                var end = document.getElementById("enddate").value;
                var startTanggal = start.split("-")[0];
                var endTanggal = end.split("-")[0];
                var startBulan = start.split("-")[1];
                var endBulan = end.split("-")[1];
                var startTahun = start.split("-")[2];
                var endTahun = end.split("-")[2];
                var totalCuti = (endTanggal - startTanggal + ((endBulan - startBulan) * 30) + ((endTahun - startTahun) * 360));
                document.getElementById("total").value = totalCuti.toString();
            });
            $("#enddate").click(function () {
                var start = document.getElementById("startdate").value;
                var end = document.getElementById("enddate").value;
                var startTanggal = start.split("-")[0];
                var endTanggal = end.split("-")[0];
                var startBulan = start.split("-")[1];
                var endBulan = end.split("-")[1];
                var startTahun = start.split("-")[2];
                var endTahun = end.split("-")[2];
                var totalCuti = (endTanggal - startTanggal + ((endBulan - startBulan) * 30) + ((endTahun - startTahun) * 360));
                document.getElementById("total").value = totalCuti.toString();
            });
        </script>
</body>
<jsp:include page="Footer.jsp" />
