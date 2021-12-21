package com.capstone.entity;

import org.springframework.web.multipart.MultipartFile;

public class UserEntity {
	private long id;
	
	
	private String firstName;
	
	
	private String lastName;
	private String avatar;
	private MultipartFile file;
	private String userName;
	private String password;
	private String newPassword;
	private String confirmPassword;
	private String address;
	private String phone;
	private String email;
	private long report;
	private int active;
	private String unactiveDate;
	public UserEntity() {
		
	}
	
	public long getReport() {
		return report;
	}

	public void setReport(long report) {
		this.report = report;
	}

	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public String getUnactiveDate() {
		return unactiveDate;
	}

	public void setUnactiveDate(String unactiveDate) {
		this.unactiveDate = unactiveDate;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}
	
	
}
