package com.oams.action;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.oams.entity.User;
import com.oams.service.UserService;


public class UserActionTest {

  @Before
  public void setUp() throws Exception {}

  @Test
  public void testAdd() {
	  	ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
		UserAction userAction = (UserAction)ctx.getBean("userAction");
		userAction.add();
		ctx.destroy();
  }

}
