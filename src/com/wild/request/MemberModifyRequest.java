package com.wild.request;

import java.io.File;

import com.wild.dto.MemberVO;

public class MemberModifyRequest {

	private String id; // 아이디
	private String pwd; // 비밀번호
	private String name; // 이름
	private String email; // 이메일
	private String phone; // 휴대전화번호
	private File picture; // 사진 파일 경로. 파일
	private String oldPicture; // 이전 사진 파일
	private String uploadPicture; // 변경된 사진 파일
	
	public MemberVO toParseMember() {
		MemberVO member = new MemberVO();
		member.setId(this.id);
		member.setPwd(this.pwd);
		member.setName(this.name);
		member.setPhone(this.phone);
		member.setEmail(this.email);
		
		if(uploadPicture != null && !uploadPicture.isEmpty()) { //이미지 변경후 
			member.setPicture(this.picture.getName());
			System.out.println("12313");
		}else {
			member.setPicture(this.oldPicture);
		}
		
		return member;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public File getPicture() {
		return picture;
	}
	public void setPicture(File picture) {
		this.picture = picture;
	}
	public String getOldPicture() {
		return oldPicture;
	}
	public void setOldPicture(String oldPicture) {
		this.oldPicture = oldPicture;
	}
	public String getUploadPicture() {
		return uploadPicture;
	}
	public void setUploadPicture(String uploadPicture) {
		this.uploadPicture = uploadPicture;
	}

	
	
}


