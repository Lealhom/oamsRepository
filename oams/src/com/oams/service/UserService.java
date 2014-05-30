package com.oams.service;

import com.oams.entity.User;

public interface UserService extends BaseService<User> {

	public abstract User login(String username, String password);
	
}
