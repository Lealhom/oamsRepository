package com.oams.action;


import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

import com.oams.entity.User;
import com.oams.service.UserService;
import com.opensymphony.xwork2.ActionSupport;
@Controller
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
		System.out.println(userService);
	    logger.error("����û�ʧ��");
	    User user = new User();
	    user.setId("123456");
	    userService.save(user);
		return SUCCESS;
	}
}
