package com.capstone.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.capstone.entity.UserEntity;
import com.capstone.entity.UserMapper;

@Repository
public class UserDao extends BaseDAO {
	public int addAccount(UserEntity user) {
		StringBuilder sql = new StringBuilder();
		sql.append("insert into user ");
		sql.append("values( ");
		sql.append("     null  ");
		sql.append("    ,'https://res.cloudinary.com/nguyenhai/image/upload/v1636880416/default-avatar_bjg40e.jpg' ");
		sql.append("    ,'" + user.getFirstName() + "' ");
		sql.append("    ,'" + user.getLastName() + "' ");
		sql.append("    ,'" + user.getUserName() + "' ");
		sql.append("    ,'" + user.getPassword() + "' ");
		sql.append("    ,'" + user.getAddress() + "' ");
		sql.append("    ,'" + user.getPhone() + "' ");
		sql.append("    ,'" + user.getEmail() + "' ");
		sql.append("    ,1 ");
		sql.append("    ,0 ");
		sql.append(");");
		try {
			return _jdbcTemplate.update(sql.toString());
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
	}
	public List<UserEntity> findAll(){
		String sql = "SELECT * FROM user";
		try {
			return _jdbcTemplate.query(sql, new UserMapper());
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public UserEntity getUserByAcc(UserEntity user) {
		String sql = "SELECT * FROM user where username = '" + user.getUserName() + "'";
		
		try {
			UserEntity userEntity = _jdbcTemplate.queryForObject(sql, new UserMapper());
			return userEntity;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}

	public UserEntity getUserByUserNameAndEmail(String username, String email) {
//		UserEntity user = new UserEntity();
		StringBuilder sql = new StringBuilder();
		sql.append("select * from user ");
		sql.append("where username='" + username + "' and email='" + email + "';");
		try {
			return _jdbcTemplate.queryForObject(sql.toString(), new UserMapper());
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public UserEntity getUserById(long id) {
		String sql = "SELECT * FROM user where id=?";
		try {
			return _jdbcTemplate.queryForObject(sql, new UserMapper(),id);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	public int updateUser(UserEntity user) {
		String sql = "update user set firstname=?, lastname=?, address=?, phone=?, email=? where id=?";
		try {
			return _jdbcTemplate.update(sql,user.getFirstName(), user.getLastName(), user.getAddress(), user.getPhone(), user.getEmail(), user.getId());
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
	}
	public int updateUserWithAvatar(UserEntity user) {
		String sql = "update user set image=?, firstname=?, lastname=?, address=?, phone=?, email=? where id=?";
		try {
			return _jdbcTemplate.update(sql,user.getAvatar(),user.getFirstName(), user.getLastName(), user.getAddress(), user.getPhone(), user.getEmail(), user.getId());
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
	}
	public int updateReportById(long report,long id) {
		String sql = "update user set report=? where id=?";
		try {
			return _jdbcTemplate.update(sql,report,id);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	
	public int updatePasswordById(String newPassword,long id) {
		String sql = "update user set password=? where id=?";
		try {
			return _jdbcTemplate.update(sql,newPassword,id);
		} catch (Exception e) {
			return 0;
		}
		
	}
	public int changePasswordById(String newPassword,long id) {
		String sql = "update user set password=? where id=?";
		try {
			return _jdbcTemplate.update(sql,newPassword,id);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
	}
	public int changePasswordByUserName(String newPassword, String userName) {
		String sql =  "update user set password=? where username=?";
		try {
			return _jdbcTemplate.update(sql,newPassword,userName);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	public UserEntity getUserByUsername(String username) {
		String sql = "SELECT * FROM user where username=?";
		try {
			return _jdbcTemplate.queryForObject(sql, new UserMapper(),username);
		} catch (Exception e) {
			return null;
		}
	}
	public UserEntity getUserByEmail(String email) {
		String sql = "SELECT * FROM user where email=?";
		try {
			return _jdbcTemplate.queryForObject(sql, new UserMapper(),email);
		} catch (Exception e) {
			return null;
		}
	}
	public int updateAvatarByUserId(String image,long id) {
		String sql = "update user set image=? where id=?";
		try {
			return _jdbcTemplate.update(sql,image,id);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
}
