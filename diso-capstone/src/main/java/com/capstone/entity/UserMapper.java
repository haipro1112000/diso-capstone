package com.capstone.entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class UserMapper implements RowMapper<UserEntity>{

	@Override
	public UserEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
		UserEntity user = new UserEntity();
		user.setId(rs.getLong("id"));
		user.setFirstName(rs.getString("firstname"));
		user.setLastName(rs.getString("lastname"));
		user.setAvatar(rs.getString("image"));
		user.setPassword(rs.getString("password"));
		user.setAddress(rs.getString("address"));
		user.setPhone(rs.getString("phone"));
		user.setEmail(rs.getString("email"));
		user.setReport(rs.getLong("report"));
		return user;
	}

}
