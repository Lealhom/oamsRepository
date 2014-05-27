package com.oams.entity;
/**
 * 
 * @author Lealhom
 * date:2014-05-27
 * 所有实体类的父类
 */
public abstract class AbstractEntity {
	private String id;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
}
