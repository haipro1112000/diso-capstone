package com.capstone.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.capstone.dto.CommentDTO;
import com.capstone.dto.CommentDTOMapper;
@Repository
public class CommentDAO extends BaseDAO{
	public List<CommentDTO> getDataCommentByPostId(long postid) {
		StringBuilder  sql = new StringBuilder();
		sql.append("SELECT c.id, content, postid, c.userid, c.createat, c.updateat, firstname, lastname ");
		sql.append("FROM diso_capstone.comment as c join user as u on c.userid = u.id ");
		sql.append("where postid=" + postid + " " );
		sql.append("ORDER BY c.createat DESC");
		List<CommentDTO> list = new ArrayList<CommentDTO>();
		try {
			list = _jdbcTemplate.query(sql.toString(), new CommentDTOMapper());
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	public CommentDTO addComment(CommentDTO comment) {
		String sql= "insert into comment(postid, userid, content, createat) values(?,?,?,?)";
		
		try {
			int result = _jdbcTemplate.update(sql, comment.getPostId(), comment.getUserId(), comment.getContent(),comment.getCreateAt());
			if(result>0)
				return comment;
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	@Transactional
	public int deleteCommentById(long id) {
		String sql = "delete from comment where id=?";
		try {
			return _jdbcTemplate.update(sql,id);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
		
	}
}
