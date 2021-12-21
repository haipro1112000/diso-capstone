package com.capstone.api;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.capstone.entity.UserEntity;
import com.capstone.service.impl.AccountService;
import com.capstone.utils.Email;
import com.capstone.utils.EmailUtils;

@RestController
public class AccountAPI {

	@Autowired
	private AccountService accountService;

	@PutMapping(path = "api/account", produces = { MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8" })
	public int changePassword(@RequestBody Map<String, String> params) {
		long userId = Long.parseLong(params.get("userId"));
		String password = params.get("password");
		String newPassword = params.get("newPassword");
		String confirmPassword = params.get("confirmPassword");
		UserEntity user = accountService.getUserById(userId);
//		password = BCrypt.hashpw(newPassword, BCrypt.gensalt(12));
		if (!BCrypt.checkpw(password, user.getPassword())) {
			return 0;
		}
		if (!newPassword.equals(confirmPassword)) {
			return 0;
		}
		return accountService.changePasswordById(newPassword, userId);
	}

//	@PutMapping("api/avatar")
//	public ResponseEntity<?> updateAvatar(@RequestBody Map<String, Object> params) throws IOException{
//		
//		String string = (String) params.get("string");
//		
//		System.out.println(string);
//		return ResponseEntity.ok("working");
//	}
//	
	@PostMapping(path = "api/account/report", produces = { MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8" })
	public ResponseEntity<?> increaseReport(@RequestBody long userId) {
		return ResponseEntity.ok(accountService.increaseReportByUserId(userId));
	}

	@PostMapping(path = "api/account/active", produces = { MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8" })
	public ResponseEntity<?> activeAccount(@RequestBody long id) {
		return ResponseEntity.ok(accountService.activeById(id));
	}
	@PutMapping(path = "api/account/active", produces = { MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8" })
	public ResponseEntity<?> unactiveAccount(@RequestBody long id) {
		
		SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		String unactiveDate = ft.format(new Date());
		return ResponseEntity.ok(accountService.unactiveById(id, unactiveDate));
	}
	
	@PostMapping(path = "api/account/feedback", produces = { MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8" })
	public ResponseEntity<?> feedback(@RequestBody Map<String, String> params) {
		String name = params.get("name");
		String mail = params.get("email");
		String subject = params.get("subject");
		String content = params.get("content");
		Email email = new Email();
		email.setFrom("dangngocnam631@gmail.com");
		email.setFromPassword("Dangngocnam@123654");
		email.setSubject("FeedBack: " + subject);
		email.setTo("dangngocnam631@gmail.com");
		StringBuilder st = new StringBuilder();
		st.append("Người dùng :").append(name).append("(")
								 .append(mail).append(") gửi phản hồi với nội dung: <br>");
		st.append(content).append("<br>");
		st.append("Thân,<br>");
		st.append("DISO ");
		email.setContent(st.toString());
		EmailUtils.send(email);
		return ResponseEntity.ok(1);
		
	}
	
	
	
}
