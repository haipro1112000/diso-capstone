package com.capstone.api;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.capstone.service.impl.PostService;

@RestController
public class PostAPI {
	@Autowired
	private PostService postService;
	
	@DeleteMapping(path="api/post",produces = {
			MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8"
	})
	public int deletePost(@RequestBody Map<String, String> params ) {
		long id = Long.parseLong(params.get("id"));
		return postService.deletePostById(id);
	}
	
	@PostMapping(path="api/post/report",produces = {
			MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8"
	})
	public int increaseReport(@RequestBody long id ) {
		return postService.updateReportById(id);
	}
	
}
