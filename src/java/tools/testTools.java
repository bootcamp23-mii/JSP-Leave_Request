/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

import controllers.EmployeeController;
import controllers.EmployeeControllerInterface;
import controllers.RequestController;
import controllers.RequestControllerInterface;
import controllers.RequestStatusController;
import controllers.RequestStatusControllerInterface;
import daos.GeneralDAO;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import models.Request;
import org.hibernate.SessionFactory;
import tools.HibernateUtil;

/**
 *
 * @author Panji Sadewo
 */
public class testTools {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws ParseException {
        // TODO code application logic here
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        EmployeeControllerInterface eci = new EmployeeController(sessionFactory);
        GeneralDAO gdao = new GeneralDAO(sessionFactory, eci);
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        RequestStatusControllerInterface rci = new RequestStatusController(HibernateUtil.getSessionFactory());
        RequestControllerInterface rc = new RequestController(HibernateUtil.getSessionFactory());
        Date now = new Date();
        
        
        String hariini = dateFormat.format(now);
        Request idnext = rc.getLastId();
        System.out.println(rci.insert("", hariini, "", idnext.getId() , "S1")); 
//        if (eci.login("Alfa", "asd")) {
//            System.out.println("Login berhasil");
//        } else {
//            System.out.println("Login gagal");
//
//        }
        
    }
    
}

