package com.oams.action;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.oams.dao.impl.BaseDAOImpl;
import com.oams.dao.impl.UserDAOImpl;
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
