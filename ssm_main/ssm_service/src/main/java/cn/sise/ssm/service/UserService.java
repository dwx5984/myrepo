/**
 * 
 */
package cn.sise.ssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.sise.ssm.mapper.UserMapper;
import cn.sise.ssm.po.User;
import cn.sise.ssm.po.UserExample;
import cn.sise.ssm.po.UserExample.Criteria;



/**
 * @author dwx
 *管理员业务组件
 */
@Service
public class UserService {
	//注入dao
	@Autowired
	UserMapper userMapper;
	
	/*
	 * 校验用户名
	 */
	public boolean checkUserName(String name) {
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUserNameEqualTo(name);
		//criteria.andUserPasswordEqualTo(user.getUserPassword());
		long name_count = userMapper.countByExample(example);
		//long pwd_count = userMapper.countByExample(example);
		
		return name_count != 0;
	}
	/*
	 * 校验用户密码
	 */
	public boolean checkUserPwd(String pwd) {
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUserPasswordEqualTo(pwd);
	
		long pwd_count = userMapper.countByExample(example);
		
		
		return pwd_count != 0;
	}

}
