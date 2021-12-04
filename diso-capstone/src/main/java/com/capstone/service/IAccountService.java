package com.capstone.service;

import com.capstone.entity.UserEntity;

public interface IAccountService {
	public int addAccount(UserEntity user);
	
	public UserEntity checkAccount(UserEntity user);
	
	public UserEntity getUserByUserNameAndEmail(String username, String email);
	
	public UserEntity getUserById(long id); 
	
	public int updateAccount(UserEntity user);
	
	public int updatePasswordById(String newPassword,long id);
	
	public UserEntity getUserByUsername(String username);
	
	public UserEntity getUserByUserEmail(String email);
	
	public int changePasswordById(String newPassword,long id);
	
	public int updateAvatarByUserId(String image,long id);
	
	public int changePasswordByUserName(String newPassword, String userName);
	
	

}
