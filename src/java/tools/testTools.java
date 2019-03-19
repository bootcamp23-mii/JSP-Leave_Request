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
import models.RequestStatus;
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

//        String hariini = dateFormat.format(now);
//        Request idnext = rc.getLastId();
//        System.out.println(rci.insert("", hariini, "", idnext.getId() , "S1")); 
//        System.out.println(rci.getAllHistory("11201"));
//        System.out.println(rc.save("P1", "2018-03-19", "2018-03-19", "10", "asd", "11201", "JC1"));
//
//        if (eci.login("Alfa", "qwe")) {
//            System.out.println("Login berhasil");
//        } else {
//            System.out.println("Login gagal");
//
//        }
System.out.println(rci.getAllHistory("11201"));
        for (RequestStatus request : rci.getAllHistory("11201")) {
            System.out.println(request.getId());
            System.out.println(request.getRequest().getId());
            System.out.println(request.getStatus().getType());
            System.out.println(request.getRequest().getTotal());
        }

    }

}
