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
import tools.HibernateUtil;

/**
 *
 * @author acer
 */
@WebServlet(name = "ApprovalServlet", urlPatterns = {"/ApprovalServlet"})
public class ApprovalServlet extends HttpServlet {

    RequestControllerInterface rc = new RequestController(HibernateUtil.getSessionFactory());
    RequestStatusControllerInterface rsci = new RequestStatusController(HibernateUtil.getSessionFactory());
    List<Request> Req = null;

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
            Req = rc.getByEmployee(request.getSession().getAttribute("idLogin").toString());
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
        System.out.println(request.getParameter("approvalStart"));
        System.out.println(request.getParameter("approvalEnd"));
        System.out.println(request.getParameter("approvalTotal"));
        System.out.println(request.getParameter("approvalStatus"));
        System.out.println(request.getParameter("approvalEmployee"));
        System.out.println(request.getParameter("approvalLeave"));
        
            if (rc.save(request.getParameter("approvalIdID"), 
                    request.getParameter("approvalStart"), 
                    request.getParameter("approvalEnd"), 
                    request.getParameter("approvalTotal"), 
                    request.getParameter("approvalStatus"), 
                    request.getParameter("approvalEmployee"), 
                    request.getParameter("approvalLeave")) != null) {
                processRequest(request, response);
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
