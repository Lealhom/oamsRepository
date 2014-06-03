package com.oams.dao.impl;

import java.lang.reflect.ParameterizedType;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.oams.dao.BaseDAO;

@SuppressWarnings("unchecked")
public class BaseDAOImpl<T> implements BaseDAO<T> {
  private String className;
  @Resource
  protected HibernateTemplate hibernateTemplate;
  private Class<T> entityType;
  
  public BaseDAOImpl(){
	  ParameterizedType ps=(ParameterizedType) this.getClass().getGenericSuperclass();
	  this.entityType=(Class<T>)ps.getActualTypeArguments()[0];
  }

  public void save(Object entity) {
    hibernateTemplate.save(entity);
  }

  public void update(Object entity) {
    hibernateTemplate.update(entity);
  }

  public void delete(Object entity) {
    hibernateTemplate.delete(entity);
  }

  public void deleteByIds(String[] ids) {
  }

  public T getById(String id) {
    hibernateTemplate.find(id);
    return null;
  }
  public List<T> findAll() {
    //List<T> list = hibernateTemplate.find(" from "+entityType.getSimpleName());
    List<T> list = hibernateTemplate.executeFind(
        new HibernateCallback() {     
              public Object doInHibernate(Session session)     
                throws HibernateException, SQLException {     
               Query query = session.createQuery(" from "+entityType.getSimpleName());     
               query.setFirstResult(1);     
               query.setMaxResults(5);     
               List<T> list = query.list();     
              return list;     
             }     
            });     
    return list;
  }

  public List<T> paginateList(final String hql, final int offset, final int length) {
    
    List<T> list = hibernateTemplate.executeFind(
        new HibernateCallback() {     
              public Object doInHibernate(Session session)     
                throws HibernateException, SQLException {     
               Query query = session.createQuery(hql);     
               query.setFirstResult(offset);     
               query.setMaxResults(length);     
               List<T> list = query.list();     
              return list;     
             }     
            });     
     return list;     
  }
}
