package com.oams.action;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.oams.entity.User;
import com.oams.service.UserService;
import com.oams.service.impl.UserServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport{
	private UserService userService = new UserServiceImpl();
	private static Logger logger = LoggerFactory.getLogger(UserAction.class);
	/**
	 * 
	 */
	private static final long serialVersionUID = 4059566892230982927L;
	public String add(){
	    logger.error("ÃÌº””√ªß ß∞‹");
	    User user = new User();
	    user.setId("123456");
	    userService.save(user);
		return SUCCESS;
	}
}
