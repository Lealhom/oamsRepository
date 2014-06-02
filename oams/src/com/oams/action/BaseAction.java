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
		Map<String, Object> jsonMap = new HashMap<String, Object>();//定义map  
	    jsonMap.put("total", list.size());//total键 存放总记录数，必须的  
	    jsonMap.put("rows", list);//rows键 存放每页记录 list  
	    return JSONObject.fromObject(jsonMap);//格式化result   一定要是JSONObject 
	}
	
}
