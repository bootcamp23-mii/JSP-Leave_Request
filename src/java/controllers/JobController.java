/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.GeneralDAO;
import daos.Interface;
import java.util.List;
import models.Job;
import org.hibernate.SessionFactory;

/**
 *
 * @author AdhityaWP
 */
public class JobController implements JobControllerInterface{
    private final Interface<Job> cdao;
    
    public JobController(SessionFactory sessionFactory) {
        cdao = new GeneralDAO<>(sessionFactory, new Job());
    }

    @Override
    public Job getId(String s) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Job> getAll() {
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
