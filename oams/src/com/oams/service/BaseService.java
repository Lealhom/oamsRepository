package com.oams.service;

import java.util.List;

public interface BaseService<T> {
  public abstract void save(T entity);
  public abstract void update(T entity);
  public abstract void delete(T entity);
  public abstract void deleteByIds(String ids[]);
  public abstract T getById(String id);
  public abstract List<T> findAll(int page, int rows);
  public abstract int getCount(); 
}
