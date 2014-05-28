package com.oams.service.impl;

import com.oams.dao.UserDAO;
import com.oams.dao.impl.UserDAOImpl;
import com.oams.entity.User;
import com.oams.service.UserService;

public class UserServiceImpl implements UserService{
	private UserDAO userDao = new UserDAOImpl();

	public void save(User entity) {
		userDao.save(entity);
	}
}
