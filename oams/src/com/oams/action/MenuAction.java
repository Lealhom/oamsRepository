package com.oams.action;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.SessionAware;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.oams.entity.Menu;
import com.oams.service.MenuService;
@Controller
@Scope("prototype")
@ParentPackage("json-default")
@Result(name = "list", type = "json", params = { "root", "data" })
public class MenuAction extends BaseAction<Menu> implements SessionAware{
    @Resource
	private MenuService menuService;
    private Map<String, Object> session;
    private Menu entity = new Menu();
    private JSONObject data;
	private static Logger logger = LoggerFactory.getLogger(MenuAction.class);
	private static final long serialVersionUID = 4059566892230982927L;
	
	public String add(){
		menuService.save(entity); 
		return SUCCESS;
	}
	public String update(){
		menuService.update(entity);
	  return SUCCESS;
	}
	public String delete(){
		menuService.delete(entity);
      return SUCCESS;
    }
	public String list(){
		//http://www.cnblogs.com/huozhicheng/archive/2011/09/27/2193605.html
      List<Menu> menus = menuService.findAll();
      data = ListToJson(menus);
//      Map<String, Object> jsonMap = new HashMap<String, Object>();//定义map  
//      jsonMap.put("total", 2);//total键 存放总记录数，必须的  
//      jsonMap.put("rows", menus);//rows键 存放每页记录 list  
//      data = JSONObject.fromObject(jsonMap);//格式化result   一定要是JSONObject 
      return "list";
    }
	public Menu getModel() {
		return entity;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public JSONObject getData() {
		return data;
	}
	public void setData(JSONObject data) {
		this.data = data;
	}
	
}
