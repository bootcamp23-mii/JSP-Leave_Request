/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.GeneralDAO;
import daos.Interface;
import java.awt.Image;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import models.Employee;
import org.hibernate.SessionFactory;

/**
 *
 * @author AdhityaWP
 */
public class UploadController implements UploadControllerInterface {
    private Interface<Employee> dao;
    
    public UploadController (SessionFactory sessionFactory) {
        dao = new GeneralDAO<>(sessionFactory, new Employee());
    }

    @Override
    public boolean Upload(String id, String path) {
        try {
            System.out.println(path);
            Employee data = dao.getById(id);
//            File file = new File("./web/assets/img/apple-icon.png");
            File file = new File(path);
            System.out.println(file.getAbsolutePath());
            InputStream is = new FileInputStream(file);
            byte[] photo = new byte[is.available()];
            is.read(photo);
            is.close();
            if (dao.saveOrDelete(new Employee(id, data.getName(), data.getGendertype(), data.getLeavetotal(), data.getEmail(), data.getPassword(), data.getMarriedstatus(), data.getIdmanager() ,data.getJob(), data.getJoindate(), photo), true)) {
                return true;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return false;
    }

    @Override
    public Image Download(String id) {
        Image image = null;
        Employee data = dao.getById(id);
        try {
            InputStream io = new ByteArrayInputStream(data.getPhoto());
            return ImageIO.read(new ByteArrayInputStream(data.getPhoto()));
        } catch (IOException ex) {
            Logger.getLogger(UploadController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return image;
    }

}
