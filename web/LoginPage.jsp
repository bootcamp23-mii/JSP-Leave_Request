<%-- 
    Document   : AdminPage
    Created on : Mar 14, 2019, 2:21:40 PM
    Author     : Panji Sadewo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="Header.jsp" />
<body class="bg-gradient-primary">
    <div class="container">
        <!-- Outer Row -->
        <div class="row justify-content-center">
            <div class="col-xl-10 col-lg-12 col-md-9">
                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block">
                                <center>
                                <image src="img/logo.png">
                                </center>
                            </div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Welcome To Leave Request MII</h1>
                                    </div>
                                    <form class="user" action="LoginPageServlet" method="POST">
                                        <div class="form-group">
                                            <input type="text" name="usernameLogin" class="form-control form-control-user" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Username ID">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="passwordLogin" class="form-control form-control-user" id="exampleInputPassword" placeholder="Password">
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck">
                                                <label class="custom-control-label" for="customCheck">Remember Me</label>
                                            </div>
                                        </div>
                                        <input class="btn btn-primary btn-user btn-block" type="submit" value="Login" name="save" />
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="forgot-password.html">Forgot Password?</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="btn" href="register.html">Create an Account!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
