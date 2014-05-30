package com.oams.dao;

import com.oams.entity.User;

public interface UserDAO extends BaseDAO<User>{

	public abstract User getUser(String username, String password);
}
