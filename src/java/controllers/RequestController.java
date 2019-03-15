/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.GeneralDAO;
import java.math.BigInteger;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.LeaveType;
import models.Request;
import models.Employee;
import org.hibernate.SessionFactory;
import daos.Interface;

/**
 *
 * @author acer
 */
public class RequestController implements RequestControllerInterface{
    private final SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yy");
    private final Interface <Request> cdao;

    public RequestController(SessionFactory sessionFactory) {
        cdao = new GeneralDAO <>(sessionFactory, new Request());
    }

    @Override
    public String save(String id, String start, String end, String total, String status, String employee, String leaveType) {
        try {
            if (cdao.saveOrDelete(new Request(id, sdf.parse(start), sdf.parse(end), new BigInteger(total),status ,new Employee(employee), new LeaveType(leaveType)), true)) {
                return "DATA SAVE FOR ID = " + id;
            } else {
                return "SAVE FAILED";
            }
        } catch (ParseException ex) {
            Logger.getLogger(RequestController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "FAIL";
    }

    
    @Override
    public String update(String id, String start, String end, String total, String status, String employee, String leaveType) {
        try {
            if (cdao.saveOrDelete(new Request(id, sdf.parse(start), sdf.parse(end), new BigInteger(total), status ,new Employee(employee), new LeaveType(leaveType)), true)) {
                return "DATA UPDATED FOR ID = " + id;
            } else {
                return "UPDATE FAILED";
            }
        } catch (ParseException ex) {
            Logger.getLogger(RequestController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "FAIL";
    }

    @Override
    public String delete(String id) {
        if (cdao.saveOrDelete(new Request(id), false)) {
            return "RECORD SUCCESSFULLY DELETED";
        } else {
            return "DELETE FAILED";
        }
    }

    @Override
    public Request getById(String key) {
        return cdao.getById(key);
    }

    @Override
    public List<Request> getByEmployee(String key) {
        return cdao.getByKar(key);
    }
    
//    @Override
//    public List<Pengajuan> getHistory(String key) {
//        return cdao.getHistory(key);
//    }

    @Override
    public List<Request> getAll(String key) {
        return cdao.getData("");
    }

    @Override
    public List<Request> getData(String key) {
        return cdao.getData(key);
    }

    @Override
    public List<Request> getIdEmployee(String key) {
       return cdao.getByKar(key); //To change body of generated methods, choose Tools | Templates.
    }

}
