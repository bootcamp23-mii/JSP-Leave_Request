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
import java.net.URLDecoder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Employee;
import models.LoginSession;
import org.hibernate.Hibernate;
import tools.HibernateUtil;

/**
 *
 * @author Panji Sadewo
 */
@WebServlet(name = "HeaderServlet", urlPatterns = {"/HeaderServlet"})
public class HeaderServlet extends HttpServlet {
    
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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet HeaderServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HeaderServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
            } else if (request.getParameter("action").equals("his_req")) {
                response.sendRedirect("HistoryAdminServlet");
            } else if (request.getParameter("action").equals("add_users")) {
                response.sendRedirect("AddUserServlet");
            } else if (request.getParameter("action").equals("logout")) {
                LoginSession.setIdUsername(null);
                LoginSession.setRoleUsername(null);
                LoginSession.setNameLogin(null);
                request.getSession().removeAttribute("idLogin");
                request.getSession().removeAttribute("roleLogin");
                request.getSession().removeAttribute("nameLogin");
                HttpSession session = request.getSession(false);
                session.invalidate();
                response.sendRedirect("LoginPageServlet");
            } else if (request.getParameter("id") != null) {
                Employee employee = eci.getById(request.getParameter("id").toString());
                if (employee.getPassword().equals(URLDecoder.decode(request.getParameter("token").toString()))) {
                    Employee employees = eci.getById(request.getParameter("id"));
                    eci.update(employees.getId().toString(), 
                            employees.getName().toString(), 
                            employees.getGendertype().toString(), 
                            employees.getLeavetotal().toString(), 
                            employees.getEmail().toString(), 
                            employees.getPassword().toString(), 
                            employees.getMarriedstatus().toString(), 
                            employees.getIdmanager().toString(), 
                            employees.getJob().toString(), 
                            employees.getJoindate().toString());
                    response.sendRedirect("LoginPageServlet");
                }
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
