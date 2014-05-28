package com.oams.service;

import java.util.List;

public interface BaseService<T> {
  public abstract void save(T entity);
  public abstract void update(T entity);
  public abstract void delete(String id);
  public abstract void deleteByIds(String ids[]);
  public abstract T getById(String id);
  public abstract List<T> findAll();
}
