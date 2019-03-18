/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.GeneralDAO;
import daos.Interface;
import java.util.List;
import models.LeaveType;
import models.MarriedStatus;
import org.hibernate.SessionFactory;

/**
 *
 * @author AdhityaWP
 */
public class MarriedStatusController implements MarriedStatusControllerInterface{
    private final Interface<MarriedStatus> cdao;
    
    public MarriedStatusController(SessionFactory sessionFactory) {
        cdao = new GeneralDAO<>(sessionFactory, new MarriedStatus());
    }

    @Override
    public MarriedStatus getId(String s) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<MarriedStatus> getAll() {
        return cdao.getData("");
    }

    @Override
    public String save(String id, String type) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String update(String id, String type) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String delete(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
