package com.capstone.api;

import java.util.Map;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.capstone.entity.UserEntity;
import com.capstone.service.impl.AccountService;

@RestController
public class AccountAPI {
	
	@Autowired
	private AccountService accountService;
	@PutMapping(path="api/account",produces = {
			MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8"
	})
	public int changePassword(@RequestBody Map<String, String> params) {
		long userId = Long.parseLong(params.get("userId"));
		String password = params.get("password");
		String newPassword = params.get("newPassword");
		String confirmPassword = params.get("confirmPassword");
		UserEntity user = accountService.getUserById(userId);
//		password = BCrypt.hashpw(newPassword, BCrypt.gensalt(12));
		if(!BCrypt.checkpw(password, user.getPassword())) {
			return 0;
		}
		if(!newPassword.equals(confirmPassword)) {
			return 0;
		}
		return accountService.changePasswordById(newPassword,userId);
	}
	
	
	
	
	
}
