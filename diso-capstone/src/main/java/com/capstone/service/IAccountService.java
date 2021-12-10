package com.capstone.service;

import java.util.List;

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
	
	public int increaseReportByUserId(long userId);
	
	public List<UserEntity> findAll();
	
	public int activeById(long id);
	
	public int unactiveById(long id, String unactiveDate);
	
	public List<UserEntity> findUser(String txt);

}
