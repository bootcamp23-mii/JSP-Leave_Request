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
import models.Employee;
import models.LoginSession;
import org.hibernate.SessionFactory;
import tools.HibernateUtil;

/**
 *
 * @author Panji Sadewo
 */
@WebServlet(name = "DashboardAdminServlet", urlPatterns = {"/DashboardAdminServlet"})
public class DashboardAdminServlet extends HttpServlet {

//    String id = LoginSession.getIdUsername();
    String id = "11201";
    EmployeeControllerInterface eci = new EmployeeController(HibernateUtil.getSessionFactory());

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
            if (eci.getIdKar(id) != null) {
                for (Employee employee : eci.getIdKar(id)) {
                    request.getSession().setAttribute("name", employee.getName());
                    if (employee.getIdmanager() != null) {
                        request.getSession().setAttribute("manager", employee.getIdmanager().getName());
                    } else {
                        request.getSession().setAttribute("manager", "Ultra Supervisor");
                    }
                }
            }
            response.sendRedirect("DashboardAdmin.jsp");
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
        if (request.getParameter("action") != null) {
            if (request.getParameter("action").equals("add_request")) {
                response.sendRedirect("AddRequestServlet");
            } else if (request.getParameter("action").equals("approval")) {
                response.sendRedirect("ApprovalServlet");
            } else if(request.getParameter("action").equals("his_req")){
                response.sendRedirect("HistoryAdminServlet");
            } else if(request.getParameter("action").equals("logout")){
                LoginSession.setIdUsername(null);
                LoginSession.setRoleUsername(null);
                response.sendRedirect("LoginPageServlet");
            }
        } else {
            processRequest(request, response);
        }

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
        processRequest(request, response);
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
