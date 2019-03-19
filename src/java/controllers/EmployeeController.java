/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.GeneralDAO;
import daos.Interface;
import java.math.BigInteger;
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

/**
 *
 * @author AdhityaWP
 */
public class EmployeeController implements EmployeeControllerInterface{
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
    
}
