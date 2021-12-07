package com.capstone.service.impl;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.capstone.dao.UserDao;
import com.capstone.entity.UserEntity;
import com.capstone.service.IAccountService;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
@Service
public class AccountService implements IAccountService{

	@Autowired
	public UserDao userDao;
	
	@Autowired Cloudinary cloudinary;
	
	@Override
	public int addAccount(UserEntity user) {
		user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12)));
		return userDao.addAccount(user);
	}

	@Override
	public UserEntity checkAccount(UserEntity user) {
		String pass = user.getPassword();
		 
		user = userDao.getUserByAcc(user);
		if(user != null) {
			if(BCrypt.checkpw(pass, user.getPassword()))
			return user;
		}
	
		
		
		return null;
	}

	@Override
	public UserEntity getUserByUserNameAndEmail(String username, String email) {
		return userDao.getUserByUserNameAndEmail(username, email);
	}

	@Override
	public UserEntity getUserById(long id) {
		return userDao.getUserById(id);
	}

	@Override
	public int updateAccount(UserEntity user) {
//		return userDao.updateUser(user);
		try {
			if(!user.getFile().isEmpty()) {
				user.setAvatar(cloudinary.uploader().upload(user.getFile().getBytes(),
						ObjectUtils.emptyMap())
						.get("secure_url").toString());
				return userDao.updateUserWithAvatar(user);
			}else {
				return userDao.updateUser(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public int updatePasswordById(String newPassword, long id) {
		BCrypt.hashpw(newPassword, BCrypt.gensalt(12));
		return userDao.updatePasswordById(newPassword, id);
	}

	@Override
	public UserEntity getUserByUsername(String username) {
		return userDao.getUserByUsername(username);
	}

	@Override
	public UserEntity getUserByUserEmail(String email) {
		// TODO Auto-generated method stub
		return userDao.getUserByEmail(email);
	}

	@Override
	public int changePasswordById(String newPassword, long id) {
		newPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt(12));
		return userDao.changePasswordById(newPassword, id);
	}

	@Override
	public int updateAvatarByUserId(String image, long id) {
		return userDao.updateAvatarByUserId(image, id);
	}

	@Override
	public int changePasswordByUserName(String newPassword, String userName) {
		newPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt(12));
		return userDao.changePasswordByUserName(newPassword, userName);
	}

	@Override
	public int increaseReportById(long report, long id) {
		report+=1;
		return userDao.updateReportById(report, id);
	}

	@Override
	public int decreaseReportById(long report, long id) {
		report-=1;
		return userDao.updateReportById(report, id);
	}

	

	
	

}
