package com.oams.dao.impl;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.oams.dao.BaseDAO;
@SuppressWarnings("unchecked")
@Repository
public abstract class BaseDAOImpl<T> implements BaseDAO<T> {

	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	
	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	private Class<T> entity;
	//利用发射技术得到泛型T的实际类型
	public BaseDAOImpl(){ 
		ParameterizedType ps=(ParameterizedType) this.getClass().getGenericSuperclass();
		this.entity=(Class<T>)ps.getActualTypeArguments()[0];

	}
	
	
	public void save(Object entity) {
		System.out.println(entity.toString()+" saved!");
		hibernateTemplate.save(entity);
	}

	public void update(Object entity) {
		// TODO Auto-generated method stub
		
	}

	public void delete(String id) {
		// TODO Auto-generated method stub
		
	}

	public void deleteByIds(String[] ids) {
		// TODO Auto-generated method stub
		
	}

	public T getById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	public List findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	
}
