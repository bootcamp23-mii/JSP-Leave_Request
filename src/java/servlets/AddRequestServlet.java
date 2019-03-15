/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controllers.LeaveTypeController;
import controllers.LeaveTypeControllerInterface;
import controllers.RequestController;
import controllers.RequestControllerInterface;
import controllers.EmployeeController;
import controllers.EmployeeControllerInterface;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Employee;
import models.LeaveHistory;
import models.LeaveType;
import models.LoginSession;
import models.Request;
import sun.nio.cs.HistoricallyNamedCharset;
import tools.HibernateUtil;

/**
 *
 * @author AdhityaWP
 */

@WebServlet(name = "AddRequestServlet", urlPatterns = {"/AddRequestServlet"})


public class AddRequestServlet extends HttpServlet {
    EmployeeControllerInterface eci = new EmployeeController(HibernateUtil.getSessionFactory());
    RequestControllerInterface rci = new RequestController(HibernateUtil.getSessionFactory());
    LeaveTypeControllerInterface lti = new LeaveTypeController(HibernateUtil.getSessionFactory());
    Employee Emp = null;
    List<Request> Req = null;
    List<LeaveType> Lty = null;

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
            String id = LoginSession.getIdUsername();
            Lty = lti.getAll();
            Req = rci.getAll("");
            request.getSession().setAttribute("LeaveType", Lty);
            request.getSession().setAttribute("Request", Req);
            response.sendRedirect("AddRequest.jsp");
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
        if (rci.save("P600", request.getParameter("startdate"), request.getParameter("enddate"), request.getParameter("totaldate"), request.getParameter(LoginSession.getIdUsername()),request.getParameter("leaveType"), "Diproses") != null) {
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
