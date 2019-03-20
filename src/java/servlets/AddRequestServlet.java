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
import controllers.LeaveHistoryController;
import controllers.LeaveHistoryControllerInterface;
import controllers.RequestStatusController;
import controllers.RequestStatusControllerInterface;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
import models.RequestStatus;
import sun.nio.cs.HistoricallyNamedCharset;
import tools.HibernateUtil;

/**
 *
 * @author AdhityaWP
 */
@WebServlet(name = "AddRequestServlet", urlPatterns = {"/AddRequestServlet"})

public class AddRequestServlet extends HttpServlet {

    EmployeeControllerInterface eci = new EmployeeController(HibernateUtil.getSessionFactory());
    RequestStatusControllerInterface rci = new RequestStatusController(HibernateUtil.getSessionFactory());
    RequestControllerInterface rc = new RequestController(HibernateUtil.getSessionFactory());
    LeaveTypeControllerInterface lti = new LeaveTypeController(HibernateUtil.getSessionFactory());
    LeaveHistoryControllerInterface lhi = new LeaveHistoryController(HibernateUtil.getSessionFactory());
    Employee Emp = null;
    List<RequestStatus> Req = null;
    List<LeaveType> Lty = null;
    boolean isS1 = false;

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
            String id = request.getSession().getAttribute("idLogin").toString();
            Lty = lti.getAll();
            Req = rci.getAllHistory(id);
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
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat dateFormat2 = new SimpleDateFormat("dd-MM-yyyy");
        String id = request.getSession().getAttribute("idLogin").toString();
//        System.out.println(id);
        String start = "";
        String end = "";
        System.out.println("starting ::: "+request.getParameter("startdate"));
       
        try {
            start = dateFormat.format(dateFormat2.parse(request.getParameter("startdate")));
            end = dateFormat.format(dateFormat2.parse(request.getParameter("enddate")));
        } catch (ParseException ex) {
            Logger.getLogger(AddRequestServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
         System.out.println("format:::;"+start);
        Date now = new Date();
        System.out.println(now);
        String hariini = dateFormat.format(now);
        rc.save("", start, end, request.getParameter("total"), "Diproses", id, request.getParameter("leavetype"));
        Request idnext = rc.getLastId();

        if (idnext != null) {
            if (rci.insert("", hariini, "", idnext.getId(),"S1") != null && lhi.save("", hariini, request.getParameter("total"), "KC4", id) != null ) {
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
