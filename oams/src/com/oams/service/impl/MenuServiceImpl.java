package com.oams.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.oams.dao.MenuDAO;
import com.oams.entity.Menu;
import com.oams.service.MenuService;

@Service("menuService")
public class MenuServiceImpl implements MenuService{
	@Resource
	private MenuDAO menuDAO;
	public void save(Menu entity) {
		menuDAO.save(entity);
	}

	public void update(Menu entity) {
	}

	public void delete(Menu entity) {
	}

	public void deleteByIds(String[] ids) {
	}

	public Menu getById(String id) {
		return null;
	}

	public List<Menu> findAll(int page,int pageSize) {
		List<Menu> menus = menuDAO.findAll(page,pageSize);
		return menus;
	}

	public int getCount() {
		return menuDAO.getCount();
	}


}
