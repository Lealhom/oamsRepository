package com.oams.action;


import com.oams.entity.User;
import com.oams.service.UserService;
import com.oams.service.impl.UserServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport{
	private UserService userService = new UserServiceImpl();
	/**
	 * 
	 */
	private static final long serialVersionUID = 4059566892230982927L;
	public String add(User user){
		userService.save(user);
		return SUCCESS;
	}
	public static void main(String[] args) {
		UserAction test = new UserAction();
		User user = new User();
		user.setId("id:込込込込込");
		test.add(user);
	}
}
