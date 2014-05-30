package com.oams.dao.impl;

import org.springframework.stereotype.Component;

import com.oams.dao.UserDAO;
import com.oams.entity.User;

@SuppressWarnings("unchecked")
@Component
public class UserDAOImpl extends BaseDAOImpl<User> implements UserDAO{
  public UserDAOImpl(){
    super(User.class);
  }
}

