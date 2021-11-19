package com.capstone.service;

import java.util.List;

import com.capstone.dto.PostDTO;
import com.capstone.entity.PostEntity;

public interface IPostService {
	public int addPost(PostEntity post,long userId);
	public List<PostDTO> getDataPost();
	public List<PostEntity> getDataPostByUserId(long userId);
	public PostDTO getDataPostByTitle(String title);
	public int deletePostById(long id);
	public PostEntity getPostById(long id);
	public int updatePost(PostEntity post);
	public List<PostDTO> getPostDTOByUserId(long userId);
	
}
