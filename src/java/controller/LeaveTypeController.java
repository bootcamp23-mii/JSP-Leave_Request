/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daos.GeneralDAO;
import java.util.List;
import models.LeaveType;
import org.hibernate.SessionFactory;
import daos.Interface;

/**
 *
 * @author acer
 */
public class LeaveTypeController implements LeaveTypeControllerInterface{
     private final Interface<LeaveType> cdao;

    public LeaveTypeController(SessionFactory sessionFactory) {
        cdao = new GeneralDAO<>(sessionFactory, new LeaveType());
    }

    @Override
    public models.LeaveType getId(String s) {
        return cdao.getById(s);
    }

    @Override
    public List<models.LeaveType> getAll(String s) {
        return cdao.getData("");
    }

    @Override
    public String save(String id, String type) {
        if (cdao.saveOrDelete(new LeaveType(id, type), true)) {
            return "NEW LEAVE TYPES SUCCESSFULLY INSERTED";
        } else {
            return "UH OH, SOMETING WENT WRONG";
        }
    }

    @Override
    public String update(String id, String type) {
        if (cdao.saveOrDelete(new LeaveType(id, type), true)) {
            return "NEW LEAVE TYPES SUCCESSFULLY UPDATED";
        } else {
            return "UH OH, SOMETING WENT WRONG";
        }
    }

    @Override
    public String delete(String id) {
        if (cdao.saveOrDelete(new LeaveType(id), false)) {
            return "NEW LEAVE TYPES SUCCESSFULLY DELETED";
        } else {
            return "UH OH, SOMETING WENT WRONG";
        }
    }

}
