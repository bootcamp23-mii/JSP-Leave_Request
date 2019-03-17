/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.util.List;
import models.LeaveHistory;

/**
 *
 * @author AdhityaWP
 */
public interface LeaveHistoryControllerInterface {
    public String save(String id, String datettime, String total, String description, String Employee);
    public LeaveHistory getById(String id);
    public List<LeaveHistory> getAll(String key);
    public List<LeaveHistory> getData(String key);
    public String delete(String id);
}
