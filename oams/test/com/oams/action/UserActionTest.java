package com.oams.action;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.oams.dao.impl.BaseDAOImpl;
import com.oams.dao.impl.UserDAOImpl;
import com.oams.entity.User;
import com.oams.service.UserService;



public class UserActionTest {

  @Before
  public void setUp() throws Exception {}

  @Test
  public void testAdd() {
        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
        
        UserAction userAction = (UserAction)ctx.getBean("userAction");
        User user = new User();
        //添加
        user.setUsername("用户名");
		userAction.add(user);
		//修改
		user.setUsername("用户名123456");
		userAction.update(user);
		//删除
		//userAction.delete(user);
		//查询
		//userAction.list();
		ctx.destroy();
		
		

  }

}
