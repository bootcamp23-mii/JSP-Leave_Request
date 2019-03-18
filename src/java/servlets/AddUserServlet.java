/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controllers.EmployeeController;
import controllers.EmployeeControllerInterface;
import controllers.JobController;
import controllers.JobControllerInterface;
import controllers.MarriedStatusController;
import controllers.MarriedStatusControllerInterface;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Employee;
import models.Job;
import models.MarriedStatus;
import tools.HibernateUtil;

/**
 *
 * @author AdhityaWP
 */
@WebServlet(name = "AddUserServlet", urlPatterns = {"/AddUserServlet"})
public class AddUserServlet extends HttpServlet {
    EmployeeControllerInterface eci = new EmployeeController(HibernateUtil.getSessionFactory());
    MarriedStatusControllerInterface ms = new MarriedStatusController(HibernateUtil.getSessionFactory());
    JobControllerInterface jc = new JobController(HibernateUtil.getSessionFactory());
    List<Employee> LEm = null;
    List<MarriedStatus> LMs = null;
    List<Job> LJob = null;

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
            LEm = eci.getAll();
            LMs = ms.getAll();
            LJob = jc.getAll();
            request.getSession().setAttribute("employee", LEm);
            request.getSession().setAttribute("marriedstatus", LMs);
            request.getSession().setAttribute("job", LJob);
            response.sendRedirect("AddUser.jsp");
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
