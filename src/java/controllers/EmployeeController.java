/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.GeneralDAO;
import daos.Interface;
import java.util.List;
import tools.BCrypt;
import models.Employee;
import models.LoginSession;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Panji Sadewo
 */
public class EmployeeController implements EmployeeControllerInterface{
    
    private Interface<Employee> edao;

    public EmployeeController(SessionFactory sessionFactory) {
        edao = new GeneralDAO<>(sessionFactory, new Employee());
    }
    
    @Override
    public boolean Login(String username, String password) {
        List<Employee> list = edao.login(username);
        if (!list.isEmpty()) {
            for (Employee employee : list) {
                LoginSession.setIdUsername(employee.getId());
                if (BCrypt.checkpw(password, employee.getPassword())) {
                    return true;
                }
            }
        }
        System.out.println("List kosong");
        return false;
    }
    
}
