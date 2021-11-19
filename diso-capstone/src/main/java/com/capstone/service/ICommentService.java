package com.capstone.service;

import java.util.List;

import com.capstone.dto.CommentDTO;

public interface ICommentService {
	List<CommentDTO> getDataCommentByPostId(long postid);
	CommentDTO addComment(long postid, long userid, String Content);
	int deleteCommentById(long id); 
}
