package com.oams.action;


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
	private static Logger logger = LoggerFactory.getLogger(UserAction.class);
	/**
	 * 
	 */
	private static final long serialVersionUID = 4059566892230982927L;
	public String add(){
	    User user = new User();
	    userService.save(user);
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
