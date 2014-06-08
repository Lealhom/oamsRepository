package com.oams.action;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.interceptor.SessionAware;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.oams.entity.User;
import com.oams.service.UserService;
@Controller
@Scope("prototype")
@Results({
			@Result(name = "loginSuccess", location = "index.jsp"),
			@Result(name = "loginFail", location = "login.jsp"),
			
		 })
public class UserAction extends BaseAction<User> implements SessionAware{
	/*	
	 *  @Resource(name="xxx")��Ĭ��ByName����Name�Ҳ�����ByType������ҵ��������ᱨ��
	 * 
	 * 	@AutowiredĬ����ByType��Ĭ�������Ҫ������ע���Bean������ڣ����Ҫ����Ϊ�գ���Ӧ��ʹ�ã�@Autowired(required=false) 
	 *  @AutowiredҲ�������ó�ByName���������£�
	 *  @Autowired
	 *  @Qualifier("xxx") 
	 *  
	 *  @Inject��@Autowired���ƣ�����������spring��ע�⣬������� import javax.inject.Inject;
	 */
    @Resource
	private UserService userService;
    private Map<String, Object> session;
    private User entity = new User();
    
	private static Logger logger = LoggerFactory.getLogger(UserAction.class);
	private static final long serialVersionUID = 4059566892230982927L;
	
	public String login(){
		String username = entity.getUsername();
		String password = entity.getPassword();
		User user = userService.login(username,password);
		if(user!=null){
			System.out.println(user.getUsername());
			System.out.println(user.getPassword());
			session.put("username", user.getUsername());
			//session.remove("loginMsg");
		}else{
			session.put("loginMsg", "�û������������");
			return "loginFail";
		}
		
		return "loginSuccess";
	}
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
      List<User> users = userService.findAll(0, 0);
      for(int i=0;i<users.size();i++){
        System.out.println(users.get(i).getId());
      }
      return SUCCESS;
    }
	public User getModel() {
		return entity;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
}
