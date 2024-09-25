package com.sonu.entity;

public class User {
	private int id;
	private String fulllname;
	private String email;
	private String password;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFulllname() {
		return fulllname;
	}
	public void setFulllname(String fulllname) {
		this.fulllname = fulllname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public User( String fulllname, String email, String password) {
		super();
		
		this.fulllname = fulllname;
		this.email = email;
		this.password = password;
	}
	public User() {
		super();
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", fulllname=" + fulllname + ", email=" + email + ", password=" + password + "]";
	}
	
	
	
	

}
