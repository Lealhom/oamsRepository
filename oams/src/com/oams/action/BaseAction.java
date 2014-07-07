package com.oams.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
public abstract class BaseAction<T> extends ActionSupport implements ModelDriven<T>{
	private static final long serialVersionUID = 1L;
	protected String ids;
	protected int page;
	protected int rows;
	protected int total;
	protected String sort;
	protected String order;
	protected JSONObject data;  
	
//	private Class<T> entityType;
//	public BaseAction(){
//		  ParameterizedType ps=(ParameterizedType) this.getClass().getGenericSuperclass();
//		  this.entityType=(Class<T>)ps.getActualTypeArguments()[0];
//	}
	
	protected JSONObject ListToJson(List<?> list,int total){
		Map<String, Object> jsonMap = new HashMap<String, Object>();//����map  
	    jsonMap.put("total", total);//total�� ����ܼ�¼������  
	    jsonMap.put("rows", list);//rows�� ���ÿҳ��¼ list  
	    return JSONObject.fromObject(jsonMap);//��ʽ��result   һ��Ҫ��JSONObject 
	}
	
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}
	
	public JSONObject getData() {
		return data;
	}
	public void setData(JSONObject data) {
		this.data = data;
	}
	
	public String getIds() {
		return ids;
	}
	
	public void setIds(String ids) {
		this.ids = ids;
	}
	
}
