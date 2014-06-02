package com.oams.dao.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.oams.dao.UserDAO;
import com.oams.entity.User;

@Component
public class UserDAOImpl extends BaseDAOImpl<User> implements UserDAO {

	public User getUser(String username, String password) {
		System.out.println("from User user where user.username='"+username+"' and password='"+password+"'" );
		List userList = this.hibernateTemplate.find("from User user where user.username='"+username+"' and password='"+password+"'" );
		
		if(userList.size()!=0){
			return (User)userList.get(0);
		}else{
			return null;
		}
	}
}
