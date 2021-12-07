package com.capstone.entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class PostMapper implements RowMapper<PostEntity>{

	@Override
	public PostEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
		PostEntity post = new PostEntity();
		post.setId(rs.getLong("id"));
		post.setTitle(rs.getString("title"));
		post.setContent(rs.getString("content"));
		post.setUserid(rs.getLong("userid"));
		post.setImage1(rs.getString("image1"));
		post.setImage2(rs.getString("image2"));
		post.setImage3(rs.getString("image3"));
		post.setCreateAt(rs.getString("createat"));
		post.setUpdateAt(rs.getString("updateat"));
		post.setReport(rs.getLong("report"));
		return post;
	}

}
