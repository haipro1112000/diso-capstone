package com.capstone.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class CommentDTOMapper implements RowMapper<CommentDTO>{

	@Override
	public CommentDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
		CommentDTO comment = new CommentDTO();
		comment.setId(rs.getLong("id"));
		comment.setPostId(rs.getLong("postid"));
		comment.setUserId(rs.getLong("userid"));
		comment.setContent(rs.getString("content"));
		comment.setFirstName(rs.getString("firstname"));
		comment.setLastName(rs.getString("lastname"));
		comment.setCreateAt(rs.getString("createat"));
		comment.setUpdateAt(rs.getString("updateat"));
		return comment;
	}

}
