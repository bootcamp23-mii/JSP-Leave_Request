<%-- 
    Document   : Footer
    Created on : Mar 14, 2019, 3:04:25 PM
    Author     : Panji Sadewo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<footer>
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
                    <a class="btn btn-primary" href="HeaderServlet?action=logout">Logout</a>
                </div>
            </div>
        </div>
    </div>
    <!--<script src="http://boot.mobilelegendadddiamond.web.id/vendor/jquery/jquery.min.js"></script>-->

</footer>