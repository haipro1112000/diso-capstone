package com.capstone.service.impl;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.capstone.dao.PostDAO;
import com.capstone.dto.PostDTO;
import com.capstone.entity.PostEntity;
import com.capstone.service.IPostService;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
@Service
public class PostService implements IPostService {

	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	Cloudinary cloudinary;
	
	@Override
	public int addPost(PostEntity post, long userID) {
		try {
			if(!post.getFile1().isEmpty()) {
//				Map map1 = cloudinary.uploader().upload(post.getFile1().getBytes(),
//						ObjectUtils.asMap("resource_type","auto"));
//				post.setImage1(map1.get("secure_url").toString());
				post.setImage1(cloudinary.uploader().upload(post.getFile1().getBytes(),
						ObjectUtils.emptyMap())
						.get("secure_url").toString());
			
			}
//			if(!post.getFile2().isEmpty()) {
//				post.setImage2(cloudinary.uploader().upload(post.getFile2().getBytes(),
//						ObjectUtils.asMap("resource_type","auto"))
//						.get("secure_url").toString());
//			}
//			if(!post.getFile3().isEmpty()) {
//				post.setImage3(cloudinary.uploader().upload(post.getFile3().getBytes(),
//						ObjectUtils.asMap("resource_type","auto"))
//						.get("secure_url").toString());
//			}
			post.setUserid(userID);
			SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
			post.setCreateAt(ft.format(new Date()));
			post.setUpdateAt(ft.format(new Date()));
//			post.setUpdateAt(new Date());
			return postDAO.addPost(post);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
		
	}
	
	@Override
	public int updatePost(PostEntity post) {
		try {
			SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
			post.setUpdateAt(ft.format(new Date()));
			if(!post.getFile1().isEmpty()) {
//				Map map1 = cloudinary.uploader().upload(post.getFile1().getBytes(),
//						ObjectUtils.asMap("resource_type","auto"));
//				post.setImage1(map1.get("secure_url").toString());
				post.setImage1(cloudinary.uploader().upload(post.getFile1().getBytes(),
						ObjectUtils.emptyMap())
						.get("secure_url").toString());
				return postDAO.updatePostAndImage(post);
			}else 
				return postDAO.updatePost(post);
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
	}

	
	@Override
	public List<PostDTO> getDataPost() {	
		return postDAO.getDataPost();
	}

	@Override
	public List<PostEntity> getDataPostByUserId(long userId) {
		return postDAO.getDataPostByUserId(userId);
	}

	@Override
	public PostDTO getDataPostByTitle(String title) {
		return postDAO.getDataPostByTitle(title);
	}

	@Override
	public int deletePostById(long id) {
		try {
			return postDAO.deletePostById(id);
		} catch (Exception e) {
			return 0;
		}
	}

	@Override
	public PostEntity getPostById(long id) {
		return postDAO.getPostById(id);
	}

	@Override
	public List<PostDTO> getPostDTOByUserId(long userId) {
		
		return postDAO.getPostDTOByUserId(userId);
	}

	@Override
	public int updateReportById(long id) {
		return postDAO.updateReportById(id);
	}

	@Override
	public List<PostDTO> getPostDTOById(long id) {
		
		return postDAO.getPostDTOById(id);
	}

	@Override
	public PostDTO findOneById(long id) {
		// TODO Auto-generated method stub
		return postDAO.findOneById(id);
	}

	

}
