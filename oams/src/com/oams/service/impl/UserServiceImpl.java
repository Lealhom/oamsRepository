package com.oams.service.impl;

import org.springframework.stereotype.Service;

import com.oams.entity.User;
import com.oams.service.UserService;

@Service("userService")
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService{
}
