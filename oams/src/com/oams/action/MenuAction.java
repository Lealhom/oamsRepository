package com.oams.action;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

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
	private static Logger logger = LoggerFactory.getLogger(MenuAction.class);
	private static final long serialVersionUID = 4059566892230982927L;
	
    public String add(){
		menuService.save(entity); 
		return null;
	}
    
	public String update(){
		menuService.update(entity);
	  return null;
	}
	
	public String delete(){
		System.out.println(ids);
		String idsArray[] = ids.split(",");
		System.out.println(menuService);
		//menuService.delete(entity);
		menuService.deleteByIds(idsArray); 
      return null;
    }
	
	public String list(){
		  int total = menuService.getCount();
	      List<Menu> menus = menuService.findAll(page,rows);
	      data = ListToJson(menus,total);
	      return "list";
	    }
	
	public Menu getModel() {
		return entity;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
}
