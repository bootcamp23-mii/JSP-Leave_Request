/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.util.List;
import models.RequestStatus;

/**
 *
 * @author acer
 */
public interface RequestStatusControllerInterface {
    public List <RequestStatus> getHistory(String keyword, Boolean status);

    public List<RequestStatus> getHistoryByMang(String id, Boolean type);

    public List<RequestStatus> getAll(String key);

    public List<RequestStatus> getData(String key);

//    public String save(String id, String start, String end, String total, String karyawan, String jenisCuti);
    public String update(String id, String datetime, String description, String request, String status);

    public String insert(String id, String datetime, String description, String request, String status);
}


