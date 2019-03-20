<%-- 
    Document   : DashboardAdmin
    Created on : Mar 14, 2019, 3:03:04 PM
    Author     : Panji Sadewo
--%>

<%@page import="models.LoginSession"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="tools.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="Header.jsp" />
<!-- Begin Page Content -->
<div class="row">
        <div class="col-xl-6 col-lg-5">
            <div class="container-fluid">
            <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 text-center">
                    <h6 class="m-0 font-weight-bold text-primary">Profile Users</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                    <div class="py-2">
                        <div class="row">
                            <div class="col-md-4 col-lg-4">
                                <label>Id User </label>
                            </div>
                            <div class="col-md-4 col-lg-4">
                                <input type="text" name="idProfilUser" placeholder="ID" disabled="">
                            </div>
                        </div>
                    </div>
                    <div class="py-2">
                        <div class="row">
                            <div class="col-md-4 col-lg-4">
                                <label>Name </label>
                            </div>
                            <div class="col-md-4 col-lg-4">
                                <input type="text" name="nameProfilUser" placeholder="Name" disabled="">
                            </div>
                        </div>
                    </div>
                    <div class="py-2">
                        <div class="row">
                            <div class="col-md-4 col-lg-4">
                                <label>Gender Type </label>
                            </div>
                            <div class="col-md-4 col-lg-4">
                                <input type="text" name="genderProfilUser" placeholder="Email" disabled="">
                            </div>
                        </div>
                    </div>
                    <div class="py-2">
                        <div class="row">
                            <div class="col-md-4 col-lg-4">
                                <label>Leave Total </label>
                            </div>
                            <div class="col-md-4 col-lg-4">
                                <input type="text" name="leaveProfilUser" placeholder="Gender" disabled="">
                            </div>
                        </div>
                    </div>
                    <div class="py-2">
                        <div class="row">
                            <div class="col-md-4 col-lg-4">
                                <label>Email </label>
                            </div>
                            <div class="col-md-4 col-lg-4">
                                <input type="text" name="emailProfilUser" placeholder="Leave" disabled="">
                            </div>
                        </div>
                    </div>
                    <div class="py-2">
                        <div class="row">
                            <div class="col-md-4 col-lg-4">
                                <label>Married Status</label>
                            </div>
                            <div class="col-md-4 col-lg-4">
                                <input type="text" name="marriedProfilUser" placeholder="Married Status" disabled="">
                            </div>
                        </div>
                    </div>
                    <div class="py-2">
                        <div class="row">
                            <div class="col-md-4 col-lg-4">
                                <label>Id Manager</label>
                            </div>
                            <div class="col-md-4 col-lg-4">
                                <input type="text" name="idManagerProfilUser" placeholder="Id Manager" disabled="">
                            </div>
                        </div>
                    </div>
                    <div class="py-2">
                        <div class="row">
                            <div class="col-md-4 col-lg-4">
                                <label>Job </label>
                            </div>
                            <div class="col-md-4 col-lg-4">
                                <input type="text" name="jobProfilUser" placeholder="Job" disabled="">
                            </div>
                        </div>
                    </div>
                    <div class="py-2">
                        <div class="row">
                            <div class="col-md-4 col-lg-4">
                                <label>Join Date</label>
                            </div>
                            <div class="col-md-4 col-lg-4">
                                <input type="text" name="joinProfilUser" placeholder="Join Date" disabled="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-6 col-xl-6">
        <img src="https://dtq2i388ejbah.cloudfront.net/images/imagedensity/alpukat_super_1kg_desktop_home_2x.jpg">
    </div>
</div>
<!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>
</body>
<%@include file="Footer.jsp"%>
