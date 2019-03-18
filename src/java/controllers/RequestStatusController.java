/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.GeneralDAO;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Employee;
import models.LeaveType;
import models.Request;
import models.RequestStatus;
import models.Status;
import org.hibernate.SessionFactory;
import daos.Interface;

/**
 *
 * @author acer
 */
public class RequestStatusController implements RequestStatusControllerInterface{
     private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    private final Interface<RequestStatus> spdao;

    public RequestStatusController(SessionFactory sessionFactory) {
        spdao = new GeneralDAO<>(sessionFactory, new RequestStatus());
    }

    @Override
    public List<RequestStatus> getHistory(String keyword, Boolean status) {
        return spdao.getHistory(keyword, status);
    }

    @Override
    public List<RequestStatus> getHistoryByMang(String id, Boolean type) {
        return spdao.getHistoryByMang(id, type);
    }

    @Override
    public List<RequestStatus> getAll(String key) {
        return spdao.getAllHistory(key);
    }

    @Override
    public List<RequestStatus> getData(String key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String update(String id, String datetime, String description, String request, String status) {
         try {
            if (spdao.insertOrUpdate(new RequestStatus(id, sdf.parse(datetime), description, new Request(request), new Status(status)), true)) {
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
    public String insert(String id, String datetime, String description, String request, String status) {
        try {
            if (spdao.insertOrUpdate(new RequestStatus(id, sdf.parse(datetime), description, new Request(request), new Status(status)), true)) {
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
    public String delete(String key) {
        if (spdao.saveOrDelete(new RequestStatus(key), false)) {
            return "RECORD SUCCESSFULLY DELETED";
        } else {
            return "DELETE FAILED";
        }
    }

    @Override
    public List<RequestStatus> getAllHistory(String id) {
        return spdao.getAllHistory(id);
    }

    

}