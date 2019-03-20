/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

/**
 *
 * @author Pandu
 */
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import models.Employee;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Panji Sadewo
 * @param <T>
 */
public class GeneralDAO<T> implements Interface<T> {

    private SessionFactory factory;
    private Session session;
    private Transaction transaction;
    private T t;

    public GeneralDAO(SessionFactory factory, T t) {
        this.factory = factory;
        this.t = t;
    }

    public GeneralDAO() {
    }

    private String getQuery(String keyword) {
        String query = "From " + t.getClass().getSimpleName();
        if (!keyword.equals("")) {
            query += " where ";
            for (Field field : t.getClass().getDeclaredFields()) {
                if (!field.getName().contains("UID") && !field.getName().contains("List")) {
                    query += field.getName() + " like '%" + keyword + "%' OR ";
                }
            }
            query = query.substring(0, query.lastIndexOf("OR"));
        }
        return query + " order by 1";
    }

    @Override
    public List<T> getData(Object keyword) {
        List<T> obj = new ArrayList<>();
        session = this.factory.openSession();
        transaction = session.beginTransaction();
        try {
            obj = session.createQuery(getQuery(keyword + "")).list();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        }
        return obj;
    }

    @Override
    public List<T> getByKar(Object id) {
        List<T> obj = new ArrayList<>();
        session = this.factory.openSession();
        transaction = session.beginTransaction();
        try {
            obj = session.createQuery("FROM " + t.getClass().getSimpleName() + " WHERE employee = '" + id + "'").list();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        }
        return obj;
    }

    @Override
    public List<T> getKarType(Object id) {
        List<T> obj = new ArrayList<>();
        session = this.factory.openSession();
        transaction = session.beginTransaction();
        try {
            obj = session.createQuery("FROM " + t.getClass().getSimpleName() + " WHERE job = '" + id + "'").list();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        }
        return obj;
    }

    @Override
    public List<T> getByKarByMang(Object id) {
        List<T> obj = new ArrayList<>();
        session = this.factory.openSession();
        transaction = session.beginTransaction();
        try {
            obj = session.createQuery("FROM " + t.getClass().getSimpleName() + " WHERE idmanager = '" + id + "'").list();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        }
        return obj;
    }

    @Override
    public List<T> getByIdKar(Object keyword) {
        List<T> obj = new ArrayList<>();
        session = this.factory.openSession();
        transaction = session.beginTransaction();
        try {
            obj = session.createQuery("FROM " + t.getClass().getSimpleName() + " WHERE id = '" + keyword + "'").list();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        }
        return obj;
    }

    @Override
    public T getById(Object id) {
        T obj = null;
        session = this.factory.openSession();
        transaction = session.beginTransaction();
        try {
            obj = (T) session.createQuery("FROM " + t.getClass().getSimpleName() + " WHERE id = '" + id + "'").uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        }
        return obj;
    }

    @Override
    public List<T> getHistory(Object keyword, Boolean isS1) {
        List<T> obj = new ArrayList<>();
        session = this.factory.openSession();
        transaction = session.beginTransaction();
        try {
//            obj = session.createQuery("FROM " + t.getClass().getSimpleName() + " WHERE karyawan = '" + keyword + "' AND ").list();
            if (isS1) {
                obj = session.createQuery("from RequestStatus where status is not 'S1' and request in(from Request where employee = '" + keyword + "') order by datetime desc").list();
            } else {
                obj = session.createQuery("from RequestStatus where status = 'S1' and request in(from Request where employee = '" + keyword + "') order by datetime desc").list();
            }
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        }
        return obj; //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<T> getHistoryByMang(Object keyword, Boolean isS1) {
        List<T> obj = new ArrayList<>();
        session = this.factory.openSession();
        transaction = session.beginTransaction();
        try {
            if (isS1) {
                obj = session.createQuery("from RequestStatus where status = 'S1' and request in(from Request where employee in(from Employee where idmanager = '" + keyword + "')) order by datetime desc").list();

            } else {
                System.out.println("THERE NO NEED TO WORRY");
            }
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        }
        return obj; //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean saveOrDelete(T entity, boolean isSave) {
        boolean result = false;
        session = this.factory.openSession();
        transaction = session.beginTransaction();
        try {
            if (isSave) {
                session.saveOrUpdate(entity);
            } else {
                session.delete(entity);
            }
            transaction.commit();
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return result;
    }

    @Override
    public boolean insertOrUpdate(T entity, boolean isSave) {
        boolean result = false;
        session = this.factory.openSession();
        transaction = session.beginTransaction();
        try {
            if (isSave) {
                session.save(entity);
            } else {
                session.update(entity);
            }
            transaction.commit();
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return result;
    }

    @Override
    public List<T> login(Object username) {
        List<T> obj = new ArrayList<>();
        session = this.factory.openSession();
        transaction = session.beginTransaction();
        try {
            obj = session.createQuery("FROM " + t.getClass().getSimpleName() + " WHERE name = '" + username + "'").list();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        }
        return obj;
    }

    @Override
    public T getLastId() {
        T obj = null;
        session = this.factory.openSession();
        transaction = session.beginTransaction();
        try {
            obj = (T) session.createQuery("FROM " + t.getClass().getSimpleName() + " WHERE id IN ( SELECT MAX(id) FROM " + t.getClass().getSimpleName() + " )").uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        }
        return obj;
    }

    @Override
    public List<T> getAllHistory(Object keyword) {
        List<T> obj = new ArrayList<>();
        session = this.factory.openSession();
        transaction = session.beginTransaction();
        try {
//           
            obj = session.createQuery("from RequestStatus where request in(from Request where employee = '" + keyword + "') order by datetime desc").list();

        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        }
        return obj; //To change body of generated methods, choose Tools | Templates.        
    }

}
