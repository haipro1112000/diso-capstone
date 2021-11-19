package com.capstone.api;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.capstone.dto.CommentDTO;
import com.capstone.service.impl.CommentService;

@RestController
public class CommentAPI {

	@Autowired
	private CommentService commentService;
	
	@PostMapping(path="api/comment",produces = {
			MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8"
	})
	public CommentDTO addComment(@RequestBody Map<String, String> params){
		try {
			long postId =  Long.parseLong(params.get("postId"));
			long userId =  Long.parseLong(params.get("userId"));
			String content = params.get("content");			 
			return commentService.addComment(postId, userId, content);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	
	@DeleteMapping(path="api/comment",produces = {
			MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8"
	})
	public int delecomment(@RequestBody Map<String, String> params) {
		long id = Long.parseLong(params.get("id"));
		return commentService.deleteCommentById(id);
	}
	
}
