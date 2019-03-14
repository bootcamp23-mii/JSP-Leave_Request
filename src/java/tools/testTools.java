/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

import controllers.EmployeeController;
import controllers.EmployeeControllerInterface;
import daos.GeneralDAO;
import java.text.ParseException;
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
        
        if (eci.Login("Alfa", "asd")) {
            System.out.println("Login berhasil");
        } else {
            System.out.println("Login gagal");

        }
        
    }
    
}

