package com.oams.dao;

import java.util.List;
/**
 * 
 * @author Lealhom
 * 
 * @param <T>
 */
public interface BaseDAO<T> {
	public abstract void save(T entity);
	public abstract void update(T entity);
	public abstract void delete(String id);
	public abstract void deleteByIds(String ids[]);
	public abstract T getById(String id);
	public abstract List<T> findAll();
}
