/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controllers.RequestController;
import controllers.RequestControllerInterface;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Request;
import tools.HibernateUtil;

/**
 *
 * @author acer
 */
@WebServlet(name = "HistoryUserServlet", urlPatterns = {"/HistoryUserServlet"})
public class HistoryUserServlet extends HttpServlet {
 RequestControllerInterface rc = new RequestController(HibernateUtil.getSessionFactory());
           List<Request> Req = null;
           Request ree = null;
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
           
            Req = rc.getAll("");
            request.getSession().setAttribute("Request", Req);
            response.sendRedirect("HistoryUsers.jsp");
        }
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
                Request r = rc.getById(request.getParameter("id"));
                request.getSession().setAttribute("id", r.getId());
                request.getSession().setAttribute("start", r.getStartdate());
                request.getSession().setAttribute("end", r.getEnddate());
                request.getSession().setAttribute("total", r.getTotal());
                request.getSession().setAttribute("leavetype", r.getLeavetype().getType());
                request.getSession().setAttribute("status", r.getStatus());
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
        if (rc.save(request.getParameter("id"), request.getParameter("start"), request.getParameter("end"), request.getParameter("total"), request.getParameter("leavetype"),request.getParameter("employee"),
                request.getParameter("status"))!=null) {
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
