package com.oams.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.oams.dao.UserDAO;
import com.oams.entity.User;
import com.oams.service.UserService;

@Service("userService")
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService{

	@Resource
    private UserDAO userDAO;
	public User login(String username, String password) {
		return userDAO.getUser(username,password);
	}
}
