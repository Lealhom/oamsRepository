package com.oams.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public abstract class BaseAction<T> extends ActionSupport implements ModelDriven<T>{

	private static final long serialVersionUID = 1L;
	protected JSONObject ListToJson(List list){
		Map<String, Object> jsonMap = new HashMap<String, Object>();//����map  
	    jsonMap.put("total", list.size());//total�� ����ܼ�¼���������  
	    jsonMap.put("rows", list);//rows�� ���ÿҳ��¼ list  
	    return JSONObject.fromObject(jsonMap);//��ʽ��result   һ��Ҫ��JSONObject 
	}
	
}
