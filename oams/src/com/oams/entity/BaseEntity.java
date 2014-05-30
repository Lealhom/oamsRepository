package com.oams.entity;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.annotations.GenericGenerator;

/**
 * 
 * @author Lealhom
 * date:2014-05-27
 * 所有实体类的基类
 */
public abstract class BaseEntity implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7519021763989757715L;
	protected String id;

	@Id
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid")
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}
