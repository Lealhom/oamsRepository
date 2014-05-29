package com.oams.service.impl;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import com.oams.dao.BaseDAO;
import com.oams.service.BaseService;

@SuppressWarnings("unchecked")
public class BaseServiceImpl<T> implements BaseService<T>{
    private BaseDAO<T> baseDAO;
    private Class<T> entity;
    
    public BaseServiceImpl() {
        ParameterizedType ps=(ParameterizedType) this.getClass().getGenericSuperclass();
        this.entity=(Class<T>)ps.getActualTypeArguments()[0];
        String s[] = entity.getName().split("\\.");
        String name = s[s.length-1];
        String className = "com.oams.dao.impl."+name+"DAOImpl";
        try {
          baseDAO = (BaseDAO<T>) Class.forName(className).newInstance();
        } catch (InstantiationException e) {
          e.printStackTrace();
        } catch (IllegalAccessException e) {
          e.printStackTrace();
        } catch (ClassNotFoundException e) {
          e.printStackTrace();
        }
    }
    
    public  void save(T entity){
      baseDAO.save(entity);
    }
    public  void update(T entity){
      baseDAO.update(entity);
    }
    public  void delete(String id){
      baseDAO.delete(id);
    }
    public  void deleteByIds(String ids[]){
      baseDAO.deleteByIds(ids);
    }
    public  T getById(String id){
      return  baseDAO.getById(id);
    }
    public  List<T> findAll(){
      return baseDAO.findAll();
    }
}
