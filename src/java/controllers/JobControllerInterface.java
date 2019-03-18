/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.util.List;
import models.Job;

/**
 *
 * @author AdhityaWP
 */
public interface JobControllerInterface {
     public Job getId(String s);
    public List<Job> getAll();
    
    public String save(String id, String type);
    public String update(String id, String type);
    public String delete(String id);
    
}
