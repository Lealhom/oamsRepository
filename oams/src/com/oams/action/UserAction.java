package com.oams.action;


import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.oams.entity.User;
import com.oams.service.UserService;
import com.opensymphony.xwork2.ActionSupport;
@Controller
@Scope("prototype")
public class UserAction extends ActionSupport{
	/*	
	 *  @Resource(name="xxx")，默认ByName，按Name找不着则ByType，如果找到多个，则会报错
	 * 
	 * 	@Autowired默认是ByType，默认情况下要求依赖注入的Bean必须存在，如果要允许为空，则应该使用：@Autowired(required=false) 
	 *  @Autowired也可以设置成ByName，配置如下：
	 *  @Autowired
	 *  @Qualifier("xxx") 
	 *  
	 *  @Inject与@Autowired类似，不过不属于spring的注解，导入的是 import javax.inject.Inject;
	 */
    @Resource
	private UserService userService;
	private static Logger logger = LoggerFactory.getLogger(UserAction.class);
	/**
	 * 
	 */
	private static final long serialVersionUID = 4059566892230982927L;
	public String add(User user){
	    userService.save(user);
		return SUCCESS;
	}
	public String update(User user){
	  userService.update(user);
	  return SUCCESS;
	}
	public String delete(User user){
      userService.delete(user);
      return SUCCESS;
    }
	public String list(){
      List<User> users = userService.findAll();
      for(int i=0;i<users.size();i++){
        System.out.println(users.get(i).getId());
      }
      return SUCCESS;
    }
//  public UserService getUserService() {
//    return userService;
//  }
//  @Resource
//  public void setUserService(UserService userService) {
//    this.userService = userService;
//  }
	
}
