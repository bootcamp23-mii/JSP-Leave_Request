/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.util.List;
import models.Request;

/**
 *
 * @author acer
 */
public interface RequestControllerInterface {
    public Request getById(String id);
    
    public List<Request> getByEmployee (String id);
    
    public List<Request> getIdEmployee(String id);
    
     public List<Request> getAll(String key);
    
    public List<Request> getData(String key);

    public String save(String id, String start, String end, String total, String status ,String employee, String leaveType);
    public String update(String id, String start, String end, String total,String status, String employee, String leaveType);
    public String delete(String id);
}
