package com.oams.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.oams.dao.BaseDAO;
import com.oams.dao.impl.BaseDAOImpl;
import com.oams.service.BaseService;

//@Service
public class BaseServiceImpl<T> implements BaseService<T>{
    //@Resource
    private BaseDAO<T> baseDAO = new BaseDAOImpl<T>();
    
    public BaseDAO<T> getBaseDAO() {
      return baseDAO;
    }
    
    public BaseServiceImpl(){
      
    }
    
    public  void save(T entity){
      baseDAO.save(entity);
    }
    public  void update(T entity){
      baseDAO.update(entity);
    }
    public  void delete(T entity){
      baseDAO.delete(entity);
    }
    public  void deleteByIds(String ids[]){
      baseDAO.deleteByIds(ids);
    }
    public  T getById(String id){
      return  baseDAO.getById(id);
    }

	public List<T> findAll(int page, int pageSize) {
		return baseDAO.findAll(page,pageSize);
	}

	public int getCount() {
		return baseDAO.getCount();
	}
}
