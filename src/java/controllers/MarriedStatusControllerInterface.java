/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.util.List;
import models.MarriedStatus;

/**
 *
 * @author AdhityaWP
 */
public interface MarriedStatusControllerInterface {
     public MarriedStatus getId(String s);
    public List<MarriedStatus> getAll();
    
    public String save(String id, String type);
    public String update(String id, String type);
    public String delete(String id);
    
}
