/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.util.List;
import models.LeaveType;

/**
 *
 * @author acer
 */
public interface LeaveTypeControllerInterface {
     public LeaveType getId(String s);
    public List<LeaveType> getAll();
    
    public String save(String id, String type);
    public String update(String id, String type);
    public String delete(String id);
}
