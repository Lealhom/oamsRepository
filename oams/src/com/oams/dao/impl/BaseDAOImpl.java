package com.oams.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.oams.dao.BaseDAO;

@SuppressWarnings("unchecked")
@Repository ("baseDAO")
public class BaseDAOImpl<T> implements BaseDAO<T> {
  private static String className;
  @Resource
  protected HibernateTemplate hibernateTemplate;
  
  public BaseDAOImpl(){
  }
  public BaseDAOImpl(Class<T> entity) {
    className = entity.getName();
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
    List<T> list = hibernateTemplate.find(" from "+className);
    return list;
  }
}
