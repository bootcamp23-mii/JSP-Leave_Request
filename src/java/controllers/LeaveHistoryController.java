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
import models.LeaveDesc;
import models.LeaveHistory;
import models.LeaveType;
import org.hibernate.SessionFactory;

/**
 *
 * @author AdhityaWP
 */
public class LeaveHistoryController implements LeaveHistoryControllerInterface{
    private final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    private final Interface <LeaveHistory> cdao;

    public LeaveHistoryController(SessionFactory sessionFactory) {
        cdao = new GeneralDAO <>(sessionFactory, new LeaveHistory());
    }
    
    @Override
    public String save(String id, String datettime, String total, String description, String Employee) {
        try {
            if (cdao.saveOrDelete(new LeaveHistory(id, sdf.parse(datettime), new BigInteger(total), new LeaveDesc(description), new Employee(Employee)), true)) {
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
     public List<LeaveHistory> getAll(String key) {
        return cdao.getData("");
    }

    @Override
    public LeaveHistory getById(String id) {
        return cdao.getById(id);
    }
    
     @Override
    public List<LeaveHistory> getData(String key) {
        return cdao.getData(key);
    }
    
    
     @Override
    public String delete(String id) {
        if (cdao.saveOrDelete(new LeaveHistory(id), false)) {
            return "RECORD SUCCESSFULLY DELETED";
        } else {
            return "DELETE FAILED";
        }
    }
     
}
