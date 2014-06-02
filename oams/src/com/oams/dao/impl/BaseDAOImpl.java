package com.oams.dao.impl;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

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
    List<T> list = hibernateTemplate.find(" from "+entityType.getSimpleName());
    return list;
  }
}
