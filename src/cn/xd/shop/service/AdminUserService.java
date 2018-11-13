package cn.xd.shop.service;

import org.springframework.transaction.annotation.Transactional;

import cn.xd.shop.dao.AdminUserDao;
import cn.xd.shop.vo.AdminUser;
@Transactional
public class AdminUserService {
	// 注入Dao
	private AdminUserDao adminUserDao;

	public void setAdminUserDao(AdminUserDao adminUserDao) {
		this.adminUserDao = adminUserDao;
	}

	
	public AdminUser login(AdminUser adminUser) {
		return adminUserDao.login(adminUser);
	}
	
}
