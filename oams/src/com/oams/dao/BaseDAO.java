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
	public abstract void delete(T entity);
	public abstract void deleteByIds(String ids[]);
	public abstract T getById(String id);
	public abstract List<T> findAll(final int page,final int pageSize);
	public abstract int getCount();
}
