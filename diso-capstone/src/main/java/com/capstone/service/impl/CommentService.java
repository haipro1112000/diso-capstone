package com.capstone.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.capstone.dao.CommentDAO;
import com.capstone.dao.UserDao;
import com.capstone.dto.CommentDTO;
import com.capstone.entity.UserEntity;
import com.capstone.service.ICommentService;
@Service
public class CommentService implements ICommentService {
	
	@Autowired
	private CommentDAO commentDAO;
	
	@Autowired
	private UserDao userDAO;
	
//	@Autowired
//	private PostDAO postDAO;
	
	@Override
	public List<CommentDTO> getDataCommentByPostId(long postid) {
		// TODO Auto-generated method stub
		return commentDAO.getDataCommentByPostId(postid);
	}

	@Override
	public CommentDTO addComment(long postId, long userId, String content) {
		UserEntity user = userDAO.getUserById(userId);
//		PostEntity post = postDAO.getPostById(postId);
		CommentDTO comment = new CommentDTO();
		comment.setPostId(postId);
		comment.setUserId(userId);
		comment.setContent(content);
		comment.setFirstName(user.getFirstName());
		comment.setLastName(user.getLastName());
		comment.setAvatar(user.getAvatar());
		SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		comment.setCreateAt(ft.format(new Date()));
		return commentDAO.addComment(comment);
	}

	@Override
	public int deleteCommentById(long id) {	
		return commentDAO.deleteCommentById(id);
	}
	
	

}
