package com.oams.action;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;


public class UserActionTest {

  @Before
  public void setUp() throws Exception {}

  @Test
  public void testAdd() {
    UserAction u = new UserAction();
    u.add();
  }

}
