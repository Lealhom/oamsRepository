package com.oams.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.oams.dao.BaseDAO;
import com.oams.service.BaseService;

@SuppressWarnings("unchecked")
@Service
public class BaseServiceImpl<T> implements BaseService<T>{
    @Resource
    private BaseDAO<T> baseDAO;
    private Class<T> entity;
    
    public BaseDAO<T> getBaseDAO() {
      return baseDAO;
    }
    
    public BaseServiceImpl(){
      
    }
    public BaseServiceImpl(Class<T> entity) {
      this.entity = entity;
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
