package com.oams.dao.impl;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.oams.dao.BaseDAO;

@SuppressWarnings("unchecked")
@Repository ("baseDAO")
public class BaseDAOImpl<T> implements BaseDAO<T> {
  
  private HibernateTemplate hibernateTemplate;

  public HibernateTemplate getHibernateTemplate() {
    return hibernateTemplate;
  }
  @Resource
  public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
    this.hibernateTemplate = hibernateTemplate;
  }

  private static String className;
  
// 利用发射技术得到泛型T的实际类型
//  public BaseDAOImpl() {
//    ParameterizedType ps = (ParameterizedType) this.getClass().getGenericSuperclass();
//    this.entity = (Class<T>) ps.getActualTypeArguments()[0];
//  }

  public BaseDAOImpl(){
  }
  public BaseDAOImpl(Class<T> entity) {
    className = entity.getName();
  }

  public void save(Object entity) {
    System.out.println(entity.toString() + " saved!");
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
