/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import java.util.List;
import models.Employee;

/**
 *
 * @author Pandu
 */
public interface Interface<T> {

    public boolean saveOrDelete(T entity, boolean isSave);

    public boolean insertOrUpdate(T entity, boolean isSave);

    public List<T> getData(Object keyword);

    public List<T> getByKar(Object keyword);

    public List<T> getByKarByMang(Object keyword);

    public List<T> getByIdKar(Object keyword);

    public List<T> getKarType(Object keyword);

    public List<T> getHistory(Object keyword, Boolean status);

    public List<T> getHistoryByMang(Object keyword, Boolean status);

    public List<T> login(Object keyword);

    public T getById(Object id);
}
