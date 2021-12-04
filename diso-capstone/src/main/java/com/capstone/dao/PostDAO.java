package com.capstone.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.capstone.dto.PostDTO;
import com.capstone.dto.PostDTOMapper;
import com.capstone.entity.PostEntity;
import com.capstone.entity.PostMapper;
@Repository
public class PostDAO extends BaseDAO{
	
	public int addPost(PostEntity post) {
		
		StringBuilder  sql = new StringBuilder();
		sql.append("insert into post(title,content,userid,image1,image2,image3,createat,updateat) ");
		sql.append("values('"+ post.getTitle()+"'");
		sql.append("      ,'"+ post.getContent()+"'");
		sql.append("      ,"+ post.getUserid());
		sql.append("      ,'"+ post.getImage1()+"'");
		sql.append("      ,'"+ post.getImage2()+"'");
		sql.append("      ,'"+ post.getImage3()+"'");
		sql.append("      ,'"+ post.getCreateAt()+"'");
		sql.append("      ,'"+ post.getUpdateAt()+"')");
		try {
			return _jdbcTemplate.update(sql.toString());
		} catch (Exception e) {
			return 0;
		}
		
	}
	
	public List<PostDTO> getDataPost() {
		List<PostDTO> list = new ArrayList<PostDTO>();
		StringBuilder  sql = new StringBuilder();
//		sql.append("select p.id , title, content,p.userid ,u.fullname,createat,updateat, image1,image2,image3 ");
		sql.append("select p.id , title, p.content,p.userid ,u.firstname, u.lastname,u.image,p.createat,p.updateat, image1,image2,image3, COUNT(c.id) as 'totalcomment' ");
		sql.append("from post as p join user as u on p.userid = u.id ");
		sql.append("	       left join comment as c on p.id = c.postid ");
		sql.append("group by (p.id) ");
		sql.append("order by p.id desc");
//		sql.append("from post as p join user as u on p.userid = u.id;");
		try {
			list = _jdbcTemplate.query(sql.toString(), new PostDTOMapper());
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	public List<PostDTO> getPostDTOByUserId(long userId){
		List<PostDTO> list = new ArrayList<PostDTO>();
		StringBuilder  sql = new StringBuilder();
		sql.append("select p.id , title, p.content,p.userid ,u.firstname, u.lastname,u.image,p.createat,p.updateat, image1,image2,image3, COUNT(c.id) as 'totalcomment' ");
		sql.append("from post as p join user as u on p.userid = u.id ");
		sql.append("	       left join comment as c on p.id = c.postid ");
		sql.append("where p.userid=? ");
		sql.append("group by (p.id) ");
		sql.append("order by p.id desc");
		try {
			list = _jdbcTemplate.query(sql.toString(), new PostDTOMapper(),userId);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public PostDTO getDataPostByTitle(String title) {
		PostDTO list = new PostDTO();
		StringBuilder  sql = new StringBuilder();
		sql.append("select p.id , title, content,p.userid ,u.firstname , u.lastname,image ,createat,updateat, image1,image2,image3 ");
		sql.append("from post as p join user as u on p.userid = u.id ");
		sql.append("where title = '"+title+"';");
		try {
			list = _jdbcTemplate.queryForObject(sql.toString(), new PostDTOMapper());
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public List<PostEntity> getDataPostByUserId(long userId) {
		List<PostEntity> list = new ArrayList<PostEntity>();
		String sql = "SELECT * FROM post where userid=" + userId;
		try {
			list = _jdbcTemplate.query(sql, new PostMapper());
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	public PostEntity getPostById(long id) {
		String sql = "SELECT * FROM post where id=?";
		try {
			return _jdbcTemplate.queryForObject(sql, new PostMapper(),id);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public int deletePostById(long id) {
		String sql = "delete from post where id=?";
		try {
			return _jdbcTemplate.update(sql,id);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	public int updatePost(PostEntity post) {
		String sql = "update post set title=?, content=?, updateat=? where id=?";
		try {
			return _jdbcTemplate.update(sql,post.getTitle(), post.getContent(), post.getUpdateAt(), post.getId());
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	public int updatePostAndImage(PostEntity post) {
		String sql = "update post set title=?, content=?, updateat=?, image1=?  where id=?";
		try {
			return _jdbcTemplate.update(sql,post.getTitle(), post.getContent(), post.getUpdateAt(),post.getImage1(), post.getId());
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
}
