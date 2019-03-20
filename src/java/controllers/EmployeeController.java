/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.GeneralDAO;
import daos.Interface;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Employee;
import models.Job;
import models.MarriedStatus;
import models.Session;
import org.hibernate.SessionFactory;
import tools.BCrypt;
import models.LoginSession;
import models.SendEmailTemp;

/**
 *
 * @author AdhityaWP
 */
public class EmployeeController implements EmployeeControllerInterface {

    private final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    private Interface<Employee> edao;

    public EmployeeController(SessionFactory sessionFactory) {
        edao = new GeneralDAO<>(sessionFactory, new Employee());
    }

    @Override
    public String register(String id, String nama, String jenisKelamin, String jumlahCuti, String email, String password, String statusNikah, String idManager, String jobs, String Date) {
        String passwordHash = BCrypt.hashpw(password, BCrypt.gensalt());
        try {
            if (edao.saveOrDelete(new Employee(id, nama, new Boolean(jenisKelamin), new BigInteger(jumlahCuti), email, passwordHash, new MarriedStatus(statusNikah), new Employee(idManager), new Job(jobs), sdf.parse(Date)), true)) {
                Employee employee = edao.getLastId();
                String idsm = employee.getId();
                String messagess = "<html>\n"
                        + "    <head>\n"
                        + "        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n"
                        + "    </head>\n"
                        + "    <body>\n"
                        + "        <table border=\"0\" bgcolor=\"#808080\" align=\"top\" width=\"100%\" style=\"position: relative; height: 100px\">\n"
                        + "            <tr>\n"
                        + "                <td bgcolor=\"#000080\" align=\"center\">\n"
                        + "                    <p style=\"font-size: 38pt; color: #ffffff; font-family: Arial Rounded MT Bold\">MII LEAVE REQUEST</p>\n"
                        + "                </td>\n"
                        + "                <td align=\"right\" width=\"180\">\n"
                        + "                    <img src=\"http://boot.mobilelegendadddiamond.web.id/img/logo.png\" style=\"background-color:white\" width=\"180\" height=\"160\" align=\"right\"/>\n"
                        + "                </td>\n"
                        + "            </tr>\n"
                        + "        </table>\n"
                        + "        <form action=\"http://localhost:8084/Leave_request/HeaderServlet?id="+idsm+"&token="+URLEncoder.encode(passwordHash)+"\">\n"
                        + "            <p>Please click this button to activate your account <input type=\"submit\" value=\"Activate now\"/></p>\n"
                        + "    \n"
                        + "</form>\n"
                        + "    </body>\n"
                        + "</html>";
                SendEmailTemp.setMessage(messagess);
                return "Selamat penambahan karyawan berhasil";
            }
        } catch (ParseException ex) {
            Logger.getLogger(EmployeeController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "Maaf coba lagi";
    }

    @Override
    public boolean login(String username, String password) {
        List<Employee> list = edao.login(username);
        if (!list.isEmpty()) {
            for (Employee employee : list) {
                LoginSession.setIdUsername(employee.getId());
                LoginSession.setRoleUsername(employee.getJob().getId());
                LoginSession.setNameLogin(employee.getName());
                System.out.println(employee.getName());
                if (BCrypt.checkpw(password, employee.getPassword())) {
                    return true;
                }
            }
        }
        System.out.println("List kosong");
        return false;
    }

    @Override
    public List<Employee> getAll() {
        return edao.getData("");
    }

    @Override
    public List<Employee> getKar(String key) {
        return edao.getByKar(key);
    }

    @Override
    public List<Employee> getByJob(String key) {
        return edao.getKarType(key);
    }

    @Override
    public List<Employee> getKarByMang(String key) {
        return edao.getByKarByMang(key);
    }

    @Override
    public List<Employee> getIdKar(String key) {
        return edao.getByIdKar(key);
    }

    @Override
    public List<Employee> getAll(String key) {
        return edao.getData("");
    }

    @Override
    public Employee getById(String key) {
        return edao.getById(key);
    }

    @Override
    public String delete(String key) {
        if (edao.saveOrDelete(new Employee(key), false)) {
            return "RECORD SUCCESSFULLY DELETED";
        } else {
            return "DELETE FAILED";
        }
    }

    @Override
    public String update(String id, String nama, String jenisKelamin, String jumlahCuti, String email, String password, String statusNikah, String idManager, String jobs, String Date, String JoinDate) {
        String passwordHash = BCrypt.hashpw(password, BCrypt.gensalt());
        try {
            if (edao.saveOrDelete(new Employee(id, nama, new Boolean(jenisKelamin), new BigInteger(jumlahCuti), email, passwordHash, new MarriedStatus(statusNikah), new Employee(idManager), new Job(jobs), sdf.parse(JoinDate)), true)) {
                return "SUCCESSFULLY UPDATE YOUR DATA";
            }
        } catch (ParseException ex) {
            Logger.getLogger(EmployeeController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "FAIL TO UPDATE";
    }

    @Override
    public String literallyUpdate(String id, String jumlahCuti) {
        if (edao.saveOrDelete(new Employee(id, new BigInteger(jumlahCuti)), true)) {
            return "SUCCESSFULLY UPDATE YOUR DATA";
        }
        return "FAIL TO UPDATE";
    }

    @Override
    public Employee getLastId() {
        return edao.getLastId();
    }

}
