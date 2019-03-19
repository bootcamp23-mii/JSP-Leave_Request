/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controllers.EmployeeController;
import controllers.EmployeeControllerInterface;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.LoginSession;
import tools.HibernateUtil;

/**
 *
 * @author Panji Sadewo
 */
@WebServlet(name = "LoginPageServlet", urlPatterns = {"/LoginPageServlet"})
public class LoginPageServlet extends HttpServlet {

    EmployeeControllerInterface eci = new EmployeeController(HibernateUtil.getSessionFactory());
//    List<Region> data = null;

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
            response.sendRedirect("LoginPage.jsp");
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
        if (eci.login(request.getParameter("usernameLogin"), request.getParameter("passwordLogin"))) {
            request.getSession().setAttribute("idLogin", LoginSession.getIdUsername());
            request.getSession().setAttribute("roleLogin", LoginSession.getRoleUsername());
            request.getSession().setAttribute("nameLogin", LoginSession.getNameLogin());
            if (request.getSession().getAttribute("roleLogin").equals("J4")) {
                response.sendRedirect("DashboardAdminServlet");
            } else if (request.getSession().getAttribute("roleLogin").equals("J2")) {
                response.sendRedirect("DashboardAdminServlet");
            } else if (request.getSession().getAttribute("roleLogin").equals("J3")) {
                response.sendRedirect("DashboardAdminServlet");
            }
        } else {
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
