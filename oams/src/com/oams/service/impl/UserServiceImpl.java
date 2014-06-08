package com.oams.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.oams.dao.UserDAO;
import com.oams.entity.User;
import com.oams.service.UserService;

@Service("userService")
public class UserServiceImpl  implements UserService{

	@Resource
    private UserDAO userDAO;
	public User login(String username, String password) {
		return userDAO.getUser(username,password);
	}
	public void save(User entity) {
		// TODO Auto-generated method stub
		
	}
	public void update(User entity) {
		// TODO Auto-generated method stub
		
	}
	public void delete(User entity) {
		// TODO Auto-generated method stub
		
	}
	public void deleteByIds(String[] ids) {
		// TODO Auto-generated method stub
		
	}
	public User getById(String id) {
		// TODO Auto-generated method stub
		return null;
	}
	public List<User> findAll(int page,int pageSize) {
		// TODO Auto-generated method stub
		return null;
	}
	public int getCount() {
		return userDAO.getCount();
	}

}
