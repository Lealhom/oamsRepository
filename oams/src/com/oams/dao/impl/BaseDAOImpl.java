package com.oams.dao.impl;

import java.io.Serializable;
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
	  System.out.println("进入delete方法");
    hibernateTemplate.delete(entity);
  }

  public void deleteByIds(String[] ids) {
	  for (Object id : ids) {
			hibernateTemplate.delete(find(entityType, id));
		}
  }
  
	public void delete(Class<T> entityClass, Object entityId) {
		delete(entityClass, new Object[] { entityId });
	}

	public void delete(Class<T> entityClass, Object[] entityIds) {
		for (Object id : entityIds) {
			hibernateTemplate.delete(find(entityClass, entityIds));
		}
	}

	public  T find(Class<T> entityClass, Object entityId) {
		return (T) hibernateTemplate.get(entityClass, (Serializable) entityId);
	}
  

  public T getById(String id) {
    hibernateTemplate.find(id);
    return null;
  }

  public List<T> findAll( final int page,  final int pageSize) {
	final String hql = " from "+entityType.getSimpleName();
    List<T> list = hibernateTemplate.executeFind(
        new HibernateCallback() {     
              public Object doInHibernate(Session session)     
                throws HibernateException, SQLException {     
               Query query = session.createQuery(hql);     
               query.setFirstResult((page-1)*pageSize);     
               query.setMaxResults(pageSize);     
               List<T> list = query.list();     
              return list;     
             }     
            });     
     return list;     
  }

	public int getCount() {
		String hql = " select count(*) from "+entityType.getSimpleName();
		return ((Long)hibernateTemplate.find(hql).listIterator().next()).intValue();
	}

}
