package com.capstone.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class PostDTOMapper implements RowMapper<PostDTO>{

	@Override
	public PostDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
		PostDTO post = new PostDTO();
		post.setId(rs.getLong("id"));
		post.setTitle(rs.getString("title"));
		post.setContent(rs.getString("content"));
		post.setFirstName(rs.getString("firstname"));
		post.setLastName(rs.getString("lastname"));
		post.setAvatar(rs.getString("image"));
		post.setUserId(rs.getString("userid"));
		post.setCreateAt(rs.getString("createat"));
		post.setUpdateAt(rs.getString("updateat"));
		post.setImage1(rs.getString("image1"));
		post.setImage2(rs.getString("image2"));
		post.setImage3(rs.getString("image3"));	
		try {
			post.setTotalComment(rs.getString("totalComment"));
			post.setReport(rs.getLong("report"));
		} catch (Exception e) {
			
		}
		
		return post;
	}

}
