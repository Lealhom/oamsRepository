package com.oams.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.dom4j.tree.AbstractEntity;
import org.hibernate.annotations.GenericGenerator;

/**
 * 
 * @author Lealhom
 * date:2014-05-27
 * ����ʵ����Ļ���
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
