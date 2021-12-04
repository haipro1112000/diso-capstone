package com.capstone.controller;

import java.util.List;

import javax.management.AttributeNotFoundException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.capstone.dto.PostDTO;
import com.capstone.entity.PostEntity;
import com.capstone.entity.UserEntity;
import com.capstone.service.impl.CommentService;
import com.capstone.service.impl.PostService;

@Controller
public class PostController extends BaseController {
//	@Autowired
//	private Cloudinary cloudinary;

	@Autowired
	private PostService postService;
	@Autowired
	private CommentService commentService;

/*	@GetMapping("/post")
	public ModelAndView createPostPage(HttpSession session, HttpServletRequest request) {
		String previous = request.getRequestURI().replace("/diso-capstone", "");
		session.setAttribute("previous", previous);
		if (session.getAttribute("loginInfo") == null) {
			_mv.setViewName("redirect:/login");
			return _mv;
		} else {
			
			_mv.addObject("post", new PostEntity());
			_mv.setViewName("web/community/create-post");
		}

		return _mv;
	}
	*/
	@GetMapping("/post")
	public ModelAndView createPostPage(@RequestParam(value = "id", required = false) Long id,HttpSession session, HttpServletRequest request) {
//		String previous = request.getRequestURI().replace("/diso-capstone", "");
//		session.setAttribute("previous", previous);
		if (session.getAttribute("loginInfo") == null) {
			_mv.setViewName("redirect:/login");
			return _mv;
		} else {
			_mv.setViewName("web/community/create-post");
			PostEntity post = new PostEntity();
			if(id != null) {
				post = postService.getPostById(id);
//				previous+= "?id="+id;
//				session.setAttribute("previous", previous);
			}
			_mv.addObject("post", post);
			
		}

		return _mv;
	}
	
	@PostMapping("/post")
	public ModelAndView savePost(@ModelAttribute(value = "post") PostEntity post, HttpSession session,
			HttpServletRequest request, ModelMap model) {
		int result=0;
		if(post.getId() ==0) {
			UserEntity user = (UserEntity) session.getAttribute("loginInfo");
			result = postService.addPost(post, user.getId());
		}else {
			result = postService.updatePost(post);
		}
		
		if (result > 0) {
//			_mv.setViewName("redirect:/" + (String) session.getAttribute("previous"));
			model.put("status", " thành công!");
			_mv.setViewName("redirect:/" + (String) session.getAttribute("previous"));
		}
		else {
			model.put("status", "thất bại!");
			_mv.setViewName("web/community/create-post");
		}
		
		return _mv;
	}
	
/*	@PostMapping("/post")
	public ModelAndView savePost(@ModelAttribute(value = "post") PostEntity post, HttpSession session,
			HttpServletRequest request, ModelMap model) {
		UserEntity user = (UserEntity) session.getAttribute("loginInfo");
		int count = postService.addPost(post, user.getId());
		if (count > 0) {
//			_mv.setViewName("redirect:/" + (String) session.getAttribute("previous"));
			model.put("status", "Tạo bài thành công!");
		}
		else {
			model.put("status", "Tạo bài đăng thất bại!");
		}
		_mv.setViewName("web/community/create-post");
		return _mv;
	} */
	
	
/*	@GetMapping("/edit")
	public ModelAndView editPage(HttpSession session, HttpServletRequest request) {
		if (session.getAttribute("loginInfo") == null) {
			_mv.setViewName("redirect:/login");
			return _mv;
		}
		long id = Long.parseLong(request.getParameter("id"));
		PostEntity post = postService.getPostById(id);
		_mv.addObject("post",post);
		_mv.setViewName("web/community/create-post");
		return _mv;
	}
	*/

	
	@GetMapping("/community/{title}")
	public ModelAndView postDetailPage(HttpSession session, HttpServletRequest request, @PathVariable String title) {
		String previous = request.getRequestURI().replace("/diso-capstone", "");
		session.setAttribute("previous", previous);
		PostDTO post = postService.getDataPostByTitle(title);
		_mv.addObject("post", post);
		_mv.addObject("comment", commentService.getDataCommentByPostId(post.getId()));
		_mv.setViewName("web/community/post-detail");
		return _mv;

	}

	@RequestMapping(value = "/my-post", method = RequestMethod.GET)
	public ModelAndView myPost(HttpSession session, HttpServletRequest request) {
		String previous = request.getRequestURI().replace("/diso-capstone", "");
		session.setAttribute("previous", previous);
		if (session.getAttribute("loginInfo") == null) {
			_mv.setViewName("redirect:/login");
		} else {
			UserEntity user = (UserEntity) session.getAttribute("loginInfo");
//			List<PostEntity> list = postService.getDataPostByUserId(user.getId());
			List<PostDTO> list = postService.getPostDTOByUserId(user.getId());
//			PostEntity entity = list.get(0);
//			System.out.println(entity);
			_mv.addObject("mypost", list);
			_mv.setViewName("web/community/mypost");

		}
		return _mv;
	}

	@RequestMapping(value = "/community", method = RequestMethod.GET)
	public ModelAndView communityPage(HttpSession session, HttpServletRequest request) {
		String previous = request.getRequestURI().replace("/diso-capstone", "");
		session.setAttribute("previous", previous);
		List<PostDTO> list = postService.getDataPost();
		_mv.addObject("post", list);
		_mv.setViewName("web/community/community");
		return _mv;
	}

//	@GetMapping("/post")
//	public String list(Model model) {
//		model.addAttribute("post", new PostEntity());
//		return "web/create-post";
//	}
//	@PostMapping("/post")
//	public String add(@ModelAttribute(value="post") PostEntity post) {
//		try {
//			Map map = cloudinary.uploader().upload(post.getFile1().getBytes(),
//					ObjectUtils.asMap("resource_type","auto"));
//			String string = map.get("secure_url").toString();
//			System.out.println(string);
//			return "redirect:/";
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			System.err.println("== ADD POST ==" + e.getMessage());
//		}
//		return "web/create-post";
//		 
//	}

}
