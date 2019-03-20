/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.util.List;
import models.Employee;

/**
 *
 * @author AdhityaWP
 */
public interface EmployeeControllerInterface {

    public String register(String id, String nama, String jenisKelamin, String jumlahCuti, String email, String password, String statusNikah, String idManager, String jobs, String Date);

    public boolean login(String username, String Password);

    public List<Employee> getAll();

    public List<Employee> getKar(String key);

    public List<Employee> getByJob(String key);

    public List<Employee> getKarByMang(String key);

    public List<Employee> getIdKar(String key);

    public List<Employee> getAll(String key);

    public Employee getById(String key);

    public String delete(String key);

    public String update(String id, String nama, String jenisKelamin, String jumlahCuti, String email, String password, String statusNikah, String idManager, String jobs, String Date, String JoinDate);

    public String literallyUpdate(String id, String jumlahCuti);

    public Employee getLastId();

}
