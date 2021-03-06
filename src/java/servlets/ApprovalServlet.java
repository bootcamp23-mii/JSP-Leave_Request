/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controllers.RequestController;
import controllers.RequestControllerInterface;
import controllers.RequestStatusController;
import controllers.RequestStatusControllerInterface;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.LoginSession;
import models.Request;
import models.RequestStatus;
import tools.HibernateUtil;

/**
 *
 * @author acer
 */
@WebServlet(name = "ApprovalServlet", urlPatterns = {"/ApprovalServlet"})
public class ApprovalServlet extends HttpServlet {

    RequestControllerInterface rc = new RequestController(HibernateUtil.getSessionFactory());
    RequestStatusControllerInterface rsci = new RequestStatusController(HibernateUtil.getSessionFactory());
    List<RequestStatus> Req = null;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            Req = rsci.getHistoryByMang(request.getSession().getAttribute("idLogin").toString(), true);
            request.getSession().setAttribute("Request", Req);
            response.sendRedirect("Approval.jsp");
        }
//        request.getSession().setAttribute(id, request);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null) {
            if (action.equalsIgnoreCase("delete")) {
                rc.delete(request.getParameter("id"));
            } else if (action.equalsIgnoreCase("update")) {
            }
        }
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println(request.getParameter("approvalIdID"));
        System.out.println(request.getParameter("approvalDatetime"));
        System.out.println(request.getParameter("approvalDesk"));
        System.out.println(request.getParameter("approvalReqid"));
        System.out.println(request.getParameter("approvalstatus"));
                
        if(request.getParameter("approvalIdID")!=null){
            if (rsci.update(request.getParameter("approvalIdID"), request.getParameter("approvalDatetime"), request.getParameter("approvalDesk"), request.getParameter("approvalReqid"), request.getParameter("approvalstatus") ) != null) {
            processRequest(request, response);
        }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
